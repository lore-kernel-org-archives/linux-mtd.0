Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821D3C5DF82
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Aug 2026 07:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6u76E5cns6PE3Z1NOrgwVDokYbyrG1h7ElFC5Y97kE=; b=TmAMTTS5vCGqxX
	ccRLWr6XDfQ+7F+VJzuJsSsmm1FEdjrl1APYigxLCkqbH7TqqdGOiZ3UJu2vVvCVsbIQuqUGOmHKr
	scVaJMpDbPqlj7RpYjVb0MAGXDLIy+WXsLjc/fXrJxo6rMyQVcRS15zC3PfIx7JEzMSa+aHZtKcbS
	mC0TGHiHjw1c4OIQsmntfScbpoL5NMHuOh6A5unkS3n9o/MNAGKKlKibI6rhw/rrXVwv2nSBuaYaT
	WSq+GHSOUEGNkQp6h2h1xxnSV92Fymc1zo4f8OhJ42H39smYYzRxw9QsUXrbaU+Y6ppR3NVoSuDU8
	Cj+b1M8wUKybNYTt2bMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwpX-0000000B064-1lGM;
	Thu, 20 Aug 2026 07:04:51 +0000
Received: from smtp9.infineon.com ([217.10.52.204])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwpU-0000000B04r-0FKl;
	Thu, 20 Aug 2026 07:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787209488; x=1818745488;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8uBJ8Mta62b6RmQf7dtw94ndHIb5OKy4XaY6DIy9lLw=;
  b=N9+2Bv5Za0EZW/RX277qdyaVR4NFCV+uGKbrV0f9h73xrUaxxAnDr8Nm
   Dy7/E2LTX+iaR9ovIX6KIHKaZDzhUOYQ8y6Jr9blLdAlS9ne1U8GBeAyx
   jJ4pwcwDzP7IseIWm8Cm2CaUcHgliGnD+KK5kUdtQXLtKJmCBmkpbBP5W
   g=;
X-CSE-ConnectionGUID: ABJj3vDsQVOZ22lUpvgejQ==
X-CSE-MsgGUID: wBy2RtI/QkmwESO3DyWbYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="105427185"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="105427185"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE805.infineon.com) ([172.23.29.31])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 09:03:45 +0200
Received: from MUCSE818.infineon.com (172.23.29.44) by MUCSE805.infineon.com
 (172.23.29.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 09:03:44 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE818.infineon.com
 (172.23.29.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 09:03:44 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 09:03:44 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 23/23] mtd: spi-nor: debugfs: Expose SR opcodes and QE
 mask
Thread-Topic: [PATCH v3 23/23] mtd: spi-nor: debugfs: Expose SR opcodes and QE
 mask
Thread-Index: AQHdKzdfZ2b8fOyMyk+wKDEcGW2sy7amjJxQ
Date: Thu, 20 Aug 2026 07:03:44 +0000
Message-ID: <2bf142b04caf4c578cfbc57740490632@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-23-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-23-b637cf120d5c@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_000448_429987_1A0A832A 
X-CRM114-Status: UNSURE (   9.67  )
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

> Expose Status Register opcodes based on the flash capabilities
> discovered while parsing the SFDP QER field.
> 
> Value '0' indicates an absence of opcode (non supported), we do not
> print anything in that case.
> 
> The QE bit is also displayed.
> 
> Example on a W25Q02JV-M:
> 
> $ grep opcodes -A10 /sys/kernel/debug/spi-nor/spi0.0/params
> opcodes
>  read           0xec
>   dummy cycles  6
>  erase          0xdc
>  program        0x34
>  SR1 read       0x05
>  SR2 read       0x35
>  SR1+SR2 write  0x01
>  QE             SR2 bit 1
>  8D extension   none
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

S25HL512T:
opcodes
 read           0xec
  dummy cycles  10
 erase          0xd8
 program        0x12
 SR1 read       0x05
 SR2 read       0x35
 SR1+SR2 write  0x01
 QE             SR2 bit 1
 8D extension   repeat

S25FS512S:
opcodes
 read           0xec
  dummy cycles  10
 erase          0xdc
 program        0x12
 SR1 read       0x05
 SR2 read       0x35
 SR1+SR2 write  0x01
 QE             SR2 bit 1
 8D extension   none

S25FL256S (no SFDP):
opcodes
 read           0x6c
  dummy cycles  8
 erase          0xdc
 program        0x12
 SR1 read       0x05
 SR2 read       0x35
 SR1+SR2 write  0x01
 QE             SR2 bit 1
 8D extension   none

S28HS512T (Octal, no QE):
opcodes
 read           0xee
  dummy cycles  24
 erase          0xd8
 program        0x12
 SR1 read       0x05
 SR2 read       0x35
 SR1 write      0x01
 SR1+SR2 write  0x01
 8D extension   repeat

Tested-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
