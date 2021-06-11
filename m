Return-Path: <SRS0=BpRd=LF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C33BC48BE0
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 11:59:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2645161407
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 11:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2645161407
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YKsk6hE6BW1orWr8u/mko7opogpeDu31V9rS/XW9IaE=; b=epT+lSEjbomEZb
	R/qoCawbwyeFiMAKkUEhCDOEHRgQR93Z1DIGAdRKKKT5fifvsNGqkSw/N1QAGqhlamF8nAAVWIh+l
	USYDuDSC61742idJ7CIZCcMV6kCWmBr5/+yh4tVL7st05xayhdPWAD+i8qs3HV3ZEXLNj0A7vaTl3
	fhTcodfxMCPYtRduoGp3pVYRMrML6/NDAGLgQB4mbvzcG31bR4UorZV+gFh6zeNT3xmsfHr1wnKpC
	yN78SznhCPTDhZ7aUOPEEoaIjJ/PwyOWiUmWL8tE3XpWIkqiSAC5QJKEHIihjmZTGH6sej/BDSfP4
	nagCyTboPCizuG0Dpsmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrfne-00590G-Rb; Fri, 11 Jun 2021 11:58:10 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrfnc-0058zE-Lt
 for linux-mtd@lists.infradead.org; Fri, 11 Jun 2021 11:58:10 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15BBw25b054437;
 Fri, 11 Jun 2021 06:58:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1623412682;
 bh=lz3eUFLWjc5wmVQBahFCbI1CAfEZvq0RXjoWx/xNOTo=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=SnTyOxVGtWgam3hw9DxhnyXNuAiMbqT8AKhmfu9poFX/ktkFleo31vrp2wV8yaAjH
 nkX3VDguyCpwIvpP2oMGMfRDYTMeb5CnMbEEqYQG34xIADpcXH4enKuywtqHX1bWRz
 5tdQ8FRSe4IAkySs1S0l04Rh33BYX1aGnDcpLagE=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15BBw2Tv121572
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Jun 2021 06:58:02 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 11
 Jun 2021 06:58:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 11 Jun 2021 06:58:01 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15BBvvLS039508;
 Fri, 11 Jun 2021 06:57:58 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v6 0/4] mtd: spi-nor: otp: 4 byte mode fix and erase
 support
Date: Fri, 11 Jun 2021 17:27:51 +0530
Message-ID: <162341252747.7630.10412857264567592221.b4-ty@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210607112744.21587-1-michael@walle.cc>
References: <20210607112744.21587-1-michael@walle.cc>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_045808_782497_AD0FEB28 
X-CRM114-Status: UNSURE (   9.21  )
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

On Mon, 7 Jun 2021 13:27:40 +0200, Michael Walle wrote:
> This series is the follow up on the single patch
> mtd: spi-nor: implement OTP erase for Winbond and similar flashes
> 
> Pratyush Yadav discovered a likely problem with bigger flashes, the address
> to access the security registers is either 3 or 4 byte (at least for
> winbond flashes).
> 
> [...]

Applied to spi-nor/next, thanks!
[1/4] mtd: spi-nor: otp: fix access to security registers in 4 byte mode
      https://git.kernel.org/mtd/c/b97b1a7698
[2/4] mtd: spi-nor: otp: use more consistent wording
      https://git.kernel.org/mtd/c/d5b813e484
[3/4] mtd: spi-nor: otp: return -EROFS if region is read-only
      https://git.kernel.org/mtd/c/388161ca45
[4/4] mtd: spi-nor: otp: implement erase for Winbond and similar flashes
      https://git.kernel.org/mtd/c/c6ec3e1e3a

--
Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
