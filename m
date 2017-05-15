Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dADp2-0000Mz-QO
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 11:05:54 +0000
Date: Mon, 15 May 2017 13:05:20 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: "Mario J. Rugiero" <mrugiero@gmail.com>, Marek Vasut <marex@denx.de>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3] mtd: nand: add option to erase NAND blocks even if
 detected as bad.
Message-ID: <20170515130520.6ffff277@bbrezillon>
In-Reply-To: <f47ffee8-a40d-0fc1-65a7-99e1596ea9f0@nod.at>
References: <20170512053957.10426-1-mrugiero@gmail.com>
 <20170512073946.812-1-mrugiero@gmail.com>
 <20170515102158.798f83f2@bbrezillon>
 <c373f192-99b2-2357-5c6b-dbc585b08169@nod.at>
 <20170515114159.655309cf@bbrezillon>
 <f47ffee8-a40d-0fc1-65a7-99e1596ea9f0@nod.at>
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

On Mon, 15 May 2017 12:10:58 +0200
Richard Weinberger <richard@nod.at> wrote:

> Boris,
> 
> Am 15.05.2017 um 11:41 schrieb Boris Brezillon:
> >> IMHO we can keept it simple such as:
> >> echo y > /sys/kernel/debug/nand/<nand-chip-name>/allow-bad-block-erase
> >>
> >> Then a user can erase whatever he wants...  
> > 
> > Well, I was proposing to do that because several users can use the same
> > NAND chip in parallel, and allowing to forcibly erase a bad block at
> > the NAND chip level can be dangerous in this case.
> > Here is a real example: 2 users are accessing 2 different partitions,
> > one wants to force bad block erasure on partition 1, while the other
> > just wants to normally erase partition 0. With the global
> > "allow/disallow bad block erasure" approach, you're just likely to
> > erase bad blocks in partition 0 as well.  
> 
> Hmm, I'm not sure whether it makes sense to be smart in this case.
> If somebody needs to fixup his bad blocks, like Mario described, there
> are no other users and such an action should only be done when you
> really know what you are doing.
> This is a debug knob and not a knob that should be used in production
> or while other parts of the chip are in use.

Fair enough. Let's keep it simple then.
