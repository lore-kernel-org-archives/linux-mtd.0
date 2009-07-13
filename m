Received: from lime.solrad.nl ([213.193.238.107])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MQNHL-0008He-Fg
	for linux-mtd@lists.infradead.org; Mon, 13 Jul 2009 15:17:25 +0000
Message-ID: <4A5B4EC7.9010605@youcom.nl>
Date: Mon, 13 Jul 2009 17:12:07 +0200
From: Jelle Martijn Kok <jmkok@youcom.nl>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: UBI resizing
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Artem and others,

I have made an "ubirsvol" application (actually it are just some very 
simple changes to your ubimkvol/ubirmvol). If you would like to have it, 
I could sent it.

I have 2 questions regarding resizing.

Question 1: Why do UBI volumes have fixed sizes ?
As far as I can see, all unused PEBs only have their EC headers are 
written in the MTD. The volume headers are left unwritten.
Only PEBs which are attached to a specific volume have their volume 
header set.
Is it correct that all unused PEBS are in a pool for the whole ubi 
device, and not in a pool per ubi volume ?
I do understand that this might make it much harder for UBIFS to 
determine its available space as it could actually mean that two UBIFS 
filesystems which are mounted on the same ubi (eg. ubi0_0 and ubi0_1) 
might see the same amount of available LEBs, and thus UBIFS shows twice 
as much space. However this might be very similar as mounting the same 
harddrive on your system twice.

Question 2: Can UBIFS handle UBI resizes easier ?
I have not looked at all at the inner working of UBIFS, so I do not dare 
to say anything sensible.
However making the UBI volume smaller, makes UBIFS complain that the 
amount of LEBs is incorrect.
I encountered (in ubidesign.pdf) "Note, that by default UBI will not 
reduce the size of dynamic volumes unless the number range of logical 
erase blocks which will be removed from the volume contains only unused 
blocks. A specical parameter allows to override this default.".
What is this "special parameter" ?

If UBI (and UBIFS) sizes would become non-fixed, it would prevent the 
need for resizing at all. It might ease the usage of ubi, for example:
- When creating ubi images (for production) the ubi size does not 
matter. (UBI_VTBL_AUTORESIZE_FLG could ultimately be removed)
- ubimkvol, can be called without specifying any size.
- no more wasted space in static volumes.
- bad blocks may be handled easier, as it can simply access the complete 
pool. No block have to be reserved on front (UBI might however best not 
hand out those last 10 PEBs)

More info on our specific application is below.

Best Regards,

Jelle Martijn Kok

We currently have the following (working) setup (similar like 
ubidesign.pdf - chapter 8):
- We are using a 1024 blocks 128MB nand flash.
- MTD in 2 partitions
    - MTD0 contains the bootloader (1 block)
    - MTD1 contains 1023 blocks in ubi0 (actually 1022 blocks as we are 
blessed with a bad erase block)
- ubi0 contains 2 volumes.
    - ubi0_0 which is the root file system (UBIFS on a dynamic volume)
    - ubi0_1 is the kernel (static volume)
- The bootloader loads the kernel from the mtd (ubi0). Note: it 
explicitly uses the volume name ("kernel") and not the volume_id to find 
the static volume containg

However the limitations currently are:
- I cannot place the kernel in the rootfs as I do under no circumstance 
want to implement UBIFS in the bootloader.
- I do not simply want to run ubiupdatevol on the kernel volume (ubi0_1) 
as this might leave the kernel unusable
- For this to be safely possible I want to write the new kernel into 
ubi0_2 (named: "new").
- I could then do an (atomic) "ubirename /dev/ubi0 new kernel kernel 
old" and the new kernel is active
- I do not wish to have that volume always present (and waste space)
- I do at this moment not yet know the size of future kernels.

-- 
------------------------------------------------------------------------
You/Com Audiocommunicatie b.v.
Motorenweg 5k 
2623CR Delft
The Netherlands
tel. : (+31)15 262 59 55
fax. : (+31)15 257 15 95
mail : jmkok@youcom.nl
http : http://www.youcom.nl
------------------------------------------------------------------------
