Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A11BC5DF82
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Aug 2026 06:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xLvUVsEAaIO69QHqgaJsgr25MoE66WXdhdNJmzdqKS8=; b=xpUhK/gejbOmEJ
	nkO8ifk405LTgQhnOqfXZkueqnGEMKboCIQnoyBzHvIV/L5SgxcmQTJaShjIm8DC3BUDMsQyVzBS7
	lgRt2tbO3oalZ7Auk9y+3XJZMlF58RiJihTqh8+Fm39VqdIrZoQUEAULob/jsW73enb6r19Nymkz/
	nvpFzNgIW1U61EYlDwaLWhggPI+OUMuaPAvognn580EEexmCRIJEihdOH3h1q7aDuhzDeIzaXG2oB
	EOep5fB8RHrZoh9pANlqiPu4tS37MZOipwT8OYd+MASbLb7fCf7KYPUHxLzqB5RzEzTwyyTgYlzEm
	wbKoDp7gQMycBg1iKfIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwVw-0000000Axp7-3lcT;
	Thu, 20 Aug 2026 06:44:36 +0000
Received: from smtp2.infineon.com ([2a00:18f0:1e00:4::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwVt-0000000Axo7-3PVe;
	Thu, 20 Aug 2026 06:44:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787208274; x=1818744274;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uqadmPJge0Xy/YQ6o8YBnC+Imza6A1lLBBMzgWO73F8=;
  b=laxuN0X1pEcPLNoPu5rwzcxduNcC4Yut+crp4Ln2faBK2bdgDU+j5SoH
   1RPyxalJXkwvhaofzxK81Yl+rVsJbDc8hWMMI+skoOGtzIBRiAw5Ah+9I
   biL6DxH/jWPyfZFoWtVtAD8DKq2Ui0K6AdBDaA3AtXC6B+JZqMWcxCcBl
   I=;
X-CSE-ConnectionGUID: pVd/7Kx7RwCMPHwI6x+cjg==
X-CSE-MsgGUID: 2pPypu75Q12MdMZNrdt4zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="173553957"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="173553957"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE803.infineon.com) ([172.23.29.29])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 08:44:32 +0200
Received: from MUCSE820.infineon.com (172.23.29.46) by MUCSE803.infineon.com
 (172.23.29.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 08:44:31 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE820.infineon.com
 (172.23.29.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 08:44:31 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 08:44:31 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 18/23] mtd: spi-nor: winbond: Add support for
 W25Q12RV-M
Thread-Topic: [PATCH v3 18/23] mtd: spi-nor: winbond: Add support for
 W25Q12RV-M
Thread-Index: AQHdKzdZvgsYuAZvr06GheipzTEvC7amhBRA
Date: Thu, 20 Aug 2026 06:44:31 +0000
Message-ID: <889b2fa10c5e4c6ea22ede16baa22b44@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-18-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-18-b637cf120d5c@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_234434_167279_1C1A99E9 
X-CRM114-Status: GOOD (  10.57  )
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

Hi Miquel,

> There is an ID collision with the chip of same density from the JV
> family. Both chips are very similar in practice, it is mostly a matter
> of electrical differences (mostly power consumption being lower).
> 
> As a significant difference, RV chips identify themselves as supporting
> the new SFDP (rev F) field which forces an alternate write SR2
> opcode (0x31).
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> + cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> ef7018
> + cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> winbond
> + xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 534644500a0100ff00080117800000ffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffe520f9ffffffff0344eb086b083b42bbfeffffffffff
> 0000ffff44eb0c200f5210d80000142a010186e114c1e96376337a757a75
> f7a2d55c39f66dffe930f880000000000000ac0000000000f7f5ffff0f00
> 0000060d44bd27ed080d
> + sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 94b52d6e903a2046e144eab0760384b6932c6fdbfec17eb7336f1778c3898daf  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> + cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
> Supported read modes by the flash
>  1S-1S-1S
>   opcode        0x03
>   mode cycles   0
>   dummy cycles  0
>  1S-1S-2S
>   opcode        0x3b
>   mode cycles   0
>   dummy cycles  8
>  1S-2S-2S
>   opcode        0xbb
>   mode cycles   2
>   dummy cycles  2
>  1S-1S-4S
>   opcode        0x6b
>   mode cycles   0
>   dummy cycles  8
>  1S-4S-4S
>   opcode        0xeb
>   mode cycles   2
>   dummy cycles  4
>  4S-4S-4S
>   opcode        0xeb
>   mode cycles   2
>   dummy cycles  4
> 
> Supported page program modes by the flash
>  1S-1S-1S
>   opcode        0x02
>  1S-1S-4S
>   opcode        0x32
> + cat /sys/kernel/debug/spi-nor/spi0.0/params
> name            (null)
> id              ef 70 18 00 00 00
> size            8.00 MiB

Is this correct?
This part should be 16MB(128Mb).

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
