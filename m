Received: from web15706.mail.cnb.yahoo.com ([202.165.102.73])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C7Qke-0002X1-NE
	for linux-mtd@lists.infradead.org; Tue, 14 Sep 2004 23:46:42 -0400
Message-ID: <20040915034600.4517.qmail@web15706.mail.cnb.yahoo.com>
Date: Wed, 15 Sep 2004 11:46:00 +0800 (CST)
From: =?gb2312?q?GYF?= <hello_gyf@yahoo.com.cn>
To: linux-mtd <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: 8bit
Subject: jffs2 filesystem on flash problem CRC errpr
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, 
&nbsp;
I'm new here. Here I have a problem about setting up
jffs2 file system on my flash. My target system is
uClinux(2.4.x), and the following is the flash
information:
Bank # 1: AMD 29LV160BB (16 Mbit, bottom boot sector)
&nbsp; Size: 4 MB in 35 Sectors
&nbsp; Sector Start Addresses:
&nbsp;&nbsp;&nbsp; B0000000 (RO) B0008000 (RO)
B000C000 (RO) B0010000 (RO) B0020000 (RO)
&nbsp;&nbsp;&nbsp;
B0040000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
B0060000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
B0080000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
B00A0000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
B00C0000&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;
B00E0000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
B0100000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
B0120000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
B0140000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
B0160000&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;
B0180000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
B01A0000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
B01C0000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
B01E0000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
B0200000&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;
B0220000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
B0240000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
B0260000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
B0280000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
B02A0000&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;
B02C0000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
B02E0000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
B0300000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
B0320000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
B0340000&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;&nbsp;&nbsp;
B0360000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
B0380000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
B03A0000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
B03C0000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
B03E0000&nbsp;&nbsp;&nbsp;&nbsp; 

And&nbsp; the partitions:
&nbsp;
Creating 4 MTD partitions on "Physically mapped
flash":
0x00000000-0x00040000 : "u-boot"
0x00040000-0x000e0000 : "kernel"
0x000e0000-0x00100000 : "config"
0x00100000-0x00400000 : "filesystem"
&nbsp;
I enabled&nbsp;MTD and&nbsp;jffs2 filesystem support,
&nbsp;started the target system using NFS mode (i.e.
its filesystem is on the NFS server ). 
&nbsp;
then I downloaded from internet&nbsp;two diffrent
versions of&nbsp; executable file mkfs.jffs2. and
build the jffs2 image in this way:
./mkfs.jffs2 -b -e 0x20000 -d mydir -o fs.img
According to my flash information, the erase size is
128kB(0x20000), 
mydir is the directory from which I want to build
jffs2 filesystem.
fs.img is the name of the filesystem image .

It seems that these tools work well, but they produced
different images
from same directory.
But when I tried to mount the filesystem, I got a lot
of "CRC failed" errors. see below.
------------------------------------------------------------
/usr> erase /dev/mtd3
Erase Total 1 Units
Performing Flash Erase of length 131072 at offset 0x0
done
/usr> cp jffs2.img /dev/mtd3
/usr> mount -t jffs2 /dev/mtd3 /mnt
mount: Mounting /dev/mtd3 on /mnt failed: Block device
required
pid 31: failed 256
/usr> mount -t jffs2 /dev/mtdblock3 /mnt
mount: Bad command or file name
/usr> mount -t jffs2 /dev/mtdblock3 /mnt
jffs2_scan_dirent_node(): Name CRC failed on node at
0x0000000c: Read 0x09349Name for which CRC failed is
(now) 'ARMulator-HO'?@', ino #2
jffs2_scan_dirent_node(): Name CRC failed on node at
0x000006a0: Read 0x30779Name for which CRC failed is
(now) 'ARNEWSH-5206-HOW'?', ino #3
jffs2_scan_inode_node(): Data CRC failed on node at
0x000006dc: Read 0x77a574jffs2_scan_dirent_node():
Name CRC failed on node at 0x000009d0: Read
0x817beName for which CRC failed is (now)
'ARNEWSH-5307-HOW'?', ino #4
jffs2_scan_inode_node(): Data CRC failed on node at
0x00000a0c: Read 0xd24de9jffs2_scan_dirent_node():
Name CRC failed on node at 0x00000d40: Read
0x86dbdName for which CRC failed is (now)
'Adding-Platforms-HOW$?', ino #5
jffs2_scan_inode_node(): Data CRC failed on node at
0x00000d80: Read 0xcb6b49jffs2_scan_dirent_node():
Name CRC failed on node at 0x000013d8: Read
0xc74beName for which CRC failed is (now)
'Adding-User-Apps-HOW$?', ino #6
jffs2_scan_inode_node(): Data CRC failed on node at
0x00001418: Read 0x0fb7c7jffs2_scan_dirent_node():
Name CRC failed on node at 0x00001930: Read
0x58299Name for which CRC failed is (now) 'COBRA527s',
ino #7
jffs2_scan_dirent_node(): Name CRC failed on node at
0x000019a8: Read 0xcc103Name for which CRC failed is
(now) 'ColdFire-HOWAp', ino #8
jffs2_scan_inode_node(): Data CRC failed on node at
0x000019e0: Read 0xae98acjffs2_scan_inode_node(): Data
CRC failed on node at 0x000029f8: Read
0x5594e7jffs2_scan_dirent_node(): Name CRC failed on
node at 0x00003d10: Read 0x81192Name for which CRC
failed is (now) '...', ino #9
jffs2_scan_dirent_node(): Name CRC failed on node at
0x00004098: Read 0x3d2acName for which CRC failed is
(now) 'HITACHI-BigSurIV-HOW$?', ino #10
jffs2_scan_inode_node(): Data CRC failed on node at
0x000040d8: Read 0xc99856jffs2_scan_dirent_node():
Name CRC failed on node at 0x000042d4: Read
0x32938Name for which CRC failed is (now)
'HITACHI-KeyWest-HOWT$', ino #11
jffs2_scan_inode_node(): Data CRC failed on node at
0x00004314: Read 0xde672fjffs2_scan_dirent_node():
Name CRC failed on node at 0x0000450c: Read
0x7846dName for which CRC failed is (now)
'INTEL-IXDP425-HOHOW', ino #12
jffs2_scan_inode_node(): Data CRC failed on node at
0x00004548: Read 0x8484a3jffs2_scan_dirent_node():
Name CRC failed on node at 0x00004aa0: Read
0x0e39aName for which CRC failed is (now)
'LEOX-TSIM-HO5-H', ino #13
jffs2_scan_inode_node(): Data CRC failed on node at
0x00004ad8: Read 0x5b9ea4jffs2_scan_inode_node(): Data
CRC failed on node at 0x00004cf0: Read
0x45ea1djffs2_scan_inode_node(): Data CRC failed on
node at 0x00005478: Read
0x4de56ejffs2_scan_dirent_node(): Name CRC failed on
node at 0x000059dc: Read 0x06f05Name for which CRC
failed is (now) 'MOTOROLA-M5206eC3-HOu??', ino #15
jffs2_scan_inode_node(): Data CRC failed on node at
0x00005a1c: Read 0xaf4077jffs2_scan_dirent_node():
Name CRC failed on node at 0x00005cec: Read
0xf767bName for which CRC failed is (now)
'MOTOROLA-M5206eLITE-HOWT(', ino #16
......
&nbsp;
Eep. Child "LIESMICH" (ino #14) of dir ino #1 doesn't
exist!
Eep. Child "LIESMICH.txt" (ino #26) of dir ino #7
doesn't exist!
Eep. Child "COBRA5272-FAQ_de.txt" (ino #30) of dir ino
#28 doesn't exist!
Eep. Child "COBRA5272-FAQ_en.txt" (ino #32) of dir ino
#29 doesn't exist!
Eep. Child "COBRA5272-Getting-started_en.txt" (ino
#33) of dir ino #29 doesn!Inode #7 was a directory
with children - removing those too...
Cannot remove child "LIESMICH.txt", ino #26, because
it doesn't exist
Inode #28 was a directory with children - removing
those too...
Cannot remove child "COBRA5272-FAQ_de.txt", ino #30,
because it doesn't existInode #29 was a directory with
children - removing those too...
Cannot remove child "COBRA5272-FAQ_en.txt", ino #32,
because it doesn't existCannot remove child
"COBRA5272-Getting-started_en.txt", ino #33, because
it t/usr> cd /mnt
/mnt> ls
jffs2_read_inode() on nonexistent ino 14
LIESMICH: Input/output errorffs2_read_inode() on
nonexistent ino 25
SnapGear-SOHO+-HOWTO: Input/output error
/mnt> ls
LIESMICH: Input/output error
SnapGear-SOHO+-HOWTO: Input/output error
/mnt> mount
rootfs on / type rootfs (rw)
/dev/root on / type nfs
(rw,v2,rsize=4096,wsize=4096,hard,udp,nolock,addr=17)/proc
on /proc type proc (rw)
/dev/ram0 on /var type ext2 (rw)
/dev/ram1 on /etc/config type ext2 (rw)
/dev/mtdblock3 on /mnt type jffs2 (rw)
/mnt>
-------------------------------------------------------------
what's the reason? and what&nbsp;else should I
do?&nbsp; thanks.
&nbsp;



_________________________________________________________
Do You Yahoo!?
150万曲MP3疯狂搜，带您闯入音乐殿堂
http://music.yisou.com/
美女明星应有尽有，搜遍美图、艳图和酷图
http://image.yisou.com
1G就是1000兆，雅虎电邮自助扩容！
http://cn.rd.yahoo.com/mail_cn/tag/1g/*http://cn.mail.yahoo.com/event/mail_1g/
