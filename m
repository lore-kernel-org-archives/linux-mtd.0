Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LWgE9-00069i-Jf
	for linux-mtd@lists.infradead.org; Tue, 10 Feb 2009 00:11:52 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: Adrian McMenamin <adrian@newgolddream.dyndns.info>
Subject: Re: [PATCH] sh: maple: add support for Visual Memory Card devices,
	and make consequential changes to maple input drivers - 2/3 - v5
Date: Mon, 9 Feb 2009 19:11:43 -0500
References: <1234122069.6736.8.camel@localhost.localdomain>
	<200902091433.57126.vapier@gentoo.org>
	<1234215716.6756.18.camel@localhost.localdomain>
In-Reply-To: <1234215716.6756.18.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200902091911.46383.vapier@gentoo.org>
Cc: linux-sh <linux-sh@vger.kernel.org>, Greg KH <greg@kroah.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>, Paul Mundt <lethal@linux-sh.org>,
	MTD <linux-mtd@lists.infradead.org>,
	linux-input <linux-input@vger.kernel.org>, dwmw2 <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 09 February 2009 16:41:56 Adrian McMenamin wrote:
> But the basic point here is that changing the bus code is necessary to
> get the VMU driver (or *any* VMU driver) to work, but changing the bus
> driver also breaks the two existing drivers in mainline that use the
> bus. The breakage in terms of lines to be fixed is small, but it still
> needs to be done 'all at once'.

the bus change and the resulting fallout in those drivers should be 1 
changeset.  if you want to do more work than just transitioning those drivers, 
that should be additional patches that depend on that bus changeset.  that way 
bisection will not break as Paul highlighted.
-mike
