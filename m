Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FIYoJ-0007Eo-E0
	for linux-mtd@lists.infradead.org; Sun, 12 Mar 2006 17:13:16 -0500
Date: Sun, 12 Mar 2006 23:12:48 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Lennert Buytenhek <buytenh@wantstofly.org>
Message-ID: <20060312221248.GA7525@wohnheim.fh-wedel.de>
References: <20060212170441.GA28427@xi.wantstofly.org>
	<20060228191642.GB19811@xi.wantstofly.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060228191642.GB19811@xi.wantstofly.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [less intrusive PATCH, RFC] don't load physmap if length is zero
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 28 February 2006 20:16:42 +0100, Lennert Buytenhek wrote:
> 
> OK, so if the previous patch (which converted physmap into a platform
> driver) was too nonobvious, can we at least apply a patch like this so
> that it's possible to compile in physmap without using it?
> 
> This is useful for example on the Technologic Systems TS-72xx boards,
> where some models in the series have NOR flash while others have NAND
> flash, and you'd like to be able to compile a single kernel that works
> on all models.  (So for the NOR models, you call physmap_configure at
> run time, while for the NAND models, you initialise the board-specific
> NAND driver (which I shall submit later.))
> 
> I'd still prefer the platform driver patch to be applied, but having
> some kind of solution merged is better than no solution at all :-)

Is there a good reason why you didn't just write your own mapping
driver?  Most people copy physmap.c, change a few things and use that
driver instead of physmap.c.  It does involve many copies of
essentially the same code, but that code is very simple and no sane
kernel should have more than one mapping driver included, so no object
code is duplicated.

Jörn

-- 
Public Domain  - Free as in Beer
General Public - Free as in Speech
BSD License    - Free as in Enterprise
Shared Source  - Free as in "Work will make you..."
