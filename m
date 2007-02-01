From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Adrian Hunter'" <ext-adrian.hunter@nokia.com>,
	<linux-mtd@lists.infradead.org>
References: <45BA1A9D.60301@nokia.com> <45BA21E6.60301@nokia.com>
	<000101c7436b$14370420$c7a3580a@swcenter.sec.samsung.co.kr>
	<45BDACBA.2080503@nokia.com> <45BE1480.1060506@nokia.com>
	<003701c74435$0b1f61f0$c7a3580a@swcenter.sec.samsung.co.kr>
	<45C0B8D4.2000807@nokia.com>
Subject: RE: [PATCH] [MTD] OneNAND: Add support
	for	auto-placementofout-of-banddata
Date: Thu, 1 Feb 2007 11:26:03 +0900
Message-ID: <005601c745a8$55787b50$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <45C0B8D4.2000807@nokia.com>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'll push it.

But with JFFS2 patch, there's one bug (see below)

I'l fix it and commit it.

Thank you,
Kyungmin Park

> +static int onenand_fill_auto_oob(struct mtd_info *mtd, 
> u_char *oob_buf,
> +				  const u_char *buf, int 
> column, int thislen) {
> +	struct onenand_chip *this = mtd->priv;
> +	struct nand_oobfree *free;
> +	int writecol = column;
> +	int writeend = column + thislen;
> +	int lastgap = 0;
> +
> +	for (free = this->ecclayout->oobfree; free->length; ++free) {
> +		if (writecol >= lastgap)
> +			writecol += free->offset - lastgap;
> +		if (writeend >= lastgap)
> +			writeend += free->offset - lastgap;
> +		lastgap = free->offset + free->length;
> +	}

> +	writeend = mtd->oobsize;

We don't re-assign the 'writeend'. It cause the block is not clean. Since
JFFS2 send only 12 bytes but onenand writes until oobsize, actually 20
bytes with zero.
So this statement will be removed.

> +	for (free = this->ecclayout->oobfree; free->length; ++free) {
> +		int free_end = free->offset + free->length;
> +		if (free->offset < writeend && free_end > writecol) {
> +			int st = max_t(int,free->offset,writecol);
> +			int ed = min_t(int,free_end,writeend);
> +			int n = ed - st;
> +			memcpy(oob_buf + st, buf, n);
> +			buf += n;
> +		}
> +	}
> +	return 0;

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org 
> [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of 
> Adrian Hunter
> Sent: Thursday, February 01, 2007 12:42 AM
> To: linux-mtd@lists.infradead.org
> Subject: Re: [PATCH] [MTD] OneNAND: Add support for 
> auto-placementofout-of-banddata
> 
> Just noticed another bug.  Here is better version.
> 
> 
> >From f93c480e9ccd6a72abbc3fed1ab71dc4244b0229 Mon Sep 17 
> 00:00:00 2001
> From: Adrian Hunter <ext-adrian.hunter@nokia.com>
> Date: Wed, 31 Jan 2007 17:19:28 +0200
> Subject: [MTD] OneNAND: Add support for auto-placement of 
> out-of-band data
> 
> Enable the use of oob operation mode MTD_OOB_AUTO with OneNAND.
> Note that MTD_OOB_RAW is still not supported.
> 
> Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
> ---
