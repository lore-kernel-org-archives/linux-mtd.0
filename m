Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF78FC4707F
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 14:44:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87B536101B
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 14:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87B536101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sijluD3PCF+Gv1VD1P2r1IbL3uNxkXb0h4ibfmHg7eE=; b=mgi2q973MlVZxL
	oDhOFUZ6Zznqo///nlPb+OKaZA6AkE7a+rfFspUqjZTVojGnFuT1EQRNb34IUBNJ9k3iTxEYkCyNZ
	8FW+knUssSy7oW0Qn+yQXninW4aCsYOAvG8QzXNyGIpLe+78I8qaResFwGzzRFs7uacprWYbeLY94
	WK0M6vX8KawpRBKca9XtMTSDPchK4lRhABBOW+sNPqXc2NshHSlcah+Gw4n8acCn6/eH/PgiK53zK
	5nSeV3ZawtAGYoVnNqrI5QL5w/K1N8fy2JXNAyVLN3eHbi9b9UUHHeHEChJjoWXSEieicNpaLR/6m
	tISMdVJOv0ElqYRTwETA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmHE0-006sPF-Rk; Thu, 27 May 2021 14:43:05 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmGhP-006b3R-2A
 for linux-mtd@lists.infradead.org; Thu, 27 May 2021 14:09:24 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14RE9KwM026569;
 Thu, 27 May 2021 09:09:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1622124560;
 bh=jo7vp1r1D15eHxjv5T1Z+K8MMAR5BnkxInbZmeLGKDo=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=A/sty2KX6ahpEpXRGG4Y2KGTNzuVqmTPIUh8toCrp8lRgyee31egifGNKSuse4AYy
 eGcwnhQo4S6qVuNny9VTEcJqtOlh4JoNo6jI2GBP6lTdtKaTVnb/rvGacpOvT3/rf0
 goPkzLyDlwGFbtRxndGr9hi9oRceRrDO+SaNNQ5s=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14RE9Ksv054737
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 27 May 2021 09:09:20 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 27
 May 2021 09:09:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 27 May 2021 09:09:19 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14RE9FnS102343;
 Thu, 27 May 2021 09:09:16 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger
 <richard@nod.at>, Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: spi-nor: otp: fix kerneldoc typos
Date: Thu, 27 May 2021 19:39:05 +0530
Message-ID: <162212417122.9400.5343449761391565485.b4-ty@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505200017.17499-1-michael@walle.cc>
References: <20210505200017.17499-1-michael@walle.cc>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_070923_226436_AE365B5B 
X-CRM114-Status: UNSURE (   6.61  )
X-CRM114-Notice: Please train this message.
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

On Wed, 5 May 2021 22:00:17 +0200, Michael Walle wrote:
> Use the correct argument names in the kerneldoc.

Applied to spi-nor/next, thanks!
[1/1] mtd: spi-nor: otp: fix kerneldoc typos
      https://git.kernel.org/mtd/c/a6e2cd4dd2

--
Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
