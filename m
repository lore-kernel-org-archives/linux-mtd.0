Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dACWN-000608-9Z
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 09:42:32 +0000
Date: Mon, 15 May 2017 11:41:59 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: "Mario J. Rugiero" <mrugiero@gmail.com>, Marek Vasut <marex@denx.de>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3] mtd: nand: add option to erase NAND blocks even if
 detected as bad.
Message-ID: <20170515114159.655309cf@bbrezillon>
In-Reply-To: <c373f192-99b2-2357-5c6b-dbc585b08169@nod.at>
References: <20170512053957.10426-1-mrugiero@gmail.com>
 <20170512073946.812-1-mrugiero@gmail.com>
 <20170515102158.798f83f2@bbrezillon>
 <c373f192-99b2-2357-5c6b-dbc585b08169@nod.at>
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

On Mon, 15 May 2017 11:23:55 +0200
Richard Weinberger <richard@nod.at> wrote:

> Boris,
> 
> Am 15.05.2017 um 10:21 schrieb Boris Brezillon:
>  > #ifndef statements should be at the beginning of the line. But anyway,
> > I think we all agree that always forcing bad block erasure is a bad
> > idea. If we accept to support this feature, this should be done through
> > a per-NAND-chip debugfs entry, with fine grained selection of the block
> > that we're allowing to be forcibly erased.
> > 
> > Here is a suggestion:
> > 
> > echo all > /sys/kernel/debug/nand/<nand-chip-name>/erase-bad-blocks
> > echo none > /sys/kernel/debug/nand/<nand-chip-name>/erase-bad-blocks
> > echo X,Y-Z,... > /sys/kernel/debug/nand/<nand-chip-name>/erase-bad-blocks
> > 
> > where X is an eraseblock number, and X-Y is a range of eraseblocks.  
> 
> Will a write to that file trigger the erase or just allow it?

Just allows it.

> 
> IMHO we can keept it simple such as:
> echo y > /sys/kernel/debug/nand/<nand-chip-name>/allow-bad-block-erase
> 
> Then a user can erase whatever he wants...

Well, I was proposing to do that because several users can use the same
NAND chip in parallel, and allowing to forcibly erase a bad block at
the NAND chip level can be dangerous in this case.
Here is a real example: 2 users are accessing 2 different partitions,
one wants to force bad block erasure on partition 1, while the other
just wants to normally erase partition 0. With the global
"allow/disallow bad block erasure" approach, you're just likely to
erase bad blocks in partition 0 as well.

> 
> > BTW, maybe we should create and expose a top-level mtd debugfs directory
> > to avoid exposing MTD related things at the root of the debugfs FS.
> > 
> > Something like:
> > 
> > /sys/kernel/debug/mtd/<dev-type>/...
> > 
> > so for the NAND related bits it would be
> > 
> > /sys/kernel/debug/mtd/nand/...  
> 
> Yes, this makes sense to me.
> 
> And since this is debugfs we can do what we want.

Yep.
