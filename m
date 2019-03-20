Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 291F4C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 20:05:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D46721841
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 20:05:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C7fBUEon";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="JplPzbTJ";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="KHgXKJzR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D46721841
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ckhVnoVmOReqq9qVSy5M1OL7S8Osqh5lQtLw3acdCSk=; b=C7fBUEonlfkM0KIz+kpUOZHmZ
	sJDFRrFQRwfLPSVXqiL0KAgzKFEjjb4wScsRtXUI3r9Q+3W2GXMjWDAR+mFUW/jZ9Oj9C2GGdNUnp
	LWmy4lf6S7ljijNaYQV6Zp0iKuFntKLDQBr8lG8GKSrSFG7t7jrLHjbs7JzznIuxf4xVcvMcafIiQ
	Q+YtGFuKnTdiv2hKfrzk2sRMdU7LEB3UnqaNpztHxt4u8MPC//QG2YbHTwVYrQJFuCciJKqRtNCum
	atZ5aTfAhkND3kGzQweWYRKa//pkmMy0/bG6Ct/qGDvGCzM1boEfeK/GHdyAr/4XZmhQgLBm0nEXp
	e3YC9WPpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6hTB-0004dt-Mq; Wed, 20 Mar 2019 20:05:49 +0000
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6hT8-0004cf-G8
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 20:05:47 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 022B760F3F; Wed, 20 Mar 2019 20:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1553112346;
 bh=J4dZuMKJKUnbEpzsHHPpkPO3B4l+kubBHyMn5liynsc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=JplPzbTJWcwMnJUUwVU5dEM3d7u6ddwfQDbDRp+mALsnVjfuuM5eDVzt/m8/jbeCf
 tuwBIYptUo4N8AmscAJQrEaG7JWJCXRx4FRrlgVFzIrj85zg/tkU2oKiJUASoXuI2A
 nv0ie8K3Fb3vMXCBZiTp9VwwPA9Mibqy+WPSQCuw=
Received: from [10.79.162.149]
 (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: mojha@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E654C60F3C;
 Wed, 20 Mar 2019 20:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1553112345;
 bh=J4dZuMKJKUnbEpzsHHPpkPO3B4l+kubBHyMn5liynsc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KHgXKJzRF1got7rWIme0ritJPvmxHydiuRxPsvZaUcs2NlLvYJdETIPUestjYpNwz
 2NN74J2U9bnNJAa3yexXZvqHY4NuG1BQvyAx+6dSYAuVh7aDtOFdAwyAa2Qk8Mgohh
 fD1r60aVJWnDTd/L+PhrQ/fKMDeg2Wa63Yz2whns=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E654C60F3C
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=mojha@codeaurora.org
Subject: Re: [PATCH -next] ubifs: remove unused function __ubifs_shash_final
To: Yue Haibing <yuehaibing@huawei.com>, richard@nod.at, dedekind1@gmail.com, 
 adrian.hunter@intel.com
References: <20190320140955.11576-1-yuehaibing@huawei.com>
From: Mukesh Ojha <mojha@codeaurora.org>
Message-ID: <97289b81-ed73-002a-504d-2e82fad153e7@codeaurora.org>
Date: Thu, 21 Mar 2019 01:35:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190320140955.11576-1-yuehaibing@huawei.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_130546_560865_1E09E891 
X-CRM114-Status: GOOD (  14.50  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 3/20/2019 7:39 PM, Yue Haibing wrote:
> From: YueHaibing <yuehaibing@huawei.com>
>
> There is no callers in tree, and can be removed.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   fs/ubifs/auth.c | 18 ------------------
>   1 file changed, 18 deletions(-)
>
> diff --git a/fs/ubifs/auth.c b/fs/ubifs/auth.c
> index 5bf5fd0..2a40ccce 100644
> --- a/fs/ubifs/auth.c
> +++ b/fs/ubifs/auth.c
> @@ -147,24 +147,6 @@ struct shash_desc *__ubifs_hash_get_desc(const struct ubifs_info *c)
>   }
>   
>   /**
> - * __ubifs_shash_final - finalize shash
> - * @c: UBIFS file-system description object
> - * @desc: the descriptor
> - * @out: the output hash
> - *
> - * Simple wrapper around crypto_shash_final(), safe to be called with
> - * disabled authentication.
> - */
> -int __ubifs_shash_final(const struct ubifs_info *c, struct shash_desc *desc,
> -			u8 *out)
> -{
> -	if (ubifs_authenticated(c))
> -		return crypto_shash_final(desc, out);
> -
> -	return 0;
> -}
> -
> -/**
>    * ubifs_bad_hash - Report hash mismatches
>    * @c: UBIFS file-system description object
>    * @node: the node



Looks fine to be removed.

Acked-by: Mukesh Ojha <mojha@codeaurora.org>

-Mukesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
