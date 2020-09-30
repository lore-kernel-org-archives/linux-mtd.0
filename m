Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EECDC2D0A8
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 07:10:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF80720738
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 07:10:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0qnft7Mu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF80720738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CArdxni5E8iS1PzeKY4I1CErz8C+5/AA9BqIZgqPgiw=; b=0qnft7Muc+C1wfjvxDDz0D7hq
	VqPs8uuDlG+jkm4Hqf+q+J6jHr1PBq5ReBrdETymjyXPk8iusltGNNUgG8oGvsvvGNTMIAx1VXJ9q
	DqOYaWXi2TaRCQLGVky8saENGnXK7h0nVis1ZxelKuqMojC2ewMbD6uJSe4NV4FjdPPykM42CE/Ae
	Oi2dTXWAuRJqeaJaWHtgD8fH2qOxg21yZq1OxA5nT5OMsYYRrkL48suMrSuDm4ksMZNuK+OPl1+7k
	p44Psi+93rUv7yjlqQt7vY5KWvaOiWytqZ5RM0RPimn/tCTcWQh1MuIioZU+trxh9bcEWgHX0JUtX
	AVBCKQEzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNWFg-0007eL-MU; Wed, 30 Sep 2020 07:10:12 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNWFd-0007ct-LX
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 07:10:10 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kNWFT-0006AC-Pv; Wed, 30 Sep 2020 09:09:59 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kNWFQ-0007gN-8r; Wed, 30 Sep 2020 09:09:56 +0200
Date: Wed, 30 Sep 2020 09:09:56 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Subject: Re: [PATCH 1/3] ubifs: Fix a memleak after dumping authentication
 mount options
Message-ID: <20200930070956.GD11648@pengutronix.de>
References: <20200929124531.941873-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929124531.941873-1-chengzhihao1@huawei.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:00:32 up 223 days, 14:31, 154 users,  load average: 0.56, 0.23,
 0.27
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_031009_720099_4B78F622 
X-CRM114-Status: GOOD (  20.13  )
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

On Tue, Sep 29, 2020 at 08:45:29PM +0800, Zhihao Cheng wrote:
> Fix a memory leak after dumping authentication mount options in error
> handling branch.
> 
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
> Cc: <stable@vger.kernel.org>  # 4.20+
> Fixes: d8a22773a12c6d7 ("ubifs: Enable authentication support")

Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

I wonder if patches like in this series should really go to stable. There's
always the risk of regressions, and there's not much to win in fixing
such low probability, low frequency memory holes.

Sascha

> ---
>  fs/ubifs/super.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index a2420c900275..6f85cd618766 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -1141,6 +1141,18 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
>  	return 0;
>  }
>  
> +/*
> + * ubifs_release_options - release mount parameters which have been dumped.
> + * @c: UBIFS file-system description object
> + */
> +static void ubifs_release_options(struct ubifs_info *c)
> +{
> +	kfree(c->auth_key_name);
> +	c->auth_key_name = NULL;
> +	kfree(c->auth_hash_name);
> +	c->auth_hash_name = NULL;
> +}
> +
>  /**
>   * destroy_journal - destroy journal data structures.
>   * @c: UBIFS file-system description object
> @@ -1650,8 +1662,7 @@ static void ubifs_umount(struct ubifs_info *c)
>  	ubifs_lpt_free(c, 0);
>  	ubifs_exit_authentication(c);
>  
> -	kfree(c->auth_key_name);
> -	kfree(c->auth_hash_name);
> +	ubifs_release_options(c);
>  	kfree(c->cbuf);
>  	kfree(c->rcvrd_mst_node);
>  	kfree(c->mst_node);
> @@ -2219,6 +2230,7 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
>  out_unlock:
>  	mutex_unlock(&c->umount_mutex);
>  out_close:
> +	ubifs_release_options(c);
>  	ubi_close_volume(c->ubi);
>  out:
>  	return err;
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
