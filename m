Received: from kroah.org ([198.145.64.141] helo=coco.kroah.org)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P9KyK-0006Qu-E2
	for linux-mtd@lists.infradead.org; Fri, 22 Oct 2010 17:00:05 +0000
Date: Fri, 22 Oct 2010 08:54:16 -0700
From: Greg KH <greg@kroah.com>
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [stable] [Uclinux-dist-devel] [PATCH] mtd: Blackfin NFC: fix
	build error after nand_scan_ident() change
Message-ID: <20101022155416.GA18595@kroah.com>
References: <1282974300-11664-1-git-send-email-vapier@gentoo.org>
	<AANLkTiktR-zNsv4KrnOBh3PxXZTHa6UypzqnwSBpE1=R@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AANLkTiktR-zNsv4KrnOBh3PxXZTHa6UypzqnwSBpE1=R@mail.gmail.com>
Cc: uclinux-dist-devel@blackfin.uclinux.org, linux-mtd@lists.infradead.org,
	stable@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Oct 16, 2010 at 05:14:53AM -0400, Mike Frysinger wrote:
> stable team: could you pick this up for 2.6.35.x ?
> 
> it has been merged in mainline as eac15a429a27cb74115daaf4c1127c5e854d50e4

But it doesn't apply at all to .35-stable.  There is no call to
nand_scan_ident() in that file in the .35 tree.

So, no, sorry, I can't apply it :)

thanks,

greg k-h
