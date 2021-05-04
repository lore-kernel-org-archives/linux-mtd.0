Return-Path: <SRS0=rMW0=J7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C60C433B4
	for <linux-mtd@archiver.kernel.org>; Tue,  4 May 2021 07:28:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 602F26139A
	for <linux-mtd@archiver.kernel.org>; Tue,  4 May 2021 07:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 602F26139A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZYx6Hf51ndNPQ9BUoS/bhqsQeKX/f2nfktyPfMFpGHY=; b=JIMfu2l8uMqn/VacLuyz2vFdb
	accvc4/A7KcCClaWZOatpVEo/7aykiofe+Kl+hrx8v1Mdyra0NtkBqAIkrRWQrUMieFfKLrAHtY8f
	wyd1pyihKf5tqv3yomlOD0W/cRpMt3V8K9F/1cIdTKrOjCxfi2L14J8VIKobQEEP1vN9QggKEuJqd
	gM7wpcIoAOaKjKfQtob8R3kmIeaNAOA9ij5I12w8kSF/04P9rUgck5U29m0bEDdlmCOsHultofd7f
	XBB0YAl1Tq1ZIYuK8pjtzz3iSutfEl1OH4kincls4d+s+oioW3hrfIvY/LOFUDwozFGf8k+IvjfC3
	MBH/zqkWg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldpSZ-00FcNO-TD; Tue, 04 May 2021 07:27:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldpSW-00FcNH-P1
 for linux-mtd@desiato.infradead.org; Tue, 04 May 2021 07:27:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=eru3RqNbOBFAr0aUvS8kZEC79BoVl89sNoNjI1EN4qk=; b=BaXSVUKzeow+DKGZAgtqo4h+PS
 jww0V0nWkRwKqbTUWe1mYgHnoX6cYGLKleiYjoL8SsZB/0gsZDWVCigQmNILxQ7NctxGQzUhQMj4q
 yHYZ/KCFV2IotNXmAHrddz01kEQB45M6fSsvI8IeYdys5nTGw36UvjjXRKHrPpBMmDxFPjeKWZQ/A
 OZw+jXdRO9dfCALpT6Eo9Ep5KJYDHOCtGxNiluzrNhYQnjGDbx5+3TyA0hQzcWno4V/hSagNEWts/
 qyqNgHJ+rlfFzjh6mghiMjX/kzuzT90VBH1GaqrdhbV/aSvdOLJ9Rvy01kN+WQs1SI/xo8m4ljfjT
 inc82PWg==;
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldpST-003lMp-Tr
 for linux-mtd@lists.infradead.org; Tue, 04 May 2021 07:27:07 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1447QoKq104263;
 Tue, 4 May 2021 02:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1620113210;
 bh=eru3RqNbOBFAr0aUvS8kZEC79BoVl89sNoNjI1EN4qk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=oNnDMCbnU3qkAaYwe4xdAJHAEW6AZYCP4lLRowOfEXYItXzj6zWkclBrYRwNk7+MW
 5PDI9fXbMB2XB6uo/GKpdt7v4SS5n6tlZdD9Gd+SB+kl2jRMyBhyRjtqsYRvqaJ4Af
 /BiluQes64uEL8qTtYH00lITRNTN6C+v5Eoio7zA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1447QoQ8108124
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 4 May 2021 02:26:50 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 4 May
 2021 02:26:50 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 4 May 2021 02:26:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1447QnT9122975;
 Tue, 4 May 2021 02:26:50 -0500
Date: Tue, 4 May 2021 12:56:49 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Alexander Williams <awill@google.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Heiko Thiery <heiko.thiery@gmail.com>
Subject: Re: [PATCH v4 2/2] mtd: spi-nor: add initial sysfs support
Message-ID: <20210504072647.cfcka5jcvnmlnvcc@ti.com>
References: <20210503155651.30889-1-michael@walle.cc>
 <20210503155651.30889-3-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210503155651.30889-3-michael@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_002706_071379_83254B57 
X-CRM114-Status: GOOD (  11.88  )
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

On 03/05/21 05:56PM, Michael Walle wrote:
> Add support to show the manufacturer, the partname and JEDEC identifier
> as well as to dump the SFDP table. Not all flashes list their SFDP table
> contents in their datasheet. So having that is useful. It might also be
> helpful in bug reports from users.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Acked-by: Pratyush Yadav <p.yadav@ti.com>

> ---
> Pratyush, Heiko, I've dropped your Acked and Tested-by because there
> were some changes.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
