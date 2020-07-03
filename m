Return-Path: <SRS0=VtTp=AO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7995C433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2020 10:54:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7435120737
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2020 10:54:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vnk9Gt29";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Tev9rkez"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7435120737
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=beRyURPyS6A3DaGXS2x9yAo8IpXZRXAO0zm3xE6wXN0=; b=vnk9Gt29xExz68YH5cOSnJIGI
	UGF+PZv8AL59SKarkVoLSt69HIePYqHc2Xs5XcCySjfhjn28SdTl1XVEzzPr53AcdR2kLfi35pkuK
	FpJbUP3WM3fe7NY09AU0l+GcJxEwm+vKz2STLmeiyCpgft80u01CEGgC+wWQxrtZuyTu2lExa7PHN
	vnzAkvxACsjl7wW9ye2ahjl0HvbePYz5I/NAyVXgMnwG1UaqGSraa49HeR/2CrSSJLHBOEfBeaRGQ
	EpGYwAYOmoogF6fghhTD8CZP9DklzGXgXyqwFMgLSzpDgP38CjSC70uFXptBHb4v1/VWW7UeRlTAS
	EyRFEIJnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrJJv-0001h8-6Q; Fri, 03 Jul 2020 10:53:27 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrJJr-0001fj-Kh
 for linux-mtd@lists.infradead.org; Fri, 03 Jul 2020 10:53:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1593773603; x=1625309603;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fbZsA13yxwa9teNIQIl5i9ecK01Ey9FAWxpcodemLkg=;
 b=Tev9rkez33xbhITVq5nmRPmlsNt294s34tPs14xsMQnB+O2IpqCk/nTX
 yzEBt8+i1CRvOKFmAKh27goBIj2mbn5bffDJ/4CjFwoKoI0kjfogixpOj
 4ppOWc2ZG/pDGGPQBk2xQI3l6kiZIERPwm5+SqInOa4cLKAi6rtJXTePM
 oQF6syt6Bb2Wb+sRd6Wj5znzDtIEN/qHkCL28hoTD567U4dOTXQks3b+E
 jhR7MTQ91t22cODZj5OBvoxKkw5uaKujhG05tIPSPCo37+lqnY1+Ku762
 0TwcEm3POScTsfJglFgmlS3G/eWY/RmZMCWjdyER1wZTkhT/Dp7cbSjuF Q==;
IronPort-SDR: /LCZH9duXpF5WXUZdbbZOQ1XBByBgXnqKYGC203mHlboByrImXmoGoxXoSQMTMm4xVcGjuvSXq
 9wbuN7UyibTYmfK44RF638/hfFbRMNS2IymKwklg4IGSWr+ACiVMkkyLEf5i9YJFOFSaxrqYbz
 s2TdxI1XmpAH/VrvjxQ/fcxwprM00Kh0C5NF7rts7Zjgth05zyEHKNHnlpWxUxCi1O0UbJVl/0
 4R4GWSvvZfNfKOky06mDqL7tHvc2tWs/RqC2fhI8kQrofC/DDlunWK1J/Bx2w9uoE4Fk2+8NOK
 0MQ=
X-IronPort-AV: E=Sophos;i="5.75,308,1589266800"; d="scan'208";a="86131696"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Jul 2020 03:53:20 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 3 Jul 2020 03:52:59 -0700
Received: from atudor-ThinkPad-T470p.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 3 Jul 2020 03:52:57 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: Sven Van Asbroeck <thesven73@gmail.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for Winbond w25q64jvm spi
 flash
Date: Fri, 3 Jul 2020 13:53:08 +0300
Message-ID: <159377313302.183636.9201993342908919115.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200629195306.1030-1-TheSven73@gmail.com>
References: <20200629195306.1030-1-TheSven73@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_065323_873399_92013E97 
X-CRM114-Status: UNSURE (   4.84  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 29 Jun 2020 15:53:06 -0400, Sven Van Asbroeck wrote:
> This chip is (nearly) identical to the Winbond w25q64 which is
> already supported by Linux. Compared to the w25q64, the 'jvm'
> has a different JEDEC ID.

Applied to spi-nor/next, thanks!

[1/1] mtd: spi-nor: winbond: Add support for w25q64jvm
      https://git.kernel.org/mtd/c/0ee2872f10

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
