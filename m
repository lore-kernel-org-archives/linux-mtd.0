Received: from e4.ny.us.ibm.com ([32.97.182.144])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FtgXK-000256-FW
	for linux-mtd@lists.infradead.org; Fri, 23 Jun 2006 03:57:15 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e4.ny.us.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5N7v3rP023007
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <linux-mtd@lists.infradead.org>; Fri, 23 Jun 2006 03:57:03 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.13.6/NCO/VER7.0) with ESMTP id
	k5N7v3WJ263236
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Fri, 23 Jun 2006 03:57:03 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	k5N7v3Ra018481
	for <linux-mtd@lists.infradead.org>; Fri, 23 Jun 2006 03:57:03 -0400
Subject: Re: Creating NAND flash image outside embedded target
From: Frank Haverkamp <haver@vnet.ibm.com>
To: Kevin Starinieri <kevin_s1@verifone.com>
In-Reply-To: <267BDCD982E696419B21B63BF91270310225258A@SMFNTMAIL.verifone.com>
References: <267BDCD982E696419B21B63BF91270310225258A@SMFNTMAIL.verifone.com>
Content-Type: text/plain
Date: Fri, 23 Jun 2006 09:57:01 +0200
Message-Id: <1151049421.6067.25.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: haver@vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Kevin,

we had a similar problem with our embedded powerpc system where we
needed pre-build binary images to be flashed via a JTAG programming
utility into our NAND flashes. We also wanted to boot using NAND
flash only and have NAND flash scrubbing and the possiblity to
handle those bad blocks gracefully. 

For those and other reasons we developed UBI which we recently
published. It implements an interresting volume management approach,
helping to overcome some limitations which a traditional fixed
address/size partitioning scheme had. If you like, you can have a look
at our design paper and the associated utilities in my mtd-utils.git.

Here you can find our UBI design paper and a brief overview:
http://www.linux-mtd.infradead.org/doc/ubi.html

Maybe you find other aspects which are interessting for your
application too.

On Thu, 2006-06-22 at 17:28 -0700, Kevin Starinieri wrote:
> I have looked through the mail archives and did not see any subject
> threads regarding this.  I am trying to create a NAND flash image
> without having to do it on my embedded target.  

> I then wanted to partition the fake mtd device and write to it using a
> nandwrite utility that I compiled for x86 that is used for samsung arm
> s3c2410 nand flash.  But the utility expects the device to be
> partitioned and erase regions to be defined.  But, I don't know of
> anyway to do this outside of my target.

For generation of UBI/NAND images on your developemt (x86) systems we
are using the ubi-utils toolchain:

 o mkpfi is processing a configuration file and binary input data e.g.
   JFFS2 images, boot-code, kernel images. It creates a partial flash
   image (pfi) file which can be used by other tools e.g.
 o pfi2bin which converts the pfi file into plain binary output.
   For NOR flashes that would be an image you could directly burn
   into your NOR which you solder afterwards onto your board,
   for NAND you can run:
 o bin2nand which adds the OOB whith ECC information (currently only
   our layout, but one could consider enhancing it).

The output of this we can flash via JTAG to our systems. If this works
we use on our embedded systems:
 o overwriting files in JFFS2 ;-) and
 o pfiflash to flash pfi files to the system e.g. boot-code, 
   kernel which are stored in UBI static volumes. We are 
   using this to update our systems. To create UBI volumes 
   manually and update them, we use:
 o ubimkvol, ubirmvol, ubiupdatevol

We even started (and have not finished yet) the inverse toolchain which
can convert the data you read via JTAG from broken systems back into
binary data which previously was written to the UBI volumes. This is
intended to be used for field returns which do not boot/operate
correctly anymore.

Frank
