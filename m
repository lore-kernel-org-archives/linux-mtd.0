Received: from mail-da0-x22b.google.com ([2607:f8b0:400e:c00::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUxNU-0006I5-CO
 for linux-mtd@lists.infradead.org; Wed, 24 Apr 2013 10:56:45 +0000
Received: by mail-da0-f43.google.com with SMTP id u36so836769dak.30
 for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2013 03:56:41 -0700 (PDT)
Received: from [192.168.1.2] (softbank126015195200.bbtec.net. [126.15.195.200])
 by mx.google.com with ESMTPSA id be10sm2584996pbd.30.2013.04.24.03.49.54
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
 Wed, 24 Apr 2013 03:49:55 -0700 (PDT)
Message-ID: <5177B8D0.8050202@gmail.com>
Date: Wed, 24 Apr 2013 19:49:52 +0900
From: Juha Lumme <juha.lumme@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: writing to JFFS2 filesystem makes it it unusable. Plenty of "Magic
 bitmask 0x1985" errors...
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have read the FAQ about JFFS2, but unfortunately I haven't been able 
to solve this after several days of trying.. I hope I can get some help here
I have a problem getting a jffs2 file system to work read-write. I can 
mount it ok, and read it correctly, but writing to it results to 
strangeness (fails).
Some background:
My flash chip is sst25vf064c (8MB SPI flash chip with erase block size 
of 64KB, or also 32 is ok according to datasheet).

I'm on an ARM board, and working on a read-only rootfs created with 
buildroot (squashfs). Now I would like to create overlays for /home and 
/etc for writing purposes, and thought JFFS2 would be a good solution 
for this.

For testing purposes, I have created a simple home structure:
jlumme@simppa:~/projects/jffs2_home$ ls -la
total 20
drwxrwxr-x 4 jlumme jlumme 4096 Apr 21 16:21 .
drwxrwxr-x 6 jlumme jlumme 4096 Apr 21 16:21 ..
drwxrwxr-x 2 jlumme jlumme 4096 Apr 21 13:45 default
drwxrwxr-x 2 jlumme jlumme 4096 Apr 21 13:45 ftp
-rw-rw-r-- 1 jlumme jlumme   24 Apr 21 15:34 test.txt

 From this I create an jffs2 image, with this command:
mkfs.jffs2 -r jffs2_home/ -e 64 -p -o home.jffs2
$ ls home.jffs2 -la
-rw-r--r-- 1 jlumme jlumme 65536 Apr 24 19:16 home.jffs2

I'm writing my whole flash chip with flashrom, and my flash layout looks 
like this:
uboot/<0x00000000 0x40000>
kernel/<0x00040000 0x3D9000>
dtb/<0x00419000 0x10000>
rootfs/<0x00429000 0x1F7000>
home/<0x00620000 0x1E0000> //This is where I would like to put my jffs2, 
the start is 64KB aligned

With DD I create my 1.9MB home section content, so that all other data 
is 0xFF, except what is inside home.jffs2. The flash section for home 
looks now like this (I only show the relevant beginning here, rest is 
just 0xFF until end of flash area):
http://paste.ubuntu.com/5597974/

I can mount my mtdblock fine, and all the files look ok. Now if I modify 
the test.txt, and save it, vi immediately spits out a warning:
[   77.030000] jffs2: Node totlen on flash (0xffffffff) != totlen from 
node ref (0x00000044)
At this point I can still see "the modifications". However, if I 
un-mount the drive, and remount it, I start getting new errors:
# mount -t jffs2 /dev/mtdblock4 /home/
[   99.740000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not 
found at 0x001d4070: 0xff0a instead
[   99.760000] jffs2: Empty flash at 0x001d4074 ends at 0x001d412c
[   99.770000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not 
found at 0x001d412c: 0xffff instead
[   99.790000] jffs2: Empty flash at 0x001d4130 ends at 0x001d4194
[   99.790000] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not 
found at 0x001d4194: 0xff0a instead

This is pretty much as far as I have gotten.
My kernel is from freescale mainline "patches-3.8" branch, with newest 
snapshot of drivers/mtd/devices folder (I saw some patches related to 
the sst25vfXXX chips, so I thought I should try those).
In my kernel I have following MTD flags enabled:
http://paste.ubuntu.com/5597993/

By default, cat /proc/mtd shows this:
# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00040000 00001000 "uboot"
mtd1: 003d9000 00001000 "kernel"
mtd2: 00010000 00001000 "dtb"
mtd3: 001f7000 00001000 "rootfs"
mtd4: 001e0000 00001000 "home"

I thought why this erase area is 4KB here (I can't create 4KB erase file 
systems. 8KB is minimum mkfs.jffs2 accepts), and hacked the m25p80.c, so 
that erasearea was 64KB, but this didn't help the case unfortunately. I 
know there is probably a good reason why this has been set to 4KB 
(sector size is 4KB), but it was confusing.
I'm really stuck here, not sure what I could try next..

I really appreciate any tips where I might have gone wrong...
