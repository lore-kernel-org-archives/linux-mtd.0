Received: from web21403.mail.yahoo.com ([216.136.232.73])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16vC8l-0006YD-00
	for <linux-mtd@lists.infradead.org>; Wed, 10 Apr 2002 08:03:35 +0100
Message-ID: <20020410070333.75392.qmail@web21403.mail.yahoo.com>
Date: Wed, 10 Apr 2002 00:03:33 -0700 (PDT)
From: Trevor Warren <trevorwarren@yahoo.com>
Subject: problem with old M-sys 1000 DOC
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Dudes....hello there.....
 trevor here...

  While rumagin thro the office a few dayz ago i
happen to lay me hands on a M-sys DOC....which is an
old 1...if i may say so.

 I aint sure abt how old it may be..but we had ordered
it from taiwan when Gateway had 1st introduced it's
Diskless Linux servers for SOHO/SME's. 

--> This DOC PCI card has an iTE IDE controller
chipset with the following inscription [IT8871F,
0033-AYS, EE5G39] and a M-sys DOC [ MD-2800-D08 ].




--> This card is detected on my PCI bus on my RH7.2
gnu-linux box as follows.........


" Bus  0, device  13, function  0:
    Serial controller: PCI device 1283:8872
(Integrated Technology Express, Inc.) (rev 1).
      IRQ 3.
      I/O at 0xb400 [0xb4ff].
      I/O at 0xb800 [0xb8ff].
      I/O at 0xbc00 [0xbcff].
      I/O at 0xc000 [0xc0ff].
      I/O at 0xc400 [0xc4ff].
      I/O at 0xc800 [0xc8ff]."

--> O/p from the boot process...

"MTD Sharp chip driver <ds@lineo.com>
mtd: Giving out device 0 to M-Systems DiskOnChip 1000
No recognised DiskOnChip devices found
slram: not enough parameters.
blkmtd: error, missing `device' name
$Id: ftl.c,v 1.39 2001/10/02 15:05:11 dwmw2 Exp $
ftl_cs: FTL header not found.
NFTL driver: nftlcore.c $Revision: 1.82 $, nftlmount.c
$Revision: 1.25 $
Linux Kernel Card Services 3.1.22
  options:  [pci] [cardbus] [pm]"

--> My /proc/mtd sayz the following...

"dev:    size   erasesize  name
mtd0: 00100000 00010000 "M-Systems DiskOnChip 1000"

--> I hav applied the mtd patch to the 2.4.18 from
M-SYS available fro their website........which allowes
1 to choose the DOC Flash disk as a BLock Device
during kernel compilation.

--> Also with the kernel 2.4.18 i hav the option of
compiled the driver for ALL the M-sys
devices......including
 This is the 2.4.18 kernel compile using "make
menuconfig" in curses.

   *********************************

<*> Memory Technology Device (MTD) support            
 [*] Debugging
(0)   Debugging verbosity (0 = quiet, 3 = noisy)      
 <*>   MTD partitioning support                       
  <*>   RedBoot partition table parsing               
   --- User Modules And Translation Layers            
    <*>   Direct char device access to MTD devices    
     <*>   Caching block device access to MTD devices 
      <*>   FTL (Flash Translation Layer) support     
       <*>   NFTL (NAND Flash Translation Layer)
support       [*]     Write support for NFTL (BETA)   
               RAM/ROM/Flash chip drivers  --->       
                Mapping drivers for chip access  ---> 
                 Self-contained MTD device drivers 
--->                 NAND Flash Device Drivers  --->


  *******************************


There also is somethin in the MTD section called
.........
            ******************
<*>   CFI Flash device in physical memory map         
 (8000000)     Physical start address of flash mapping
(NEW)  
(4000000)     Physical length of flash mapping (NEW)  
 (2)     Bus width in octets (NEW)
       *************************
 
 Which i am just tryin out...to exhaust all my
options...;)

--> Results of a small test
"bash#./ftl_check /dev/mtd0
Memory region info:
  Region size = 1024 kb  Erase block size = 64 kb

No valid erase unit headers!"

-->  A ftl_format.........gives the following errors
thro syslog.

"  1 20:59:26 localhost kernel: end_request: I/O
error, dev 1f:00 (mtdblock), sector 0
Apr  1 20:59:28 localhost kernel: sync...Done.
Apr  1 20:59:39 localhost kernel: sync...Done.
Apr  1 20:59:42 localhost kernel: MTD_open
Apr  1 20:59:42 localhost kernel: MTD_ioctl
Apr  1 20:59:42 localhost kernel: Invalid ioctl 1268
(MEMGETINFO = 80204d01)
Apr  1 20:59:42 localhost kernel: MTD_ioctl
Apr  1 20:59:42 localhost kernel: Invalid ioctl 1260
(MEMGETINFO = 80204d01)
Apr  1 20:59:42 localhost kernel: MTD_ioctl
Apr  1 20:59:42 localhost kernel: Invalid ioctl 330
(MEMGETINFO = 80204d01)
Apr  1 20:59:42 localhost kernel: MTD_read
Apr  1 20:59:42 localhost last message repeated 2
times
Apr  1 20:59:47 localhost kernel: MTD_close
Apr  1 20:59:47 localhost kernel: sync...Done.
Apr  1 21:00:01 localhost kernel: MTD_open
Apr  1 21:00:01 localhost kernel: MTD_ioctl
Apr  1 21:00:01 localhost kernel: MTD_read
Apr  1 21:00:01 localhost last message repeated 15
times
Apr  1 21:00:01 localhost kernel: MTD_close
Apr  1 21:00:01 localhost kernel: sync...Done.
Apr  1 21:00:10 localhost kernel: MTD_open
Apr  1 21:00:10 localhost kernel: MTD_ioctl
Apr  1 21:00:10 localhost kernel: MTD_close
Apr  1 21:00:10 localhost kernel: sync...Done.
Apr  1 21:00:15 localhost kernel: sync...Done.
Apr  1 21:00:20 localhost kernel: MTD_open
Apr  1 21:00:20 localhost kernel: MTD_ioctl
Apr  1 21:00:20 localhost kernel: MTD_close
Apr  1 21:00:20 localhost kernel: sync...Done.
Apr  1 21:00:59 localhost kernel: MTD_open
Apr  1 21:00:59 localhost kernel: MTD_ioctl
Apr  1 21:00:59 localhost kernel: MTD_close
Apr  1 21:00:59 localhost kernel: sync...Done.
Apr  1 21:01:09 localhost kernel: sync...Done.
Apr  1 21:01:22 localhost kernel: MTD_open
Apr  1 21:01:22 localhost kernel: MTD_ioctl
Apr  1 21:01:22 localhost kernel: MTD_ioctl
Apr  1 21:01:23 localhost kernel: flashcard: erase
failed, status 0xd3ea
Apr  1 21:01:41 localhost last message repeated 9
times"


--> 
    Dudes....i know some of u would say....why dont u
buy a new card.........but i need to PROOVE to the
management that Linux on the DOC could create a lovely
product line for them using a DIskless Server based
approach...nd diskless Thin clients........
 FOr which i hav to proove myself using the crappy old
hardware i have...:((
  But i am determined to ...........to get it running
with microwindowz nd all..;)


--> Can pple help me out...or give me pointers as to
where is the issues....nd why i am not able to
format/mount/access the flash file system.
 From my understanding...in the 2.4.18 kernel i hav
compiled vrythin in........isnt the FLASH file system
driver in too.....???
  PLEASE ....guide me pals.....

TIA dudes....

Trevor Warren
 


=====
( >-    GNU/LINUX, It's all about CHOICE      -< )
/~\    __  http://www.qmailtheeasyway.com __   /~\
|  \) /    mailto: trevorwarren@yahoo.com   \ (/ |
|_|_  \ Urgent ->9820349221@maxtouch.co.in  / _|_|
       \___________________________________/

__________________________________________________
Do You Yahoo!?
Yahoo! Tax Center - online filing with TurboTax
http://taxes.yahoo.com/
