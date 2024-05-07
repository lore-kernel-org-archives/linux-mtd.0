Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9613EC25B4F
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2024 08:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijfVaEz4I47d1ocvAkygB4JM6v8jkrIL/jkGqA7n+Xs=; b=kkjPkKxsb4qa4r
	iOFc2cwVzEHpGD/4JYj+mj94BbTKg+XImClgAKZiiAnsZeSXQNbf6hikRBUbcjq6T/+1pYjO7Uda1
	bn1+8lDPndyJGCSWO3p4G1+ZmF4mQrEhgUd65WCBlZgYjztqTt8YPw3vhMbafoxSqJ8GDHtcpnRjU
	j/JVx5IixL/RHBLdrFljtAGFxNai2Toz4tlBRW1P5t7K52mcizVWLDVg7lFoVQRFyQi+eXuf0sF2/
	8berZfMFrdFNIDzggJdbpLMokswtspwDsl1vOctff0gaW8xHO0QCzjjUvF5BRGTNrH3FZ15hVDElP
	xpcBHIbIQ/wQKi/MVecw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4G5r-0000000A7QO-0CTm;
	Tue, 07 May 2024 08:22:35 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4G5l-0000000A7P4-1353;
	Tue, 07 May 2024 08:22:32 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 394EC120005;
	Tue,  7 May 2024 11:22:24 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 394EC120005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715070144;
	bh=jIjPFNyzW7kNBJrUm409Uj7Pess/SCSFbd0CJs0Wv7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=m218MWw9r9laGjM9qXxEiNvkRidn7UgJrOg5Xu/R53VqsSkkAjlqB72B+mqRzdA0Q
	 NVrFk69LCvTkzDgE0LbBuSssB/Gb5/feiw4l4bKTGBZDHMEVqIcU8mHLzobM7NaQCp
	 BEfb8CYnn3y2QpLaM/SYHsu+oKgiDGO+9C6KfLhSXQg52k/e8IuBtYMk/n287owrOa
	 lHnn7uieKP8moEtvi//MPbVgtQl3HvE0rwDlswWileQq53n1NwMxfFc+C2U6unno1n
	 m1/rHO14QNofAwIWClT75WaRU1e7U9gZMxPwt67dlnhQkGIGGlzgxccLCgxKtfSWwr
	 ZzF5If/jer8lA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  7 May 2024 11:22:24 +0300 (MSK)
Received: from [172.28.226.125] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 7 May 2024 11:22:23 +0300
Message-ID: <771a35e4-db15-8c4d-29e9-7a984cb34abc@salutedevices.com>
Date: Tue, 7 May 2024 11:11:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 1/2] dt-bindings: mtd: amlogic,meson-nand: support
 fields for boot ROM code
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
 <20240416085101.740458-2-avkrasnov@salutedevices.com>
 <20240506154858.003bab54@xps-13>
 <d90f9d3d-7823-503f-4cc6-73783a083d0e@salutedevices.com>
 <20240507092726.4ab1afdb@xps-13>
 <e3ea7238-c80d-dfe9-28bf-df95708872d6@salutedevices.com>
 <20240507100553.31578d0d@xps-13>
From: Arseniy Krasnov <avkrasnov@salutedevices.com>
In-Reply-To: <20240507100553.31578d0d@xps-13>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185103 [May 07 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 19 0.3.19 07c7fa124d1a1dc9662cdc5aace418c06ae99d2b, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;100.64.160.123:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/07 06:33:00 #25113436
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_012229_978606_F0825156 
X-CRM114-Status: GOOD (  17.75  )
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

CgpPbiAwNy4wNS4yMDI0IDExOjA1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNhbHV0ZWRldmljZXMuY29tIHdyb3RlIG9uIFR1ZSwgNyBNYXkgMjAy
NCAxMDozNTo1MSArMDMwMDoKPiAKPj4gT24gMDcuMDUuMjAyNCAxMDoyNywgTWlxdWVsIFJheW5h
bCB3cm90ZToKPj4+IEhpIEFyc2VuaXksCj4+Pgo+Pj4gYXZrcmFzbm92QHNhbHV0ZWRldmljZXMu
Y29tIHdyb3RlIG9uIFR1ZSwgNyBNYXkgMjAyNCAwOTo1MzowNiArMDMwMDoKPj4+ICAgCj4+Pj4g
T24gMDYuMDUuMjAyNCAxNjo0OCwgTWlxdWVsIFJheW5hbCB3cm90ZTogIAo+Pj4+PiBIaSBBcnNl
bml5LAo+Pj4+Pgo+Pj4+PiBhdmtyYXNub3ZAc2FsdXRlZGV2aWNlcy5jb20gd3JvdGUgb24gVHVl
LCAxNiBBcHIgMjAyNCAxMTo1MTowMCArMDMwMDoKPj4+Pj4gICAgIAo+Pj4+Pj4gQm9vdCBST00g
Y29kZSBvbiBNZXNvbiByZXF1aXJlcyB0aGF0IHNvbWUgcGFnZXMgb24gTkFORCBtdXN0IGJlIHdy
aXR0ZW4KPj4+Pj4+IGluIHNwZWNpYWwgbW9kZTogInNob3J0IiBFQ0MgbW9kZSB3aGVyZSBlYWNo
IGJsb2NrIGlzIDM4NCBieXRlcyBhbmQKPj4+Pj4+IHNjcmFtYmxpbmcgbW9kZSBpcyBvbi4gICAg
Cj4+Pj4+Cj4+Pj4+IE9rCj4+Pj4+ICAgICAKPj4+Pj4+IFN1Y2ggcGFnZXMgbG9jYXRlZCB3aXRo
IHRoZSBzcGVjaWZpZWQgaW50ZXJ2YWwgd2l0aGluIHNwZWNpZmllZCBvZmZzZXQuICAgIAo+Pj4+
Pgo+Pj4+PiBJJ20gc29ycnkgSSBkb24ndCBnZXQgdGhhdCBzZW50ZW5jZS4gICAgCj4+Pj4KPj4+
PiBTb3JyeSwgSSBtZWFuIHRoaXMgKGxldCBtZSBkcmF3IDopICkgOgo+Pj4+Cj4+Pj4gWyBwYWdl
IDAgXVsgcGFnZSAxIF1bIHBhZ2UgMiBdWyBwYWdlIDMgXVsgcGFnZSA0IF1bIHBhZ2UgNSBdWyBw
YWdlIDYgXVsgcGFnZSA3IF1bIHBhZ2UgOCBdWyBwYWdlIDkgXQo+Pj4+Cj4+Pj4gRm9yIGV4YW1w
bGUsIHdlIGhhdmUgMTAgcGFnZXMgc3RhcnRpbmcgZnJvbSB0aGUgYmVnaW5uaW5nIG9mIHRoZSBj
aGlwIC0gdGhpcyBpcyAid2l0aGluIHNwZWNpZmllZCBvZmZzZXQiLAo+Pj4+IGUuZy4gb2Zmc2V0
IGlzIDEwLiBCb290Uk9NIG9uIGF4ZyBuZWVkcyB0aGF0IChmb3IgZXhhbXBsZSkgZXZlcnkgdGhp
cmQgcGFnZSBtdXN0IGJlIHdyaXR0ZW4gaW4gInNwZWNpYWwiCj4+Pj4gbW9kZTogc2NyYW1ibGlu
ZyBpcyBvbiBhbmQgRUNDIGlzIDM4NCBieXRlcy4gU3VjaCBwYWdlcyBhcmUgMCwgMiwgNCwgNiwg
OC4gRS5nLiAic3BlY2lmaWVkIGludGVydmFsIiB3aWxsCj4+Pj4gYmUgMy4gIAo+Pj4KPj4+IFNo
YWxsIGJlIDIsIG5vPyAgCj4+Cj4+IHllcywgc3RhcnRpbmcgZnJvbSAwIC0gdGhlbiAyLiBlLmcu
Cj4+IGlmICghKHBhZ2VfbnVtICUgMikpCj4+ICAgICBib290IFJPTSBuZWVkIHRoaXMgcGFnZQo+
Pgo+Pj4gICAKPj4+Pgo+Pj4+IFNvOgo+Pj4+Cj4+Pj4gYW1sb2dpYyxib290LXBhZ2VzOiAxMAo+
Pj4+IGFtbG9naWMsYm9vdC1wYWdlLXN0ZXA6IDMgIAo+Pj4KPj4+IE9rIEkgZ2V0IGl0LiBUaGFu
a3MgZm9yIHRoZSBleHBsYW5hdGlvbi4gSSBkb24ndCByZWFsbHkgdW5kZXJzdGFuZCB0aGUKPj4+
IGxvZ2ljIGJlaGluZCBpdCB0aG91Z2guIERvIHlvdSBrbm93IHdoeSB0aGUgYm9vdFJPTSB3b3Vs
ZCBhY2Nlc3Mgb25seQo+Pj4gb25lIHBhZ2Ugb3ZlciAyIG9yIDM/IElzIHRoZXJlIGEgZGVmYXVs
dCB2YWx1ZT8gSXMgdGhpcyBjb25maWd1cmFibGU/ICAKPj4KPj4gTm8sIGJvb3Qgcm9tIHNvdXJj
ZSBpcyBjbG9zZWQsIEkgZG9uJ3QgaGF2ZSBhY2Nlc3MgdG8gaXQuIEkgZ2V0IHRoaXMgbG9naWMK
Pj4gZnJvbSBvbGQgdmVyc2lvbiBvZiB2ZW5kb3IncyB1Ym9vdCAtIGluIHByYWN0aWNlIHRoZXkg
dXNlIG5vbiAyIG9yIDMsIHRoZXkKPj4gdXNlIGhhcmRjb2RlZCAxMjggc3RlcCB2YWx1ZS4gQW5k
IGFtbG9naWMsYm9vdC1wYWdlcyBpcyAxMDI0Cj4gCj4gRmVlbHMgbGlrZSB0aGV5IGFyZSB0cnlp
bmcgdG8gdXNlIG9ubHkgdGhlIGZpcnN0IHBhZ2Ugb2YgZWFjaCBibG9jaywgbm8/Cj4gCj4gVGhh
dCdzIHZlcnkgd2VpcmQgYnV0IEkgdW5kZXJzdGFuZCBiZXR0ZXIuCgpBIGxpdHRsZSBiaXQgbm8s
IHRoZXkgdXNlIGV2ZXJ5IDEyOCBwYWdlIGluIHJhbmdlIFswLCAxMDI0XSBwYWdlcy4gRS5nLiB0
aGVyZSB3aWxsCmJlIDggc3VjaCBwYWdlczoKMAoxMjgKMjU2CjUxMgo2NDAKNzY4Cjg5NgoxMDI0
CgpUaGV5IHdyaXRlIHNvbWUgbWV0YWRhdGEgYWJvdXQgU29DIHRvIHN1Y2ggcGFnZXMuCgpUaGFu
a3MsIEFyc2VuaXkKCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
