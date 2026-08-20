Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353DCC5DF81
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Aug 2026 06:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lo6tNthr+mLZK/CO2+Y5z0lyFV+F7wc8skduINZf8U4=; b=HwtZ44jfkZGmuY
	n5zsHFAhjQfcJX85oFUUmc70Ppl4CjXLem5O0mQx6/fQm58tc3MogNb/VP2JWYnJiAAn283Hvp1Ar
	uNsJStc36FDdS4S+eCxOnuB9sdiilbyCEylV/RZsyffY3A2Qo/hJiDi1YSeiaWfzHF+pJbKcAqsC3
	7HNeE67s8V3+5ASAAzI+AnHXVyfd/6LN/5ioeyT2iN/Gyk+WaAZbh3UCqmSx1qnw4ysI3FYtj/roi
	nHM9rPbLXoQElLAjebNff94aipFqckFB/qEq7lEbxTIjWLfiHtrZOkuKc/DNgB6Ib/P8WwAd46dN1
	mS3/khUWc/8ID5xK7IlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvtf-0000000AuDC-3W1m;
	Thu, 20 Aug 2026 06:05:03 +0000
Received: from smtp11.infineon.com ([2a00:18f0:1e00:4::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvtd-0000000AuCC-01BR;
	Thu, 20 Aug 2026 06:05:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787205900; x=1818741900;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=u6nnStvPEFbyY7Htslo0ENX4rktquD6YXC5DcbylmnQ=;
  b=FL1IrrnVQwZjV8Kmk0GRs7cC74/0P3tbWnSTutmwCfCAnFIR1c0+6uEh
   2GaJQam0CUk+BI5/lM8gRGIxPUlfpUC8lfxPV43fItIzgmHlmYcTvABWI
   eWeJiB9i32BSh5ppDwfQTLrnScTCU4B81S9GMFzeoEUVM/bBfRaj6jRSI
   s=;
X-CSE-ConnectionGUID: p9Pcy1tCQ4yClJ571sBVsg==
X-CSE-MsgGUID: fv982asuR6q5I8vNyBmasw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="156704624"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="156704624"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE819.infineon.com) ([172.23.29.45])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 08:04:59 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE819.infineon.com
 (172.23.29.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 08:04:58 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 08:04:58 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 12/23] mtd: spi-nor: winbond: Add support for
 W25Q51RV-Q/N
Thread-Topic: [PATCH v3 12/23] mtd: spi-nor: winbond: Add support for
 W25Q51RV-Q/N
Thread-Index: AQHdKzdMGyPhGSA+k0S0SBMKrbBTzLamfRgg
Date: Thu, 20 Aug 2026 06:04:58 +0000
Message-ID: <6ed3856fa9dd45ba845e9bde3fbd12b5@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-12-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-12-b637cf120d5c@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_230501_361195_A6D3A4CE 
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
