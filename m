Received: from lrts1.demon.co.uk ([158.152.10.39])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16RhZ4-0001EB-00
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jan 2002 22:32:50 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Gareth Davies <grmd@lotwillow.co.uk>
To: linux-mtd@lists.infradead.org
Subject: Re: FAQ? How do I use slram?
Date: Fri, 18 Jan 2002 22:43:30 +0000
References: <01122616541901.01003@tomsk.lotwillow.ltd>
In-Reply-To: <01122616541901.01003@tomsk.lotwillow.ltd>
MIME-Version: 1.0
Message-Id: <02011822433005.00840@tomsk.lotwillow.ltd>
Content-Transfer-Encoding: 8bit
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

On Wednesday 26 December 2001 16:54 pm, I wrote:
>
>I understand that slram can be used to support using uncached RAM for
>swapping but I do not know how to set it up.
>

With many thanks to Jochen Schaeuble, I have this working correctly.


The recipe:

1. compile slram.c, mtdcore.c and mtdblock.c

   I compiled these as modules rather than as part of a new kernel
   and placed the object files with the other module objects that
   came as part of the distribution I use.

   slram.o and mtdblock.o both depend on mtdcore.o, slram appears
   to provide access to the designated memory, while mtdblock is
   used to provide a block interface for mtd devices.

   I did 'depmod -a' so I could check that the dependancies were
   recorded correctly in /lib/modules/.../modules.dep

2. choose options for slram.o

   My computers are pentium-based using FX, VX and TX chipsets.
   These chipsets only cache the first 64 Mbytes of RAM, and I had
   enough memory to fit 128 Mbytes in some of them. I decided that
   the second 64 MBytes was to be used by the slram module, so I
   added the following to /etc/modules.conf

     options slram map=mtdblock0,64M,+64M

   which says that the device is to be /dev/mtdblock0, the block
   of memory is to start at 64 Mbytes, and the size is 64 Mbytes.

   Because there is no direct dependancy link between slram.o and
   mtdblock.o I added

     above slram mtdblock

   to /etc/modules.conf so that mtdblock is loaded whenever the
   other two modules are loaded.

3. add a new device

   As mentioned previously, mtdblock.o provides a block interface
   and I configured slram.o to use /dev/mtdblock0, so the device
   must be created. The major number is 31, and the minor numbers
   are assigned in pairs, even for read-write devices and odd for
   read-only devices. As I required read-write access, I created
   the block device

     mknod /dev/mtdblock0 b 31 0

   When the modules are loaded correctly, this device can be used
   as any other block device, formatted, mounted, and so on.

4. add an extra boot option

   I use the grub loader, and this requires that if the kernel is
   to use less than the total available memory, grub must also be
   told. I copied the default configuration and modified the copy
   by giving it a different name, inserting the option to tell
   grub that upper memory (memory above 1 Mbyte) was reduced, and
   modified the kernel options

     uppermem 64512
     kernel /boot/vmlinuz-2.4.9-13 ro root=/dev/sda3 \
                            mem=exactmatch mem=640k@0 mem=63M@1M

   Note that the kernel options were on one line, which I split
   here for tidyness.

5. reboot and test the new configuration

   I thought I'd test the configuration rather than set it up so
   that it fired up automatically. Once I'd checked that the
   kernel was using the correct amount of memory, (using the free
   command), I did

     modprobe slram

   I checked that all 3 modules were loaded by looking at
   /proc/modules. If there were errors when loading, I could look
   at the end of the output from dmesg to find the reason, but I
   would probably need Jochen to explain what the messages mean!

   Then I was able to use the /dev/mtdblock0 device. I did

     mkswap /dev/mtdblock0

   which formatted the 64 Mbytes as a swap partition, then

     swapon -p 10 /dev/mtdblock0

   which enabled swapping to this device at a higher priority
   than the disk partitions.  When I was satisfied that this
   worked properly, I added the commands to /etc/rc.d/rc.sysinit
   so that the swap space would be created at power-on.


Problems I had:

1. The slram module emits an error if the memory that it has been
   told to use is not available. This completely stopped me as I
   didn't realise this was the problem.

2. When using grub to boot linux, any memory restriction that is
   passed to the kernel must also passed to grub (in a suitable
   manner), otherwise (i) grub loads the initialisation ramdisk
   at the wrong location, and (ii) seems to inhibit slram from
   loading. The grub 'uppermem' option takes a parameter in
   kbytes above 1 Mbyte. It uses this to decide where to locate
   the initialisation ramdisk. Get this wrong, and the kernel
   will fail to boot!

3. To restrict the kernel to 64 Mbytes, I expected to be able to
   add mem=64M to the kernel command line. When I did this, the
   kernel used 384 kbytes more than expected. It might something
   strange about the first motherboard I used, though. After some
   research I found that I was able to define memory regions, see
   the line in step 4, above.

4. The mtdblock module is required to access the device referred
   to in the slram module options.


Hope this helps others,

Gareth.

-- 
Gareth Davies, Lotwillow Ltd.     'Always' and 'never' are two words you
Tel. +44 1344 294900               should always remember never to use.
Fax. +44 1344 294902                                         - M. Kendig
