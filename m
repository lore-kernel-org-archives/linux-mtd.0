Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aWhn5-0006cL-Ls
 for linux-mtd@lists.infradead.org; Fri, 19 Feb 2016 09:56:01 +0000
Date: Fri, 19 Feb 2016 10:55:30 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Guilherme de Oliveira Costa <guilherme.oliveira@autotrac.com.br>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: NAND Bad Block Marking Policy
In-Reply-To: <7F9DB42F7DDA544EA3EB31D694929A30EB041A@PERU.autotrac.corp>
Message-ID: <alpine.DEB.2.02.1602181502360.10339@lnxricardw1.se.axis.com>
References: <7F9DB42F7DDA544EA3EB31D694929A30EB041A@PERU.autotrac.corp>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 18 Feb 2016, Guilherme de Oliveira Costa wrote:

> Indeed, the U-Boot solution is derived from the  MTD implementation.
> 
> While I understand that factory bad blocks are marked in such a way, isn't
> it possible that a random page in a block goes bad, and we should mark its
> eraseblock as bad too? Or is such a thing impossible?

If we decide that a page within a block is 'bad' we should mark the whole 
block as being bad.

The question is however, what does 'bad' mean? From a factory point of 
view, bad blocks are blocks which don't meet the specs of the component. 
This can be for instance that some physical defect on the chip renders a 
block useless, or that the data retention or other parameters don't meet 
the specs.

Since a 'bad' block could contain any type of defect, it is unwise to use 
it even if it appears there's only a single cell or page that doesn't seem 
to be working properly. That's why 'bad' blocks are on the block 
granularity. In normal use, the only practical way to get a 'bad' block is 
by excessive writing and erasure. In most cases, you'd never have to mark 
a block as bad. So having 'bad blocks' with block granularity does not 
incur much of a memory capacity penalty, and it's part of the specs of the 
nand flash chips that a certain percentage of blocks may be bad or go bad 
during the lifetime of the chip.

In Linux, the only time we mark a block as bad is when JFFS2 notes that it 
fails to erase properly. (Correct me if I'm wrong on this one, that's the 
way it used to be, did a quick grep for markbad in jffs2 and ubifs and 
that's all I came up with). So from Linux point of view, 'bad' means the 
whole block is bad (because it can't be successfully erased, and erasure 
always takes place on a block level).

> This question is motivated by the fact that our NANDs are not indicating any
> Bad Blocks, which we find very weird, since every piece of literature we've
> come across says that there WILL be bad block in a NAND. We are worried
> that our bad block checking is somehow broken, and we keep overwriting
> this information.

Given a batch of nand flashes, it is not unlikely that there will be a 
certain percentage of devices without bad blocks.

In my (limited) experience, there seem to be two types of factory-marked 
bad blocks. Some blocks are simply marked as bad, and they can be erased 
just like any other blocks, and often used with no immediate problems. 
Most likely these blocks don't meet some manufacturer specification during 
testing at the factory, like data retention time. In a lab environment, I 
have used such bad blocks with no problems, but I would never considering 
letting a product with such resuscitated bad blocks reach an end user.

Then there are bad blocks which contain all zeros, and which cannot be 
erased. I would think these are somehow marked at an earlier stage in 
manufacture, when it has been deemed that there are physical problems in 
the actual chip, so the block in question is disconnected in order to 
avoid problems.

(I haven't verified these two bad block types with any manufacturer, just 
empirical studies of random individual SLC flashes in the range 1-2 Gb.)

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
