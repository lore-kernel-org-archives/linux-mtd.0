Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 140nYJ-00042S-00
	for mtd-list@infradead.org; Tue, 28 Nov 2000 16:24:19 +0000
Message-ID: <00B4D286538DD311BC6E005004E9EFC73B0F6C@M4EXCH>
From: Simon Munton <Simon.Munton@m4data.co.uk>
To: David Woodhouse <dwmw2@infradead.org>
Cc: mtd@infradead.org, "JFFS (E-mail)" <jffs-dev@axis.com>
Subject: RE: Oops in JFFS 
Date: Tue, 28 Nov 2000 16:24:02 -0000
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C05957.9F043D20"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C05957.9F043D20
Content-Type: text/plain;
	charset="iso-8859-1"

> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]
> 
> Just in case anyone here is interested but isn't also 
> subscribed to the 
> JFFS list - I've posted a patch which appears to fix this problem.
> 

Thanks David,

It does seem to fix the specific test case, BUT...  

What I was doing was run a stress test which highlighted the original
problem, and I was able to simplify it to the test case. Running the stress
test with the patch applied gives another oops:

...
***jffs_remove(): file = "dir1", ino = 193
Deleting nonexistent file inode: 193, nlink: 0
jffs_write_node(): filename = "", ino = 193, total_size = 60
jffs_fmalloc(): fmc = 0xc0090ac0, size = 60, node = 0xc0dc1410
jffs_write_node(): setting version of dir1 to 5
jffs_insert_node(): ino = 193, version = 5, name = "", deleted = 1
jffs_remove_redundant_nodes(): Removing node: ino: 193, version: 4,
mod_type: 1
jffs_fmfree(): node->ino = 193, node->version = 4
thread_should_wake(): free=8209096, dirty=32976, blocksize=131072.
***jffs_rename()
jffs_rename(): old_dir: 0xc0f67dc0, old name: 0xc0f34f00, new_dir:
0xc0f67dc0, new name: 0xc0d99070
jffs_write_node(): filename = "dir1", ino = 200, total_size = 68
jffs_fmalloc(): fmc = 0xc0090ac0, size = 68, node = 0xc0da6a10
jffs_write_node(): setting version of test1 to 3
Unable to handle kernel NULL pointer dereference at virtual address 00000018
current->tss.cr3 = 00e47000, %cr3 = 00e47000
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<c015272f>]
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010246
eax: 00000000   ebx: 00000004   ecx: 00000000   edx: 00000000
esi: c0d99074   edi: c0d99010   ebp: 000081a4   esp: c0e49e94
ds: 0018   es: 0018   ss: 0018
Process mv (pid: 662, process nr: 20, stackpage=c0e49000)
Stack: c0d8bd10 c0da6a10 c0de0430 00000044 00000004 00000004 c0d1fa10
c0e49f14 
       0000003c c0d99070 00000004 c0e49f10 00000004 c01ddd67 c0f92010
c0151de1 
       c0090910 c0da6a10 c0e49f14 c0151e32 c0f67dc0 c0d99010 000081a4
c0f67dc0 
Call Trace: [<c0151de1>] [<c0151e32>] [<c012a539>] [<c012a599>] [<c012a6c1>]
[<c0107be8>] 
Code: 8b 40 18 50 8b 7c 24 14 57 68 a0 5f 1b c0 e8 9e fd fb ff 8b 

>>EIP; c015272f <jffs_remove+4f/300>   <=====
Trace; c0151de1 <jffs_rename+211/330>
Trace; c0151e32 <jffs_rename+262/330>
Trace; c012a539 <vfs_rename_other+1c9/1f0>
Trace; c012a599 <vfs_rename+39/40>
Trace; c012a6c1 <sys_rename+121/190>
Trace; c0107be8 <system_call+34/38>
Code;  c015272f <jffs_remove+4f/300>
00000000 <_EIP>:
Code;  c015272f <jffs_remove+4f/300>   <=====
   0:   8b 40 18                  movl   0x18(%eax),%eax   <=====
Code;  c0152732 <jffs_remove+52/300>
   3:   50                        pushl  %eax
Code;  c0152733 <jffs_remove+53/300>
   4:   8b 7c 24 14               movl   0x14(%esp,1),%edi
Code;  c0152737 <jffs_remove+57/300>
   8:   57                        pushl  %edi
Code;  c0152738 <jffs_remove+58/300>
   9:   68 a0 5f 1b c0            pushl  $0xc01b5fa0
Code;  c015273d <jffs_remove+5d/300>
   e:   e8 9e fd fb ff            call   fffbfdb1 <_EIP+0xfffbfdb1> c01124e0
<printk+0/180>
Code;  c0152742 <jffs_remove+62/300>
  13:   8b 00                     movl   (%eax),%eax

Unfortunately, I've not managed to generate a simple test case, and I won't
be around for the next week, so I've attached the files used to do the
stress test; extract into a JFFS partition, and do:
. ln1 & . ln2 & . ln3 & . try1 & . try2 & . try3 &

and eventually it causes the oops

========================================================
Simon Munton				simonm@m4data.co.uk
M4 Data Ltd					Tel: 44-1749-683800
Mendip Court, Bath Rd, Wells		Fax: 44-1749-673928
Somerset, BA5 3DG, England




------_=_NextPart_000_01C05957.9F043D20
Content-Type: application/octet-stream;
	name="fs-test.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="fs-test.tar.gz"

H4sIAAPZIzoAA+1abW/bNhDO1+hX3LAiS4E45oteknQIsKEFtgLbhy1/QJapWrUsGqRs1/9+R0qW
ZSetnK5y2oRPjEgi73ikyCPvIZXqQSl0OTzpEYT4JAoCvFrsX6v7MIhCQhiN2AmhlAbsBII+K7XB
QpexAjhRUpZfkuvK/0GR1v0/zhTtaxAc1P8RI5Ef+D4Psf8ZoZHr/2Ngp//TLBfs29sglJDQ9z/X
/5TzoO5/P2KUm/6PMAnIt6/Kfbzw/i9X0itlGedAqTdQq4EamB8AUDBNBoPmxsIPQ/hXzIESINc3
LIB/3v329q933litPqmB+aEQ+4w2JczfaFN6QxiYkfc/dNmBtebXV/A+LoCGKHSND3lxaIM5iawq
bFUPtUqj631VfqAqANltrC7Vwaq8rUrBuPihrX1Q+dBKMxrA+0Vh+pDRGz+AUq0PNYzzAPwtl0B9
+64io3vwe76KbKXBR1UzJlGXe0/tXD8ANvO/HSE92eiY/xF8s/7zgNj5nzLu5v9jYJI5L3nJaMV/
7HuK/xlx8f8xsNP/o1j1YaN7/id78X8Qcv8E6DHIiev/av3HeKkvG139j2zP7v/gLMG5kUP/J75b
/4+Bn38ajrICPV9PPC+VCjLIkCRh/M4xlg6Qt0RwBdcewFjiv9kUfRFivDOyHx+UBeKZkNzKGxjJ
6ZckrexpKRfJBOLhq4+vpk1yIbzWjZrBQKVo3j4/9at7Fmj5f1/hf6f/cxYZ/+cBZQEL7f5vFDn/
Pwoe6f+HeP2pSCYSJhnc1vsOVUIu6wTunZ7rXJgthjeQxGUl9Rp+tVc4eyib1dnMZDc621u+nSbc
3PAYtPy/h+CqQuf6T5AbhD7nlONUEFT+T5z/HwN9+P9sCYO08tBqd7eVwqs9W+et3wk2/q/LXqif
Rff5D7XxfxCFATH36P+UOv8/BtzZjzv76VB2Zz/PGJv5H4d1bza64j8/os3+r/0WgNIgcuc/R0Ef
8Z/Zpknt/DxM5e7zKFY1HcS4D26bjd0NSSxXspXKvNO8gIGGrVyr2L0s1rLQWGzKMURxkw+3w7FY
DotFnt8TpS1RtNIWrZr3zGLW9vlvXxvAX3X+677/OQpy+VxGssPXYOP/VRzfj40u/od/e9//Vt9/
Ov/vH3eTzK6hIimlWkMiizLOCg1azgTobDbPhSUBoBOVzUsN5QSXx0m8FDBXcikKb6FFushtZIAs
RehqQGXFB1jGKpMLDWZd1Wtdipm+hLuJaMpaSTWF0dpTYi7iUozzNYhPQiWZNupGDRKFOZksLmAs
clHdKVHEM5S4gLgYe3lWTO0DRiUlFj6RcwEytdWTJgdUnAjTsnFm9DVgTSVKKiMyyrFW4NW625pe
et6dBLWo0usKow2tF8ImJXI2Q/Pa8y4NnYQzMFdWXzmcYbohQDbBsJnNjclqtfgS/kwhznMsGlYi
zy9gLRe/4LMWAtsHMklijdVGlo4m5zn2TgmpkjPP1AJfvhrkYinypkIXMFqUUEiYClWIvM6dYcfE
H0TVeDnXQmMLf8/Qzh/xSmi3CLxQbPlfb8d/nfFfyPwt/6M1/3P7/0fBI/lffQJv9+3aT6z5NmAw
t7mbxMcdGG7JXXNkuCV1Dd+rmFmbsrWyDL9rE79zQ+dwYXoDu7T0Ndy2zNWcb0My2wTxwQLQSlOA
rdxOAayDYd6jp09HLbf+39vnP93nf6H5/gedP6A0rPb/g9DFf0dBH/s/57U/tzymHvq1zzSOcF67
+b5zAuy457PceXFwcHBwcHBwcHBwcHBwcHBwcHBwcHDoD/8BFHfsvgBQAAA=

------_=_NextPart_000_01C05957.9F043D20--


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
