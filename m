Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SlRJ-0001M1-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 19:48:41 +0000
Received: from mail1.daniel.com ([12.19.96.6] helo=mail1.danielind.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14SlR7-0001Lt-00
	for mtd@infradead.org; Tue, 13 Feb 2001 19:48:30 +0000
Message-ID: <3A8995B4.F3F3EBCA@danielind.com>
Date: Tue, 13 Feb 2001 14:14:44 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: mtd <mtd@infradead.org>, jffs-dev <jffs-dev@axis.com>
Subject: Third cut of the MTD-JFFS HOWTO (with a name spelling correction)
Content-Type: multipart/mixed;
 boundary="------------E3FF6841C507F27CB97B05FB"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.
--------------E3FF6841C507F27CB97B05FB
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Sorry, I mis-spelled Johan's name. This version corrects that as well as
adds a FAQ on blocking garbage collects (during sector erases).

This HOWTO will soon go into the CVS so I'll stop cluttering up the
mailing list.

Vipin

--------------E3FF6841C507F27CB97B05FB
Content-Type: text/plain; charset=us-ascii;
 name="mtd-jffs-HOWTO.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mtd-jffs-HOWTO.txt"

                      ***  The Linux MTD, JFFS HOWTO ***
         (work in progress, please contribute if you have anything)

Last Updated: Feb 13 2001
Compiled By: Vipin Malik (vmalik@danielind.com)

**ABOUT:

This document will attempt to describe setting up the MTD (Memory
Technology Devices), DOC, CFI and the JFFS (Journaling file system)
under Linux versions 2.2.x and 2.4.x

This is work in progress and (hopefully) with the help of others on
the mtd and jffs mailing lists will become quite a comprehensive
document.

Please mail any comments/corrections/contributions to
vmalik@danielind.com






*** Getting Started:

If you want to seriously design a project with MTD/JFFS please
subscribe to the respective mailing lists.

MTD:
  There is a majordomo-managed mailing list: mtd@infradead.org
  To subscribe, send "subscribe mtd" in the body of a mail to
  majordomo@infradead.org

JFFS:
  Please send an email to majordomo@axis.com containing this line in
  the body of the email:
  subscribe jffs-dev 

The home page for the two projects are located at:
MTD/DOC/
 http://www.linux-mtd.infradead.org/
JFFS
 http://developer.axis.com/software/jffs/ 

The MTD mail archive is at:
 http://www.linux-mtd.infradead.org/list-archive/

The JFFS mail archive is at:
 http://mhonarc.axis.se/jffs-dev/threads.html


*** Getting the latest code:

The entire MTD/DOC/JFFS (and some utils) source code may be downloaded
via anonymous CVS.

Follow the following steps:
1.Make sure that you are root.
2. cd /usr/src
3. cvs -d :pserver:anoncvs@cvs.infradead.org:/home/cvs login
(password: anoncvs)
4. cvs -d :pserver:anoncvs@cvs.infradead.org:/home/cvs co mtd

This will create a dir called mtd under /usr/src

You now have two options depending on what series of the Linux Kernel
you want to work with.
There is an extra step involved with the 2.2 series kernels as they do
not have any MTD code in them.


** With 2.2.x series kernels:

(Note that as far as I can tell, mtd and jffs does not work as modules
under the 2.2.x series of kernels. If you want to do modules I would
recommend that you upgrade to the 2.4.x series of kernels).

Get the 2.2.17 or 2.2.18 kernel source code from your favorite source
(ftp.kernel.org) and install the kernel under /usr/src/linux-2.2.x
with /usr/src/linux being a symbolic link to your kernel source dir.

Configure the kernel to your desired options (by doing a make config
(or menuconfig or xconfig), and make sure that the kernel compiles ok.

Download the mtd patch from:
ftp://ftp.infradead.org/pub/mtd/patches

Move the patch to /usr/src/linux and do

   patch -p1 < <patch file name here>

Make sure that the patch was applied ok without any errors.
This will add the mtd functionality to your basic kernel and bring the
mtd code upto date to the date of the patch.

You have two choices here. You may do a make config and configure in
mtd stuff with the current code or you may want to get the latest code
from the cvs patched in.

If you want the latest CVS code patched in follow the 2.4.x directions
below.

** With 2.4.x series of kernels:

If you want the latest code from CVS (available under /usr/src/mtd)
do:
1. cd /usr/src/mtd/patches
2. sh patchin.sh /usr/src/linux

This will create symbolic links from the
/usr/src/linux/drivers/mtd/<files here> to
the respective files in /usr/src/mtd/kernel/<latest files here>

The same happens with /usr/src/linux/fs/jffs and
/usr/src/linux/include/linux/mtd

Now you have the latest cvs code available with the kernel. You may
now do a make config (or menuconfig or xconfig) and config the
mtd/jffs etc. stuff in as described below.




*** Configuring MTD and friends for DOC in the Kernel:

Do not use any mtd modules with the 2.2.x series of kernels. As far as
I can tell, it does not work even if you can get it to compile ok.

Modules work ok with the 2.4.x series of kernels.

Depending on what you want to target you have some choices here,
namely:


*** 1. Disk On Chip Devices (DOC):
For these, you need to turn on (or make into modules) the following:

*MTD core support
*Debugging (set the debug level as desired)
*Select the correct DOC driver depending on the DOC that you have
(1000, 2000 or Millennium).
*If you know the physical address of your chip then input that here. A
lot of people input 0xd000 if their chip is mapped into the BIOS
expansion rom address. You need to say 0xD0000 (the actual physical
address, not just the segment address).

If you leave the address blank, the code will *auto probe*. This works
quite well (at least for me). Try it first.

*Probe High Addresses will probe in the top of the possible memory
 range rather than  in the usual BIOS ROM expansion range from 640K -
 1Meg. This has to do with LinuxBIOS. See the mailing list archive for
 some e-mails regarding this. If you don't know what I am talking
 about here, leave this option off.

*Probe for 0x55 0xaa BIOS signature. If you kept the address at 0
 (auto probe), say yes here.

Leave everything else off, till you reach...
User Modules and Translation layers:
* Direct char device access - yes
* Caching block device access - yes
* NFTL layer support - yes
* Write support for NFTL(beta) - yes

Save everything, make dep, make bzImage, make modules, make
modules_install

Note: If you downloaded the 2.4.x series kernels and your original
installed distribution came with the 2.2.x series of kernels then you
need to download the latest modutils (from
ftp.kernel.org/utils/kernel), else make modules_install or depmod -a
will fail for the new 2.4.x kernels.

Move everything to the right place, install the kernel, run lilo and
reboot.

If you compiled the mtd stuff into the kernel (see later section if
you compiled as modules- which is what I prefer as you don't have to
keep rebooting) then look for the startup messages. In particular pay
attention to the lines when the MTD DOC header runs. It will say
something like:

"DiskOnChip found at address 0xD0000 (your addrss may be different)"
"nftla1"

The above shows that the DOC was detected fine and one partition was
found and assigned to /dev/nftla1. If further partitions are detected,
they will be assigned to /dev/nftla2 etc.

Note that the MTD device is /dev/mtd0 and details are available by
doing a:

#cat /proc/mtd
dev:    size   erasesize  name
mtd0: 02000000 00004000 "DiskOnChip 2000"

/dev/nftla1,2,3  are "regular" block disk partitions and you may
mke2fs on them to put a ext2 fs on it. Then they may be mounted in the
regular way.

When the DiskOnChip is detected and instead of nftla1,2,3... you get
something like:

"Could not find valid boot record"
"Could not mount NFTL device"

...you have a "hosed" (that's a technical term) disk. You need to
"un-hose" it. To help you out in that department there is a utility
available under /usr/src/mtd/util called nftl_format.

Essentially after you'r disk have been detected but complains about
"Could not mount NFTL device", just run
#./nftl_format /dev/mtd0 (if your device was installed under mtd0, see
cat /proc/mtd/).

If your device "erasesize" is 8k (0x2000), then the utility will go
ahead and format it. Just reboot and this time the drivers will
complain about an "unknown partition table".

Don't worry. Just do:
# fdisk /dev/nftla

and create some partitions on them. TaDa! You may now e2fsck and
others on these partitions.

*** IF you compiled the mtd stuff as modules (What I prefer):
Make sure that you have done a depmod -a after you reboot with the
new kernel.

Then just
#modprobe -a doc2000 nftl nand mtdchar mtdblock

You have now loaded the core stuff. The actual detection takes place
only when you load the docprobe module. Then do
#modprobe -a docprobe

You should then see the messages described in the section
above. Follow the directions and procedures are outlined in the
section above (where you would have compiled the mtd/DOC stuff into
the kernel).





*** 2. Raw Flash (primarily NOR) chips

This are multiple (or just one) flash IC's that may be soldered on
your board or you may be designing some in. Unlike the DOC device,
these are usually linearly memory mapped into the address space
(though not necessarly, they may also be paged).

MTD can handle x8, x16 or x32 wide memory interfaces, using x8, x16
(even x32 chips (are they such a thing)?- confirm).

At present CFI stuff seems to work quite well and these are the type
of chips on my board. Hence I will describe them first. Maybe someone
with JDEC chips can describe that.

You must use (for all practical purposes that involve writing) JFFS on
raw flsah MTD devices. This is because JFFS provides a robust writing
and wear levealing mechanism. See FAQ for more info.



*** Configuring the kernel with MTD/CFI/JFFS and friends. 
Turn off all options for MTD except those mentioned here.

* MTD support (the core stuff)
* Debugging -yes (try level 3 initially)
* Support for ROM chips in bus mapping -yes
* CFI (common flash interface) support -yes
* Specific CFI flash geometry selection -yes
* <select they FLASH chip geometry that you have on your board>
* If you have a 32 bit wide flash interface with 8bit chips, then you
  have 4 way interleaving, etc. Turning on more than one option does
  not seem to hurt anything
* CFI support for Intel.Sharp or AMD/Fijutsu as your particular case
  may be.
* Physical mapping of flash chips - set your config here or if you
  have one of the boards listed then select the board as the case may
  be.

Then under "File systems" select:
* jffs and 
* /proc filesystem support right under that.
* Select a jffs debugging verbosity level. Start high then go low.

Save, make dep, make bzImage, make modules, make modules_install, move
kernel to correct spot, add lilo entries, run lilo (or your fav. boot
loader) and reboot.

If you have compiled the stuff as modules then do (as root):
# depmod -a
# modprobe -a mtdchar mtdblock cfi_cmdset_0002 map_rom cfi_probe

This loads the core modules for cfi flash. Now we probe for the actual
flash by doing:
#modprobe -a physmap

Look at the console window (Note if you are telnet'd into the machine,
then the console may be outputting on tty0 which may be the terminal
connected to the graphics card). Being able to see the console is very
important. You may also view kernel console messages at
/var/log/messages (this depends on the distribution you are
using. This is true for redhat).

Don't be fooled by the message:
"physmap flash device:xxxxx at yyyyyyy"

This is just reporting what parameters you have compiled into the
system (see above under "Physical mapping of flash chips".

If your flash is really detected then it will print something like:
"Physically mapped flash: Found bla-bla-bla at location 0".

If no device is found, then physmap will refuse to load as a module!
This is not a problem with compiling it as a module or with physmap or
modprobe itself. Unfortunately this is the hard part. You have to dive
into the routine "do_cfi_probe()" called from physmap.c.

Caution! physmap.c uses ioremap() to map the physical memory into an
area of logical memory. If your processor has a cache in it, then
modify physmem to use ioremap_nocache(), else you will tear your hair
out as your flash chips will never be detected.

This routine is called cfi_probe() and is in the file "cfi_probe.c"
under mtd/kernel/

Sprinkle the file with printk's to see why your chips were not
detected. If your chips are detected, then when you load physmap (by
doing a "modprobe physmap", you will see something like:

"Physically mapped flash: Found bla-bla-bla at location"

Now, the chips have been registered under mtd and you should see them
by doing a:
#cat /proc/mtd



*** Putting a jffs file system on the flash devices:

Now that you have successfully managed to detect your flash devices,
you need to put a jffs on them. Unlike mke2fs there is no utility that
will directly create a jffs filesystem onto the
/dev/mtd0,1,2... device.

You have to use a utility called mkfs.jffs available under mtd/util

Get a directory ready with the stuff that you want to put under
jffs. Let's assume that it's called /home/jffsstuff

Then just do:
#/usr/src/mtd/util/mkfs.jffs -d /home/jffsstuff -o /tmp/jffs.image

This makes a jffs image file. Then do (if your flash chips are erased,
else see below):
#cp -f /tmp/jffs.image /dev/mtd0,1,2... (as the case may be, most
likely /dev/mtd0).

If your flash chips are not erased or you have been messing around
with them earlier, your cannot just copy the new image ontop of the
older one. Bad things may happen. Use the program mtd/util/erase to
erase your device.

#/usr/src/mtd/util/erase /dev/mtd0,1,2,3 <offset here, try 0 if your
 don't know>  <your flash totalsize/your mtd device erase size- look
 under `cat /proc/mtd`>

Watch the messages on your console (assuming you have verbose turned
on when you configured your kernel). You should not see any errors.

When your command prompt returns, do:
#cp -f /tmp/jffs.image /dev/mtd0,1,2... (as the case may be, most
likely /dev/mtd0).


Then load the jffs module in by:
#modprobe jffs

Then mount the file system by:
#mount -t jffs /dev/mtdblock0 /mnt/jffs (assuming /mnt/jffs exists, else
make it).

Note: Note the use of /dev/mtdblock0 NOT /dev/mtd0. "mount" needs a
block device interface and /dev/mtdblock0,1,2,3... are provided for
that purpose. /dev/mtd0,1,2,3 are char devices are provided for things
like copying the binary image onto the raw flash devices.




*** Making partitions with CFI flash and working with multiple banks
    of FLASH:

Unlike a "regular" block device, you cannot launch fdisk and create
partitions on /dev/mtdblock0,1,2,3...

(As far as I know) CFI flash partitions have to be created and
compiled in the physmap.c file.

The same goes for multiple banks of flash memory. (IS THIS CORRECT????
Check and correct.)

An example of creating partitions can be found in the file
mtd/kernel/sbc_mediagx.c

An example of multiple banks of flash chips being mapped into seperate
/dev/mtdn devices can be found in the file mtd/kernel/octagon_5066.c
(in particular pay attention to the multiple looping of the code while
registering the mtd device in "init_oct5066()". You may also add
partitions to each bank by looking at code in mtd/kernel/sbc_mediagx.c






*** FAQ's:

Q. What is MTD and why do we need it?

A. From the MTD site:

"We're working on a generic Linux subsystem for memory devices,
especially Flash devices.

The aim of the system is to make it simple to provide a driver for new
hardware, by providing a generic interface between the hardware
drivers and the upper layers of the system.  

Hardware drivers need to know nothing about the storage formats used,
such as FTL, FFS2, etc., but will only need to provide simple routines
for read, write and erase. Presentation of the device's contents to
the user in an appropriate form will be handled by the upper layers of
the system."


Q. What is JFFS?

A. JFFS was designed by Axis Communications AB, Sweden
(www.axis.com). It is an open source log structured file system that
is most suitable for putting on raw flash chips.
For more info: http://developer.axis.com/software/jffs/

Some additional documentation (not reviewed and no link to it yet):
http://developer.axis.com/software/jffs/doc/jffs.shtml


David Woodhouse described jffs in a mail to the jffs mailing
list. This is what he wrote:

"JFFS is purely log-structured. The 'filesystem' is just a huge list of
'nodes' on the flash media. Each node (struct jffs_node) contains some
information about the file (aka inode) which it is part of, may also 
contain a name for that file, and possibly also some data. In the cases 
where data are present, the jffs_node will contain a field saying at what 
location in the file those data should appear. In this way, newer data can 
overwrite older data. 

Aside from the normal inode information, the jffs_node contains a field 
which says how much data to _delete_ from the file at the node's given 
offset. This is used for truncating files, etc. 

Each node also has a 'version' number, which starts at 1 with the first node
written in an file, and increases by one each time a new node is written
for that file. The (physical) ordering of those nodes really doesn't matter at
all, but just to keep the erases level, we start at the beginning and just
keep writing till we hit the end.

To recreate the contents of a file, you scan the entire media (see 
jffs_scan_flash() which is called on mount) and put the individual nodes in 
order of increasing 'version'. Interpret the instructions in each as to 
where you should insert/delete data. The current filename is that attached 
to the most recent node which contained a name field.

(Note this is not trivial. For example, if you have a file with 1024 bytes 
of data, then you write 512 bytes to offset 256 in that file, you'll end up 
with two nodes for it - one with data_offset 0 and data_length 1024, and 
another with data_offset 256, data_length 512 and removed_size 512. Your 
first node actually appears in two places in the file - locations 0-256 and 
768-1024. The current JFFS code uses struct jffs_node_ref to represent this 
and keeps a list of the partial nodes which make up each file. )

This is all fairly simple, until your big list of nodes hits the end of the
media. At that point, we have to start again at the beginning. Of the 
nodes in the first erase block, some may have been obsoleted by later 
nodes. So before we actually reach the end of the flash and fill the 
filesystem completely, we copy all nodes from that first block which are 
still valid, and erase the original block. Hopefully, that makes us some 
more space. If not, we continue to the next block, etc. This is called 
garbage collection.

Note that we must ensure that we never get into a state where we run out of
empty space between the 'head' where we're writing the new nodes, and the
'tail' where the oldest nodes are. That would mean that we can't actually 
continue with garbage collection at all, so the filesystem can be stuck 
even if there are obsolete nodes somewhere in it.

Although we currently just start at the beginning and continue to the end,
we _should_ be treating the erase blocks individually, and just keeping a
list of erase blocks in various states (free/filling/full/obsoleted/erasing/
bad). In general, blocks will proceed through that list from free->erasing 
and then obviously back to free. (They go from full to obsoleted by 
rewriting any still-valid nodes into the 'filling' node)."



Q. Why another file system. What was wrong with ext2?

A. (from Johan Adolfsson:) JFFS is aimed at providing a
crash/powerdown-safe filesystem for disk-less embedded devices. This
typically means flash memories and these have certain characteristics,
such as you can't write twice to the same location without doing a
time-expensive erase on a full sector first (typically 64kB), this
means "normal" file systems such  as ext2 won't work very well.

Additionally if only a little amount of data has changed in the sector
to be erased, then the rest of the data needs to be stored off
somewhere, the new data merged with the old and everything written
back. So potentially, you would write 64KB for every 512 bytes of data
to be written to the file system. If this data is "saved off" in RAM,
then you could loose everything if power goes down while the sector is
being erased. If it is saved off in another sector of flash, then that
sector needs to be pre erased, and now you are doing 128KBytes of
write for a 512 byte data write.

(David Woodhouse added:) Need journalling pseudo-filesystem to emulate
a block  device and to wear levelling. then need ext3 (note 3) on
that. journalling  fs on top of journalling fs - not efficient. Also,
no way for ext[23] to  mark blocks as _deleted_ and no longer cared
about. Fill ext2 partition on  NFTL, empty it again, and the NFTL will
still carefully copy around the  blocks containing old deleted data.



Q. Do I have to have JFFS on MTD?

A. (David Woodhouse:) At the moment yes. Once you could do it on a block
device. People are talking about making me make it work on IDE devices
(CF). But I don't want to :) 



Q. What is DOC (disk on chip)?

A. Manufactured by M-Systems (www.m-sys.com).
Bunch of NAND flash chips connected together with a clever ASIC
which does  hardware ECC.



Q. What File systems can I have on DOC?

A. (David Woodhouse:) If you put NFTL on it to emulate a block device
(the status quo) then any  normal filesystem. JFFS ought to work too.



Q. What is Flash memory?

A. This is a non-volatile memory integrated circuit that is arranged
in "sectors". There are two different types.

NOR or code storage flash is arranged in quite large sectors of upto
(or greater than) 64KBytes each. A fully erased flash (or sector) has
all bits "erased" to a 1.

You man change a "1" to a "0" "on-the-fly" or with a very fast byte
(or word if the chip is 16 bits wide) write to it (almost like RAM but
usually slower).
However, to change a "0" back to a "1" requires that you erase the
*entire* sector.
Each NOR flash sector also has a finite number of erase cycles
(typically from 100k to 1million).
NOR flash is usually more tolerant of physical of writes to its
sectors and new NOR flash is 100% good and usable.

NAND flash or data flash has much smaller sectors and is typically
used to store data. This type of flash is also less tolerant of
physical writes to it and new devices may have "bad blocks" that need
to be marked unusable by the driver software (think bad blocks marked
unusable on hard drives during a format operation).

Note: Both types of flash can be used with a driver layer software to
store code (obviously both can store data). The MTD driver in linux
does just that. In this case, the code is treated as "data" and copied
to RAM before it is executed.

Please see www.amd.com or www.intel.com (or any other mfg. site like
Toshiba, Samsung, SanDisk etc.) for more information.




Q. If Flash has a limited "erase" sector life to it, how can I
reliably use it to store logs etc. in an embedded system?

A. Welcome to "wear levelling". If you use flash with a driver level
software (like MTD in Linux), then as we saw in the above question,
the driver level can convert even data flash (NAND) to code flash and
execute code from it (really copy to RAM first and then execute). In
other words, the driver level provides a layer of "functional
translation" on the raw device.

JFFS implements another type of transformation called wear
levelling. Every write to the flash device (by a user program) results
in an "addition" to the data already on the raw flash device. This is
true even if your program is sitting there writing out oxfefefefe (or
whatever) to the same place in the file. This has the effect of
spreading out the writes over the entire available flash memory.

For a quick back of the envelope calculation, lets assume the
following:
1. You want to write out a small log (say 100 bytes) 1 a second
for ever.
2. Your log flash chip is 2MBytes and the entire chip is available for
log storage.
3. If you were writing to the same location everytime (if you were
accessing the flash sector directly) then assuming a sector life of
1 million erases your would wear out the sector in (assuming that you
erased the sector for every write:

1million/(1 timespersec * 60secs/min * 60mins/hr * 24hrs/day) 
or in about 11 days!

If your now used the entire flash to spread out your writes then you
would have to erase a sector (assuming 64KB sectors) only once in
(2M * 1024Kbytes * 1024 bytes)/100bytes

or 20,900 writes.

In other words your are increasing the life of your storage device by
20900 times! or to 629 years!

(Note: These calculations are just an example. Please do your own
sanity check and calculations for your particular situation.)


Q. Anything that I need to watch out for while using JFFS on raw
flash?

A. Yes! At present (13th Feb 2001) the garbage collecting thread in
JFFS (that's what collects all the "good" inodes and gathers them into
a new sector, then erases the old sector to free up flash space),
BLOCKS, while doing a sector erase.
Sectors can take upto 4 seconds to erase. This means that any program,
either reading or writing to *that particular file system that
contains the flash chip* will also get blocked (as you can neither
read nor write to *any* sector of the flash chip even if one sector is
being erased). This means that if you want to log a data file faster
than once every 4 seconds you are out of luck!

There are 2 ways around this.

1. Wait for "suspend erase" feature to be implemented (David, any time
frame on this?). CFI flash chips can be suspended while being erased,
to allow reads/writes from/to other portions of the flash. This is NOT
in place yet.

(I have a question on this. Say our sector needs 4 seconds to
erase. Say we "suspend" the erase 1 second into the erase to read from
the flash. When we restart the erase, does the previous 1 second erase
count towards the 4 seconds or does the flash still needs 4 seconds to
erase the sector? Anyone know? - Vipin)

2. If you are designing a custom board, put a small FRAM chip (see
www.ramtron.com) on your board. Map this chip into a /dev/mtd device
and log your "fast" logs here. Like a flash device, FRAM chips are
non-volative on power fail (without needing a battery backup), but
unlike a flash chip, these do not have to be sector erased to turn a
"0" bit into a "1" bit. Reads and writes to these chips occur at bus
speeds. You can then use a background task to offload the logs from
this partition to the regular flash in a non latency critical and safe
manner (make sure that the logs have taken on the flash and then erase
it from the FRAM partition). Unfortunately the largest available
device (that I know of as of 13th feb 2001) is a 32KByte (a x8)
device. Hence you can only use it as a "fast" cache, rather than for
the whole JFFS file system.


Q. What is CFI Flash memory?

A. (from Johan Adolfsson:) CFI  = Common Flash Interface, see
http://www.amd.com/products/nvd/overview/cfi.html 

This makes it possible to read info from the flash chip so you know
how to erase it etc. without having to hardcode the ID of the flash in
your software.



Q. What is JEDEC Flash memory?

A. (from Johan Adolfsson:) Each flash chip has a manufacturer ID and a
device ID that can be read and used to determine size, algorithm
etc. to use. If the chip doesn't support CFI, this is typically what
you have to use.



Q. What is this "interleave" stuff?

A. (David Woodhouse:) If you have 16-bit chips, but a 32-bit
processor, it makes sense to arrange  them side-by-side to fill the
CPU's bus. You drive them both simultaneously. That's the arrangement
we refer to as 'interleave'.

Hence if you have four x8 bit FLASH chips connected in parallel (ahem
interleave!) to a 32bit processor bus, you are 4 way interleaved. One
quick way to see how may way interleave you are is to glance at the
address bus connected to your flash chips (on the schematic). If your
processor A0 goes to A0 on your 8 bit flash chip(s), then you are
1way. If your processor A1 goes to A0 on the flash chips then you are
2 way, similarly A2 to A0 gives 4 way interleaving. (Note: There is no
3 way interleaving).

Other possibilities are... 2x 16-bit chips on 32-bit bus, 2x8-bit 
chips on 16-bit bus, ...

If you are designing your own hardware, if possible use the maximum
width of the processor data bus as you will be able to write out 4
times faster per word write to your flash, x32 compared to a x8
connection.


Q. Can I boot my kernel from a DOC or jffs NOR flash mtd device
(with/without the help of a BIOS)?
A. Yes! <help! Folks that know this stuff please contribute! I need
this for my project too. -vipin> 


*** Credits:

<developers, please provide me with the credits for MTD, jffs, DOC
etc. etc. etc. for the wonderful code in MTD, DOC, JFFS,
etc. etc. etc. Who is doing/had done what etc.>
...
...
...


--------------E3FF6841C507F27CB97B05FB--



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
