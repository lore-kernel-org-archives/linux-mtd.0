Received: from moutng.kundenserver.de ([212.227.126.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JP0bI-0006R4-O4
	for linux-mtd@lists.infradead.org; Tue, 12 Feb 2008 19:15:36 +0000
From: Stefan Roese <sr@denx.de>
To: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH] mtd: Fix physmap_of to not exit upon unsuccessful
	partition scan
Date: Tue, 12 Feb 2008 20:15:08 +0100
References: <1202832181-1783-1-git-send-email-sr@denx.de>
	<47B1E02A.3090709@freescale.com>
In-Reply-To: <47B1E02A.3090709@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200802122015.08811.sr@denx.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 12 February 2008, Scott Wood wrote:
> Stefan Roese wrote:
> > The patch 9a310d21196f38f6ad0ad146057548653e495c09 ("[MTD] Factor out OF
> > partition support from the NOR driver.") introduced an problem. Now the
> > physmap_of driver returns with error upon the first unsuccessful
> > partition scan (parse_mtd_partitions()). This is not wanted, since even
> > when the RedBoot/cmdlinepart partition scan is unsuccessful, the other
> > scan's (of_mtd_parse_partitions(), parse_obsolete_partitions()) should be
> > done nevertheless.
> >
> > This patch fixes this problem.
> >
> > Signed-off-by: Stefan Roese <sr@denx.de>
> > ---
> >
> > Scott, could you please take a look at this patch and add you ACK if you
> > think it is ok?
>
> I was under the impression -- and looking at the code seems to back that
> up -- that parse_mtd_partitions() returns zero if the scan was
> unsuccessful due to the lack of a partition table, and negative only if
> there's a real error.
>
> Under what conditions are you actually seeing this fail?

When CONFIG_MTD_REDBOOT_PARTS is not defined for example it returns with -22 
(EINVAL).

Best regards,
Stefan
