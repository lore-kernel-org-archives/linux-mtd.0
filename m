Received: from marasystems.com ([213.150.153.194] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18TjnZ-0008Hm-00
	for <linux-mtd@lists.infradead.org>; Wed, 01 Jan 2003 14:24:45 +0000
Date: Wed, 1 Jan 2003 15:55:06 +0100 (CET)
From: Henrik Nordstrom <hno@marasystems.com>
To: Charles Manning <manningc2@actrix.gen.nz>
cc: Jeff Lin <jlin87@yahoo.com>, <linux-mtd@lists.infradead.org>
Subject: Re: FTL of compact flash card
In-Reply-To: <20030101074730.0D64C158A5@dragon.actrix.co.nz>
Message-ID: <Pine.LNX.4.44.0301011519090.21680-100000@filer.marasystems.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 1 Jan 2003, Charles Manning wrote:

> >From what I read here, what you want is a mapping that provides a block-wise 
> interface to the flash.
> 
> JFFSx is a file system. That will not do what you want.
> 
> What you need is some block-like FTL like NFTL or whatever goes on inside a 
> Compact Flash or ATA card. I am not aware of any open source code that will 
> do what you want. As far as I can tell all this code is fiercely guarded by 
> companies like Sandisk and MSystems.

There is at least 4 such layers in the Linux MTD kernel sources:

  NFTL. Compatible with the NFTL design and implementation by MSystems for
their DOC devices. However, any use of NFTL on other devices will likely
be in violation to their patent unless a license is aquired.

  FTL. Also covered by a M-Systems patent with a special grant for use in
PCMCIA. See ftl.c for details.

  mtdblock, linear block level access to flash memory. No wear leveling as
far as I know.

  The journalling level of jffs. Has wear leveling.

  The journalling level of jffs2. Has wear leveling.


For most purposes I suspect actually using the JFFS2 filesystem is the
best fit. Gives you efficient wear leveling (inlcluding not caring about
deleted content) and reasonable data integrity protection.

Regards
Henrik
