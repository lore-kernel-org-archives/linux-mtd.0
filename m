Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aEHwF-000527-DS
 for linux-mtd@lists.infradead.org; Wed, 30 Dec 2015 14:41:20 +0000
Date: Wed, 30 Dec 2015 15:40:55 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Franklin S Cooper Jr." <fcooper@ti.com>
Cc: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: Testing generic empty page bit flips recovery
Message-ID: <20151230154055.662b4df8@bbrezillon>
In-Reply-To: <5683E5CC.6020008@ti.com>
References: <5683E5CC.6020008@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Franklin,

On Wed, 30 Dec 2015 08:10:20 -0600
"Franklin S Cooper Jr." <fcooper@ti.com> wrote:

> I am trying to follow up on this discussion from this patch
> set (https://patchwork.ozlabs.org/patch/539059/) which
> suggested that Michael instead test the generic bitflips
> recovery that is implemented by Boris "mtd: nand: properly
> handle bitflips in erased pages" patchset
> (http://lists.infradead.org/pipermail/linux-mtd/2015-September/061617.html).
> I would like to test Boris patchset but first I need to
> recreate the error that his patch is fixing.
> 
> The error that the patchset is attempting to fix isn't
> something I have ever encountered before. Currently I am
> trying to reproduce this issue on a TI K2E evm that uses the
> davinci nand driver. I flashed the nand's file-system
> partition with a ubi filesystem and the board is currently
> set to boot using the file-system on the nand. After about
> 60 secs I cut the power from the board and boot the board
> again. What I would expect is that the board will eventually
> fail to mount the ubi filesystem but currently the board has
> ran for over 24 hours and powered on and off over 1400 times
> and its still mounting the file-system perfectly fine.
> 
> Any suggestions on a test case that I can use to force the
> empty page bit flips error?
> 
> 

The davinci driver seems to support raw accesses, so you can try to
apply this patch [1] against the mtd-utils tree (not sure it still
applies cleany, but it should work with mtd-utils-1.5.1), and use the
nandflipbits tool:

# flash_erase /dev/mtdX <offset> 1
# nandflipbits /dev/mtdX 1@<offset>
# nanddump -f /tmp/dump -s <offset> -l <page-size> /dev/mtdX

Without the patch, nanddump should complain about uncorrectable errors,
and if you hexdump /dev/dump you should see the bitflip.
If nanddump does not complain after applying my patch, then it means it
fixes the "bitflips in erased pages" bug.

Best Regards,

Boris

[1]http://lists.infradead.org/pipermail/linux-mtd/2014-November/056634.html
-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
