Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E333C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 20:19:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32C662184D
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 20:19:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oiwop7H6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32C662184D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SVzwFNnFL50rPTKcRat1Tw3SdXmeWeZ03+kr55GImsU=; b=oiwop7H6qk5m9A
	NtkPm/iuy3t59MDqknA5CzKdSvrj5QpYvzePdV+zzRTqRVTMHOYceJJNSB4LZFEGE/yj1rudUkami
	kWDiXMNA7cB+0XB83DjFff6eabodAxW6ZaEvB8m+q4CtPxa24Nj+TsAEY+mD7xxJA2Ktf7zs96iJk
	QJK6DaW/j/9BQ4A7cpkUXCBsFPNbjnPGrvfRhH2CUrZU2gsMerBFy8/LtbIDLkLDuAhv+BuPuCty0
	rg+VZ3MdT0Z9fBcjZE8DZy3uJh/d8vVwBIHHD7k1SdxJDTVusQZLimcH7Wm4mqGZcOQ7KiVxisHs0
	R7Yztl8BX+3YCr6K6hFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6hgj-0001Rb-2T; Wed, 20 Mar 2019 20:19:49 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6hgg-0001P5-MR
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 20:19:47 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C0177609185A;
 Wed, 20 Mar 2019 21:19:36 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 5LPTQF1JokWG; Wed, 20 Mar 2019 21:19:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4883860ED8A1;
 Wed, 20 Mar 2019 21:19:36 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id S1oWfxpoei8A; Wed, 20 Mar 2019 21:19:36 +0100 (CET)
Received: from blindfold.localnet (213-47-184-186.cable.dynamic.surfer.at
 [213.47.184.186])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id C11B8609185A;
 Wed, 20 Mar 2019 21:19:35 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Mukesh Ojha <mojha@codeaurora.org>
Subject: Re: [PATCH -next] ubifs: remove unused function __ubifs_shash_final
Date: Wed, 20 Mar 2019 21:18:58 +0100
Message-ID: <2691086.gDEv9kBeKS@blindfold>
In-Reply-To: <97289b81-ed73-002a-504d-2e82fad153e7@codeaurora.org>
References: <20190320140955.11576-1-yuehaibing@huawei.com>
 <97289b81-ed73-002a-504d-2e82fad153e7@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_131946_874945_0E55CB90 
X-CRM114-Status: GOOD (  13.24  )
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
Cc: linux-kernel@vger.kernel.org, Yue Haibing <yuehaibing@huawei.com>,
 adrian.hunter@intel.com, linux-mtd@lists.infradead.org, dedekind1@gmail.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Mittwoch, 20. M=E4rz 2019, 21:05:37 CET schrieb Mukesh Ojha:
> =

> On 3/20/2019 7:39 PM, Yue Haibing wrote:
> > From: YueHaibing <yuehaibing@huawei.com>
> >
> > There is no callers in tree, and can be removed.
> >
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > ---
> >   fs/ubifs/auth.c | 18 ------------------
> >   1 file changed, 18 deletions(-)
> >
> > diff --git a/fs/ubifs/auth.c b/fs/ubifs/auth.c
> > index 5bf5fd0..2a40ccce 100644
> > --- a/fs/ubifs/auth.c
> > +++ b/fs/ubifs/auth.c
> > @@ -147,24 +147,6 @@ struct shash_desc *__ubifs_hash_get_desc(const str=
uct ubifs_info *c)
> >   }
> >   =

> >   /**
> > - * __ubifs_shash_final - finalize shash
> > - * @c: UBIFS file-system description object
> > - * @desc: the descriptor
> > - * @out: the output hash
> > - *
> > - * Simple wrapper around crypto_shash_final(), safe to be called with
> > - * disabled authentication.
> > - */
> > -int __ubifs_shash_final(const struct ubifs_info *c, struct shash_desc =
*desc,
> > -			u8 *out)
> > -{
> > -	if (ubifs_authenticated(c))
> > -		return crypto_shash_final(desc, out);
> > -
> > -	return 0;
> > -}
> > -
> > -/**
> >    * ubifs_bad_hash - Report hash mismatches
> >    * @c: UBIFS file-system description object
> >    * @node: the node
> =

> =

> =

> Looks fine to be removed.
> =

> Acked-by: Mukesh Ojha <mojha@codeaurora.org>

I guess you mean Reviewed-by?

Thanks,
//richard




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
