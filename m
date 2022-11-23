Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A232C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 07:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/9oOAhJowSuR4ALfJTHwduXPR1a0mgEraFcAXGNfM0I=; b=D5caWiSwmxkdkc
	oxhh5AXnYvGVbohkDTe+weL82dWu0g/nfcGpQC2Lp9fgQ8G9oD1SlHxScfkTAAgub3/rOmjAExGiI
	8dM0NdCvdc7nov016o1dp7ZEhFNoFZ2A1m3DrbkVmXXHrB5HZlKvKZoxPloJzCCaDi7rWMhuhfkhd
	57DnOFk12PxR3GLq5ARoSfSI2+aSGRHQVAz6ZRBT+a2xDW50Mpv+XMlBdj2xgurNR3CHE2ApMBWYd
	7g8AkcpjaVQ4M4W6j2NS6hd1ujiUJ/GXfoEatAQctB3wYdBO96n1WmG0Vdw3yX9ngxr2L0Z3jyC6n
	PtCzzuu49bt7Jxdv2djA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxkB9-00FAaq-V4; Wed, 23 Nov 2022 07:28:19 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxkB7-00FAUr-0a
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2022 07:28:18 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1oxkAv-0000f7-Fn; Wed, 23 Nov 2022 08:28:05 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1oxkAs-00011W-Lt; Wed, 23 Nov 2022 08:28:02 +0100
Date: Wed, 23 Nov 2022 08:28:02 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Li Hua <hucool.lihua@huawei.com>
Cc: richard@nod.at, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, weiyongjun1@huawei.com,
	yusongping@huawei.com
Subject: Re: [PATCH v2] ubifs: Fix build errors as symbol undefined
Message-ID: <20221123072802.GC29978@pengutronix.de>
References: <20221121111847.71648-1-hucool.lihua@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221121111847.71648-1-hucool.lihua@huawei.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_232817_078562_738DF920 
X-CRM114-Status: GOOD (  23.14  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Nov 21, 2022 at 07:18:47PM +0800, Li Hua wrote:
> With CONFIG_UBIFS_FS_AUTHENTICATION not set, the compiler can assume that
> ubifs_node_check_hash() is never true and drops the call to ubifs_bad_hash().
> Is CONFIG_CC_OPTIMIZE_FOR_SIZE enabled this optimization does not happen anymore.
> 
> So When CONFIG_UBIFS_FS and CONFIG_CC_OPTIMIZE_FOR_SIZE is enabled but
> CONFIG_UBIFS_FS_AUTHENTICATION is not set, the build errors is as followd:
>     ERROR: modpost: "ubifs_bad_hash" [fs/ubifs/ubifs.ko] undefined!
> 
> Fix it by add no-op ubifs_bad_hash() for the CONFIG_UBIFS_FS_AUTHENTICATION=n case.
> 
> Fixes: 16a26b20d2af ("ubifs: authentication: Add hashes to index nodes")
> Signed-off-by: Li Hua <hucool.lihua@huawei.com>

Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

> ---
>  fs/ubifs/ubifs.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> index 478bbbb5382f..2f1f31581094 100644
> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -1623,8 +1623,13 @@ static inline int ubifs_check_hmac(const struct ubifs_info *c,
>  	return crypto_memneq(expected, got, c->hmac_desc_len);
>  }
>  
> +#ifdef CONFIG_UBIFS_FS_AUTHENTICATION
>  void ubifs_bad_hash(const struct ubifs_info *c, const void *node,
>  		    const u8 *hash, int lnum, int offs);
> +#else
> +static inline void ubifs_bad_hash(const struct ubifs_info *c, const void *node,
> +				  const u8 *hash, int lnum, int offs) {};
> +#endif
>  
>  int __ubifs_node_check_hash(const struct ubifs_info *c, const void *buf,
>  			  const u8 *expected);
> -- 
> 2.17.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
