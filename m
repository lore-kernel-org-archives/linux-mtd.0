Received: from moutng.kundenserver.de ([212.227.126.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JP11t-0004IO-Pg
	for linux-mtd@lists.infradead.org; Tue, 12 Feb 2008 19:43:05 +0000
From: Stefan Roese <sr@denx.de>
To: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH] mtd: Fix physmap_of to not exit upon unsuccessful
	partition scan
Date: Tue, 12 Feb 2008 20:37:27 +0100
References: <1202832181-1783-1-git-send-email-sr@denx.de>
	<200802122015.08811.sr@denx.de> <47B1F30E.4000509@freescale.com>
In-Reply-To: <47B1F30E.4000509@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200802122037.27864.sr@denx.de>
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
> >> Under what conditions are you actually seeing this fail?
> >
> > When CONFIG_MTD_REDBOOT_PARTS is not defined for example it returns with
> > -22 (EINVAL).
>
> Ah, I see -- it seems the cmdline partition code behaves differently
> than the redboot code.
>
> Your patch changes it to treat zero as success, however -- which breaks
> some other cases.  The test should be "err <= 0", which is what
> parse_mtd_partiitions() itself uses in its loop.

OK, I'll fixup another version of this patch tomorrow.

Thanks.

Best regards,
Stefan
