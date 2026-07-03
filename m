Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1348DC43458
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2026 09:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KYWYspUDTuJGcwi3E7TEEwMp8uteEqmXtHT5m9hi56k=; b=uvfY+iGnndezn+
	jU8DcxKbbKHd02xM7mpmzkGd7AysaheF6wl93tSmjtBcFjQfhWFr+1kOz0n0glXWRY8RxFO4ekMz1
	/8RONtDwp71xS3VD7aM/wUtIirrjk0BRwM3Hh8jPcr1cvAbe770OC9VI5FarsYt0b1qd2OxiGPcrB
	y6ziM2pxuXW/STXY1w5eb34uadhWXds6ZljBpukXV4r/ei4+hQILYCIyFN2bJScWxsDlWRN2Brjfu
	07JTBjH5062CUivuJDyn4HpRgq7gqS4icizi3uua3L2+6nAFVbHnahlsi5P2OGTmsp1Q1PAQyJ01t
	/rQBGZK0PXh1l+eu+NMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfa6b-00000006TNX-12v0;
	Fri, 03 Jul 2026 09:22:41 +0000
Received: from smtp9.infineon.com ([217.10.52.204])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfa6Y-00000006TMu-1WAK;
	Fri, 03 Jul 2026 09:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1783070558; x=1814606558;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Ybh09U61n8vr7U6hIUEp2ScYPAHtOMLi9dOZJ/aT9j8=;
  b=G+3KuJeYYR3y9Pf7WdfaKr+701acqab6DoL5Mts9lit+3GTgs6Mv044d
   6xH/oweckWMgMZrIR9NV2rDEks02mEtKy7aEBaqaKLTI/1j/45wL/9ox4
   eVM5jmiQr2H42w4CljTz9gUUFMr4dVgiCaTDzGfDm8c/XuROJkWN27qBx
   0=;
X-CSE-ConnectionGUID: z8Qc26ctTJuCzOFVy9AyBw==
X-CSE-MsgGUID: sKhdcObXRGidQmNxVFF2yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="99599774"
X-IronPort-AV: E=Sophos;i="6.25,145,1779141600"; 
   d="scan'208";a="99599774"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE803.infineon.com) ([172.23.29.29])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 11:21:35 +0200
Received: from MUCSE816.infineon.com (172.23.29.42) by MUCSE803.infineon.com
 (172.23.29.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 3 Jul
 2026 11:21:34 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE816.infineon.com
 (172.23.29.42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 3 Jul
 2026 11:21:33 +0200
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.043; Fri, 3 Jul 2026 11:21:33 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <manikandan.m@microchip.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<srini@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <linusw@kernel.org>,
	<arnd@arndb.de>, <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>
Subject: RE: [PATCH v4 3/7] mtd: spi-nor: sfdp: expose the SFDP as a read-only
 NVMEM device
Thread-Topic: [PATCH v4 3/7] mtd: spi-nor: sfdp: expose the SFDP as a
 read-only NVMEM device
Thread-Index: AQHdCHJjppL/9AvAjUSdTTDRPCeZfLZbR6AwgABBQ+A=
Date: Fri, 3 Jul 2026 09:21:33 +0000
Message-ID: <d0823b0801bc4339a2653e4a51c488f4@infineon.com>
References: <20260630092406.150587-1-manikandan.m@microchip.com>
 <20260630092406.150587-4-manikandan.m@microchip.com>
 <8f3b422e0b7749b2a47b14a585dd0a0c@infineon.com>
In-Reply-To: <8f3b422e0b7749b2a47b14a585dd0a0c@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_022238_729326_6F81CD55 
X-CRM114-Status: GOOD (  11.32  )
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

> Hi,
> 
> > Register the cached SFDP as a read-only NVMEM device rooted at the
> > flash's "sfdp" child node, exposing it in on-flash byte order. This lets
> > NVMEM cells reference any SFDP data: a fixed-layout for parameters at a
> > known offset, or an nvmem-layout parser for vendor data whose location
> > must be discovered at runtime. The device is only registered when an
> > "sfdp" node is present in the device tree.
> >
> > Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> 
> SFDP is exposed in sysfs (e.g., /sys/bus/spi/devices/spi0.0/spi-nor/sfdp).
> Why don't you just use this existing entry?

Sorry, sysfs is for userspace.
Please just disregard my previous comment.
 
Thanks,
Takahiro


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
