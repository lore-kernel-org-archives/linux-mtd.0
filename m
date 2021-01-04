Return-Path: <SRS0=Ie18=GH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E31DCC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 22:17:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E75922519
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 22:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E75922519
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zf1QcjZyvSt++6a+gXsMmVTFwKBl2hH9N5V5+k5UMQs=; b=qUb0EaPh5oEVEBjHfMsynFnvc
	nHBURjUBekcMg56QKwkCXWJc9GQjkZFiNaM/m/Q44LVLgjj1ENEfyT0dDje4lni+ur2DmCdUryYCW
	0wqx9cVUQYXIrZoHfNiKOPTCJcqJLWfd3y9SUjusmqLJJ1R+qGcZBLHil1zEEgS2xTFW0RglXeZas
	MNNAwEb6PL/xT9PCTrh2N9cJjGet+s2FUyHn4/QFEVUXQf9FmfuVD5hkfwL3TVQ4Kj3igzFLjLXRR
	WMT7N+7R7v/0iKnwEkZxi8hyXYBMNQrtDETF3srfNfZrDgVWT4nd3sEcj87aPaNLErTVofytXUWHQ
	zTY/JUqOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwY98-0002hY-9L; Mon, 04 Jan 2021 22:16:14 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwY95-0002gT-P9
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2021 22:16:12 +0000
Received: by mail-qt1-x82d.google.com with SMTP id 2so19630584qtt.10
 for <linux-mtd@lists.infradead.org>; Mon, 04 Jan 2021 14:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=G+1MVqQV4yHFgTMLgTDws1RowImJf6XP6VoJRtb5S+E=;
 b=A8AMn+1UUhCRiytO8dsAJ2EE22k8/KqGTTOp23oPFa5n7oJLACVw0A/Kzht12QIDiW
 PZj2L7RZkSmERf2UvNkn+QSrjUwO92g6Np5r26/pKKZ8KXU2kpY4HjPaeD4Ud8dWsHTl
 Bf6zl/9PzFP9C1vBFFZvxOIwkbQu99UwY9Fsv70XhOhfkpAqP6s5QP/yUB4jxSSh+xm3
 h1titWMzqdHcF1ULmEJv8Lev0gaHah5lAOFcG9uoUO920QrDmZYOM3/CokGnPnA5bShr
 5TjLPEIpxeYuIh3d2sHVZo4JmIAuCcxW7nRASgBT5D7rxdF062ewVsKDf1P0uoPpCJLk
 e5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G+1MVqQV4yHFgTMLgTDws1RowImJf6XP6VoJRtb5S+E=;
 b=YGH9D4S+BwjDSLPx3Ciz+IZF2vgSJjm5WzzlZW+Lq4L2Q25irgJNGJbgGfFHrQluVW
 QgI7v1IaqTiHRxzXBkJEauMrf9/KOgzCSMDN5t37C9ttwl+0N91Zt4D6cChSHfk6ohT+
 ML7RNuGPM7QJBOirU/jRD7WMJyU3oNV7/F5ON2ircWwg1UrWAiGU/4W6dB8bFHlTlfem
 TZGUHdBE81mnugCPpMlw7JPxEUyLAjjwJPLh8auv/qkr4Qg+33V57epRHCQ+2Dy36yYO
 TO2ZWjZb3uW+0zxH3Lh2DvKzwsfDp4rRZ6cilxw3ifSVeFuyfvlNnLL3nK6aPSQKPWHo
 ZYSQ==
X-Gm-Message-State: AOAM533xq0jxmuOKBlk5sfTb68lsJM/DJB5I2M4yJcTLFpee4pVbTOEI
 qrQoST/2OwWXHUyWff1J5vc=
X-Google-Smtp-Source: ABdhPJyJ/EHlu4TgUEE4Q0VJAMJNWZRECaTm1kQJaWbzP5MMGBqG7/o70hv5UM86qz0za2h9WdbALQ==
X-Received: by 2002:ac8:6651:: with SMTP id j17mr74509403qtp.176.1609798569734; 
 Mon, 04 Jan 2021 14:16:09 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id f134sm37674597qke.23.2021.01.04.14.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 14:16:09 -0800 (PST)
Date: Mon, 4 Jan 2021 15:16:07 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: trix@redhat.com
Subject: Re: [PATCH] jffs2: fix use after free in jffs2_sum_write_data()
Message-ID: <20210104221607.GA1985645@ubuntu-m3-large-x86>
References: <20201230145604.1586486-1-trix@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201230145604.1586486-1-trix@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_171611_840967_1B22EF00 
X-CRM114-Status: GOOD (  24.35  )
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
Cc: richard@nod.at, ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Dec 30, 2020 at 06:56:04AM -0800, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> clang static analysis reports this problem
> 
> fs/jffs2/summary.c:794:31: warning: Use of memory after it is freed
>                 c->summary->sum_list_head = temp->u.next;
>                                             ^~~~~~~~~~~~
> 
> In jffs2_sum_write_data(), in a loop summary data is handles a node at
> a time.  When it has written out the node it is removed the summary list,
> and the node is deleted.  In the corner case when a
> JFFS2_FEATURE_RWCOMPAT_COPY is seen, a call is made to
> jffs2_sum_disable_collecting().  jffs2_sum_disable_collecting() deletes
> the whole list which conflicts with the loop's deleting the list by parts.
> 
> To preserve the old behavior of stopping the write midway, bail out of
> the loop after disabling summary collection.
> 
> Fixes: 6171586a7ae5 ("[JFFS2] Correct handling of JFFS2_FEATURE_RWCOMPAT_COPY nodes.")
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  fs/jffs2/summary.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
> index be7c8a6a5748..4fe64519870f 100644
> --- a/fs/jffs2/summary.c
> +++ b/fs/jffs2/summary.c
> @@ -783,6 +783,8 @@ static int jffs2_sum_write_data(struct jffs2_sb_info *c, struct jffs2_eraseblock
>  					dbg_summary("Writing unknown RWCOMPAT_COPY node type %x\n",
>  						    je16_to_cpu(temp->u.nodetype));
>  					jffs2_sum_disable_collecting(c->summary);
> +					/* The above call removes the list, nothing more to do */
> +					goto bail_rwcompat;
>  				} else {
>  					BUG();	/* unknown node in summary information */
>  				}
> @@ -794,6 +796,7 @@ static int jffs2_sum_write_data(struct jffs2_sb_info *c, struct jffs2_eraseblock
>  
>  		c->summary->sum_num--;
>  	}
> + bail_rwcompat:
>  
>  	jffs2_sum_reset_collected(c->summary);
>  
> -- 
> 2.27.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
