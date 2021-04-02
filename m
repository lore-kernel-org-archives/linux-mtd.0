Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555BBC43460
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 06:39:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCA7D610E7
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 06:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCA7D610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+QcZf8I5j+z8kn85XX3yfgJP4cnzye7H89sVSrtVReQ=; b=VarPicS2oLkhZSbkVLBpdpoCf
	Yba6gb+U4M//QIC3CzRQOTExYPMqtJ8/hRwdm7YPCslW2Jkbf6xmGAWS4sl+Rh9mVIIZU8lPXIGqO
	51EUyvVv6pOcIk7Yaw2hfeV4MhxMAQbRBqurELshftqgVXrHxhQUekMqyTyBONuzk3yU0W1zqwo1z
	z0I9pta23mvme20+3t6cUNAC80joaK7D0aOK9LwXBAEwYJcEc2JcAQ9WNHB9PxcKIV2LYZW+S+Jti
	5lvkw0sguh5agYBg8ObRKhXCsvnIWjCWsRpO22Of96+lhE/QI6pOyHAJA2FNepXDdAKjWGzQUiGSl
	HWn3fN9Vw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSDSQ-00C7M3-4f; Fri, 02 Apr 2021 06:39:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSDS1-00C7Bt-0m
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 06:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617345516; x=1648881516;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6l2ewII7HZLUgDgNCceti4mGNoBgxO2BRjv+HTj5Vo0=;
 b=ZAg7zwYTv6kWyhX1H5atriihN6gn+42W8FKSELmTAr2PQDYdX6kLyQLU
 8qpZGZxlfyWJd1h669YNLTwEwJKGBxO74WSAwupXqlIb81GsfcghewoAh
 LcyPWcNNZa3zzt4LacaK7MIm2qEkEXrPgisoyYvbNhmefKRqlLUyfIEtx
 /552QmqzWwAet4Kol6B8IlqKeVdV6UTOr2Z1GQFWo+Di5eU7pS3HlgbYO
 yPwLonft/m4fztG4NZgoAxBMzvVpfaSEBIs90fXl3lPqGcldZ51CYPy/z
 LwAgzm4dbo9DcXlbWmS2Tonfj/Z3vIDAMNOwn+xUub5dfKR1uqhiK3T5J A==;
IronPort-SDR: TL8ljy6RNMv79gk6EfenK6EHogV/VWqyTYuWBwjGus4XNPqosKJPBz5/IgG1Alq2Z/gY9c+5pq
 1sE8ZQkBBd3ENVOZxlbeeh8iMutspbv7+jMDJ/0pNEuwulky/FcrAmk57xB1MoNkEV8c3sALq3
 PJjCIdigQXA3Q1tr24xFwfIfLRLEhcNkyxYkOpsJ4idJbSFcV4prfHaSrZtzdjRkpHlfMddxNU
 GVFEo5QZnptklvXu3Lx1Xb+OFKYrkzz9Q/c8xLshwH7jmt9p92Xl2RS9ocIzMyFHZ3jdCHP2ji
 hlQ=
X-IronPort-AV: E=Sophos;i="5.81,299,1610434800"; d="scan'208";a="49777298"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Apr 2021 23:38:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 23:38:30 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 23:38:28 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <linux-kernel@vger.kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger
 <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5 0/3] mtd: spi-nor: OTP support
Date: Fri, 2 Apr 2021 09:38:24 +0300
Message-ID: <161734495497.5882.15333204001106333069.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210321235140.8308-1-michael@walle.cc>
References: <20210321235140.8308-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_073837_699704_E6382226 
X-CRM114-Status: UNSURE (   8.26  )
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

On Mon, 22 Mar 2021 00:51:37 +0100, Michael Walle wrote:
> This patchset implements the MTD OTP functions to allow access to the SPI
> OTP data. Specific support is added for Winbond flash chips.
> 
> In the past there was already an attempt by Rahul Bedarkar to add this, but
> there was no response. These patches are slightly based on his work.
> 
> https://lore.kernel.org/linux-mtd/1489754636-21461-1-git-send-email-rahul.bedarkar@imgtec.com/
> 
> [...]

Update 1/3: use div64_u64(), IS_ALIGNED, params->otp.org.
unsigned int region, drop comment, add rlen local variable in spi_nor_mtd_otp_lock()

Applied to spi-nor/next, thanks!

[1/3] mtd: spi-nor: add OTP support
      https://git.kernel.org/mtd/c/06d4bdf0a329
[2/3] mtd: spi-nor: implement OTP support for Winbond and similar flashes
      https://git.kernel.org/mtd/c/10488a53bdc4
[3/3] mtd: spi-nor: winbond: add OTP support to w25q32fw/jw
      https://git.kernel.org/mtd/c/5909dde2bc53

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
