Received: from rex.securecomputing.com ([203.24.151.4] helo=cyberguard.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M9637-0002Px-QN
	for linux-mtd@lists.infradead.org; Tue, 26 May 2009 23:27:20 +0000
Date: Wed, 27 May 2009 09:27:01 +1000
From: David McCullough <David_Mccullough@securecomputing.com>
To: Paul Mundt <lethal@linux-sh.org>, Mike Frysinger <vapier.adi@gmail.com>,
	linux-kernel@vger.kernel.org, uclinux-dist-devel@blackfin.uclinux.org,
	Greg Ungerer <gerg@uclinux.org>, uclinux-dev@uclinux.org,
	linux-mtd@lists.infradead.org
Subject: Re: [uClinux-dev] Re: [PATCH 2/2] mtd/maps: uclinux: support
	Blackfin systems
Message-ID: <20090526232701.GC24644@securecomputing.com>
References: <1243331191-11445-1-git-send-email-vapier@gentoo.org>
	<1243331191-11445-2-git-send-email-vapier@gentoo.org>
	<20090526113122.GB16835@linux-sh.org>
	<8bd0f97a0905260942m4b574d75oc4f38ee3d8849395@mail.gmail.com>
	<20090526164735.GA24261@linux-sh.org>
	<8bd0f97a0905260950i6da64210n7da256627d3e38ff@mail.gmail.com>
	<20090526170653.GB24261@linux-sh.org>
	<8bd0f97a0905261024q178fbc80n4a997daca5a3b405@mail.gmail.com>
	<20090526231902.GA6295@linux-sh.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090526231902.GA6295@linux-sh.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Jivin Paul Mundt lays it down ...
> On Tue, May 26, 2009 at 01:24:46PM -0400, Mike Frysinger wrote:
> > On Tue, May 26, 2009 at 13:06, Paul Mundt wrote:
> > > Use the attached, and then just set uclinux_ram_map.phys = your_address_here
> > > in your setup_arch(). Having weak symbols in drivers that are supposed to
> > > be overriden by the architecture code is just way too backwards for
> > > words. Globals suffice fine for this sort of thing, if you are not going
> > > to go to the effort to pass this information to the driver directly that
> > > is.
> > 
> > i was thinking something else, but obviously this is nicer than what i
> > was thinking
> 
> Unfortunately there is the problem that the map driver itself is a
> tristate, so if this is built as a module, the symbol will not be
> available to you. On the other hand, if it doesn't need to ever really be
> a module, converting it to a bool ought to be workable. There are no
> in-tree users that enable this as a module anyways.

Based on how it relocates the rootfs,  I don't believe a module can ever
be work,  so a boolean would be a better choice IMO,

Cheers,
Davidm

-- 
David McCullough,  david_mccullough@securecomputing.com,  Ph:+61 734352815
McAfee - SnapGear  http://www.snapgear.com                http://www.uCdot.org
