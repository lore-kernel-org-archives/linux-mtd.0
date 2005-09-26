Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EJoOh-0003Zt-Rm
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2005 04:33:42 -0400
Date: Mon, 26 Sep 2005 10:31:37 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Message-ID: <20050926083137.GB17756@wohnheim.fh-wedel.de>
References: <E1EHjUk-0001IT-Dn@phoenix.infradead.org>
	<43303409.5030406@users.sourceforge.net>
	<43303D59.1040805@yandex.ru>
	<433067BF.6080909@users.sourceforge.net>
	<1127399674.28625.18.camel@sauron.oktetlabs.ru>
	<43341DCD.6090002@users.sourceforge.net>
	<20050925125455.GA28978@wohnheim.fh-wedel.de>
	<4337AB45.9020607@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4337AB45.9020607@yandex.ru>
Cc: linux-mtd@lists.infradead.org,
	Anders Grafstrom <grfstrm@users.sourceforge.net>
Subject: Re: mtd/fs/jffs2 erase.c,1.84,1.85 roll back
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 26 September 2005 12:03:17 +0400, Artem B. Bityutskiy wrote:
> Jörn Engel wrote:
> >On Fri, 23 September 2005 17:22:53 +0200, Anders Grafstrom wrote:
> >
> >>jffs2 makes a second try if a failed erase is reported by the mtd 
> >>driver. But only for NAND (in jffs2_write_nand_badblock()). What I'm 
> >>after is a retry for NOR as well. But I wrote the patch so it would 
> >>retry for other cases of failure too.
> >
> >Is a retry really an improvement?  When a block cannot be properly
> >erased on the first try, I would not trust it anymore.  Instead of a
> >retry, I'd rather mark it as a bad block and not touch it again.
> 
> From the other hand, why not to retry? Does it hurt? Is this in the 
> critical code-path? Deity knows what happend to the hardware/driver, may 
> be there was a short magnetical disturbance and that was the reason why 
> the block was not erased. May be one of the lines/cirquits outside of 
> the flash was affected but the block is really erasable. Actually, after 
> I've read the paper that *you* pointed 
> (http://www.cs.wisc.edu/adsl/Publications/iron-sosp05.pdf), I'm rather 
> positive about the idea of retrying. The articlae is about HDDs, but IMO 
> is also acceptable flash devices in this respect.

Depends on where the problem is.  An alpha particle messing up the bus
- sure, just retry and it'll work.  Something in the flash - by all
chances the block is messed up and shouldn't be used again.

As a default, I'd consider the block in question to be dead.  I don't
mind a retry per se, but that should be the exception.  If the first
retry didn't work, you can be pretty sure that it was not just an
alpha particle and should declare your hardware dead.  It doesn't even
matter whether it's the flash, the bus or anything else.

Jörn

-- 
Ninety percent of everything is crap.
-- Sturgeon's Law
