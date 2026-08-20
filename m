Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5BCC5DF82
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Aug 2026 05:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Y+CZ10NvOji9Z31jcERteMoL+ibKZy3JvfjX6pZveA=; b=xSNtvo+krWS7P4
	6NAFlms5NY5K0aLkRtcaC2yoZi6iE7I+wZ3PbrGmhDy2fvJT3O5Tnnp/tV0s1O/vmeZQmITtXl4Pz
	uvzT5VqAkSObR30HUX3Vxdopc+ysLIW77cCR5bmSCzkYybTkCAnv/2OLhjBY8bezDwLvE3mKc3R9Q
	xIZuw3fJQqxePcZ/NFryURMecIuxrCYYi5oujJUp5nwz8r2UsdIWO6KDtDadALqtxmH1MlsU+Xf5s
	hOu7lumqMkjd0a2NuFAaYTbKkj/lvkGzjHdkP80Oog2IkY6KX8dblTvO+u+g0hoqHyaEuTHLCNgPP
	p8TaajvEoHrj/9U38tGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwviL-0000000Asfe-3y0A;
	Thu, 20 Aug 2026 05:53:21 +0000
Received: from smtp11.infineon.com ([2a00:18f0:1e00:4::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwviJ-0000000Asel-0kHr;
	Thu, 20 Aug 2026 05:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787205198; x=1818741198;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=37ZW8YOnm60ojTL8ISRSzVGScSuVacERLLcfcy5t1XI=;
  b=LRttVS2HxgR7W5e3VVhXNcnButdHe+9J3Ov51R9bIRd20ZCc5yvBX5Gx
   k+IUPM2P0VM+ve0JaLqZvbmvBhHTXeQdPgdm79UJUZqns+D4oHaXg9bAH
   oAe0CED7S1pfFl0VE4G0QaVS7d/ICizrxVkDhDXisgty5eK5iZ5JYfcpD
   0=;
X-CSE-ConnectionGUID: wStoZyi0SLOQcxFSTJKt3w==
X-CSE-MsgGUID: SVZ2c4O8Svmn710HkLRf7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="156701291"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="156701291"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE803.infineon.com) ([172.23.29.29])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 07:53:16 +0200
Received: from MUCSE818.infineon.com (172.23.29.44) by MUCSE803.infineon.com
 (172.23.29.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 07:53:17 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE818.infineon.com
 (172.23.29.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 07:53:16 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 07:53:16 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 04/23] mtd: spi-nor: Add support for the new JESD216
 rev F QER field
Thread-Topic: [PATCH v3 04/23] mtd: spi-nor: Add support for the new JESD216
 rev F QER field
Thread-Index: AQHdKzcucGwXu1ZOE066BGny6n0Soramedtw
Date: Thu, 20 Aug 2026 05:53:16 +0000
Message-ID: <c209ecaf857b40519b921e4d73ae29b6@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-4-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-4-b637cf120d5c@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_225319_539122_F6F169DE 
X-CRM114-Status: GOOD (  10.70  )
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

> Revision F of the JEDEC JESD216 standard includes yet another
> supported setting in the QER 3-bit bitfield: 110b.
> 
> This setting implies that the QE bit is bit 1 of SR2 (which is an
> already supported case) but this time it makes it very clear that both
> reading and writing to SR2 is supported, but not with the usual
> opcodes. The write operation uses an alternate WRSR2 opcode:
> 0x31 (instead of 0x3E) and both the reads and writes manipulate a single
> register at a time.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
