Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53680C5DF81
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Aug 2026 05:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejMKAacPm7Xlp3XpyBpEIpVvCQ3vdW4CkjEq4+H9Z5M=; b=MZX3BR+XSUsNlf
	TN7UnWvcDXNa+SGTdFQ+36yfi0GncZaRorfcY1EopZiRJfjhD4wZ61mrhLPr8XkBrtd7aepnKUSFA
	YzgZssAdERcpDUnU3WSk34uC7Ix4HFu8otWqSodCiH3igUOcAE9yiJ+6kdRKKGSanCrm3edxiOARR
	dF0UWUvj75l6lv/P72lnBEcayYt+jrk/OBplN4EWoEcXiqVQzexATWqzV8aV8V0H99b/VFjpaC5Zn
	Mk7adOr9R6ji+UWrrYpVR09wkzyYndg135y895AkBwiLwnvL2IMJzP0ISiSMmVVdBh6l0ECHcJ2Bi
	QpnxiVuEHbdPX7eeljrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvg8-0000000AsPC-1H5O;
	Thu, 20 Aug 2026 05:51:04 +0000
Received: from smtp14.infineon.com ([2a00:18f0:1e00:4::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvg5-0000000AsOe-1GsD;
	Thu, 20 Aug 2026 05:51:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787205061; x=1818741061;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ahpxrhIzwwIAbwOr+R2KucV63JvnpiADURbuUKzU5hc=;
  b=N7I72poFLc/4abJ/riJXck6jnfLqCO6d3yvaenUfVE4HztG4myhnoedb
   mygIOoSNiWcDEtcYFBvvXqhbon8ZBf/bNt2Hmmqsg8lQyR5iYr4iIFomK
   sMV3PXEq90aqILomQAnUn1TYIaW05XWnFNg/hMye9wkyfTP3KADPALoLu
   0=;
X-CSE-ConnectionGUID: 7zVRjOo+R9WeBIwxbZHEBA==
X-CSE-MsgGUID: kFU9UMleT+aI19KSF7xBOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="142730413"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="142730413"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE803.infineon.com) ([172.23.29.29])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 07:50:56 +0200
Received: from MUCSE817.infineon.com (172.23.29.43) by MUCSE803.infineon.com
 (172.23.29.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 07:50:56 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE817.infineon.com
 (172.23.29.43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 07:50:55 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 07:50:55 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 01/23] mtd: spi-nor: Rename
 BFPT_DWORD15_QER_SR2_BIT1_BUGGY
Thread-Topic: [PATCH v3 01/23] mtd: spi-nor: Rename
 BFPT_DWORD15_QER_SR2_BIT1_BUGGY
Thread-Index: AQHdKzcjyw4WlRlF90aItjoNCif4ULameOMQ
Date: Thu, 20 Aug 2026 05:50:55 +0000
Message-ID: <c7e7f557f17647b1b7134facaa1cefc1@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-1-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-1-b637cf120d5c@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_225101_685403_DC7E3DD1 
X-CRM114-Status: GOOD (  10.68  )
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

> The _BUGGY suffix is not super accurate. There is a behavior that indeed
> seems strange, but it is somewhat documented. The fact is, with this QER
> field the status register is considered 16-bit wide and if one writes
> the first 8 bits (SR1) without the next 8 bits (SR2) then the content of
> SR2 will be assumed to be 0x00 and will be cleared.
> 
> Rename it BFPT_DWORD15_QER_SR2_BIT1_NO_1B_WR to align with the other
> namings (_NO_RD) and clarify the meaning of this field.
> 
> No functional change.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
