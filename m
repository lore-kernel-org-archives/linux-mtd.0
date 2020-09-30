Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374EBC4727F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 06:58:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EEE42075F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 06:58:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XY0Z1kBp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EEE42075F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xux1rppbEVBuSDb1HtBZtHb0s36QjszGbTotX8UwI4Q=; b=XY0Z1kBpzKe/UOPqgasJckL7+
	yGSlWnGhkChs8yZ2Cr9JIM84ooIqXJoptApE5RROQT8ziwSOAvCehrU9AdVIqhqmhb3hvevHv/CZj
	USCy7r5fDSBLLY87XS6NLJLBB+aS0CidG/xeyZgd59Lbpx3Ey3iKdMc3UILKzr0e1HoN+NZF0R5/W
	yejTpLG9FzTlaxdEon8+0Ay8d+R8/xRkx4kwjZBGV8sc8wbxg1krr7m2GIBa31Pyw5nwGeORPj7jt
	YNsO5FT5sDr2ICo6mba5c6gT8wL9D9USnyNjW+hbU1FY2pmehkO6kQC4f35VwpRqS4zWOflRKzXTc
	8XYiJ7L9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNW4H-0006J5-FN; Wed, 30 Sep 2020 06:58:25 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNW4F-0006IV-AO
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 06:58:24 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kNW46-000517-97; Wed, 30 Sep 2020 08:58:14 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kNW45-0006KD-2t; Wed, 30 Sep 2020 08:58:13 +0200
Date: Wed, 30 Sep 2020 08:58:13 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Subject: Re: [PATCH 2/3] ubifs: Don't parse authentication mount options in
 remount process
Message-ID: <20200930065813.GC11648@pengutronix.de>
References: <20200929124531.941873-1-chengzhihao1@huawei.com>
 <20200929124531.941873-2-chengzhihao1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929124531.941873-2-chengzhihao1@huawei.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:57:38 up 223 days, 14:28, 154 users,  load average: 0.04, 0.15,
 0.26
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_025823_394541_B5D0F292 
X-CRM114-Status: GOOD (  20.16  )
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

On Tue, Sep 29, 2020 at 08:45:30PM +0800, Zhihao Cheng wrote:
> There is no need to dump authentication options while remounting,
> because authentication initialization can only be doing once in
> the first mount process. Dumping authentication mount options in
> remount process may cause memory leak if UBIFS has already been
> mounted with old authentication mount options.
> 
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
> Cc: <stable@vger.kernel.org>  # 4.20+
> Fixes: d8a22773a12c6d7 ("ubifs: Enable authentication support")

Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

> ---
>  fs/ubifs/super.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 6f85cd618766..9796f5df2f7f 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -1110,14 +1110,20 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
>  			break;
>  		}
>  		case Opt_auth_key:
> -			c->auth_key_name = kstrdup(args[0].from, GFP_KERNEL);
> -			if (!c->auth_key_name)
> -				return -ENOMEM;
> +			if (!is_remount) {
> +				c->auth_key_name = kstrdup(args[0].from,
> +								GFP_KERNEL);
> +				if (!c->auth_key_name)
> +					return -ENOMEM;
> +			}
>  			break;
>  		case Opt_auth_hash_name:
> -			c->auth_hash_name = kstrdup(args[0].from, GFP_KERNEL);
> -			if (!c->auth_hash_name)
> -				return -ENOMEM;
> +			if (!is_remount) {
> +				c->auth_hash_name = kstrdup(args[0].from,
> +								GFP_KERNEL);
> +				if (!c->auth_hash_name)
> +					return -ENOMEM;
> +			}
>  			break;
>  		case Opt_ignore:
>  			break;
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
