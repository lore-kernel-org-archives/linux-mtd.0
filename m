Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD07C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 13:21:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8C87611AF
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 13:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A8C87611AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2+aViPHrcJNP8tknpKuY/rb9fT2kTZvPwUX9/78NgTk=; b=J06tujj7boAjPn
	o6bsiwuz1xofZ4C2niWdvgAD9N7WmeQg/ZuMFznIBdFwk4P4B7l7u4gtOfGkoiJ0PLPrbZ/bb24RR
	LR0fWHIl5EIStZPzRZvlXp44VuhgdkZJ24UsV2WD0ZlXeRzKsAqMamFPh7UyLe8wTFnF2Z1mPZQ4y
	CZQ/VgMu4i8oJF1NMzfN9+a5D/qzoo4zxFBqe/y25+pYoH6V/Knru/QjZPg60btjtdBwH4bqSm4lC
	VhSpQLzlSlsWVFxkivmyOtgy4qKnbFJtz2mJCVBis+i7tdnG6DPXrViQYr5tscSxdqvz1fyM8A/8v
	0OXUt/Dt3WAlpwfGV25A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnKra-004pqo-OA; Wed, 17 Nov 2021 13:20:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnKrY-004ppm-2o
 for linux-mtd@lists.infradead.org; Wed, 17 Nov 2021 13:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637155232; x=1668691232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r/F5RXTxpA+0lZWVSNUoYs6ScKboHBx/VoX/iobMa7Y=;
 b=LJhPKb/NKOrevp0vJ/hDeiZMhOiESfVxIwd4dlYadm0gNIovcR/8Cgd9
 YJYAjIXY4GiLoUxbTnea0lI/+kTKquCtwvtLCKYx0z1F2a+CWTqh2DBnG
 ShQk2IkArMMJl1VcGfTAiNZTxcCROKokYjrfcBPSyCQL6sxpla9x//qTr
 HkjifijEsov6tnetlt5haJ2BeRGTMYfLpi3ibFAMo+A3rf3egMzP9QHbH
 mCM0L5EmyN3pgFZXPfQiVwf1cX8HbB/GkTSGFQ3Xoo1U3XFoRZrHMahGd
 WygO1ADZw0NGL55Zwx5UIFJq8DZvv0e28d7HXk8JQAolkQ1ktVDmVDHVU A==;
IronPort-SDR: W76uNzB3a1rKhexxb2FdjlT45PiVYDMgNXU5+0Qqfh+CM4eeqyMhcaCmTubCWc8QLISc5OhkPY
 3p9Vq5gd/Y+etArLCV6q2HDa8/7JChIInrCqTmAfZvLSdaLAEABqWqpUtrMXDTRUP3iTSVQOUp
 3Hx3jhT9SMl6CkjppLJBsegiJyJFCfAzn/H2gR9DTTlBypTP/zyq6ckB9hPZQ/edWcwQG08vAm
 F2P4glXo1rU4KSz7brpL0DiLkHMNWNwAtBQcBN7kjheplfJodvTBPaJd7tBV+ESZIcSmL0N+ml
 vJDtfl5KrQmmuDKbLrjhsDzY
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="139427487"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Nov 2021 06:20:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 17 Nov 2021 06:20:30 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 17 Nov 2021 06:20:28 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: Pratyush Yadav <p.yadav@ti.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 <linux-kernel@vger.kernel.org>, Michael Walle <michael@walle.cc>
Subject: Re: [PATCH] MAINTAINERS: Add myself as the SPI NOR co-maintainer
Date: Wed, 17 Nov 2021 15:20:26 +0200
Message-ID: <163715510294.4949.12245796211168827045.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029181157.20623-1-p.yadav@ti.com>
References: <20211029181157.20623-1-p.yadav@ti.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_052032_211380_72FEC2B9 
X-CRM114-Status: UNSURE (   6.73  )
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

On Fri, 29 Oct 2021 23:41:57 +0530, Pratyush Yadav wrote:
> I have been reviewing patches and contributing for over a year. I would
> like to help maintain the subsystem as well.

Stripped "the" from the commit subject, added Richard Acked-by
tag as agreed on irc, and applied to spi-nor/next.

Pratyush, welcome and good luck!

[1/1] MAINTAINERS: Add myself as the SPI NOR co-maintainer
      https://git.kernel.org/mtd/c/228e80459960

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
