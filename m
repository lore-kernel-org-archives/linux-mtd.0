Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3A7D3C537
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2024 05:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uKAArym5oWROhi1jMHmaUsAoskX1U6y+YPwxw2qlah8=; b=vYkbJNraoKFJIn
	tj12NnVB4dhbQuqa7qqrVQN0V8nuSdgcmrYgZuZievpZ4UF6auIAkHcn9plxsfQIExhHyVlhIAcjf
	4akEwsTlIR7Bj/kJaMypgqrITgZvbbxgr2kj5uWNzCEzw2svF3/p31uTeIq+cxLoN+4bdTzS+VQ6f
	X3Pt2aXwzN+s509cxrorgKMpe4AGw9hnbex3YIaCrwRkRinAay0xi3LxctQdz6eCQhiCNiHHXQdKu
	R612LbA5/B4w8MMJ1sDcTaKfWV/dzd+zJYAXuxy7b3h/gdXFYFPIe5AvCoO13iyKaAhFqSylFou1f
	fBTe03tn3zrNqONEzpKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1f5o-0000000GuqC-2sXn;
	Fri, 18 Oct 2024 05:00:04 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1f5k-0000000GupK-3953
	for linux-mtd@lists.infradead.org;
	Fri, 18 Oct 2024 05:00:03 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3A16D2C011D;
	Fri, 18 Oct 2024 17:59:56 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1729227596;
	bh=dfKmpHpr76dWHkj8CFRXsuOKEzOkxqbniCqmbEn9apg=;
	h=From:To:CC:Subject:Date:From;
	b=E6iymVwqBUaS1//IYWS7dv9MmcfbuiN9CGaqJ1GDqKu9NKbhxvO9ByQTAAL1cLMFa
	 cSionFiQa+GNZR4yqHB2HVHD/ZLqHLxyFaAwJACZOaFupMiaRF1cuaw/OhAdO6N9V5
	 yLrNvIM60xIQqU/DJlyIrOvfF6pQ+xXZ9Bug0M9FhzdMmPex14PHBzWgK1mi3S8NTl
	 ps5/9jIZbLN/pNzXO+57BT0D/S4WQoSm6VXV+fUl25Zs3LbExGYqhQ+dyioOrdbglI
	 R0mNLdPNcX16hCPNajgRA4t/3NyPG/GX/fbai0dJ70mFzA3gRKP8WdxXDeSxr+dgnn
	 DtIZBCUThOgdg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6711eb4c0000>; Fri, 18 Oct 2024 17:59:56 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Oct 2024 17:59:56 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Fri, 18 Oct 2024 17:59:55 +1300
From: Joshua Scott <Joshua.Scott@alliedtelesis.co.nz>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>, "Tudor.Ambarus@microchip.com"
	<Tudor.Ambarus@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Possible incorrect byte-order for identity for cy15x104q SPI-FRAM
Thread-Topic: Possible incorrect byte-order for identity for cy15x104q
 SPI-FRAM
Thread-Index: AQHbIRcqXQ3HjhIJwECnEjsrpJbngA==
Date: Fri, 18 Oct 2024 04:59:55 +0000
Message-ID: <83d742648fef4e47b831ea697e553ead@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-NZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.32.1.11]
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=6711eb4c a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=8nJEP1OIZ-IA:10 a=DAUX931o1VcA:10 a=5debuBmyMlOHIHDrEskA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_220001_347067_790FDFBC 
X-CRM114-Status: GOOD (  12.07  )
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

Hi,

We are using a 512 KB FRAM chip, the CY15B104Q. (cy15x104q)

It appears that the ID in the spansion_nor_parts array does not match what we're getting from the chip.
The datasheet shows a 9-byte ID: 7f7f7f7f7f7fc22c<xx>, with the last byte varying by package/voltage/temperature range.

Looking at the kernel (currently running 6.6 LTS, but the value appears the same in the latest version), I see:

    { "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1)
                    FLAGS(SPI_NOR_NO_ERASE) },

However, the six bytes that are read from our chip are: 0x7f7f7f 0x7f7f7f

Locally, I've added an extra entry to the spansion_nor_parts[] list:

    { "cy15b104q",  INFO6(0x7f7f7f, 0x7f7f7f, 512 * 1024, 1)
                    FLAGS(SPI_NOR_NO_ERASE) },

And with this entry, the chip is detected and functions correctly.

My question is: Does the existing entry in the kernel work for anybody, or is it untested?
(If it does work for somebody, I'd guess it may only work for the low-voltage 'V' version of the chip that's the only one with '04' listed as the final byte in the datasheet)

I see back in 2020 some discussion around the byte order of the identity was made, when the chip was first added to the kernel. However, the conversation seemed to drop off without a conclusion about which was correct.

I'm not sure what the best resolution to this would be.Is there a way to specify an 8-byte identity instead of the 6-byte identity that is currently used? (leaving off the 9th package/voltage/temperature dependent final byte)


Thank you,
Joshua
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
