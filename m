Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K62Q9-00072A-RU
	for linux-mtd@lists.infradead.org; Tue, 10 Jun 2008 11:53:50 +0000
Date: Tue, 10 Jun 2008 13:46:29 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: mtd_info->size again (lengthy)
Message-ID: <20080610114604.GA31069@logfs.org>
References: <OFD87C95E7.367C9580-ON88257462.00177BAD-88257462.001EF9FC@selinc.com>
	<20080608121020.GA13200@logfs.org>
	<20080609132117.GC29526@shareable.org>
	<20080609143633.GA22447@logfs.org>
	<20080609163149.GB2596@shareable.org>
	<20080609172202.GB22447@logfs.org>
	<20080610105647.GD25910@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080610105647.GD25910@shareable.org>
Cc: linux-mtd@lists.infradead.org, Bruce_Leonard@selinc.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 10 June 2008 11:56:48 +0100, Jamie Lokier wrote:
> 
> I just don't see any advantage to assuming "nobody will ever use 4GiB
> erase blocks", when changing the API with larger sizes.

*shrug*

I use u64 for the number of eraseblocks because it doesn't take a lot of
imagination to see u32 overflow before I retire.  It didn't take a lot
of imagination to see the u32 size problem coming either.  Relying on "a
good reason that I haven't thought of" is a bit of a stretch.

Let me put it this way: if you spend the time and create all the
patches, you can use u128 for all I care.

> I have a particularly crappy one where erase blocks the CPU if the CPU
> reads from the chip during the erase - so the cfi_cmdset_0002.c file
> needs a patch to avoid polling the status register for this board.
> This is topic for another post, though.

Nothing can prevent bad drivers.  At least they are easy to fix.

Jörn

-- 
"Security vulnerabilities are here to stay."
-- Scott Culp, Manager of the Microsoft Security Response Center, 2001
