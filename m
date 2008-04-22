Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JoHeJ-0000Zj-GP
	for linux-mtd@lists.infradead.org; Tue, 22 Apr 2008 12:31:03 +0000
Date: Tue, 22 Apr 2008 13:30:56 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: [U-Boot-Users] ubi and u-boot
Message-ID: <20080422123054.GA4849@shareable.org>
References: <20080420222237.4AE5324657@gemini.denx.de>
	<1208779508.5965.371.camel@sauron>
	<Pine.LNX.4.64.0804211533140.27984@lnxricardw.se.axis.com>
	<1208785463.6654.34.camel@vader.jdub.homelinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1208785463.6654.34.camel@vader.jdub.homelinux.org>
Cc: "u-boot-users@lists.sourceforge.net" <u-boot-users@lists.sourceforge.net>,
	Ricard Wanderlof <ricard.wanderlof@axis.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
> > I was under the impression from past emails on the MTD list that the 
> > internal meta format for UBI has changed a few times over its lifetime.
> > 
> > Assuming this continues, I would think this would cause problems for 
> > bootloaders such as U-Boot whose flash partitions are not necessarily 
> > rewritten in the case of a product upgrade - i.e. a firmware upgrade with 
> > a new kernel would have a new UBI implementation and spec causing an
> > older bootloader to fail to operate properly with the newer image.
> 
> I think there was only 1 time the on-flash format changed, and that was
> before UBI was merged upstream.  New features can be introduced with
> additional flags, however older versions should be able to ignore those.

Quite.  As long as the format is changed in an upward compatible way,
it should be fine.  Hopefully the existing format is designed to
ensure that's always possible - at least for everything called 'UBI 1'
since the upstream merge.

-- Jamie
