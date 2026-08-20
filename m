Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4017FC5DF82
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Aug 2026 06:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Am5qi9c5Ct4odMwm0ox10RWGE/Ma1TfpSnAmd40sic=; b=KdGXT/TKXFddXA
	/FWL8oPQSDPdXDf01+CIkbo2eWMRoF37KBW4EH7mA6hvH53ZjXoKpC5xPMak7T1o1SoyBsMr009H2
	mYw5uT7LcWwSgwWW3p5lWfPBkp68zCvKFyZaxGCBG8d29hEFoQEioYczhA24cF1piLsrHtsislTkr
	iqRCbIK+ALVsK7lLRbcFR5OfpoGlF2zo8jcCBL9Z1csVSgqKNwj6sbUSWiPzRobRDSDXUhKchsf40
	AMtX/qExmsjJh0Hawz66paR8QfQ0t/XnsHaqQg74QODtVbxWBj9psaiw5qMdx6yHWpsNhQ1J1vYWP
	BxU03cF8ZTZtSXt56sWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1www9T-0000000AwPp-382n;
	Thu, 20 Aug 2026 06:21:23 +0000
Received: from smtp2.infineon.com ([2a00:18f0:1e00:4::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1www9Q-0000000AwPI-0BMg;
	Thu, 20 Aug 2026 06:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787206880; x=1818742880;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=U4W08LkUkt2oaIkOGVmzCX+wp16zz69drgER1UF8oEk=;
  b=VdG3jDcSQPHV6/oDnzVoGOnOFJgm5GTzvRx7WvhduPUbiklNllzzzh5X
   tztG0cT+hl5HGW4GIE+Zlma1NEccJV6/Ic7NrT+nxEnzNNgNWw1pXznvi
   T0yPVsEpiQLLQp5o44VJnN7idBB+HD7SXlVc3g5OOR0kIOb7Q76bKNl7B
   k=;
X-CSE-ConnectionGUID: pdjrJqr6TniHZHR4RBtmNw==
X-CSE-MsgGUID: c+kmAZulTF659+F6vcl6vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="173550215"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="173550215"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE814.infineon.com) ([172.23.29.40])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 08:21:18 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 08:21:17 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 08:21:17 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 17/23] mtd: spi-nor: winbond: Add support for
 W25Q64RV-M
Thread-Topic: [PATCH v3 17/23] mtd: spi-nor: winbond: Add support for
 W25Q64RV-M
Thread-Index: AQHdKzdX4kaN31gU5E+a+aZJ4KB29LamgY3Q
Date: Thu, 20 Aug 2026 06:21:17 +0000
Message-ID: <1607509688694e31872d1b6cc373bc7a@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-17-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-17-b637cf120d5c@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_232120_409110_26EAB1C7 
X-CRM114-Status: UNSURE (   8.58  )
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

> There is an ID collision with the chip of same density from the JV
> family. Both chips are very similar in practice, it is mostly a matter
> of electrical differences (mostly power consumption being lower).
> 
> As a significant difference, RV chips identify themselves as supporting
> the new SFDP (rev F) field which forces an alternate write SR2
> opcode (0x31).
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
