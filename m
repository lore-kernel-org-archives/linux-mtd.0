Received: from smtp115.sbc.mail.sp1.yahoo.com ([69.147.64.88])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KNxrd-0003rn-7s
	for linux-mtd@lists.infradead.org; Tue, 29 Jul 2008 22:40:17 +0000
Date: Tue, 29 Jul 2008 15:43:01 -0700
From: David Brownell <david-b@pacbell.net>
To: akpm@linux-foundation.org
Subject: Re: [RESEND PATCH 2.6.26-git 1/2] MTD DataFlash: bugfix, binary page
	sizes now handled (v3)
References: <1212467165-26379-1-git-send-email-cooloney@kernel.org>
	<200806282321.34275.david-b@pacbell.net>
	<200807251549.12565.david-b@pacbell.net>
	<20080729150052.80e558db.akpm@linux-foundation.org>
In-Reply-To: <20080729150052.80e558db.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-Id: <20080729224301.AD7A3361127@adsl-69-226-248-13.dsl.pltn13.pacbell.net>
Cc: cooloney@kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, michael.hennerich@analog.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > This fixes a bug in handling certain newer DataFlash chips (at45db321d
> > and at45db642d have current Linux users) when they were configured to
> > use binary page sizes (possibly at the factory).
> > 
> > ...
>
> I'm not sure what kernel this is against, but it gets a reject storm
> against 2.6.27-rc1.  As does [2/2].

You seem to have picked up the right version ... the problem
was that V2 got merged into RC1, not V3.  So the updated patch
corrected that problem.   The update of the second patch was
unchanged other than the Kconfig tweak (HAVE_MTD_OTP flag)
someone requested.

- Dave
