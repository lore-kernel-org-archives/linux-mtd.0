Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8983BC43327
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2026 09:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=psJer32KaTB6+df5bmROgec3Ixucqq5p+YFo4ShJ76g=; b=PGBqqUjJ2XeAHk
	iya/YHGmZKhQ6vbYDeucD17wY2FSzUIxpnhYOO95cvqV5udGEP3yCGWTwU30HOXrzX/EtkdohwIXC
	MkhTRlmRTZOyeSoESF/64k/YLbK+82S0Ju0gf2Te20WF4ziwswKJ4sck4zRaZxBZiAxJ7Z5bwRvj8
	ZCAT2KvDZVDbO+LM/Y83ngPncNfnNMUFz0W7TgUR48Cfqx6FxazCbIxE9O+Z63YbuTtDHn4mXzeEp
	ITpdxY4wj2sCRbfyI7NKokHbMHPfdhX8gc0mHpQn6UeXBT23c98jc0o5siZ8yzKN6iZjna7OPSdma
	tAUgMo9kjRNq4zvRFdGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werZF-00000001Ehj-25No;
	Wed, 01 Jul 2026 09:49:17 +0000
Received: from smtp2.infineon.com ([2a00:18f0:1e00:4::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werZB-00000001Efe-4ACJ
	for linux-mtd@lists.infradead.org;
	Wed, 01 Jul 2026 09:49:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1782899354; x=1814435354;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bikzSr+NRQS0BStBxaDankRVM0j6fnovMuiAylead9M=;
  b=Jmlr5Fqu8rdcbidjSo7vrlmqlB9bJir9/xUzLCYOeIDZwjnY5cO/J401
   QRbivVJ9Vufm5Xa0nyJU0XhnBr7QJFPEXbs8tvOKL8Y+tyBwQ4mzKB3oP
   q2UXYqmWkMY0UUvGTy70E3IDM+GVMRY3RDHoSsjK/ibTt+Sc4sJKUTZgh
   c=;
X-CSE-ConnectionGUID: g2aqPEuVQAeQXqvBZU2m+Q==
X-CSE-MsgGUID: Sef72jcpQhG0MzYbXN0sVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="165441956"
X-IronPort-AV: E=Sophos;i="6.24,235,1774306800"; 
   d="scan'208";a="165441956"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE822.infineon.com) ([172.23.29.53])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 11:49:08 +0200
Received: from MUCSE816.infineon.com (172.23.29.42) by MUCSE822.infineon.com
 (172.23.29.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 1 Jul
 2026 11:49:07 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE816.infineon.com
 (172.23.29.42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 1 Jul
 2026 11:49:07 +0200
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.043; Wed, 1 Jul 2026 11:49:07 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <ronan.dalton@alliedtelesis.co.nz>
CC: <Aryan.Srivastava@alliedtelesis.co.nz>,
	<Chris.Packham@alliedtelesis.co.nz>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
	<mwalle@kernel.org>, <pratyush@kernel.org>, <richard@nod.at>,
	<vigneshr@ti.com>
Subject: RE: [PATCH v2 1/3] Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT
 support"
Thread-Topic: [PATCH v2 1/3] Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT
 support"
Thread-Index: AQHdBRKBdcAN9mfv+k6bdaeZDwvjfLZWt11QgADFb4CAAFitgP//+/8AgACbEMA=
Date: Wed, 1 Jul 2026 09:49:07 +0000
Message-ID: <490fc98b2996487fba3abd62176bb1dd@infineon.com>
References: <2b8390c0aaae4203af318f9a5edbb0eb@infineon.com>
 <20260701020856.217664-1-ronan.dalton@alliedtelesis.co.nz>
In-Reply-To: <20260701020856.217664-1-ronan.dalton@alliedtelesis.co.nz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_024914_411872_519F27F0 
X-CRM114-Status: GOOD (  23.39  )
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

Hi Ronan,

> Hi Takahiro,
> 
> > We don't add any FRAM chips in SPI-NOR...
> 
> The SPI-NOR subsystem has support for the cy15x104q chips, which are
> FRAM chips. There is also support for Everspin MRAM chips, which are
> comparible to FRAM (and are also of small size).
> 
> Because of this, we thought there was precident to add support for this
> chip. I was under the impression that the opcodes used to interact with
> the chip had a greater significance than the underlying technology used,
> and this chip fits in with the other spi-nor chips based on that. Feel
> free to correct me if I'm wrong here.
> 
> > > The use is for a small amount of additional storage separate to the main
> > > system NAND flash for some small "critical" files that we don't want to
> > > lose. We've been using devices like the mchp23lcv1024 and mr25h40 on
> > > other products for some time.
> > >
> > For that use, how about using tmpfs with NVMEM backup?
> 
> Could you elaborate on this? I'm familiar with tmpfs but not with using
> NVMEM as a backup for it. Is there some method of syncing a tmpfs to
> NVMEM that the kernel provides?
> 
I didn't mean any kernel features, but we can dump tmpfs contents
from/to FRAM chip (exposed as NVMEM device) by 'dd'. Doesn't it meet
your system's requirement?

> Thanks,
> Ronan.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
