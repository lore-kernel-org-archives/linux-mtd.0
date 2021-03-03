Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E51EC433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 15:18:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 848C064E7C
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 15:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 848C064E7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8rYqVh8nQZ+XI9tQPOUCVvdMoVSlmdLpPezGN6bx1Wg=; b=bBaBPbGHeLkigCrB6HRuK5z3f
	lbEGJyFrwWPPPHoRPE6WedR7Z2ZExK2b9wmryCvE0X4k6/uvfJgS/0yET6vyWB+nn8a1Vxq3SrO4Z
	WTo/W9q/aB9fkTklr/QBFnrSxIyUB2RF1zNIQUXm07u9PfU5ltT8kW8mjAL86o2cxHjaO15udAIgV
	Amv43YC8cClpeGelwDmmac0NqZ3X3KH7gH3r5jKf9RBE/70N9n0PM5ckCXCTvXS58LHyL8Ef4un+W
	yrd+X6EEud5MxezKr8p8Dj/FyQhtNlctV2Nr9l6tvL4ZVb7qv8QhF0IrTE9l51EQAnAH0m4Ex4Yfs
	8VLOo/vxg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHTFM-005Lpj-2c; Wed, 03 Mar 2021 15:17:09 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSM4-0056Ut-QG
 for linux-mtd@lists.infradead.org; Wed, 03 Mar 2021 14:20:03 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5C106240007;
 Wed,  3 Mar 2021 14:19:56 +0000 (UTC)
Date: Wed, 3 Mar 2021 15:19:55 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Baruch Siach <baruch@tkos.co.il>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] mtd: parsers: qcom: incompatible with spi-nor 4k sectors
Message-ID: <20210303151955.7af6e017@xps13>
In-Reply-To: <71e3fe832d35bd34a7da87146ba7d52f89278665.1614780732.git.baruch@tkos.co.il>
References: <71e3fe832d35bd34a7da87146ba7d52f89278665.1614780732.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQmFydWNoLAoKQmFydWNoIFNpYWNoIDxiYXJ1Y2hAdGtvcy5jby5pbD4gd3JvdGUgb24gV2Vk
LCAgMyBNYXIgMjAyMSAxNjoxMjoxMgorMDIwMDoKCj4gUGFydGl0aW9uIHNpemUgYW5kIG9mZnNl
dCB2YWx1ZSBhcmUgaW4gYmxvY2sgc2l6ZSB1bml0cywgd2hpY2ggaXMgdGhlCj4gc2FtZSBhcyAn
ZXJhc2VzaXplJy4gQnV0IHdoZW4gNEsgc2VjdG9ycyBhcmUgZW5hYmxlZCBlcmFzZXNpemUgaXMg
c2V0IHRvCj4gNEsuIEJhaWwgb3V0IGluIHRoYXQgY2FzZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBC
YXJ1Y2ggU2lhY2ggPGJhcnVjaEB0a29zLmNvLmlsPgoKQ291bGQgeW91IGFkZCBhIEZpeGVzIHRh
Zz8KCkxHVE0gb3RoZXJ3aXNlLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
