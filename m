Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 1357T9-0004iv-00
	for mtd-list@infradead.org; Thu, 22 Jun 2000 14:56:35 +0100
Received: from maverick.techno.spb.ru ([195.5.142.101])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 1357T6-0004ip-00
	for mtd@infradead.org; Thu, 22 Jun 2000 14:56:33 +0100
Received: from techno.spb.ru (localhost [127.0.0.1])
	by maverick.techno.spb.ru (8.9.3/8.9.3) with ESMTP id SAA01241
	for <mtd@infradead.org>; Thu, 22 Jun 2000 18:02:41 +0400
Message-ID: <39521C80.DE405C7A@techno.spb.ru>
Date: Thu, 22 Jun 2000 18:02:40 +0400
From: Nick Maximov <maxs@techno.spb.ru>
Reply-To: maxs@techno.spb.ru
MIME-Version: 1.0
To: mtd@infradead.org
Subject: [Fwd: [Fwd: Using MTD drivers with Ampro CoreModule/p5e]]
Content-Type: multipart/mixed;
 boundary="------------4C92D4C695E4DABDD06D11BA"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.
--------------4C92D4C695E4DABDD06D11BA
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

 
  I have got new minimodule Ampro CM/p5e with M-Systems DiskOnChip2000
  installed. First I tried to use M-Systems binary drivers to access
  device and got it worked but was unable to set up Linux to load
  from Flash (because supplied patched lilo does not works on).
 
  I have no HDD connected to CM/p5e but have my own host with Red Hat
  6.2. On this machine I compiled kernel for my CM/p5e. (Kernel version
is
  2.2.14.5-0)
 
  Now I want to try to work with Grub and MTD drivers to get whole
  things up. First problem is that I cannot locate the latest version
  of grub. FSF site redirects me to GNU and there is just alpha version
  of 0.5 that is not recomended by David.
 
  Could anyone tell me step-by-step what should I do?
 
  I have utility disk from Ampro with DoC firmware (DOC2.FFF and
  DOC123.EXB). I followed instructions in M-Systems manual
  "Using DoC under Linux OS" and update firmware using DOC.FFF image.
  Then I successfully built the new kernel with drivers dowloaded
  from M-System's site. Then I have created rescue diskset
  with new kernel and successfully boot and got access to /dev/fla.
  I successfully to fdisked it and mke2fsed it and even cp there some
  files. And at this point my success is gone. I spent time trying to
  make FlashDisk bootable but nothing is works.
 
  I tried to install drivers from latest mtd and got compilation errors.
  So I was unable even got read access with mtd drivers :-(
 
 gcc -D__KERNEL__ -I/usr/src/linux-2.2.14/include -Wall
 -Wstrict-prototypes -O2 -
 fomit-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce
 -m486 -malig
 n-loops=2 -malign-jumps=2 -malign-functions=2 -DCPU=586 -DMODULE
 -DMODVERSIONS -
 include /usr/src/linux-2.2.14/include/linux/modversions.h
 -I/root/mtd/kernel/../
 include  -c -o nftl.o nftl.c
 nftl.c: In function `NFTL_setup':
 nftl.c:145: warning: long unsigned int format, unsigned int arg (arg 3)
 nftl.c: In function `NFTL_foldchain':
 nftl.c:435: warning: implicit declaration of function
 `__constant_cpu_to_le16'
 nftl.c:435: case label does not reduce to an integer constant
 nftl.c:439: case label does not reduce to an integer constant
 nftl.c:445: case label does not reduce to an integer constant
 nftl.c:446: case label does not reduce to an integer constant
 nftl.c:436: warning: unreachable code at beginning of switch statement
 nftl.c: In function `NFTL_readblock':
 nftl.c:728: case label does not reduce to an integer constant
 nftl.c:731: case label does not reduce to an integer constant
 nftl.c:734: case label does not reduce to an integer constant
 nftl.c:735: case label does not reduce to an integer constant
 nftl.c:729: warning: unreachable code at beginning of switch statement
 nftl.c: In function `NFTL_findwriteunit':
 nftl.c:799: case label does not reduce to an integer constant
 nftl.c:802: case label does not reduce to an integer constant
 nftl.c:803: case label does not reduce to an integer constant
 nftl.c:804: case label does not reduce to an integer constant
 nftl.c:800: warning: unreachable code at beginning of switch statement
 nftl.c: At top level:
 nftl.c:1158: warning: `init_module' defined but not used
 nftl.c:1202: warning: `cleanup_module' defined but not used
 make[2]: *** [nftl.o] Error 1
 make[2]: Leaving directory `/root/mtd/kernel'
 make[1]: *** [_mod_/root/mtd/kernel] Error 2
 make[1]: Leaving directory `/usr/src/linux-2.2.14'
 make: *** [all] Error 2
 [root@maverick mtd]#
 
  Please help!!!
 
 --nick
--------------4C92D4C695E4DABDD06D11BA
Content-Type: message/rfc822
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

X-Mozilla-Status2: 00000000
Message-ID: <39521B72.3ACC05E0@techno.spb.ru>
Date: Thu, 22 Jun 2000 17:58:10 +0400
From: Nick Maximov <maxs@techno.spb.ru>
Reply-To: maxs@techno.spb.ru
Organization: Techno-Spb
X-Mailer: Mozilla 4.72 [en] (X11; U; Linux 2.2.14-5.0 i686)
X-Accept-Language: ru, en
MIME-Version: 1.0
To: mtd@infradead.com
Subject: [Fwd: Using MTD drivers with Ampro CoreModule/p5e]
Content-Type: multipart/mixed;
 boundary="------------9E6AC12C34760A3C4E71785A"

This is a multi-part message in MIME format.
--------------9E6AC12C34760A3C4E71785A
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

 
 I have got new minimodule Ampro CM/p5e with M-Systems DiskOnChip2000
 installed. First I tried to use M-Systems binary drivers to access 
 device and got it worked but was unable to set up Linux to load 
 from Flash (because supplied patched lilo does not works on).
 
 I have no HDD connected to CM/p5e but have my own host with Red Hat
6.2.
 On this machine I compiled kernel for my CM/p5e. (Kernel version is
 2.2.14.5-0)
 
 Now I want to try to work with Grub and MTD drivers to get whole 
 things up. First problem is that I cannot locate the latest version
 of grub. FSF site redirects me to GNU and there is just alpha version 
 of 0.5 that is not recomended by David.
 
 Could anyone tell me step-by-step what should I do?
 
 I have utility disk from Ampro with DoC firmware (DOC2.FFF and
 DOC123.EXB). I followed instructions in M-Systems manual 
 "Using DoC under Linux OS" and update firmware using DOC.FFF image. 
 Then I successfully built the new kernel with drivers dowloaded 
 from M-System's site. Then I have created rescue diskset
 with new kernel and successfully boot and got access to /dev/fla.
 I successfully to fdisked it and mke2fsed it and even cp there some
 files. And at this point my success is gone. I spent time trying to
make
 FlashDisk bootable but nothing is works.
 
 I tried to install drivers from latest mtd and got compilation errors.
 So I was unable even got read access with mtd drivers :-(

gcc -D__KERNEL__ -I/usr/src/linux-2.2.14/include -Wall
-Wstrict-prototypes -O2 -
fomit-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce
-m486 -malig
n-loops=2 -malign-jumps=2 -malign-functions=2 -DCPU=586 -DMODULE
-DMODVERSIONS -
include /usr/src/linux-2.2.14/include/linux/modversions.h
-I/root/mtd/kernel/../
include  -c -o nftl.o nftl.c
nftl.c: In function `NFTL_setup':
nftl.c:145: warning: long unsigned int format, unsigned int arg (arg 3)
nftl.c: In function `NFTL_foldchain':
nftl.c:435: warning: implicit declaration of function
`__constant_cpu_to_le16'
nftl.c:435: case label does not reduce to an integer constant
nftl.c:439: case label does not reduce to an integer constant
nftl.c:445: case label does not reduce to an integer constant
nftl.c:446: case label does not reduce to an integer constant
nftl.c:436: warning: unreachable code at beginning of switch statement
nftl.c: In function `NFTL_readblock':
nftl.c:728: case label does not reduce to an integer constant
nftl.c:731: case label does not reduce to an integer constant
nftl.c:734: case label does not reduce to an integer constant
nftl.c:735: case label does not reduce to an integer constant
nftl.c:729: warning: unreachable code at beginning of switch statement
nftl.c: In function `NFTL_findwriteunit':
nftl.c:799: case label does not reduce to an integer constant
nftl.c:802: case label does not reduce to an integer constant
nftl.c:803: case label does not reduce to an integer constant
nftl.c:804: case label does not reduce to an integer constant
nftl.c:800: warning: unreachable code at beginning of switch statement
nftl.c: At top level:
nftl.c:1158: warning: `init_module' defined but not used
nftl.c:1202: warning: `cleanup_module' defined but not used
make[2]: *** [nftl.o] Error 1
make[2]: Leaving directory `/root/mtd/kernel'
make[1]: *** [_mod_/root/mtd/kernel] Error 2
make[1]: Leaving directory `/usr/src/linux-2.2.14'
make: *** [all] Error 2
[root@maverick mtd]#       
 
 Please help!!!
 
--nick
--------------9E6AC12C34760A3C4E71785A
Content-Type: message/rfc822
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

X-Mozilla-Status2: 00000000
Message-ID: <3952181F.8F8E4C9A@techno.spb.ru>
Date: Thu, 22 Jun 2000 17:43:59 +0400
From: Nick Maximov <maxs@techno.spb.ru>
Reply-To: maxs@techno.spb.ru
Organization: Techno-Spb
X-Mailer: Mozilla 4.72 [en] (X11; U; Linux 2.2.14-5.0 i686)
X-Accept-Language: ru, en
MIME-Version: 1.0
To: MTD Mailing list <Majordomo@infradead.org>
Subject: Using MTD drivers with Ampro CoreModule/p5e
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 7bit

I have got new minimodule Ampro CM/p5e with M-Systems DiskOnChip2000
installed.
First I tried to use M-Systems binary drivers to access device and got
it
worked but was unable to set up Linux to load from Flash (because
supplied
patched lilo does not works on).

I have no HDD connected to CM/p5e but have my own host with Red Hat 6.2. 
On this machine I compiled kernel for my CM/p5e. (Kernel version is
2.2.14.5-0)

Now I want to try to work with Grub and MTD drivers to get whole things
up.
First problem is that I cannot locate the latest version of grub. FSF
site
redirects me to GNU and there is just alpha version of 0.5 that is not
recomended by
David.

Could anyone tell me step-by-step what should I do?

I have utility disk from Ampro with DoC firmware (DOC2.FFF and
DOC123.EXB).
I followed instructions in M-Systems manual "Using DoC under Linux OS"
and
update firmware using DOC.FFF image. Then I successfully built the new
kernel
with drivers dowloaded from M-System's site. Then I have created rescue
diskset
with new kernel and successfully boot and got access to /dev/fla. 
I successfully to fdisked it and mke2fsed it and even cp there some
files.
And at this point my success is gone. I spent time trying to make
FlashDisk
bootable but nothing is works.

Please help!!!

--nick

--------------9E6AC12C34760A3C4E71785A--


--------------4C92D4C695E4DABDD06D11BA--



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
