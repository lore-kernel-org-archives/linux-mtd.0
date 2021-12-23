Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE46C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Dec 2021 08:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HHEm5Ek4YY5niaMBD8nMe1QDub1DF1wCSd59baeClrY=; b=LHFHmx7l8sh1ZS
	yT+5dUdmbGjqvNyUB/MrtMudH1P8iHJ8dYawHx3CYwL7ICMpM2UWi2w3SwVHMeElNavme5nIMMGB7
	8TYu7BhH/MR3ojcD38LgIRmS0Zem5jMMEZ8zp2QS35zhQoRm7N+n6iuF4IXN3NOIvIA+UHLrgpkji
	wNhz/RQcCRuIPY0TYjIs+2krR8pCgDblNe6kTaOukpnL4Ev2WVOYNEMCYRAtkkct5ag0pczBuycee
	t9Hl2j8DaFF+5mHd2xkzDZs8i9uPDcjOobj5VeF5zuNd9EkPaDCSe8te3ubEG6x6WpWTiXZx5kZ6M
	skJckJXzgCdemtSXuG1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0JY3-00CHHR-J7; Thu, 23 Dec 2021 08:34:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0JDQ-00C9Tw-SS
 for linux-mtd@lists.infradead.org; Thu, 23 Dec 2021 08:12:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1640247164; x=1671783164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BwrzrJ/6YTXQmVhunDbHM6brVHrDnTmV495Q4TrLTv4=;
 b=K6Kc2Bd+m4oZt03pP2p/hJEdwK9Uh5xXDjiqT29H23pomJchkfBYZwkb
 6i9C86ziqCz6uW+ExTIly07hFrkPwSpn5wxxowemqsOoIATkOdHftOmXp
 Ues8MhrdOKdUMOoARCG2WLpPDwEK9zqukL+0T+PdaXU+srVI0agxH3x35
 UUJPznHbilw+0ncbicSR/mmV6smrULulSdQvf6zeRAd3Be27b9E2Xem5r
 lhO3nnqUeHA4n2o8v2RWOjYvMQwbxwN2BzjbrKpW0VRTqv9rxiQ6aD7WS
 MvJayl61ryo+4EJbvtUbKDZ9SMithpB4V84ECVTuUD9bW1onk6aMNSZl2 w==;
IronPort-SDR: la91+brDhCpArHicl38FM/x6yPp5p0SdcjoKhDBiQD0KepCaZEZkJ7cANjNY9mNa9CVbrh+3b6
 TialqdHfnq/faCTqgXnnY1mlCVpuFDeLOaCoovu0mPsJTg5roqaFkMrGdDvMOPuYZRc0ifDmjd
 qe+mfGejOpdimcbHsMPtG2lv8EneOV6ujhtfQ2k8BFPdmOUVWJRRlilFF78Q//Y3sytuI7Cn5K
 KJu7uUniHsDCyDh0BvTfPdZr/EWeY7RqS1yZhpzDaZZ7Mt/GjutNUNXG9dryUPFjCX2hA+Akj/
 2KgMdIrqvxdtaPpb+QGuGOIA
X-IronPort-AV: E=Sophos;i="5.88,228,1635231600"; d="scan'208";a="80469813"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Dec 2021 01:12:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 23 Dec 2021 01:12:41 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Thu, 23 Dec 2021 01:12:39 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: Richard Weinberger <richard@nod.at>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Jonathan Neuschaefer <j.neuschaefer@gmx.net>,
 Flavio Suligoi <f.suligoi@asem.it>, Jonathan Corbet <corbet@lwn.net>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, <linux-doc@vger.kernel.org>, 
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v1] mtd: spi-nor: core: fix/remove references to spi-nor.c
Date: Thu, 23 Dec 2021 10:12:38 +0200
Message-ID: <164024714527.182368.2854659880404058320.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126092516.1431913-1-f.suligoi@asem.it>
References: <20210126092516.1431913-1-f.suligoi@asem.it>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_001245_048295_62A9BF71 
X-CRM114-Status: UNSURE (   7.22  )
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

On Tue, 26 Jan 2021 10:25:16 +0100, Flavio Suligoi wrote:
> The old file:
> 
> drivers/mtd/spi-nor/spi-nor.c
> 
> is not more present and now some of its code is
> contained in:
> 
> [...]

Applied to spi-nor/next, thanks!

[1/1] mtd: spi-nor: core: fix/remove references to spi-nor.c
      https://git.kernel.org/mtd/c/e7ad9f59f746

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
