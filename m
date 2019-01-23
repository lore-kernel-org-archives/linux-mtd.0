Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD66C282C2
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 20:54:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BC7F21872
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 20:54:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RV6sthn2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BC7F21872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DHWVS/gYb3XouUmAz+yLr5dxWpc6CYSu2AcVxjK+uk0=; b=RV6sthn25a548C
	251yFOTXgvev2TAuDFPJCqF2Q1kiDiQ9TKzVI7BjXned0vRdSebC/tVLTZ8w+ZTFE9HlWbaECOdBr
	wcdNjN5SJvDprSl1la9/CJFiXJdNGVhwbcjzHQoyTovEtULRA9u2f/QqrKhqLHVTQsCdswk5boDxX
	Wqmm6kYyp2Bwb6TWTFnsObqtv2JB36+7UNF//mfEy34CwTBp4ubKkPMj9aDQGN59P/OmSoG13mU1Y
	2mYuN0+9LQWKQQbkOSHPmflBKUSuMh/ZdSdyjCBVicfifUtteDZPC/t6I4H/bVqoMpOe6xzDTr9w1
	zAhqNyEd3Lb5L0oicymQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmPXu-0002qf-Gh; Wed, 23 Jan 2019 20:54:50 +0000
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmPXr-0002qK-3l
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 20:54:48 +0000
Received: from belgarion ([86.206.19.74]) by mwinf5d65 with ME
 id Twuk1z0091btlZA03wukSC; Wed, 23 Jan 2019 21:54:45 +0100
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Wed, 23 Jan 2019 21:54:45 +0100
X-ME-IP: 86.206.19.74
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH v3 -next] mtd: docg3: Fix a possible memory leak of
 mtd->name
References: <20190123092819.5020-1-yuehaibing@huawei.com>
X-URL: http://belgarath.falguerolles.org/
Date: Wed, 23 Jan 2019 21:54:44 +0100
In-Reply-To: <20190123092819.5020-1-yuehaibing@huawei.com> (YueHaibing's
 message of "Wed, 23 Jan 2019 17:28:19 +0800")
Message-ID: <87r2d3yu0b.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_125447_434765_F364B980 
X-CRM114-Status: GOOD (  13.97  )
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
Cc: bbrezillon@kernel.org, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

YueHaibing <yuehaibing@huawei.com> writes:

> In case DOC_CHIPID_G3, mtd->name is not freed in err handling path,
> which is alloced by kasprintf(). Fix this by using devm_kasprintf().
>
> Fixes: ae9d4934b2d7 ("mtd: docg3: add multiple floor support")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> v3: use devm_kasprintf
> ---
>  drivers/mtd/devices/docg3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
