Received: from mail.slimdevices.com ([67.155.107.5])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KDeGP-0005Is-Dk
	for linux-mtd@lists.infradead.org; Tue, 01 Jul 2008 11:43:14 +0000
Received: from [127.0.0.1] (host86-145-53-21.range86-145.btcentralplus.com
	[86.145.53.21])
	by mail.slimdevices.com (Postfix) with ESMTP id 92C97FD8003
	for <linux-mtd@lists.infradead.org>;
	Tue,  1 Jul 2008 04:43:12 -0700 (PDT)
Message-ID: <486A184B.3080708@logitech.com>
Date: Tue, 01 Jul 2008 12:43:07 +0100
From: Richard Titmuss <richard_titmuss@logitech.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Bootloader support for UBI images
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

The system I am developing keeps two kernel and root filesystem images 
to allow easy recovery from any errors. I would like to use UBI to store 
both the kernel and filesystem, to take advantage of the error recovery, 
wear leveling, etc. I see searching the list adding support for UBI into 
a bootloader has been discussed before, but no patches are available so 
far.

I have now ported a limited read-only version of UBI to redboot, to 
allow loading static volumes. This is at a stage where I can now boot 
the system after loading the kernel from the UBI volume. It should be 
easy to also extend this to work with u-boot (but I have no immediate 
need for this myself). I will be adding erase and writing for UBI 
images, but not updating volumes as this is significantly more complex. 
If people are interested I can post the redboot package.

Before I proceed any further I have some questions. To upgrade the 
system I would like to do something like:

# Remove backup volumes
ubirmvol /dev/ubi0 -N kernel.old
ubirmvol /dev/ubi0 -N rootfs.old
# Create new volumes
ubimkvol /dev/ubi0 -N kernel.new -s ...
ubimkvol /dev/ubi0 -N rootfs.old -s ...
# Write new volume contents
ubiupdatevol /dev/ubi0 -N kernel.new zImage
ubiupdatevol /dev/ubi0 -N rootfs.new rootfs
# Atomically rename volumes, switch to the new images
ubirenamevol /dev/ubi0 kernel kernel.old kernel.new kernel rootfs 
rootfs.old rootfs.new rootfs

This would require adding support for -N to ubiupdatevol to allow the 
volume name to be used (just syntactic sugar) . Also I need support for 
renaming multiple volumes atomically when switching images after the 
upgrade. If these sound sensible and useful changes I can look at 
creating patches to add these features.

The initial scanning of the flash in the bootloader seems to be taking a 
long time (longer than mounting the volume from linux). I need to look 
at why this is taking longer, but it would be great to avoid doing two 
full table scans. Passing the scan information from the bootloader to 
the kernel seems tricky, especially as the kernel builds multiple trees 
and lists during the scan. Bootloader support for UBI imagesA possible 
alternative approach would be to include an LER to PER index table for 
static volumes only. This table would only need updating when the static 
volume was rewritten or a PER moved due to a bit error or wear leveling. 
If the index table and the volume table were always located near the 
start or end of the flash then a full volume scan could be avoided in 
the bootloader. Does this sound like a reasonable optimization, or is 
another solution preferred?

Richard
