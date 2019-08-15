Return-Path: <SRS0=q3Mz=WL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB355C433FF
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Aug 2019 11:18:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81D17206C2
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Aug 2019 11:18:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OcxN70u6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81D17206C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhSfOMLZXjQ2LmQ8t8IpRKZvUlKm/UMrFI5J2qk0Wk4=; b=OcxN70u6FTMpsh
	2pcEoLN/MaazZeNm/2ff7guQlMFl715B1YY72mI1UiOIymwCCOT39zuMZCMi1NlUmi2AD3fb8zLXi
	bCkf/R3wmKKwPKr5vca2F+pZ0DkZsWbZwZLjfR5rOkENeeAYJezto0fPSmkYm6C55MUhvnu3lfwll
	cocANT0PvOr8gtlvU0jeS8jZ5fgJzTU0pGstk6EOC3YbOYc1nEed7m3sWBS14GAWrYPHfA3GnXlxb
	PG/KSrtUXhOvbdnMIaIR7Vbbe0l/wTlgQO0o27CvLAJ2sLTvsoFt51mDT1i37w6YXYSOVVqrzUNpe
	JQCR129Iphk/0X479Ytw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyDld-0000jH-3G; Thu, 15 Aug 2019 11:18:05 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyDla-0000iB-86
 for linux-mtd@lists.infradead.org; Thu, 15 Aug 2019 11:18:03 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0583FAFD4;
 Thu, 15 Aug 2019 11:18:01 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id BBFD41E4200; Thu, 15 Aug 2019 13:18:00 +0200 (CEST)
Date: Thu, 15 Aug 2019 13:18:00 +0200
From: Jan Kara <jack@suse.cz>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 02/11] quota: Only module_put the format when existing
Message-ID: <20190815111800.GD14313@quack2.suse.cz>
References: <20190814121834.13983-1-s.hauer@pengutronix.de>
 <20190814121834.13983-3-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814121834.13983-3-s.hauer@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190815_041802_427074_76CA3080 
X-CRM114-Status: GOOD (  15.04  )
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
Cc: linux-fsdevel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed 14-08-19 14:18:25, Sascha Hauer wrote:
> For filesystems which do not have a quota_format_type such as upcoming
> UBIFS quota fmt may be NULL. Only put the format when it's non NULL.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

But you do have quota format in the end. So is this patch needed?

								Honza

> ---
>  fs/quota/dquot.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/quota/dquot.c b/fs/quota/dquot.c
> index 3cb836351c22..b043468e53f2 100644
> --- a/fs/quota/dquot.c
> +++ b/fs/quota/dquot.c
> @@ -218,6 +218,9 @@ static struct quota_format_type *find_quota_format(int id)
>  
>  static void put_quota_format(struct quota_format_type *fmt)
>  {
> +	if (!fmt)
> +		return;
> +
>  	module_put(fmt->qf_owner);
>  }
>  
> -- 
> 2.20.1
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
