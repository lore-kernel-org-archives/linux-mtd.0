Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K0J1T-0007eo-IM
	for linux-mtd@lists.infradead.org; Sun, 25 May 2008 16:24:40 +0000
Date: Sun, 25 May 2008 18:24:26 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
Message-ID: <20080525162426.GA14741@logfs.org>
References: <20080524175647.GA7366@logfs.org>
	<346401.5675.qm@web36705.mail.mud.yahoo.com>
	<20080525072501.GA13140@logfs.org>
	<20080525133029.GA3599@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080525133029.GA3599@shareable.org>
Cc: linux-mtd@lists.infradead.org, Alex Dubov <oakad@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 25 May 2008 14:30:29 +0100, Jamie Lokier wrote:
> Jörn Engel wrote:
> > > Memorystick cards can be written page at a time, but only in progressive
> > > fashion - only if all pages at lower offsets to the current page were written
> > > before. This can be made to work as a useful optimization.
> > 
> > The same limitation is true for some raw NAND chips as well.  Afaik all
> > of current MTD honors that limitation.
> 
> That seems like it would cause uneven wear-levelling in some
> situations.  Specifically, each time you need to erase a block which
> has not been completely written, because you need to write a
> contiguous record larger than the remaining space.
> 
> I don't know it was a physical requirement of some chips, thanks for
> clarifying.

The "progressive" limitation only concerns writes _within_ eraseblocks.
It has no impact on wear leveling.

Jörn

-- 
If you're willing to restrict the flexibility of your approach,
you can almost always do something better.
-- John Carmack
