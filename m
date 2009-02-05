Received: from smtp127.sbc.mail.sp1.yahoo.com ([69.147.65.186])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LVCnK-0003gf-Q5
	for linux-mtd@lists.infradead.org; Thu, 05 Feb 2009 22:34:07 +0000
From: David Brownell <david-b@pacbell.net>
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: [patch 2.6.29-rc3] NAND: fix "raw" reads with ECC syndrome layouts
Date: Thu, 5 Feb 2009 14:34:00 -0800
References: <200902021734.12505.david-b@pacbell.net>
In-Reply-To: <200902021734.12505.david-b@pacbell.net>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200902051434.00831.david-b@pacbell.net>
Cc: Kevin Hilman <khilman@deeprootsystems.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 02 February 2009, David Brownell wrote:
> The current syndrome-based drivers in mainline all seem to use one
> chunk per page; which is presumably why they've not hit this bug.

Hmm, no comments?  It seems the ECC_HW_SYNDROME stuff isn't
especially familiar to many folk...


> Fix ... by adding read/write page_raw_syndrome() routines as
> siblings of the existing non-raw routines; "raw" just means to
> bypass the ECC computations, not mutate data and OOB layout.
