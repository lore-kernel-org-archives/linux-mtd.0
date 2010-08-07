Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OhiB3-00055I-DZ
	for linux-mtd@lists.infradead.org; Sat, 07 Aug 2010 12:07:02 +0000
Message-ID: <4C5D4C5D.3090204@nokia.com>
Date: Sat, 07 Aug 2010 15:06:53 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 5/7] UBIFS: do not look up junk nodes
References: <1281169577-18664-1-git-send-email-dedekind1@gmail.com>
	<1281169577-18664-6-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1281169577-18664-6-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> 
> When moving nodes, do not try to look up truncation and padding nodes in TNC,
> because they do not exist there. This bug was most probably harmless, because
> the TNC look-up probably failed for all padding and truncation nodes, but it

The scan does not return padding nodes.

> could also succeed and lead to various "interesting" errors.

Why would it succeed?

> 
> This patch fixes the issue.
> 
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> ---
>  fs/ubifs/gc.c |   23 ++++++++++++++++++++---
>  1 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
> index fbb9272..f68e58d 100644
> --- a/fs/ubifs/gc.c
> +++ b/fs/ubifs/gc.c
> @@ -227,9 +227,26 @@ static int sort_nodes(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
>  	list_for_each_entry_safe(snod, tmp, &sleb->nodes, list) {
>  		int err;
>  
> -		ubifs_assert(snod->type != UBIFS_IDX_NODE);
> -		ubifs_assert(snod->type != UBIFS_REF_NODE);
> -		ubifs_assert(snod->type != UBIFS_CS_NODE);
> +		ubifs_assert(snod->type == UBIFS_INO_NODE  ||
> +			     snod->type == UBIFS_DATA_NODE ||
> +			     snod->type == UBIFS_DENT_NODE ||
> +			     snod->type == UBIFS_XENT_NODE ||
> +			     snod->type == UBIFS_TRUN_NODE ||
> +			     snod->type == UBIFS_PAD_NODE);
> +		ubifs_assert(key_type(c, &snod->key) == UBIFS_DATA_KEY ||
> +			     key_type(c, &snod->key) == UBIFS_INO_KEY  ||
> +			     key_type(c, &snod->key) == UBIFS_DENT_KEY ||
> +			     key_type(c, &snod->key) == UBIFS_XENT_KEY);
> +
> +		if (snod->type != UBIFS_INO_NODE  &&
> +		    snod->type != UBIFS_DATA_NODE &&
> +		    snod->type != UBIFS_DENT_NODE &&
> +		    snod->type != UBIFS_XENT_NODE) {
> +			/* Truncation or padding node, zap it */
> +			list_del(&snod->list);
> +			kfree(snod);
> +			continue;
> +		}
>  
>  		err = ubifs_tnc_has_node(c, &snod->key, 0, sleb->lnum,
>  					 snod->offs, 0);
