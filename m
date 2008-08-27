Received: from ey-out-1920.google.com ([74.125.78.144])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KYIkr-0002cU-Bo
	for linux-mtd@lists.infradead.org; Wed, 27 Aug 2008 11:00:02 +0000
Received: by ey-out-1920.google.com with SMTP id 4so454589eyg.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Aug 2008 03:59:59 -0700 (PDT)
Message-ID: <ac9c93b10808270359l18c89a84m6d14353e78ee60df@mail.gmail.com>
Date: Wed, 27 Aug 2008 12:59:59 +0200
From: "Frans Meulenbroeks" <fransmeulenbroeks@gmail.com>
To: "Sheng-Zhe Zhao" <a18689@motorola.com>
Subject: Re: [PATCH][MTD][NAND]Bad Block Management
In-Reply-To: <1219830684.13957.25.camel@il93elnxlog2>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1219830684.13957.25.camel@il93elnxlog2>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008/8/27 Sheng-Zhe Zhao <a18689@motorola.com>:
> Here come our patch and a short introduction for this patch. Any comments are welcome.
>
> [MTD] [NAND] Bad Block Management
> During the lifetime of a NAN device, additional Bad blocks may develop. The NAN devices have a Status Register that indicates whether an operation is successful or not. Additional Bad Blocks are identified when attempts to program or erase give errors in the Status Register.  As the failure of a page program operation does not affect the data in other pages in the same block, most of the data within a failing block can be moved to a new block prior to marking the block bad. Blocks can be marked as bad and new blocks allocated using two general methods:
>
> 1.       Skip Block method:
> In the Skip Block method, the algorithm creates the Bad Block Table and when the target address corresponds to a Bad Block address, the data is stored in the next good block, skipping the Bad Block.
>
> 2.       Reserve Block method:
> The Reserve Block Method uses the same Bad Block Table format as the Skip Block Method. However, in the Reserve Block Method, Bad Blocks are not skipped but instead are replaced by a block from the reserved block area. This replacement is achieved by a layer of software which automatically remaps bad blocks to their corresponding replacement blocks. For this purpose, the Bad Block Management software creates two areas in NAN flash: the User Addressable Block Area and the Reserved Block Area as shown below.
>
> This patch implements "reserve block method" on Motorola's SCUM-A11 platform mobile devices.  With the Reserved Block method, any exist bad block or newly wearing out block will be replaced by reserved block while block pool still available . The maximum number of reserved blocks is set to be 10% of the total size of the NAN device. With the reserved block pool for bad block replacement, applications will see the NAN chip contains only contiguous good blocks; the physical bad blocks will be replaced with good blocks from the reserved pool in very low level and it is transparent to the upper level applications.

Zhao,

Nice work. A few remarks:

I know there is a patch for the skip block method from Thomas
Gleixner, but this was never submitted.
Anyway suppose you wanted to do Skip Block, I would suggest storing
hte bad block table somewhere on flash (and not create it on the fly).

Wrt the 10% for Reserve Block: I would suggest making this a config
parameter and allow the person to configure the kernel to choose the
value he/she deems best for his system

Wrt the device wise approach: I think I would prefer if I could say
per partition if I wanted to use this (and thus have the mapping done
per partition). That way filesystems that do their own bad block
handling can do it the way they want to.Now it seems a little bit
double work to have bad block handling in both the filesystem and in
the mtd layer.

Frans.
