Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918A9C4727C
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 06:45:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 118962076A
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 06:45:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I7kO+NbY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 118962076A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8Fmf62dPZqQD5GJxKSjimGv8vb0DVYDuxmKb2aLsoJ4=; b=I7kO+NbYoGbOHpDJtqqJZu6ch
	QgNB8jlBuT4YHOPLwg6rPb1/njUCdoCR7fgYH3SCOL6ffIt1fsQt+QHpkTo5V1wPaijxWhHro5Qo8
	1wJ4H8j53ZqD48YNFjw+FGmepUJ4FsmXbwF/Qxf4BX8LqAaWz2rifXQ5TfT1qhe8DvYC7K4o1wuhJ
	4mmBs/v1x3pNAftNVtz9irlrHN586GxPuTV0vMmHfyMfGh7iTXITo4Ynz2HjXRFwlQdQkF6T56XQi
	XjH9xxOviqngmWQtKBwOj6UDcw3myZyKlkbdHKRQKaZ7ytvOvIKg7rnBmz8GxtKbRwGeFOCZeg/V3
	rltRSGIqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNVqw-0003Px-Hf; Wed, 30 Sep 2020 06:44:38 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNVqt-0003P7-Mq
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 06:44:36 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kNVqi-0003W7-C2; Wed, 30 Sep 2020 08:44:24 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kNVqg-0005fd-0G; Wed, 30 Sep 2020 08:44:22 +0200
Date: Wed, 30 Sep 2020 08:44:21 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Subject: Re: [PATCH 3/3] ubifs: mount_ubifs: Release authentication resource
 in error handling path
Message-ID: <20200930064421.GB11648@pengutronix.de>
References: <20200929124531.941873-1-chengzhihao1@huawei.com>
 <20200929124531.941873-3-chengzhihao1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929124531.941873-3-chengzhihao1@huawei.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:43:53 up 223 days, 14:14, 154 users,  load average: 0.20, 0.47,
 0.38
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_024435_756186_0FC32F15 
X-CRM114-Status: GOOD (  18.93  )
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
 yi.zhang@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Sep 29, 2020 at 08:45:31PM +0800, Zhihao Cheng wrote:
> Release the authentication related resource in some error handling
> branches in mount_ubifs().
> 
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
> Cc: <stable@vger.kernel.org>  # 4.20+
> Fixes: d8a22773a12c6d7 ("ubifs: Enable authentication support")

Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

> ---
>  fs/ubifs/super.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 9796f5df2f7f..732218ef6656 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -1331,7 +1331,7 @@ static int mount_ubifs(struct ubifs_info *c)
>  
>  	err = ubifs_read_superblock(c);
>  	if (err)
> -		goto out_free;
> +		goto out_auth;
>  
>  	c->probing = 0;
>  
> @@ -1343,18 +1343,18 @@ static int mount_ubifs(struct ubifs_info *c)
>  		ubifs_err(c, "'compressor \"%s\" is not compiled in",
>  			  ubifs_compr_name(c, c->default_compr));
>  		err = -ENOTSUPP;
> -		goto out_free;
> +		goto out_auth;
>  	}
>  
>  	err = init_constants_sb(c);
>  	if (err)
> -		goto out_free;
> +		goto out_auth;
>  
>  	sz = ALIGN(c->max_idx_node_sz, c->min_io_size) * 2;
>  	c->cbuf = kmalloc(sz, GFP_NOFS);
>  	if (!c->cbuf) {
>  		err = -ENOMEM;
> -		goto out_free;
> +		goto out_auth;
>  	}
>  
>  	err = alloc_wbufs(c);
> @@ -1629,6 +1629,8 @@ static int mount_ubifs(struct ubifs_info *c)
>  	free_wbufs(c);
>  out_cbuf:
>  	kfree(c->cbuf);
> +out_auth:
> +	ubifs_exit_authentication(c);
>  out_free:
>  	kfree(c->write_reserve_buf);
>  	kfree(c->bu.buf);
> -- 
> 2.25.4
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
