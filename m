Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B75CC56201
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 07:44:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FF7620659
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 07:44:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N/UDnE/Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FF7620659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dHtBDKVeSpktU02JiWNd1Gn6dMSdKSE2tmRdHSF+DYo=; b=N/UDnE/ZH1y2HMwd5mgP6VkY5
	NVdEvUlYhVQ59IAwv7PrOa8lzhK0RWgMDdTpEt9UbWTj1tzzun6mU/sVWAWD9B5D+te/4AYh5HJ3t
	vyd0ayPDmi3WGuDMtC4nG8ZyJPg04n/8EOWc7AqinQFU0IJTxZ92S05ebwvPMa8yt6m0EKx3Yc9nV
	TlYaywDjvGNNqfscJaOv+vg18zosXdcoj4ZTd1kE6hyCol3iJAt37P4FTDib+i3xDn/lRn3a3szC4
	eU8Jnd8i1LCwsVRrDbDv/+iHdl/kLHYaRAlEl63o+92vzqiXTqoINidlNiO3ngiD83opSYFAIiQTC
	U+uSVQssA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khSzU-0005yn-Oi; Tue, 24 Nov 2020 07:43:56 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khSzR-0005xx-L2
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 07:43:54 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1khSzP-0008VX-5r; Tue, 24 Nov 2020 08:43:51 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1khSzO-0008M5-GP; Tue, 24 Nov 2020 08:43:50 +0100
Date: Tue, 24 Nov 2020 08:43:50 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Wang ShaoBo <bobo.shaobowang@huawei.com>
Subject: Re: [PATCH] bdi: Fix error return code in alloc_wbufs()
Message-ID: <20201124074350.GM24489@pengutronix.de>
References: <20201115082343.35645-1-bobo.shaobowang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201115082343.35645-1-bobo.shaobowang@huawei.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:42:29 up 278 days, 15:12, 76 users,  load average: 0.14, 0.16,
 0.16
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_024353_725862_5C55C3FB 
X-CRM114-Status: GOOD (  20.04  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 huawei.libin@huawei.com, cj.chengjian@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Nov 15, 2020 at 04:23:43PM +0800, Wang ShaoBo wrote:
> Fix to return PTR_ERR() error code from the error handling case instead
> fo 0 in function alloc_wbufs(), as done elsewhere in this function.
> 
> Fixes: 6a98bc4614de ("ubifs: Add authentication nodes to journal")
> Signed-off-by: Wang ShaoBo <bobo.shaobowang@huawei.com>
> ---
>  fs/ubifs/super.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Prefix for this patch should be "ubifs:" rather than "bdi:". With this:

Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

> 
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index cb3acfb7dd1f..dacbb999ae34 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -838,8 +838,10 @@ static int alloc_wbufs(struct ubifs_info *c)
>  		c->jheads[i].wbuf.jhead = i;
>  		c->jheads[i].grouped = 1;
>  		c->jheads[i].log_hash = ubifs_hash_get_desc(c);
> -		if (IS_ERR(c->jheads[i].log_hash))
> +		if (IS_ERR(c->jheads[i].log_hash)) {
> +			err = PTR_ERR(c->jheads[i].log_hash);
>  			goto out;
> +		}
>  	}
>  
>  	/*
> -- 
> 2.25.1
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
