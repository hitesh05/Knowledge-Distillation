# Knowledge Distillation

Pytorch implementation of various Knowledge Distillation (KD) methods. 
## Lists
  Name | Method | Paper Link
  :---- | ----- | :----:
  Baseline | basic model with softmax loss | —
  ST       | soft target | [paper](https://arxiv.org/pdf/1503.02531.pdf)
  Fitnet   | hints for thin deep nets | [paper](https://arxiv.org/pdf/1412.6550.pdf)
  RKD      | relational knowledge distillation | [paper](https://arxiv.org/pdf/1904.05068.pdf)

## Datasets
- CIFAR100

## Networks
- Resnet-20
- Resnet-110

The networks are same with Tabel 6 in [paper](https://arxiv.org/pdf/1512.03385.pdf).

## Training
- Creating `./dataset` directory and downloading CIFAR10 in it.
- Using the script `example_train_script.sh` to train various KD methods. You can simply specify the hyper-parameters listed in `train_xxx.py` or manually change them.
- Some Notes:
	- We assume the size (C, H, W) of features between teacher and student are the same. If not, you could employ 1\*1 conv, linear or pooling to rectify them.

## Results
- The trained baseline models are used as teachers. For fair comparison, all the student nets have same initialization with the baseline models.
- The initial models, trained models and training logs are uploaded [here](https://iiitaphyd-my.sharepoint.com/:f:/g/personal/hitesh_goel_research_iiit_ac_in/ElJlt7JFT1xOgs6IVdbLfocBdEUSenIs25wXmCP1j3LXUA?e=VbpNtC).
- The trade-off parameter `--lambda_kd` and other hyper-parameters are not chosen carefully. Thus the following results do not reflect which method is better than the others.


## Scores
<table>
   <tr>
      <td>Teacher</td>
      <td>Student</td>
      <td>Name</td>
      <td>CIFAR10</td>
   </tr>
   <tr>
      <td>resnet-110</td>
      <td>resnet-20</td>
      <td>Baseline</td>
      <td>93%</td> 
   </tr>
   <tr>
      <td>resnet-110</td>
      <td>resnet-20</td>
      <td>ST</td>
      <td>85.34%</td>
   </tr>
   <tr>
      <td>resnet-110</td>
      <td>resnet-20</td>
      <td>Fitnet</td>
      <td>85.57%</td>
   </tr>
   <tr>
      <td>resnet-110</td>
      <td>resnet-20</td>
      <td>RKD</td>
      <td>87%</td>
   </tr>
</table>

## Requirements
- python 3.7
- pytorch 1.3.1
- torchvision 0.4.2
