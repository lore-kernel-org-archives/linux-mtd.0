Received: from nm31-vm6.bullet.mail.bf1.yahoo.com ([72.30.239.14])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z8v6z-0005sX-8y
 for linux-mtd@lists.infradead.org; Sat, 27 Jun 2015 18:45:58 +0000
Date: Sat, 27 Jun 2015 18:45:16 +0000 (UTC)
From: <ygator@yahoo.com>
Reply-To: <ygator@yahoo.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Message-ID: <924203646.1063143.1435430716081.JavaMail.yahoo@mail.yahoo.com>
Subject: Bugs with jffs2reader
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, 

I sent this once and have my subscription set to receive my own posts, but I never saw it show up on the list.
I've now turned on Receive acknowledgement and will try again.

I wanted to report that I have run across 3 bugs with jffs2reader. 
The image used in the these findings is located here: http://toko.baliwae.com/download/1.8.5.1B_201513211614.zip 
Below is the partial output of jffs2reader and jffs2dump on the image. 

1. Incorrect file size shown on output (see jffs2reader output below).  Any file with a size of 4096 or above is reported as 4096. 
2. Extracting a file using -f option yields only the first max 4096 characters of the file. 
3. jffs2reader not seeing first entry in image.  So looking at jffs2dump shows 3518 directory as the first entry, but jffs2reader does not see. 

I found that the first two bugs were fixed in the code located https://github.com/vamanea/mtd-utils 

Thanks 




jffs2reader output: 
-rwxr-xr-x 1    0        0                0 /704 
-rwxr-xr-x 1    0        0            4096 /MCLI 
-rwxr-xr-x 1    0        0            4096 /alarmmng 
-rwxr-xr-x 1    0        0            4096 /as-iosched.ko 
-rwxr-xr-x 1    0        0                0 /ch0.h264 
-rwxr-xr-x 1    0        0                0 /ch1.h264 
-rwxr-xr-x 1    0        0                0 /ch2.h264 
-rwxr-xr-x 1    0        0                0 /ch3.h264 
-rwxr-xr-x 1    0        0            4096 /checkdisk 
-rwxr-xr-x 1    0        0            4096 /cloud 
-rwxr-xr-x 1    0        0            4096 /cloudAPI 
-rwxr-xr-x 1    0        0            4096 /connectting.g726 
-rwxr-xr-x 1    0        0            4096 /cpld_periph.ko 
-rwxr-xr-x 1    0        0            4096 /cpld_wdg.ko 
-rwxr-xr-x 1    0        0            4096 /crcCheck 
-rwxr-xr-x 1    0        0            4096 /curl 
drwxr-xr-x 1    0        0                0 /debuger/ 
-rwxr-xr-x 1    0        0                0 /debuger/.gitignore 
-rwxr-xr-x 1    0        0            4096 /default.script 
-rwxr-xr-x 1    0        0            4096 /detect_ver 
-rwxr-xr-x 1    0        0            4096 /dhcpcd 
-rwxr-xr-x 1    0        0              886 /dhcpcd.conf 
-rwxr-xr-x 1    0        0            4096 /dispatch 
-rwxr-xr-x 1    0        0            4096 /dumpmmap 
-rwxr-xr-x 1    0        0            4096 /dvr_timer 
-rwxr-xr-x 1    0        0            1700 /equip_test.sh 
-rwxr-xr-x 1    0        0            4096 /exnet 
-rwxr-xr-x 1    0        0            1916 /fappend.sh 
-rwxr-xr-x 1    0        0                0 /fb4 
-rwxr-xr-x 1    0        0              36 /fdisk.input 


jffs2dump -c output: 

Dirent    node at 0x0000000c, totlen 0x0000002c, #pino    1, version    0, #ino        2, nsize        4, name 3518 
Inode      node at 0x00000038, totlen 0x00000044, #ino      2, version    1, isize        0, csize        0, dsize        0, offset        0 
Dirent    node at 0x0000007c, totlen 0x0000002b, #pino    1, version    1, #ino        3, nsize        3, name 704 
Inode      node at 0x000000a8, totlen 0x00000044, #ino      3, version    1, isize        0, csize        0, dsize        0, offset        0 
Dirent    node at 0x000000ec, totlen 0x0000002c, #pino    1, version    2, #ino        4, nsize        4, name MCLI 
Inode      node at 0x00000118, totlen 0x00000859, #ino      4, version    1, isize    18416, csize    2069, dsize    4096, offset        0 
Inode      node at 0x00000974, totlen 0x00000a37, #ino      4, version    2, isize    18416, csize    2547, dsize    4096, offset    4096 
Inode      node at 0x000013ac, totlen 0x00000a0e, #ino      4, version    3, isize    18416, csize    2506, dsize    4096, offset    8192 
Inode      node at 0x00001dbc, totlen 0x00000480, #ino      4, version    4, isize    18416, csize    1084, dsize    4096, offset    12288 
Inode      node at 0x0000223c, totlen 0x000003a0, #ino      4, version    5, isize    18416, csize      860, dsize    2032, offset    16384 
Dirent    node at 0x000025dc, totlen 0x00000030, #pino    1, version    3, #ino        5, nsize        8, name alarmmng 
Inode      node at 0x0000260c, totlen 0x000007ce, #ino      5, version    1, isize    19944, csize    1930, dsize    4096, offset        0 
Inode      node at 0x00002ddc, totlen 0x00000780, #ino      5, version    2, isize    19944, csize    1852, dsize    4096, offset    4096 
Inode      node at 0x0000355c, totlen 0x000006e3, #ino      5, version    3, isize    19944, csize    1695, dsize    4096, offset    8192 
Inode      node at 0x00003c40, totlen 0x000009d0, #ino      5, version    4, isize    19944, csize    2444, dsize    4096, offset    12288 
Inode      node at 0x00004610, totlen 0x0000074e, #ino      5, version    5, isize    19944, csize    1802, dsize    3560, offset    16384
