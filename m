Received: from ipmail01.adl6.internode.on.net ([203.16.214.146])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KOLdC-0005Yx-7A
	for linux-mtd@lists.infradead.org; Thu, 31 Jul 2008 00:02:58 +0000
Message-ID: <4891011F.6010306@call-direct.com.au>
Date: Thu, 31 Jul 2008 10:02:39 +1000
From: Iwo Mergler <iwo@call-direct.com.au>
MIME-Version: 1.0
To: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
Subject: Re: Deep thinking about the Wear-leveling mothed
References: <1217327479.2812.24.camel@localhost.localdomain>	<1217398973.9048.7.camel@sauron>
	<417409411.06132@cqu.edu.cn>
In-Reply-To: <417409411.06132@cqu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

xiaochuan-xu wrote:
> On Wed, 2008-07-30 at 09:22 +0300, Artem Bityutskiy wrote:
>> Also, I am not sure it is save to erase one eraseblock several million
>> times and do not erase neighbor eraseblocks. There are "radiation"
>> effects in some flashes, when unused eraseblocks slowly "rot" when
>> their
>> neighbor eraseblocks are used a lot.
> 
> I'm sorry but I'm not understand this clearly.
> 
> 

You might be aware of the fact that after erasure of NAND FLASH,
you are only allowed to write a page once (or a small number of times).

In principle, the write operation is like a logical AND between
the new page content and the old one. That is, writing '0' will
result in a '0', writing a '1' leaves the bit unchanged.

However, in this context, you must regard NAND cells as analog devices.
What you store is not numbers, but electric charge. Erasing the cells
drains the charge (='1'), writing a '0' increases the charge. A charge
above a certain threshold is read as '0', below that is read as '1'.

Due to the proximity of the NAND cells, there is some leakage between
them. Writing a '0' into a cell leaks a little charge into the neighbouring
cells. Also, writing a '1' is not quite perfect and also moves a cell
a notch towards '0'. In other words, memory contents deteriorate despite
'correct' digital operations.

The manufacturers put more effort (and silicon area) into separating
individual erase blocks than into separating individual pages than into
separating individual bits.

But nothing is perfect. Writing a page has a small effect on bits in
neighbouring pages and even in neighbouring erase blocks.

This, I think, is what Artem meant. Although it's 'leakage' rather
than 'radiation'. :-)

Kind regards,

Iwo
