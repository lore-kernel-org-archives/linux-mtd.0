Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16pYHM-0006n9-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Mar 2002 17:29:08 +0000
Date: Mon, 25 Mar 2002 18:29:03 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: Andrew Dixon <andrew.dixon@seranoa.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: CVS tags?
Message-ID: <20020325182903.A16898@wohnheim.fh-wedel.de>
References: <3C9BA0DD.B3827964@seranoa.com> <20020323112215.B13151@wohnheim.fh-wedel.de> <3C9F38C4.510394D@seranoa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3C9F38C4.510394D@seranoa.com>; from andrew.dixon@seranoa.com on Mon, Mar 25, 2002 at 09:48:36AM -0500
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Mon, 25 March 2002 09:48:36 -0500, Andrew Dixon wrote:
> > You should use it if you
> > - have more than one device that can be partitioned or
> > - want to get used to the new code from the beginning.
> 
> As far as the MTD device goes I'm in a pretty good spot.  I put together
> a driver that takes two flashes, creates one device from them, and then
> partitions them the way I want.  Then I put jffs2 onto my one BIG flash
> partition.

Thought so. most people really don't need this stuff, as all the flash
will be in one big partition (minus bootloader). But if you add nvram,
slram or such, you already have two devices. Add partitioning and
things get messy. :-)
You really should try my code, stumble and demand better
documentation. As long as noone asks for it...

Jörn

-- 
Treating your users as co-developers is your least-hassle route to
rapid code improvement and effective debugging.
-- Eric Raymond in "The cathedral and the bazaar"
