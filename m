Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87EDC4345F
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2024 08:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OF94NiUsQPM0C6Mx8u8MjZpcEu4FwUSG8XMnM/sNBnY=; b=uYhdnh6o86LZ9l
	xFHbKnTMUzxQvRVaGKKcqQCQxdIySP9Upc0NE77J+kPfwLKHholSiOgN2xoORWaSCBHByi7vXNc5T
	koMcXafT/Gg9nArCXHceI0nG/xTvrqYc9v91dn5YOmU+kEJ+e7Jzc4RIvCkLXacl7J3yJUpE2693Z
	eoNjK/d45E6dTcju9rbEhiaAwAhau2YEiEZS9vJjmNLfxM54gTiSB/PCh1kp7vEy3MtDR1f9lKc54
	/eH/9ZqvqvDnz6zDcxHL5RfThULsy9UCYqel7Iyru98PCBkKwrnrJmnUzgVb13AH0YlC0SKcC0WCd
	hSNhS63X9vl11DT6U1Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3u1l-00000006gwC-2Gzq;
	Mon, 06 May 2024 08:48:53 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3u1d-00000006gob-38BV;
	Mon, 06 May 2024 08:48:49 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 330DC120007;
	Mon,  6 May 2024 11:48:36 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 330DC120007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1714985316;
	bh=8cwbIcjblu4wOeTL1PzC2Bk4VwPtVX0H4EOc1bQEhQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=Fn/8o3+DgyUBAwln6bXs8pBXOnWmpmMHVQkW4HdPk9Yk/dgk+89nq4cVuozhCXOn6
	 xmNNWlLvL6easjk8KXBeg9K9hEe+eaplY0ua/bciaC6apHIBXlv3fQ8FfzwryXmkDl
	 lPEg4zDdCMlZSyixVL/scrfIFtirjNdp2pZ16xgBaavd7dLN/NodsuWk+xEP2PmkY2
	 CTX5+hLyA2WJw0onlXiUtpLQMmqPUluaPq08gIbEOGYKHgC+MVy/IWnNEOdVPInOEc
	 YaH7Zzd4wNtieopExVRu2rFHL1MXw7ju4aPz5BEQhSiMfv6R8rBQImxBSARvTaowYw
	 oFt4NsWg/Z7Hw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  6 May 2024 11:48:36 +0300 (MSK)
Received: from [172.28.226.125] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 6 May 2024 11:48:35 +0300
Message-ID: <c6af5c6d-0272-8c2b-00a3-29c20c3b7938@salutedevices.com>
Date: Mon, 6 May 2024 11:37:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 2/2] mtd: rawnand: meson: support R/W mode for boot ROM
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<oxffffaa@gmail.com>, <kernel@sberdevices.ru>
References: <20240416085101.740458-1-avkrasnov@salutedevices.com>
 <20240416085101.740458-3-avkrasnov@salutedevices.com>
 <2e5b39a1-ffe6-1186-2ce7-51b61c5006d3@salutedevices.com>
 <20240506104753.25e5f8cd@xps-13>
From: Arseniy Krasnov <avkrasnov@salutedevices.com>
In-Reply-To: <20240506104753.25e5f8cd@xps-13>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185070 [May 06 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 19 0.3.19 07c7fa124d1a1dc9662cdc5aace418c06ae99d2b, {Tracking_arrow_text}, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/06 05:16:00 #25106397
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_014846_589306_B9E75ACA 
X-CRM114-Status: UNSURE (   8.87  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAwNi4wNS4yMDI0IDExOjQ3LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNhbHV0ZWRldmljZXMuY29tIHdyb3RlIG9uIFRodSwgMiBNYXkgMjAy
NCAwODowOTozNCArMDMwMDoKPiAKPj4gSGVsbG8sIHNvcnJ5LCBwbHMgcGluZywgMiB3ZWVrcyA6
KQo+IAo+IEkgd2FzIG9uIHZhY2F0aW9uLCBJIGFtIGN1cnJlbnRseSBsYXRlIGJ5IDMwKyBwYXRj
aGVzLCB5b3VycyBpcyBvbiB0aGUKPiBsaXN0IDspCj4gCgpIaSEgQWggLCBvaywgbm8gcHJvYmxl
bSEgVGhhbmtzISA6KQoKVGhhbmtzLCBBcnNlbml5Cgo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
