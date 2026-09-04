Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9652C79F80
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 09:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dAJeEaJ4E/3p4fGzKCabB5Nfy3WqybYKyrfJH2UxBmI=; b=GquLxhxqSwolmE
	iLB2775DGYpHlGecgos73yvmCCot0TTFVfS2IQkIDLcBsqck+c+dNp7xjP5vFO2pnUiW7ocCRhoA2
	onx5E9ZHT4zbxO02IBIdSMazrfP3BcnH7BK/1RtT6x7A1kl3ZZD0QroLc6bl2CBy3hPjK+VmU2qSN
	tFD4w6wR8K9lJaSrFcM+hr6efVu6XViu6pede2WOCTHS8eB1HJmc3ulF7Qqq+UZrBZ9F73Xboks5x
	SDFUr2jRV7AZf3YXHaRPxcJ4JQgO6lZWMS6E1mPy3x+XCCLARLFeemDUjPfM+18IdObBIb8XvLbCZ
	bQtdFRcgQVPCrDDCpUjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PtU-00000001Ty5-1QBr;
	Fri, 04 Sep 2026 09:07:32 +0000
Received: from smtp14.infineon.com ([2a00:18f0:1e00:4::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PtR-00000001Twa-3Zov;
	Fri, 04 Sep 2026 09:07:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1788512850; x=1820048850;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7MoKXvC6968eejIFP7iCwt2T4ExB49oBcRo4K3eSCKI=;
  b=l9YYbmfTAf1yzAqAL27w4Iu95bRkULpD5NEV4W5yZJ2mh56J2Bd3VLcG
   YZgWNQsA8EKw+u/bI+JfgjvZvXeIX1189YxTCXiJWGikPhX+7WUiyAWi1
   MH3FdPWe/Zq0cY/2YZOEg4kOsOSMi9ifC3s9btu0Du3KorAi2kDls5aKO
   M=;
X-CSE-ConnectionGUID: uJTRJ/DhRNev+wUkTRcQKg==
X-CSE-MsgGUID: 9jXa/FKoS4qX45ndJbitBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="145631225"
X-IronPort-AV: E=Sophos;i="6.25,260,1779141600"; 
   d="scan'208";a="145631225"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE819.infineon.com) ([172.23.29.45])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 11:07:25 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE819.infineon.com
 (172.23.29.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 4 Sep
 2026 11:07:24 +0200
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.046; Fri, 4 Sep 2026 11:07:24 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v4 12/25] mtd: spi-nor: winbond: Add support for
 W25Q12RV-Q/N
Thread-Topic: [PATCH v4 12/25] mtd: spi-nor: winbond: Add support for
 W25Q12RV-Q/N
Thread-Index: AQHdOvyPDTQdnozUAk+qARRuXX3Ydba+Hwgw
Date: Fri, 4 Sep 2026 09:07:24 +0000
Message-ID: <a6f90df0e0f742ddbbaea48ec5c0cc59@infineon.com>
References: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
 <20260902-winbond-v7-1-spi-nor-rv-addition-v4-12-779d35303dff@bootlin.com>
In-Reply-To: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-12-779d35303dff@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_020730_203094_9964C71B 
X-CRM114-Status: UNSURE (   8.94  )
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

Hi Miquel,

> There is an ID collision with the chip of same density from the JV
> family. Both chips are very similar in practice, it is mostly a matter
> of electrical differences (mostly power consumption being lower).
> 
> As a significant difference, RV chips identify themselves as supporting
> the new SFDP (rev F) field which forces an alternate write SR2
> opcode (0x31).
> 
> This density wronly advertizes its size and requires a fixup for

Typo? 'wrongly'
Same in patch #20.

> [...]
> + mtd_debug info /dev/mtd0
> mtd.type = MTD_NORFLASH
> mtd.flags = MTD_CAP_NORFLASH
> mtd.size = 8388608 (8M)

Is mtd0 a 8MB partition?

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
