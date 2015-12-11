Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a7Jkz-0004yT-5X
 for linux-mtd@lists.infradead.org; Fri, 11 Dec 2015 09:12:57 +0000
Subject: Re: [PATCH 1/1] fs:ubifs:recovery:fixup UBIFS cannot recover master
 node issue
To: =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?=
 <beanhuo@micron.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Brian Norris <computersforpeace@gmail.com>
References: <A765B125120D1346A63912DDE6D8B6310BF53F90@NTXXIAMBX02.xacn.micron.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <566A9378.4070900@nod.at>
Date: Fri, 11 Dec 2015 10:12:24 +0100
MIME-Version: 1.0
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF53F90@NTXXIAMBX02.xacn.micron.com>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bean,

Am 11.12.2015 um 09:26 schrieb Bean Huo »ô±ó±ó (beanhuo):
> For MLC NAND, paired page issue is now a common known issue.
> This patch is just for master node cannot be recovered while
> there will two pages be damaged in one single master node block.
> As for this patch, if there are more than one page data in
> master node block being damaged, and as long as exist one
> uncorrupted master node block, master node will be recovered.

So, this patch is part if a larger patch series to make UBIFS MLC aware?

> This patch has been tested on Micron MLC NAND MT29F32G08CBADAWP.
> Issue descripted:
> http://lists.infradead.org/pipermail/linux-mtd/2015-November/063016.html
> 
> Signed-off-by: Bean Huo <beanhuo@micron.com>
> ---
>  fs/ubifs/recovery.c | 75 ++++++++++++++++++++++++++++++++++-------------------
>  1 file changed, 49 insertions(+), 26 deletions(-)
> 
> diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
> index 695fc71..e3154e6 100644
> --- a/fs/ubifs/recovery.c
> +++ b/fs/ubifs/recovery.c
> @@ -128,7 +128,7 @@ static int get_master_node(const struct ubifs_info *c, int lnum, void **pbuf,
>  	while (offs + UBIFS_MST_NODE_SZ <= c->leb_size) {
>  		struct ubifs_ch *ch = buf;
>  
> -		if (le32_to_cpu(ch->magic) != UBIFS_NODE_MAGIC)
> +		if (le32_to_cpu(ch->magic) == 0xFFFFFFFF)

The purpose of this check was to trigger upon garbage data (including 0xFF).
Now you only check for 0xFF bytes.

>  			break;
>  		offs += sz;
>  		buf  += sz;
> @@ -137,37 +137,40 @@ static int get_master_node(const struct ubifs_info *c, int lnum, void **pbuf,
>  	/* See if there was a valid master node before that */
>  	if (offs) {
>  		int ret;
> -
> +retry:
>  		offs -= sz;
>  		buf  -= sz;
>  		len  += sz;
>  		ret = ubifs_scan_a_node(c, buf, len, lnum, offs, 1);
> -		if (ret != SCANNED_A_NODE && offs) {
> -			/* Could have been corruption so check one place back */
> -			offs -= sz;
> -			buf  -= sz;
> -			len  += sz;
> -			ret = ubifs_scan_a_node(c, buf, len, lnum, offs, 1);
> -			if (ret != SCANNED_A_NODE)
> -				/*
> -				 * We accept only one area of corruption because
> -				 * we are assuming that it was caused while
> -				 * trying to write a master node.
> -				 */
> -				goto out_err;
> -		}
> -		if (ret == SCANNED_A_NODE) {
> -			struct ubifs_ch *ch = buf;
> -
> -			if (ch->node_type != UBIFS_MST_NODE)
> +		if (ret != SCANNED_A_NODE) {
> +			/* Could have been corruption so check more
> +			 * place back. We accept two areas of corruption
> +			 * because we are assuming that for MLC NAND,it
> +			 * was caused while trying to write a lower
> +			 * page, upper page being damaged.
> +			 */
> +			if (offs > 0)
> +				goto retry;
> +			else
>  				goto out_err;
> +			}
> +			if (ret == SCANNED_A_NODE) {
> +				struct ubifs_ch *ch = buf;
> +
> +				if (ch->node_type != UBIFS_MST_NODE) {
> +					if (offs)
> +						goto retry;
> +					else
> +						goto out_err;
> +				}

Here you kill another sanity check.

>  			dbg_rcvry("found a master node at %d:%d", lnum, offs);
>  			*mst = buf;
>  			offs += sz;
>  			buf  += sz;
>  			len  -= sz;
> -		}
> +			}
>  	}
> +

Useless line break. :)

>  	/* Check for corruption */
>  	if (offs < c->leb_size) {
>  		if (!is_empty(buf, min_t(int, len, sz))) {
> @@ -178,10 +181,6 @@ static int get_master_node(const struct ubifs_info *c, int lnum, void **pbuf,
>  		buf  += sz;
>  		len  -= sz;
>  	}
> -	/* Check remaining empty space */
> -	if (offs < c->leb_size)
> -		if (!is_empty(buf, len))
> -			goto out_err;

Another check gone. :(

>  	*pbuf = sbuf;
>  	return 0;
>  
> @@ -236,7 +235,7 @@ out:
>  int ubifs_recover_master_node(struct ubifs_info *c)
>  {
>  	void *buf1 = NULL, *buf2 = NULL, *cor1 = NULL, *cor2 = NULL;
> -	struct ubifs_mst_node *mst1 = NULL, *mst2 = NULL, *mst;
> +	struct ubifs_mst_node *mst1 = NULL, *mst2 = NULL, *mst = NULL;
>  	const int sz = c->mst_node_alsz;
>  	int err, offs1, offs2;
>  
> @@ -280,6 +279,28 @@ int ubifs_recover_master_node(struct ubifs_info *c)
>  				if (cor1)
>  					goto out_err;
>  				mst = mst1;
> +			} else if (offs2 + sz != offs1) {
> +				if (le32_to_cpu(mst1->ch.sqnum) >
> +					le32_to_cpu(mst2->ch.sqnum)) {
> +					/*
> +					 * 1st LEB written, occurred power
> +					 * loss while writing 2nd LEB.
> +					 */
> +					if (cor1)
> +						goto out_err;
> +					mst = mst1;
> +				} else if (le32_to_cpu(mst1->ch.sqnum) <
> +					le32_to_cpu(mst2->ch.sqnum)) {
> +				/* While writing 1st LEB, occurred power loss */
> +					if (!cor2) {
> +						if (mst2->flags &
> +						   cpu_to_le32(UBIFS_MST_DIRTY))
> +							mst = mst2;
> +						else
> +							goto out_err;
> +					} else
> +					goto out_err;
> +				}
>  			} else
>  				goto out_err;
>  		} else {
> @@ -305,6 +326,8 @@ int ubifs_recover_master_node(struct ubifs_info *c)
>  		mst = mst2;
>  	}
>  
> +	if (mst == NULL)
> +		goto out_err;
>  	ubifs_msg(c, "recovered master node from LEB %d",
>  		  (mst == mst1 ? UBIFS_MST_LNUM : UBIFS_MST_LNUM + 1));

That said, please explain your patch in more detail. i.e. Why do you remove these checks?
Why is this correct to do so?
To me it looks like an ad-hoc solution to make UBIFS not
abort on your MLC by removing well-established checks.
I agree that UBIFS's master node checks are very picky but for SLC they are correct and make a lot of sense.
Adding MLC support must not hurt UBIFS's SLC robustness.

Thanks,
//richard
