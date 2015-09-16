Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zc5dI-0000vE-DD
 for linux-mtd@lists.infradead.org; Wed, 16 Sep 2015 05:51:53 +0000
Message-ID: <55F901E6.6010408@cn.fujitsu.com>
Date: Wed, 16 Sep 2015 13:45:10 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Sheng Yong <shengyong1@huawei.com>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] UBIFS: print verbose message when rescanning a corrupted
 node
References: <1442400499-22539-1-git-send-email-shengyong1@huawei.com>
In-Reply-To: <1442400499-22539-1-git-send-email-shengyong1@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/16/2015 06:48 PM, Sheng Yong wrote:
> This is a trivial fix of showing verbose message when leb-recovery detects
> a corrupted node, which is not the last one in the LEB. Rescan expects to
> show more detail of the corrupted node.
>
> Signed-off-by: Sheng Yong <shengyong1@huawei.com>

Looks good.

Reviewed-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>

> ---
>   fs/ubifs/recovery.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
> index 62903b6..e18085b 100644
> --- a/fs/ubifs/recovery.c
> +++ b/fs/ubifs/recovery.c
> @@ -805,7 +805,7 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
>   corrupted_rescan:
>   	/* Re-scan the corrupted data with verbose messages */
>   	ubifs_err(c, "corruption %d", ret);
> -	ubifs_scan_a_node(c, buf, len, lnum, offs, 1);
> +	ubifs_scan_a_node(c, buf, len, lnum, offs, 0);
>   corrupted:
>   	ubifs_scanned_corruption(c, lnum, offs, buf);
>   	err = -EUCLEAN;
>
