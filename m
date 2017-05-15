Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dACEn-0003u5-SX
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 09:24:24 +0000
Subject: Re: [PATCH v3] mtd: nand: add option to erase NAND blocks even if
 detected as bad.
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "Mario J. Rugiero" <mrugiero@gmail.com>, Marek Vasut <marex@denx.de>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <20170512053957.10426-1-mrugiero@gmail.com>
 <20170512073946.812-1-mrugiero@gmail.com>
 <20170515102158.798f83f2@bbrezillon>
Cc: linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <c373f192-99b2-2357-5c6b-dbc585b08169@nod.at>
Date: Mon, 15 May 2017 11:23:55 +0200
MIME-Version: 1.0
In-Reply-To: <20170515102158.798f83f2@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,

Am 15.05.2017 um 10:21 schrieb Boris Brezillon:
 > #ifndef statements should be at the beginning of the line. But anyway,
> I think we all agree that always forcing bad block erasure is a bad
> idea. If we accept to support this feature, this should be done through
> a per-NAND-chip debugfs entry, with fine grained selection of the block
> that we're allowing to be forcibly erased.
> 
> Here is a suggestion:
> 
> echo all > /sys/kernel/debug/nand/<nand-chip-name>/erase-bad-blocks
> echo none > /sys/kernel/debug/nand/<nand-chip-name>/erase-bad-blocks
> echo X,Y-Z,... > /sys/kernel/debug/nand/<nand-chip-name>/erase-bad-blocks
> 
> where X is an eraseblock number, and X-Y is a range of eraseblocks.

Will a write to that file trigger the erase or just allow it?

IMHO we can keept it simple such as:
echo y > /sys/kernel/debug/nand/<nand-chip-name>/allow-bad-block-erase

Then a user can erase whatever he wants...

> BTW, maybe we should create and expose a top-level mtd debugfs directory
> to avoid exposing MTD related things at the root of the debugfs FS.
> 
> Something like:
> 
> /sys/kernel/debug/mtd/<dev-type>/...
> 
> so for the NAND related bits it would be
> 
> /sys/kernel/debug/mtd/nand/...

Yes, this makes sense to me.

And since this is debugfs we can do what we want.

Thanks,
//richard
