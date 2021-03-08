Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5316BC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 09:24:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC98864ED5
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 09:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC98864ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yf3xtmROeU774418x0woR4Jaosd6ZHeNHryI1l/YCMA=; b=CYbXPqnLhIPrp5PaFJDA48x+s
	TnqKNUKI+l/Kjoyn0dZweRRQRfb5i8amLfqehzQQPsE9Uak+JRtBr+5sbJNirqHeqd//a0erGhA50
	oaNF9CAkAq7hBg9VVC4HmoGyL4YJ8xgT3aIQyQsxpl+16FXrx8i94zv0huxxs0ii7AQb9DS1EZUL7
	UcM9o//ATVc3NMz4CXaJGyy+4QwJUByI9ubVq5/yqb3ptMu5rtT4j+aEgS+6enH7PmrKsiuNqoCw/
	cqwJ2UlpnlFIkK46WWXCre4Rmf6DFKz+xarpsXbeGGcP+lCAmf9bQjev9dnuhp/5J5ncmbDHEA1zP
	4FlPjtZ4w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJC79-00GAXD-Qx; Mon, 08 Mar 2021 09:23:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJC74-00GAUs-Jp
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 09:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615195423; x=1646731423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t+UOUkwcg7Donuf4Ef3A+lHrx7xJY3uSrfPoIMoZwaQ=;
 b=zbH+2x2YpH343JG0Clmyvp2rpJygQ9O5UFuNAPHdnsUZWfuK33T7017B
 qJv3dpnItClB2+JVQSnyBYmtWG/n2AHbi7NNxdyXb88J7JaqBVKkRirUx
 hxwmdMCGb9psEQMph+tA9T9CVK6vDRymqQrBtyNkiHv330Ch11/oL2B2M
 C+YZGgULcQMoU85w1rOHK4502GBYcIrvZQ0Wh6zkzC+7HauamTCcHoHJY
 1IEIIJrKEKhW/eTH82khqa9ycagdeBALeQDGIfU2/wRnAkIc8J9GU4Zx2
 QLOppK66togrCQLSiaCjaoGXZ9MIjEe2IkEuOT9gL6KrDLDmoTo46pnYI A==;
IronPort-SDR: UrzNhQXqwUrSeh5cVcum0lAsY7vylUPTnrXGpb1gu4K2nAYjReFp0eQCTJVHdufSI8/9L74h8G
 1tTAJdiL8icI1i2OX5T8OKVoun3DTDckbb3aKjf2u6eSMtRYAOrkCR2qHaLBHMQpTzUgwEGz1v
 /berCgpXhh1b2CZgcO+1AJdbxP2tp16hPeYx4V3byyzvJO/fTC+5ZzTf3fyzsZdjvFDH4hgkNJ
 57UKyM91iCw/eSHChOzuWTcJ7yz7o+PVmQbMooUy0qcXaZ8c1tzw7j7lUEbujGtvoCh3IlAc1B
 CwQ=
X-IronPort-AV: E=Sophos;i="5.81,232,1610434800"; d="scan'208";a="109122192"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Mar 2021 02:23:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 8 Mar 2021 02:23:40 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 8 Mar 2021 02:23:38 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH] MAINTAINERS: Add Michael and Pratyush as designated reviewers
 for SPI NOR
Date: Mon, 8 Mar 2021 11:23:33 +0200
Message-ID: <20210308092333.80521-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308092333.80521-1-tudor.ambarus@microchip.com>
References: <20210308092333.80521-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_092343_092833_F16C6A74 
X-CRM114-Status: UNSURE (   8.13  )
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

It's already been the case for some time that Michael and Pratyush
are reviewing SPI NOR patches. Update MAINTAINERS to reflect reality.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
Michael, Pratyush, please send your Acked-by tags if you agree.

 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d92f85ca831d..ba561e5bc6f0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16862,6 +16862,8 @@ F:	arch/arm/mach-spear/
 
 SPI NOR SUBSYSTEM
 M:	Tudor Ambarus <tudor.ambarus@microchip.com>
+R:	Michael Walle <michael@walle.cc>
+R:	Pratyush Yadav <p.yadav@ti.com>
 L:	linux-mtd@lists.infradead.org
 S:	Maintained
 W:	http://www.linux-mtd.infradead.org/
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
