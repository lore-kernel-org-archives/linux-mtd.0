Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934F3C2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 07:46:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0559920659
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 07:46:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DXPo6ITa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0559920659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=36SRML/CH99nwkphP5hinH/m3OqwNfV6XrplNIfa93E=; b=DXPo6ITafP3ub9h/iyvu4L3He
	1nTENmexyf6GwukJWqOG7cFqOaDcc42mGMs+StES7Gx6jnRlYmgPAedgQRfAy2Jr3GKGweZr3l9ip
	bJLzp6iHp9RhlN/cLSYpjZikz5Y92Hc7skgN0xI1317NoX4vy18NYgBIPcag3qWd5dAimSFx4ATno
	i5gNIwc6K+0VMRM5fTVw9SDITZFCHNj6INJ3h9jt99KesHadCX24TX16IAgl40YJcnx7MpdP3v35W
	xsEDvJVIHQ8BoaCzO66ZwWu66hbdt+5ZJ+eVXDx10Ea2zRUgP7aqJc3n3dCxqswSwr2xd4JjhMY5c
	LRxRLXZnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khT1k-0006KA-1s; Tue, 24 Nov 2020 07:46:16 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khT1h-0006JA-3B
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 07:46:14 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1khT1f-0000Lh-NQ; Tue, 24 Nov 2020 08:46:11 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1khT1b-0008Vg-VT; Tue, 24 Nov 2020 08:46:07 +0100
Date: Tue, 24 Nov 2020 08:46:07 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Wang ShaoBo <bobo.shaobowang@huawei.com>
Subject: Re: [PATCH] ubifs: Fix error return code in
 ubifs_init_authentication()
Message-ID: <20201124074607.GN24489@pengutronix.de>
References: <20201124063320.1799-1-bobo.shaobowang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124063320.1799-1-bobo.shaobowang@huawei.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:45:36 up 278 days, 15:16, 77 users,  load average: 0.53, 0.23,
 0.18
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_024613_176746_913BBD96 
X-CRM114-Status: GOOD (  19.31  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: cj.chengjian@huawei.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, huawei.libin@huawei.com,
 herbert@gondor.apana.org.au
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 02:33:20PM +0800, Wang ShaoBo wrote:
> Fix to return PTR_ERR() error code from the error handling case where
> ubifs_hash_get_desc() failed instead of 0 in ubifs_init_authentication(),
> as done elsewhere in this function.
> 
> Fixes: 49525e5eecca5 ("ubifs: Add helper functions for authentication support")
> Signed-off-by: Wang ShaoBo <bobo.shaobowang@huawei.com>
> ---
>  fs/ubifs/auth.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

> 
> diff --git a/fs/ubifs/auth.c b/fs/ubifs/auth.c
> index b93b3cd10bfd..8c50de693e1d 100644
> --- a/fs/ubifs/auth.c
> +++ b/fs/ubifs/auth.c
> @@ -338,8 +338,10 @@ int ubifs_init_authentication(struct ubifs_info *c)
>  	c->authenticated = true;
>  
>  	c->log_hash = ubifs_hash_get_desc(c);
> -	if (IS_ERR(c->log_hash))
> +	if (IS_ERR(c->log_hash)) {
> +		err = PTR_ERR(c->log_hash);
>  		goto out_free_hmac;
> +	}
>  
>  	err = 0;
>  
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
