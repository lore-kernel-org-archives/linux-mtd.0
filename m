Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D54C77B7A
	for <linux-mtd@archiver.kernel.org>; Tue, 16 May 2023 04:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HtYu9f9L0qo794LXZH2CdODAfrHdGqsukyvtptCSyos=; b=e951Km+RjyNyLt
	1LfpC5pafR4VpRTOs+6GHNsd/TFb2+IvFKekmB+T7lxPQjN/3dcceYKrv1QQoCMnlQltUAL0Qr+KC
	LCac+OxnqE4ZaSLdTeVY1T1KxN4h+gmQz2UsvcSW90qPBHS62EhcYvp5LI7j3EHUeJrwHFwLXTNCm
	V8PExXR4zyhCl5r7B7eE/oitpFmpIycPWQp2+dcwdDsXo9klNF+8++TTjnz2VRw2vw5T8fSVqFGI1
	bd3l5i/fvDmxN+yTHlWmDUNz6ZwxsXPh5BdjT7oA8dHD8+1eCLS3WKMmxVJ3Efw1tuIriITOQoXAq
	vatp8rKRrR1zB3KBwHrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pymaH-004M4v-2O;
	Tue, 16 May 2023 04:46:49 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pymaD-004M3P-29
	for linux-mtd@lists.infradead.org;
	Tue, 16 May 2023 04:46:48 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 0EE1D2C0274;
	Tue, 16 May 2023 16:46:39 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1684212399;
	bh=x1xSqqcIQxo4yHnGi/aeTOVQvkwH8+dImv0jo+KukAs=;
	h=From:To:CC:Subject:Date:From;
	b=KDqrgq9avkC0r2u2Gc2EzTLJ2Daq9hQsE6aKszFQGoqbMginDxK5b2/zspwixSMvH
	 zGpm769zCzmrKg/BLnQYz1h7/HGvZKL2WS9b/FcEqBOhsPNxLQRsEGAl+/TFFjFCOD
	 2XMdqy+mSHht0DeQW/yJ+aWLYwoXmbR1S8Alut2uQRrTDC4VioMXsGjBrHzqYhDXGI
	 atyvUDJeYKPrnVava8pr9+gvgqUxQLYfuS8iMhmnf/ZV44g15m6GqKK1UWY4z4Ozdy
	 8VgFGG/1fPcYE3ha5+WpyTfaJUPflx53AAMlYUhur6k9seGkcwgAYsfiBkLAadIp/Y
	 BwqHXfXz0qfUg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B64630aae0000>; Tue, 16 May 2023 16:46:38 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.26; Tue, 16 May 2023 16:46:38 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Tue, 16 May 2023 16:46:38 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.026; Tue, 16 May 2023 16:46:38 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Marvell NFC timings on CN9130
Thread-Topic: Marvell NFC timings on CN9130
Thread-Index: AQHZh7FmJPDyhVgaf0OyIHAzbKJ+ow==
Date: Tue, 16 May 2023 04:46:38 +0000
Message-ID: <17a9eee2-d84f-549d-a5ff-da88d43393c1@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-ID: <786D3EEAC51A214A804B27DB0F8E80E8@atlnz.lc>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=cLieTWWN c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=P0xRbXHiH_UA:10 a=V49VWFFmnWFogDPQAP4A:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_214646_205953_EB3AF832 
X-CRM114-Status: UNSURE (   9.07  )
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

Hi Miquel, Thomas,

A hardware colleague reported a concern to me about a new design we have 
using the Marvell CN9130 SoC (which I think was called Armada-8K before 
they rebranded).

Basically their concern is that the tWC timing they observe is faster 
(~18ns) than the documented minimum in the hardware datasheet for the 
CN9130 (25ns). Aside from not meeting the datasheet spec we've not 
observed any other issue (yet).

I notice in the marvell_nand.c driver that marvell_nfc_init() sets the 
NAND Clock Frequency Select bit (0xF2440700:0) to 1 which runs according 
to the datasheet the NAND flash at 400MHz . But the calculations in 
marvell_nfc_setup_interface() use the value from 
clk_get_rate(nfc->core_clk) which is still 250MHz so I'm wondering if 
maybe the fact that the NAND flash is being run faster is having an 
impact on timings that are calculated around the core_clk frequency.

Do you think that the timings calculations should take the NAND Clock 
Frequency Select setting into account?

Thanks,
Chris
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
