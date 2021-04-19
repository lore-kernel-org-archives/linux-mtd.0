Return-Path: <SRS0=PDg9=JQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 415E5C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 13:57:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F49061245
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 13:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F49061245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UTYgAkAOZq5gHwY8TV/hVJfd5GMEztVN4AlTSn97/QY=; b=ng86kJYbuqDgBpUI6kRl+1Wi+
	pe0e8qBRVuKcb5zTTeZTBldLJHPspUpc8/An05XY69iI8m1YISLSt0PGgAcM66QSya8Du0DcAqxzJ
	FJy2QTH/XHkL043LrJNyKADYBZGSS6FnQQAWTWFzCOmyUib8PnHHx5guu+vZIqM1dYzDEZRsI7D8W
	ICrSSjGLe29hL0sZDoZYTgQ+LiO79yAOnkFQ0bKJjWkITFRQPUSk8OmmWFqGNemIfMDbldrHH1p/z
	Q+hNq29XVJyNxIRwfQicT0gxj0EsDlUExAjVi7CdywqS+PgdmDI++zee4AbbPkFWijsyqV/TJd5zH
	aElq4uDjQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYUOC-00A2DA-1R; Mon, 19 Apr 2021 13:56:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYUOA-00A2Co-JR
 for linux-mtd@desiato.infradead.org; Mon, 19 Apr 2021 13:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=vXN05HdKH+CfYXQjw1hBV/l9ST8FqhZ/fq92/EQkEmY=; b=ZTank+MMRo3Mv7fF2/b2yOjQG+
 GKBFse9LaHfaXv7oxic6asy0a+NssnAeaqy0mkAHqfAbP6vJ9TVC+aO3RlBRb47BlJpFsZ68dYA/B
 sVkFj6Uplpu0w74WBJZuzLNzFtG9uhsaSCyAwdHX06Pz5CMS1CWBCBkaxS2OKWQP/2YvXWZpszy3F
 4RraTkaCoQm1OMe5TYgf6UhtwiuXbJJPbuWCl+zExaypGPHwo3f3ParLLlxByqCnv8hL8HFHH1Rum
 l9NFT7WpHVv8iD143vnq8u+azN77fNHz7veZ6QpTcKXqr5JPvTGf/6Gqp/CFL71VR/nJgZMGx69k2
 cQO2IJ7w==;
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYUO4-00BQKA-OB
 for linux-mtd@lists.infradead.org; Mon, 19 Apr 2021 13:56:33 +0000
Received: by mail-lf1-x12e.google.com with SMTP id g8so56133520lfv.12
 for <linux-mtd@lists.infradead.org>; Mon, 19 Apr 2021 06:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vXN05HdKH+CfYXQjw1hBV/l9ST8FqhZ/fq92/EQkEmY=;
 b=uerxcs/7pQ+ScTaxiLnTieS04lH2sPSMF4Up2IFof6snBG9dmTdsFOSwpOVwL82njB
 L5G0zKA+dmOmqtl+XdWPrvjvSLdhchSyc5SqzNFhFCaVL2UAONlrAYuCdw/MYhFKNW+Y
 nJmzqh7FvbhiUIMZJblpD6vetIyInwob/4w192YSuyuSoFJeoTM9WPM22v06kfzER7ZO
 sA77ulPdFbichkxCuLaXmFEjIAIFTeSR5Cjv/vzdHiTnNSQYEvFnBEJfV7RbPrE7LP2F
 eWHY3iY9ezkAO2cvSpPR54rA5t0O2D006CqkT4wlOxytwrsEutzK9Pb5scT8pesR3iU6
 x2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vXN05HdKH+CfYXQjw1hBV/l9ST8FqhZ/fq92/EQkEmY=;
 b=WcqkkTtzRkue42H7IcMB1p25xldtChaCWFjUNTCRtxwRVa4KYbHcL4oGzODMZXlGhg
 MygTlR91X5D7jjbFX8r1svptiT0ne7pCvEfJnpe7LcPPZafQvWrlZ5DOP/fAgaeFu0Zr
 /JL7cxoSnYae5vvbgM/l6Y9nluWanIVxO2h75Yqusg9++dedYQCqbHu2rXbhpF1exC//
 0jNkLfkF85B3/XmTuKWip2KhALSnbsTWi12oaHpn6XlyJSq9IZNz9WILZ9tcgFJF+ewl
 C/wVLiCvvq9gNuCIO9rhKoHxdfJzu1kgMJAuthvAqIeBjfO65fsFkgOlryIAPcW0bnvo
 4tXg==
X-Gm-Message-State: AOAM532XdzT6on7gyH/gZd+e06Xi77yH5vhMs8XtPuod28g/wQGOGlQz
 PrWhE9XIhFNjkhx/NNGwKgaJfTomNm6ZCyoMoDBVQkjq
X-Google-Smtp-Source: ABdhPJxyPj0RvHSaLibNfvYpHZkzmySBRDrM8IYaMiJWANN0QjUqIvyTSFkwtXRkX3VbUW8NGkA0H4OipVK7QPocOB8=
X-Received: by 2002:a19:50d:: with SMTP id 13mr11890163lff.443.1618840586715; 
 Mon, 19 Apr 2021 06:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5DufVR=+EzCa1-MPUc+ZefZVTXb5Kgu3Wxms7cxw9GmGg@mail.gmail.com>
 <20210419083738.07a28a20@xps13>
 <CAOMZO5CpzojN1U9HfSA8Vi8uEzrn=0cqo4tMd_qi52F0Q6kObg@mail.gmail.com>
 <20210419135833.3ee22f58@xps13>
 <CAOMZO5CS03F9dDeaUus4WRBv9z_1svx7BqHM=b6PkxeUthGdzQ@mail.gmail.com>
 <CAOMZO5C921yS9mVkTpTjwxapjKhr_FgSddYcYXA62LBVPoK=9g@mail.gmail.com>
 <20210419154056.505e5471@xps13>
In-Reply-To: <20210419154056.505e5471@xps13>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 19 Apr 2021 10:56:15 -0300
Message-ID: <CAOMZO5AcfRm=3t-aVTVMaTFVo08Zz27R62XjPMyKu=p=W_Usng@mail.gmail.com>
Subject: Re: imx27: No space left to write bad block table
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>,
 Sascha Hauer <kernel@pengutronix.de>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_065628_807147_56429889 
X-CRM114-Status: GOOD (  14.87  )
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

Hi Miquel,

On Mon, Apr 19, 2021 at 10:40 AM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:

> I am pretty sure now the commit I pointed earlier today is the root
> cause (but I don't know why, yet). Somehow it skips the bad block table
> which is more or less declared like a bad block from a 'low level'
> point of view (so that the user cannot erase/overwrite it). Here,
> the kernel does not find the valid BBT. It then creates a new couple of
> BBT. But doing so at the next boot, the recently created BBT won't be
> detected anymore... until there are no more free blocks reserved for
> that and that's where the probe fails.
>
> So yes, the NAND controller driver probes correctly with next-20210329
> but in fact the real bad block table is not found and this is the root
> cause.

Ok, good. I will submit a revert then.

Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
