Received: from desire.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AEDzN-0007nc-8j
	for <linux-mtd@lists.infradead.org>; Mon, 27 Oct 2003 20:29:21 +0000
From: Charles Manning <manningc2@actrix.gen.nz>
To: "" <simon@baydel.com>, linux-mtd@lists.infradead.org
Date: Tue, 28 Oct 2003 09:34:16 +1300
References: <3F9D3D98.6453.14E703@localhost>
In-Reply-To: <3F9D3D98.6453.14E703@localhost>
MIME-Version: 1.0
Message-Id: <20031027202807.DA4481A0A7@desire.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: SmartMedia FAT
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 28 October 2003 04:45,  wrote:
> I would like to be able to access FAT partitions on a SMC via Linux.
> Curently the hardare loads its' configuration and boots the hardware from
> files on a FAT partition. The hardware itself has no hardware flash
> translation layer. The SMC has been created on a USB device which contains
> a flash translation layer conforming to the SFFDC standard. After this a
> JFFS2 root is mounted. It would be nice if I could change the hardware and
> boot files from Linux but I have been unable to find any reliable way of
> accessing the FAT filesystem.

Ok, I'll first remind you that a SmardMedia card is just NAND flash and you 
can use it with a NAND file system like YAFFS or JFFS2.

I'll also warn you that running FAT on SmartMedia is far from reliable and is 
slow (relative to YAFFS and, I expect, JFFS2).

The rest of my response assumes that you have a valid reason to use FAT + 
SMartMedia (eg. need to share files with a SmartMedia-equipped device).

Iyf you are just using SMC to load images from a PC into an embedded system, 
then you're likely going to get the best result by using YAFFS or JFFS2 and 
just using a simple copy process on the host to copy a YAFFS/JFFS2 image onto 
the SmartMedia card. ie a process like:

* Generate a YAFFS image with mkyaffsimage.
* Copy the image onto the SMC with a program derived from mkyaffs.
* Stuff into your embedded system and boot YAFFS.

>
> As far as I understand, from the information I have read, I would need to
> create  a block driver which contained a SSFDC compatible translation layer
> ? In the nand FAQ it mentions SmartMedia FAT. I have been unable to find
> how this is implemented. Has anyone implemented this yet ?

As I understand it, the SMC FAT format differs slightly from regular FAT. I 
don't know of any Linux implementations.

The Samsung www has various info on the formats. The SSFDC www has some specs 
too. The yaffs_ecc.c ECC code (in the YAFFS CVS)  does SMC compliant ECC 
calcs.


> I would like to know if my assumptions are correct. If so I guess there are
> many ways this could be achieved.
>
> 1. Wrirte my on block driver ?

Currently the md block driver is just a way to get from a name in /dev to the 
internal kernel structures so that it can be used by a flash file system. It 
does not supply full block driver functionality.

A SmartMedia block driver does bad block management, ECC and logical to 
physical block mapping. 


> 2. Bolt on some bits to mtdblock ?

I guess this could be added to mtdblock, but is probably best done as a new 
block driver that uses mtdblock under the hood. Why? Because probably nobody 
really wants all this extra stuff added to mtdblock.

> 3. As I don't do this all the time write a user app to update via /dev/mtd

I guess that's a possibility, but seems like some hard work. Likely a 
YAFFS/JFFS2 path would be simpler.
