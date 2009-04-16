Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LuKCP-0000rb-5f
	for linux-mtd@lists.infradead.org; Thu, 16 Apr 2009 05:31:52 +0000
Subject: Re: Run UBIFS on top of IDE mode NAND disk?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20090415162923.GC4325@shareable.org>
References: <000001c9bd90$e726cdb0$0470150a@cisco.com>
	<1239776240.3390.151.camel@localhost.localdomain>
	<20090415162923.GC4325@shareable.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 16 Apr 2009 08:30:49 +0300
Message-Id: <1239859849.3390.192.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Subodh Nijsure <sunijsur@cisco.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-04-15 at 17:29 +0100, Jamie Lokier wrote:
> Artem Bityutskiy wrote:
> > Hi,
> > 
> > On Tue, 2009-04-14 at 23:10 -0700, Subodh Nijsure wrote: 
> > > I have board with 4GB NAND memory chip, it is configured to
> > > operate in IDE mode. And currently I am creating ext3 file-system
> > > on it.  This chip also have on-board controller that does
> > > wear-levelling, ECC so the quesitons are:
> > >  
> > > Can I (Should I) run UBIFS on of it and gain more of wear-levelling or its
> > > not worth it? 
> > 
> > Vs "Can I": if this is raw NAND, you just need an MTD driver for it.
> > Then you can use UBI/UBIFS on top of that.
> > 
> > Vs "Should I": you really should not ask questions like this. It is a
> > question of your design. Look at your NAND and how many erase cycles
> > each eraseblock survives. Then roughly calculate how many years or
> > months it should survive with ext3, which has fixed-position journal
> > and inode table and bitmap. Then decide whether you need WL or not.
> > Everything depends on your requirements.
> > 
> > Also, if this is raw NAND, then HW does not hide bad blocks for you,
> > right? How will you manage bad eraseblocks then, ext3 cannot do this.
> > It just panics in case of any I/O error.
> 
> But the on board controller does wear-levelling, he said.
> 
> I think the question is whether the on board controller's
> wear-levelling is good or not.  If it's low quality, UBI will do it
> better.  If the controller is good quality, there's no need for UBI on
> top of it.
> 
> I guess that two layers of good quality wear levelling just adds more
> wear, because they both copy data around.
> 
> If it can be used as raw NAND, and the chip really is a NAND with
> standard NAND properties, _and_ if it's possible to disable the
> controller's wear levelling and get direct NAND access, then at least
> you know that UBI provides a good quality wear levelling
> implementation, and you have access to some statistics too.

Right, he responded me in private (do not know why) and I
apologized for misunderstanding, and shared my thoughts.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
