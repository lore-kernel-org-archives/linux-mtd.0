Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JOzWS-00075z-Bu
	for linux-mtd@lists.infradead.org; Tue, 12 Feb 2008 18:06:30 +0000
Message-ID: <47B1E02A.3090709@freescale.com>
Date: Tue, 12 Feb 2008 12:06:34 -0600
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] mtd: Fix physmap_of to not exit upon unsuccessful
	partition scan
References: <1202832181-1783-1-git-send-email-sr@denx.de>
In-Reply-To: <1202832181-1783-1-git-send-email-sr@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Stefan Roese wrote:
> The patch 9a310d21196f38f6ad0ad146057548653e495c09 ("[MTD] Factor out OF
> partition support from the NOR driver.") introduced an problem. Now the
> physmap_of driver returns with error upon the first unsuccessful
> partition scan (parse_mtd_partitions()). This is not wanted, since even
> when the RedBoot/cmdlinepart partition scan is unsuccessful, the other
> scan's (of_mtd_parse_partitions(), parse_obsolete_partitions()) should be
> done nevertheless.
> 
> This patch fixes this problem.
> 
> Signed-off-by: Stefan Roese <sr@denx.de>
> ---
> 
> Scott, could you please take a look at this patch and add you ACK if you
> think it is ok?

I was under the impression -- and looking at the code seems to back that 
up -- that parse_mtd_partitions() returns zero if the scan was 
unsuccessful due to the lack of a partition table, and negative only if 
there's a real error.

Under what conditions are you actually seeing this fail?

-Scott
