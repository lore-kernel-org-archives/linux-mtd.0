Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Sall-0004HN-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 08:25:05 +0000
Received: from roma.axis.se ([193.13.178.2])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Salf-0004Gs-00
	for mtd@infradead.org; Tue, 13 Feb 2001 08:24:59 +0000
Message-ID: <030b01c09595$ecdee430$0a070d0a@axis.se>
Reply-To: "Johan Adolfsson" <johan.adolfsson@axis.com>
From: "Johan Adolfsson" <johan.adolfsson@axis.com>
To: "Vipin Malik" <vmalik@danielind.com>, "jffs-dev" <jffs-dev@axis.com>,
        "mtd" <mtd@infradead.org>
References: <3A886BED.9339AC4F@danielind.com>
Subject: Re: First cut at MTD/JFFS HOWTO
Date: Tue, 13 Feb 2001 09:21:11 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Nice work!
Some comments (##) and possibly some more answers below:

Q. What is JFFS?
## I guess our marketing people would like to see the name right:
A. JFFS was designed by Axis Communications AB, Sweden (www.axis.com). It is
an
open source log structured file system that is most suitable for
putting on raw flash chips.
For more info: http://developer.axis.com/software/jffs/

Some additional documentation (not reviewed and no link to it yet):
http://developer.axis.com/software/jffs/doc/jffs.shtml

David ....
...

Q. Why another file system. What was wrong with ext2?
## From developer.axis.com (almost)
A. JFFS is aimed at providing a crash/powerdown-safe filesystem for
disk-less embedded devices.
    This typically means flash memories and these have certain
characteristics, such as you can't
    write twice to the same location without doing a time-expensive erase on
a full sector first
    (typically 64kB), this means "normal" file systems such as ext2 won't
work very well.

Q. What is CFI Flash memory?
A. CFI  = Common Flash Interface, see
http://www.amd.com/products/nvd/overview/cfi.html
     This makes it possible to read info from the flash chip so you know how
to erase it etc.
     without having to hardcode the ID of the flash in your software.

Q. What is JDEC Flash memory?
## Don't you mean JEDEC?
A. Each flash chip has a manufacturer ID and a device ID that can be read
and used to
     determine size, algorithm etc. to use. If the chip doesn't support CFI,
this is typically
     what you have to use.


/Johan Adolfsson - Axis Communications

----- Original Message -----
From: Vipin Malik <vmalik@danielind.com>
To: jffs-dev <jffs-dev@axis.com>; mtd <mtd@infradead.org>
Sent: Tuesday, February 13, 2001 00:04
Subject: First cut at MTD/JFFS HOWTO


> Hello all,
>
> As I spent about 1.5 weeks tripping around in this stuff getting my CFI
> and DOC detected/working, I thought that I would put in text what I
> found to be true by experience. I sincerely hope that this "first cut"
> HOWTO answers many of the common questions that new people have
> regarding how to get started.
>
> If this is accepted, I also volunteer to continue to keep this document
> updated (as I am now actively working on my project that uses (or will
> use) DOC/and/or/JFFS.
>
> I would ask the developers to give it a once over, to make sure that
> I did not speak any dire mistruths. Feel free to email me any
> corrections or additional sections regarding any topics that I did not
> cover (quite a lot I think).
>
> In particular I would like to see sections on booting from DOC's and CFI
> flash devices added (as I'm quite interested myself in that). I have
> seen some e-mails on the list by people that have done work in that
> direction. If you folks would put your experience/knowledge as a
> "section" to a howto then we could add it to this document.
>
> Regards,
>
> Vipin
>
>
>
>


----------------------------------------------------------------------------
----


>                       ***  The Linux MTD, JFFS HOWTO ***
>          (work in progress, please contribute if you have anything)
>
> Last Updated: Feb 02 2001
> Compiled By: Vipin Malik (vmalik@danielind.com)
>
> **ABOUT:
>
> This document will attempt to describe setting up the MTD (Memory
> Technology Devices), DOC, CFI and the JFFS (Journaling file system)
> under Linux versions 2.2.x and 2.4.x
>
> This is work in progress and (hopefully) with the help of others on
> the mtd and jffs mailing lists will become quite a comprehensive
> document.
>
> Please mail any comments/corrections/contributions to
> vmalik@danielind.com
>
>
>
>
>
>
> *** Getting Started:
>
> If you want to seriously design a project with MTD/JFFS please
> subscribe to the respective mailing lists.
>
> MTD:
>   There is a majordomo-managed mailing list: mtd@infradead.org
>   To subscribe, send "subscribe mtd" in the body of a mail to
>   majordomo@infradead.org
>
> JFFS:
>   Please send an email to majordomo@axis.com containing this line in the
body of the email:
>   subscribe jffs-dev
>
> The home page for the two projects are located at:
> MTD/DOC/
>  http://www.linux-mtd.infradead.org/
> JFFS
>  http://developer.axis.com/software/jffs/
>
> The MTD mail archive is at:
>  http://www.linux-mtd.infradead.org/list-archive/
>
> The JFFS mail archive is at:
>  http://mhonarc.axis.se/jffs-dev/threads.html
>
>
> *** Getting the latest code:
>
> The entire MTD/DOC/JFFS (and some utils) source code may be downloaded
> via anonymous CVS.
>
> Follow the following steps:
> 1.Make sure that you are root.
> 2. cd /usr/src
> 3. cvs -d :pserver:anoncvs@cvs.infradead.org:/home/cvs login (password:
anoncvs)
> 4. cvs -d :pserver:anoncvs@cvs.infradead.org:/home/cvs co mtd
>
> This will create a dir called mtd under /usr/src
>
> You now have two options depending on what series of the Linux Kernel
> you want to work with.
> There is an extra step involved with the 2.2 series kernels as they do
> not have any MTD code in them.
>
>
> ** With 2.2.x series kernels:
>
> (Note that as far as I can tell, mtd and jffs does not work as modules
> under the 2.2.x series of kernels. If you want to do modules I would
> recommend that you upgrade to the 2.4.x series of kernels).
>
> Get the 2.2.17 or 2.2.18 kernel source code from your favorite source
> (ftp.kernel.org) and install the kernel under /usr/src/linux-2.2.x
> with /usr/src/linux being a symbolic link to your kernel source dir.
>
> Configure the kernel to your desired options (by doing a make config
> (or menuconfig or xconfig), and make sure that the kernel compiles ok.
>
> Download the mtd patch from:
> ftp://ftp.infradead.org/pub/mtd/patches
>
> Move the patch to /usr/src/linux and do
>
>    patch -p1 < <patch file name here>
>
> Make sure that the patch was applied ok without any errors.
> This will add the mtd functionality to your basic kernel and bring the
> mtd code upto date to the date of the patch.
>
> You have two choices here. You may do a make config and configure in
> mtd stuff with the current code or you may want to get the latest code
> from the cvs patched in.
>
> If you want the latest CVS code patched in follow the 2.4.x directions
> below.
>
> ** With 2.4.x series of kernels:
>
> If you want the latest code from CVS (available under /usr/src/mtd)
> do:
> 1. cd /usr/src/mtd/patches
> 2. sh patchin.sh /usr/src/linux
>
> This will create symbolic links from the
> /usr/src/linux/drivers/mtd/<files here> to
> the respective files in /usr/src/mtd/kernel/<latest files here>
>
> The same happens with /usr/src/linux/fs/jffs and
> /usr/src/linux/include/linux/mtd
>
> Now you have the latest cvs code available with the kernel. You may
> now do a make config (or menuconfig or xconfig) and config the
> mtd/jffs etc. stuff in as described below.
>
>
>
>
> *** Configuring MTD and friends for DOC in the Kernel:
>
> Do not use any mtd modules with the 2.2.x series of kernels. As far as
> I can tell, it does not work even if you can get it to compile ok.
>
> Modules work ok with the 2.4.x series of kernels.
>
> Depending on what you want to target you have some choices here,
> namely:
>
>
> *** 1. Disk On Chip Devices (DOC):
> For these, you need to turn on (or make into modules) the following:
>
> *MTD core support
> *Debugging (set the debug level as desired)
> *Select the correct DOC driver depending on the DOC that you have
> (1000, 2000 or Millennium).
> *If you know the physical address of your chip then input that here. A
> lot of people input 0xd000 if their chip is mapped into the BIOS
> expansion rom address. You need to say 0xD0000 (the actual physical
> address, not just the segment address).
>
> If you leave the address blank, the code will *auto probe*. This works
> quite well (at least for me). Try it first.
>
> *Probe High Addresses will probe in the top of the possible memory
>  range rather than  in the usual BIOS ROM expansion range from 640K -
>  1Meg. This has to do with LinuxBIOS. See the mailing list archive for
>  some e-mails regarding this. If you don't know what I am talking
>  about here, leave this option off.
>
> *Probe for 0x55 0xaa BIOS signature. If you kept the address at 0
>  (auto probe), say yes here.
>
> Leave everything else off, till you reach...
> *NAND flash device drivers. You want this on (or module as the case
> may be).
> * Enable ECC Correction Algorithm -yes
> * Verify NAND page writes -off worked for me. I need to investigate
> this further.
>
> User Modules and Translation layers:
> * Direct char device access - yes
> * Caching block device access - yes
> * NFTL layer support - yes
> * Write support for NFTL(beta) - yes
>
> Save everything, make dep, make bzImage, make modules, make
> modules_install
>
> Note: If you downloaded the 2.4.x series kernels and your original
> installed distribution came with the 2.2.x series of kernels then you
> need to download the latest modutils (from
> ftp.kernel.org/utils/kernel), else make modules_install or depmod -a
> will fail for the new 2.4.x kernels.
>
> Move everything to the right place, install the kernel, run lilo and
> reboot.
>
> If you compiled the mtd stuff into the kernel (see later section if
> you compiled as modules- which is what I prefer as you don't have to
> keep rebooting) then look for the startup messages. In particular pay
> attention to the lines when the MTD DOC header runs. It will say
> something like:
>
> "DiskOnChip found at address 0xD0000 (your addrss may be different)"
> "nftla1"
>
> The above shows that the DOC was detected fine and one partition was
> found and assigned to /dev/nftla1. If further partitions are detected,
> they will be assigned to /dev/nftla2 etc.
>
> Note that the MTD device is /dev/mtd0 and details are available by
> doing a:
>
> #cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 02000000 00004000 "DiskOnChip 2000"
>
> /dev/nftla1,2,3  are "regular" block disk partitions and you may
> mke2fs on them to put a ext2 fs on it. Then they may be mounted in the
> regular way.
>
> When the DiskOnChip is detected and instead of nftla1,2,3... you get
> something like:
>
> "Could not find valid boot record"
> "Could not mount NFTL device"
>
> ...you have a "hosed" (that's a technical term) disk. You need to
> "un-hose" it. To help you out in that department there is a utility
> available under /usr/src/mtd/util called nftl_format.
>
> Essentially after you'r disk have been detected but complains about
> "Could not mount NFTL device", just run
> #./nftl_format /dev/mtd0 (if your device was installed under mtd0, see
> cat /proc/mtd/).
>
> If your device "erasesize" is 8k (0x2000), then the utility will go
> ahead and format it. Just reboot and this time the drivers will
> complain about an "unknown partition table".
>
> Don't worry. Just do:
> # fdisk /dev/nftla
>
> and create some partitions on them. TaDa! You may now e2fsck and
> others on these partitions.
>
> *** IF you compiled the mtd stuff as modules (What I prefer):
> Make sure that you have done a depmod -a after you reboot with the
> new kernel.
>
> Then just
> #modprobe -a doc2000 nftl nand mtdchar mtdblock
>
> You have now loaded the core stuff. The actual detection takes place
> only when you load the docprobe module. Then do
> #modprobe -a docprobe
>
> You should then see the messages described in the section
> above. Follow the directions and procedures are outlined in the
> section above (where you would have compiled the mtd/DOC stuff into
> the kernel).
>
>
>
>
>
> *** 2. Raw Flash (primarily NOR) chips
>
> This are multiple (or just one) flash IC's that may be soldered on
> your board or you may be designing some in. Unlike the DOC device,
> these are usually linearly memory mapped into the address space
> (though not necessarly, they may also be paged).
>
> MTD can handle x8, x16 or x32 wide memory interfaces, using x8, x16
> (even x32 chips (are they such a thing)?- confirm).
>
> At present CFI stuff seems to work quite well and these are the type
> of chips on my board. Hence I will describe them first. Maybe someone
> with JDEC chips can describe that.
>
> You must use (for all practical purposes that involve writing) JFFS on
> raw flsah MTD devices. This is because JFFS provides a robust writing
> and wear levealing mechanism. See FAQ for more info.
>
>
>
> *** Configuring the kernel with MTD/CFI/JFFS and friends.
> Turn off all options for MTD except those mentioned here.
>
> * MTD support (the core stuff)
> * Debugging -yes (try level 3 initially)
> * Support for ROM chips in bus mapping -yes
> * CFI (common flash interface) support -yes
> * Specific CFI flash geometry selection -yes
> * <select they FLASH chip geometry that you have on your board>
> * If you have a 32 bit wide flash interface with 8bit chips, then you
>   have 4 way interleaving, etc. Turning on more than one option does
>   not seem to hurt anything
> * CFI support for Intel.Sharp or AMD/Fijutsu as your particular case
>   may be.
> * Physical mapping of flash chips - set your config here or if you
>   have one of the boards listed then select the board as the case may
>   be.
>
> Then under "File systems" select:
> * jffs and
> * /proc filesystem support right under that.
> * Select a jffs debugging verbosity level. Start high then go low.
>
> Save, make dep, make bzImage, make modules, make modules_install, move
> kernel to correct spot, add lilo entries, run lilo (or your fav. boot
> loader) and reboot.
>
> If you have compiled the stuff as modules then do (as root):
> # depmod -a
> # modprobe -a mtdchar mtdblock cfi_cmdset_0002 map_rom cfi_probe
>
> This loads the core modules for cfi flash. Now we probe for the actual
> flash by doing:
> #modprobe -a physmap
>
> Look at the console window (Note if you are telnet'd into the machine,
> then the console may be outputting on tty0 which may be the terminal
> connected to the graphics card). Being able to see the console is very
> important. You may also view kernel console messages at
> /var/log/messages (this depends on the distribution you are
> using. This is true for redhat).
>
> Don't be fooled by the message:
> "physmap flash device:xxxxx at yyyyyyy"
>
> This is just reporting what parameters you have compiled into the
> system (see above under "Physical mapping of flash chips".
>
> If your flash is really detected then it will print something like:
> "Physically mapped flash: Found bla-bla-bla at location 0".
>
> If no device is found, then physmap will refuse to load as a module!
> This is not a problem with compiling it as a module or with physmap or
> modprobe itself. Unfortunately this is the hard part. You have to dive
> into the routine "do_cfi_probe()" called from physmap.c.
>
> This routine is called cfi_probe() and is in the file "cfi_probe.c"
> under mtd/kernel/
>
> Sprinkle the file with printk's to see why your chips were not
> detected. If your chips are detected, then when you load physmap (by
> doing a "modprobe physmap", you will see something like:
>
> "Physically mapped flash: Found bla-bla-bla at location"
>
> Now, the chips have been registered under mtd and you should see them
> by doing a:
> #cat /proc/mtd
>
>
>
> *** Putting a jffs file system on the flash devices:
>
> Now that you have successfully managed to detect your flash devices,
> you need to put a jffs on them. Unlike mke2fs there is no utility that
> will directly create a jffs filesystem onto the
> /dev/mtd0,1,2... device.
>
> You have to use a utility called mkfs.jffs available under mtd/util
>
> Get a directory ready with the stuff that you want to put under
> jffs. Let's assume that it's called /home/jffsstuff
>
> Then just do:
> #/usr/src/mtd/util/mkfs.jffs -d /home/jffsstuff -o /tmp/jffs.image
>
> This makes a jffs image file. Then do:
> #cp -f /tmp/jffs.image /dev/mtd0,1,2... (as the case may be, most
> likely /dev/mtd0).
>
> Then load the jffs module in by:
> #modprobe jffs
>
> Then mount the file system by:
> #mount -t jffs /dev/mtdblock0 /mnt/jffs (assuming /mnt/jffs exists, else
> make it).
>
> Note: Note the use of /dev/mtdblock0 NOT /dev/mtd0. "mount" needs a
> block device interface and /dev/mtdblock0,1,2,3... are provided for
> that purpose. /dev/mtd0,1,2,3 are char devices are provided for things
> like copying the binary image onto the raw flash devices.
>
>
>
>
> *** Making partitions with CFI flash and working with multiple banks
>     of FLASH:
>
> Unlike a "regular" block device, you cannot launch fdisk and create
> partitions on /dev/mtdblock0,1,2,3...
>
> (As far as I know) CFI flash partitions have to be created and
> compiled in the physmap.c file.
>
> The same goes for multiple banks of flash memory. (IS THIS CORRECT????
> Check and correct.)
>
> An example of creating partitions can be found in the file
> mtd/kernel/sbc_mediagx.c
>
> An example of multiple banks of flash chips being mapped into seperate
> /dev/mtdn devices can be found in the file mtd/kernel/oct5066_map.c
> (in particular pay attention to the multiple looping of the code while
> registering the mtd device in "init_oct5066()". You may also add
> partitions to each bank by looking at code in mtd/kernel/sbc_mediagx.c
>
>
>
>
>
>
> *** FAQ's:
>
> Q. What is MTD and why do we need it?
> A. From the MTD site:
>
> "We're working on a generic Linux subsystem for memory devices,
> especially Flash devices.
>
> The aim of the system is to make it simple to provide a driver for new
> hardware, by providing a generic interface between the hardware
> drivers and the upper layers of the system.
>
> Hardware drivers need to know nothing about the storage formats used,
> such as FTL, FFS2, etc., but will only need to provide simple routines
> for read, write and erase. Presentation of the device's contents to
> the user in an appropriate form will be handled by the upper layers of
> the system."
>
>
> Q. What is JFFS?
> A. JFFS was designed by axis communications. (www.axis.com). It is an
> open source log structured file system that is most suitable for
> putting on raw flash chips.
>
> David Woodhouse described jffs in a mail to the jffs mailing
> list. This is what he wrote:
>
> "JFFS is purely log-structured. The 'filesystem' is just a huge list of
> 'nodes' on the flash media. Each node (struct jffs_node) contains some
> information about the file (aka inode) which it is part of, may also
> contain a name for that file, and possibly also some data. In the cases
> where data are present, the jffs_node will contain a field saying at what
> location in the file those data should appear. In this way, newer data can
> overwrite older data.
>
> Aside from the normal inode information, the jffs_node contains a field
> which says how much data to _delete_ from the file at the node's given
> offset. This is used for truncating files, etc.
>
> Each node also has a 'version' number, which starts at 1 with the first
node
> written in an file, and increases by one each time a new node is written
> for that file. The (physical) ordering of those nodes really doesn't
matter at
> all, but just to keep the erases level, we start at the beginning and just
> keep writing till we hit the end.
>
> To recreate the contents of a file, you scan the entire media (see
> jffs_scan_flash() which is called on mount) and put the individual nodes
in
> order of increasing 'version'. Interpret the instructions in each as to
> where you should insert/delete data. The current filename is that attached
> to the most recent node which contained a name field.
>
> (Note this is not trivial. For example, if you have a file with 1024 bytes
> of data, then you write 512 bytes to offset 256 in that file, you'll end
up
> with two nodes for it - one with data_offset 0 and data_length 1024, and
> another with data_offset 256, data_length 512 and removed_size 512. Your
> first node actually appears in two places in the file - locations 0-256
and
> 768-1024. The current JFFS code uses struct jffs_node_ref to represent
this
> and keeps a list of the partial nodes which make up each file. )
>
> This is all fairly simple, until your big list of nodes hits the end of
the
> media. At that point, we have to start again at the beginning. Of the
> nodes in the first erase block, some may have been obsoleted by later
> nodes. So before we actually reach the end of the flash and fill the
> filesystem completely, we copy all nodes from that first block which are
> still valid, and erase the original block. Hopefully, that makes us some
> more space. If not, we continue to the next block, etc. This is called
> garbage collection.
>
> Note that we must ensure that we never get into a state where we run out
of
> empty space between the 'head' where we're writing the new nodes, and the
> 'tail' where the oldest nodes are. That would mean that we can't actually
> continue with garbage collection at all, so the filesystem can be stuck
> even if there are obsolete nodes somewhere in it.
>
> Although we currently just start at the beginning and continue to the end,
> we _should_ be treating the erase blocks individually, and just keeping a
> list of erase blocks in various states
(free/filling/full/obsoleted/erasing/
> bad). In general, blocks will proceed through that list from free->erasing
> and then obviously back to free. (They go from full to obsoleted by
> rewriting any still-valid nodes into the 'filling' node)."
>
>
>
> Q. Why another file system. What was wrong with ext2?
> A.
>
> Q. Do I have to have JFFS on MTD?
> A.
>
> Q. What is DOC (disk on chip)?
> A.
>
> Q. What File systems can I have on DOC?
> A.
>
> Q. What is Flash memory?
> A.
>
> Q. What is CFI Flash memory?
> A.
>
> Q. What is JDEC Flash memory?
> A.
>
> Q. What is this "interleave" stuff?
> A.
>
> Q. ?
> A.
>
>
> *** Credits:
> ...
> ...
> ...



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
