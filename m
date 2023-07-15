Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86402C0015E
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jul 2023 17:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hG1g164EQkPd2j9acR+VI3U8Xp2E0buzaFll/K3of0k=; b=VD+eVhkbnhEwg8
	eiZZS9q/+S1ZrrcqrHeYQyjMAbFyzo6EBgaxBmX11+xvh0Bauimr2uSaVmCc7WQry1X58JApiv42/
	vrzHqLRO7vYxs1Fbu/gKlsD0OAt13km18sE8Iiro1zgnXGYbmflsjuKeuZ+ed5wykyFn21Ju8Gf1B
	4Mz2OYrzDEpuZdLyRd6pgoFV6HXFvmiOVsupSz2/za7G7Wwtl0BNMP1p7o6RYKCMKHpme5FnVktq6
	Hzb1AnzYksKaoYrEewtNPxjYgM/BVufvkIVOdTpk+G0e16jnI/zqblUABQRfEPHBi7uX6kWsjjwu1
	PK7P8cYEs1DZ6sj691EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKjT3-009G6J-2t;
	Sat, 15 Jul 2023 17:54:05 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKjSy-009G4w-2Y;
	Sat, 15 Jul 2023 17:54:03 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id AE9E0100005;
	Sat, 15 Jul 2023 20:53:56 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru AE9E0100005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1689443636;
	bh=5ttxEKcHawm3oRMYZ4Ouli2azKIL2gurED8PaIq7bWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=R2R/SIo3MEqcWoNlvoAXJv2SJgfTyQ9c3kYcrQW2CbowGylAD5qmxiIeujrGS4Uhv
	 mfLQct59SUVaJc3L4lTUW9gizgm3j0jd0us1Y1CaPJaYSI7vpI+mY5/sjYe/nQEKcG
	 b0WB+lKWPH6Qo3guhnb+JuWC7F9uTrfPSDZPaF2lzADbtPjvpYpu50u76ENwKDbEaR
	 4AbMgeo91OsiM3J9jskPKHk/cJZ+E/r05A2vkKzzBxouRdUtDAAGR86e+pI2R126vx
	 gCaDs0IopaJaOq+fIA+dWTIFEMeKdf/DWcq8kpCKbMpJewwT8TyLFfVEnsaflywiSU
	 r8/7UgUpiqWcw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sat, 15 Jul 2023 20:53:56 +0300 (MSK)
Received: from [192.168.0.12] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Sat, 15 Jul 2023 20:53:13 +0300
Message-ID: <672e6a2f-21b3-77cd-fe83-04d4aa79f68e@sberdevices.ru>
Date: Sat, 15 Jul 2023 20:48:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v3 0/3] support 512B ECC step size for Meson NAND
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230711122129.2635558-1-AVKrasnov@sberdevices.ru>
 <20230715181553.1d2b5637@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230715181553.1d2b5637@xps-13>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178635 [Jul 15 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVKrasnov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 523 523 523027ce26ed1d9067f7a52a4756a876e54db27c, {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;100.64.160.123:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/15 16:31:00 #21619439
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_105401_548150_954D6261 
X-CRM114-Status: GOOD (  16.01  )
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

SGVsbG8gTWlxdWVsIQoKT24gMTUuMDcuMjAyMyAxOToxNSwgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBIaSBBcnNlbml5LAo+IAo+IEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBUdWUs
IDExIEp1bCAyMDIzIDE1OjIxOjI2ICswMzAwOgo+IAo+PiBIZWxsbywKPj4KPj4gdGhpcyBwYXRj
aHNldCBhZGRzIHN1cHBvcnQgZm9yIDUxMkIgRUNDIHN0ZXAgc2l6ZSBmb3IgTWVzb24gTkFORC4g
Q3VycmVudAo+PiBpbXBsZW1lbnRhdGlvbiBvbmx5IHN1cHBvcnRzIDEwMjRCLiBUaGVyZSBhcmUg
dGhyZWUgcGF0Y2hlczoKPj4KPj4gMSkgVXBkYXRlIGZvciBkZXZpY2UgdHJlZSBiaW5kaW5ncyB0
byByZXBsYWNlICdjb25zdCcgdHlwZSBvZiBmaWVsZAo+PiAgICAnbmFuZC1lY2Mtc3RlcC1zaXpl
JyB3aXRoICdlbnVtJyB3aGljaCBjb250YWlucyA1MTIgYW5kIDEwMjQuCj4+Cj4+IDIpIFVwZGF0
ZSBmb3IgZGV2aWNlIHRyZWUgYmluZGluZ3MgdG8gYWRkIGRlcGVuZGVuY3kgYmV0d2VlbiBwcm9w
ZXJ0aWVzCj4+ICAgICduYW5kLWVjYy1zdHJlbmd0aCcgYW5kICduYW5kLWVjYy1zdGVwLXNpemUn
Lgo+Pgo+PiAzKSBVcGRhdGUgZm9yIE1lc29uIGRyaXZlciAtIG5ldyBlbnVtIHZhbHVlIGZvciA1
MTJCIEVDQyBhbmQgcmV3b3JrZWQKPj4gICAgRUNDIGNhcGFiaWxpdGllcyBzdHJ1Y3R1cmUgdG8g
c3VwcG9ydCBib3RoIDUxMkIgYW5kIDEwMjRCIEVDQy4gQnkKPj4gICAgZGVmYXVsdCB0aGlzIGRy
aXZlciB1c2VzIDEwMjRCIEVDQywgNTEyQiBjb3VsZCBiZSBlbmFibGVkIGluIGRldmljZQo+PiAg
ICB0cmVlLgo+IAo+IFRoaXMgc2VyaWVzIGRvZXMgbm90IGFwcGx5IGNvcnJlY3RseSBvbiBuYW5k
L25leHQsIHdvdWxkIHlvdSBtaW5kCj4gcmViYXNpbmcgKG5hbmQvbmV4dCBvbiBsaW51eC1tdGQp
IGFuZCBzZW5kaW5nIGl0IGFnYWluPwoKU3VyZSwgYXMgSSBzZWUgMDAwMSB3YXMgYXBwbGllZCB0
byBuYW5kL25leHQsIHNvIEkgY2FuIHJlc2VuZCBvbmx5IDAwMDIgYW5kIDAwMDMsCmFzIDAwMDIg
aXMgdGhlIGZpcnN0IHBhdGNoIHdoaWNoIGZhaWxzIHRvIGFwcGx5PwoKPiAKPiBCVFcgdGhlICJy
ZmMiIHByZWZpeCBpcyBvbmx5IG5lZWRlZCBmb3IgdGhlICJmaXJzdCIgc3VibWlzc2lvbiwgd2hl
bgo+IHlvdSB0cnkgc29tZXRoaW5nICJuZXciLCBvdGhlcndpc2UgaXQgaXMgbm8gbG9uZ2VyIHJl
cXVpcmVkLgoKT2ssIGdvdCBpdAoKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKVGhhbmtzLCBBcnNl
bml5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
