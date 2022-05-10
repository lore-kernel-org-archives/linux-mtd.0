Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146F7C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 10 May 2022 11:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=11YcbvidWO5f5OehT4/qWMIteoRTHRZhgnSmtwIG0z4=; b=yy7c+hnKJCOIaT
	dwqFmTq02jihVDwNWIsUASoLedaP8Sel1FGclMV6Ps95zgnhaCWCnq7IFfl1jrkk+6NvT6ZEya/2f
	bKGsyLR/qLP8dQJk40jlyJZCH5KTidIPs3Htfb2yDuol1qyW/8ZRj3EgHpX8R8eJk6aqePf+aeh20
	91S4cfadCwXYMgHCrooo5AWg9Mkf+pBKdbfhJvvmKMWiqJ1UtGyPs5Vv/W5L/h6WROAMHMn8Cueea
	R4UNIDdxrltC+/s3nkbSIwFLUunirJVaNpB5md9zX30aHBeueKbYTdNuYUqikivX5KqvKN3dn2KK+
	s02W7zWOpLyp+SatQYzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noNth-001UhL-B2; Tue, 10 May 2022 11:19:21 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noNtb-001UdV-5q
 for linux-mtd@lists.infradead.org; Tue, 10 May 2022 11:19:16 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24ABJBo1125790;
 Tue, 10 May 2022 06:19:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1652181551;
 bh=OeAyXVccjY3hm+MWAfdIaWBN7g5ZIOZUI4gJYrjNDbg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=pyu8URTAdstc87XBeUdr6md9Ycr3d07FXPTmt2VvvnABQ2ek0qUXC5MRCzAiAdkyJ
 3WKr8rJ9Xbb7RCBIXXLqbUCgJySLdjKFbjkZsDNd8xg8VmfJaLlBux4pZ0IhR63eu5
 xoOoMYTNWou/XS9jhtX13/Yfrx12FI3CbXILemDc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24ABJB0A094124
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 May 2022 06:19:11 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 10
 May 2022 06:19:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 10 May 2022 06:19:11 -0500
Received: from pratyush-4F-325.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24ABJ3fq127309;
 Tue, 10 May 2022 06:19:07 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: <richard@nod.at>, Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>,
 <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <michael@walle.cc>,
 <tudor.ambarus@microchip.com>
CC: <quic_asutoshd@quicinc.com>, <linux-mtd@lists.infradead.org>,
 <quic_sartgarg@quicinc.com>, <quic_rampraka@quicinc.com>,
 <quic_nitirawa@quicinc.com>, <quic_pragalla@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_sayalil@quicinc.com>
Subject: Re: [PATCH V9] mtd: spi-nor: winbond: add support for W25Q512NW-IM
Date: Tue, 10 May 2022 16:49:02 +0530
Message-ID: <165218141900.322959.6753840624278997521.b4-ty@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1651234239-32217-1-git-send-email-quic_c_sbhanu@quicinc.com>
References: <1651234239-32217-1-git-send-email-quic_c_sbhanu@quicinc.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_041915_274806_5105FAB6 
X-CRM114-Status: UNSURE (   7.49  )
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

On Fri, 29 Apr 2022 17:40:39 +0530, Shaik Sajida Bhanu wrote:
> Add support for winbond W25Q512NW-IM chip.
> 
> Below are the tests done:
> 
> 1. Verified flashing binary image on spi card using flashrom tool.
> 2. Verified OTP support, below are the test results:
> 
> [...]

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next, thanks!
[1/1] mtd: spi-nor: winbond: add support for W25Q512NW-IM
      https://git.kernel.org/mtd/c/89051ff5dd

--
Regards,
Pratyush Yadav
Texas Instruments Inc.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
