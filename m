Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OrUHU-0000Ez-1C
	for linux-mtd@lists.infradead.org; Fri, 03 Sep 2010 11:18:06 +0000
Received: from dflp53.itg.ti.com ([128.247.5.6])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id o83BI28l018448
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Fri, 3 Sep 2010 06:18:02 -0500
From: "Sudhakar Rajashekhara" <sudhakar.raj@ti.com>
To: "'Wolfram Sang'" <w.sang@pengutronix.de>, <linux-mtd@lists.infradead.org>
References: <1283382898.2209.62.camel@brekeke>
	<1283510137-23573-1-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1283510137-23573-1-git-send-email-w.sang@pengutronix.de>
Subject: RE: [PATCH] nand/davinci: relax a timeout for ECC-initialization
Date: Fri, 3 Sep 2010 16:42:22 +0530
Message-ID: <030d01cb4b58$e18cafd0$a4a60f70$@raj@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Cc: 'Artem Bityutskiy' <Artem.Bityutskiy@nokia.com>,
	davinci-linux-open-source@linux.davincidsp.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Wolfram Sang,

On Fri, Sep 03, 2010 at 16:05:37, Wolfram Sang wrote:
> Sudhakar found out that 100us are enough. Sadly, his updated patch was
> overlooked and an older version still using 100ms was merged. Fix this.
> 
> Reference: http://patchwork.ozlabs.org/patch/59180/
> 
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> Cc: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
> Cc: Sneha Narnakaje <nsnehaprabha@ti.com>
> Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> ---
> 
> Artem, if you pick up this one, too, then we have what Sudhakar sent as
> v3 of his original patch. Except for some minor rewording in the comment.
> 
> Sudhakar, I hope it is okay if I send this patch now. I just want to have
> the confusion about the different versions gone.

I was tied up for the past few days, so couldn't work on this patch. Thanks
for taking this up. Can you modify the comment also to match my patch and
re-submit this again?

Thanks,
Sudhakar
