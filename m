Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EF4C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 05:53:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E58E64DDA
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 05:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E58E64DDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iftknGzYpfCiHrbPGtzTFfaZriHzMMdJWKGNuSgcBeU=; b=lS4i57P861vrxIdFiZMBXePTi
	NI52wdLBlpQC9e7KPub3x+ibCY+dMZElQMqGkR4MdfU6Eljz4AHCUTX/43dNJ02dU6iP7yKj0dSrd
	ejxN4RnmZtqaGOEFvxh66vFjdq1teeWVQ+d+31H97MuLXtNbyRKEbz+NA6dbcKB7pBRS5dA+5fsgd
	aBZUMjg4XgxiimM5iEG1g4DwgBCaCLnHNQqmjcSKrR8M/05qKITLP83u3rrZg3WPxF505eNJi5Jit
	qMnaKUhIMXwi2tXwj4ONREDgPH0/peuKjB2aZTd/mZ1DdQHkUuXtYGUaHfvyzggHJPpm73++ltyi5
	pE5zCWJpw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ8p6-00FMiV-4b; Mon, 08 Mar 2021 05:52:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ8mY-00FLlk-OH
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 05:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615182618; x=1646718618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LqAcY+32EdnZhxrdLJEG7sjrBzhN9AgldB87W29Jsis=;
 b=MKIr85HmJJbV6QA4JIDn8owUzfYs3JU7qz/NWW7gltGj008iYPYvpN9P
 GzJKj2E8tAcWphVRfv88Xp3hiIyk9vsnTkrWtMAU2IBF6hFKRc1VrAyOW
 Eg3/oid5KjfuPiAl57kdsp1VK8JxxlkTp09gu3PHM/vq0c/Lw9912bUme
 /qc2XVCSba71THXiqoTnZ/RLMW2WreHwf18r6rq5ovp3n3FcaTff7TJZB
 vpxaALZ0nSC3pH07Kd+QwgWrvFyqJtRtajEB8oVcIHrdOZ3Bp1WYBF+St
 wdAhsdD+LcYO6P9gQf5I0XrpiECIypHASVz7BGeakeMr4s+6Okylymvwj Q==;
IronPort-SDR: qafOGCVQhzScUwI46hyOv/CXGTT2fL02YDZq7sE1BubwFoQvUdwj5/Idn8ZXoEFrvDp9RI4vTF
 xfmvZ3xcFr7hAK2+SC7EyiuzwNtaxIwg+A5AeA7WEhCw5AUCSVAbeQwNDdTIbewKmFtEMIAGWk
 BHikmYHzOzynLOReEFgTI10uNvZqyYa7APkNW4RArITS0wQb+HxXpW57oj56AhoweJFf24qn2j
 XlrgSsyEEq/sRf4MSO5WplMR/SUC1Yl5lzxGIs1mMaPik8j58hTK2Q+rnpmpj4WauJb50CXXnV
 cVA=
X-IronPort-AV: E=Sophos;i="5.81,231,1610434800"; d="scan'208";a="109103564"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Mar 2021 22:50:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 7 Mar 2021 22:50:15 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Sun, 7 Mar 2021 22:50:14 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <linux-mtd@lists.infradead.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, <linux-kernel@vger.kernel.org>, "Richard
 Weinberger" <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "Shuhao
 Mai" <shuhao.mai.1990@gmail.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v2] mtd: spi-nor: winbond: Add support for w25q512jvq
Date: Mon, 8 Mar 2021 07:50:11 +0200
Message-ID: <161518259586.63466.11466749485988604375.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208075303.4200-1-shuhao.mai.1990@gmail.com>
References: <20201111014556.6579-1-shuhao.mai.1990@gmail.com>
 <20210208075303.4200-1-shuhao.mai.1990@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_055020_643341_46778E50 
X-CRM114-Status: UNSURE (   9.08  )
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

On Mon, 8 Feb 2021 15:53:03 +0800, Shuhao Mai wrote:
> Add support for w25q512jvq. This is of the same series chip with
> w25q256jv, which is already supported, but with size doubled and
> different JEDEC ID.
> 
> Tested on Intel whitley platform with dd from/to the flash for
> read/write respectly, and flash_erase for erasing the flash.

Applied to spi-nor/next, thanks!

[1/1] mtd: spi-nor: winbond: Add support for w25q512jvq
      https://git.kernel.org/mtd/c/ff013330fbdb

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
