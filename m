Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6B3C43334
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jul 2022 08:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ee5ixAhKnFvqbtS/wIH7reUM8SDoGnrpXZzfX5xrB+E=; b=yaVC4ccGArotWkpbKSoS4REHl2
	CtG73po/6xl02esaw6HruRNDews4c/Td/x4zUYRXzyjnI3Ic1XSj1frtKT6yF/m402um8HGI6wjJC
	Svs8FfeAo5l3d7zlGGFD0v43vvXvSET+c51S98NYR0u4O1ORv9X1GF4h0oIWp7ASVLem5NjtanWNV
	jlTvlJ12V+S17OpjAx+/TJegaXPCZzuqa4hG1/VietUjU4r4kCaPlWbmBPzQaNEgwsyH8FSNocC6K
	DWw6NJHzMEawE9VTU/E9ktN6rgnEh42GzoSIVrxXkoV+GQlRq0gnoA07pTfz7g1fmKRmgoogc0jPs
	A0tDtmRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFAX2-00HHpQ-Mi; Sat, 23 Jul 2022 08:30:40 +0000
Received: from mx01.omp.ru ([90.154.21.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFAWx-00HHae-Ib
	for linux-mtd@lists.infradead.org; Sat, 23 Jul 2022 08:30:40 +0000
Received: from [192.168.1.103] (31.173.80.87) by msexch01.omp.ru (10.188.4.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Sat, 23 Jul
 2022 11:30:17 +0300
Subject: Re: [PATCH 1/3] mtd: spi-nor: Use the spi-mem poll status APIs.
To: =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
	<tudor.ambarus@microchip.com>, <p.yadav@ti.com>, <michael@walle.cc>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<broonie@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <aidanmacdonald.0x0@gmail.com>,
	<tmn505@gmail.com>, <paul@crapouillou.net>, <dongsheng.qiu@ingenic.com>,
	<aric.pzqi@ingenic.com>, <rick.tyliu@ingenic.com>, <jinghui.liu@ingenic.com>,
	<sernia.zhou@foxmail.com>, <reimu@sudomaker.com>
References: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1658508510-15400-2-git-send-email-zhouyanjie@wanyeetech.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <1926ce77-6de0-0d87-d676-6ae93fa5c527@omp.ru>
Date: Sat, 23 Jul 2022 11:30:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1658508510-15400-2-git-send-email-zhouyanjie@wanyeetech.com>
Content-Language: en-US
X-Originating-IP: [31.173.80.87]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 07/23/2022 08:13:55
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 171890 [Jul 23 2022]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 493 493 c80a237886b75a8eec705b487193915475443854
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.80.87 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.80.87 in (user) dbl.spamhaus.org}
X-KSE-AntiSpam-Info: 	127.0.0.199:7.1.2;31.173.80.87:7.7.3,7.4.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1
X-KSE-AntiSpam-Info: {iprep_blacklist}
X-KSE-AntiSpam-Info: {Track_Chinese_Simplified, text}
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.80.87
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 07/23/2022 08:17:00
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 7/23/2022 6:36:00 AM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_013035_657404_99E1A4C7 
X-CRM114-Status: GOOD (  17.52  )
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

SGVsbG8hCgpPbiA3LzIyLzIyIDc6NDggUE0sIOWRqOeQsOadsCAoWmhvdSBZYW5qaWUpIHdyb3Rl
OgoKPiBXaXRoIGFkdmFuY2VkIGNvbnRyb2xsZXJzIChzdWNoIGFzIEluZ2VuaWMgU0ZDKSwgaXQg
aXMgcG9zc2libGUgdG8gcG9sbAo+IHRoZSBzdGF0dXMgcmVnaXN0ZXIgb2YgdGhlIGRldmljZS4g
VGhpcyBjb3VsZCBiZSBkb25lIHRvIG9mZmxvYWQgdGhlIENQVQo+IGR1cmluZyBhIGVyYXNlIG9y
IHdyaXRlIG9wZXJhdGlvbi4gTWFrZSB1c2Ugb2Ygc3BpLW1lbSBwb2xsIHN0YXR1cyBBUElzCj4g
dG8gaGFuZGxlIHRoaXMgZmVhdHVyZS4KPiAKPiBQcmV2aW91c2x5LCB3aGVuIGVyYXNpbmcgbGFy
Z2UgYXJlYSAoZS5nLiAzMk1pQiksIGluIG5vbi1vZmZsb2FkIGNhc2UsCj4gQ1BVIGxvYWQgY291
bGQgcmVhY2ggfjkwJSBhbmQgd291bGQgZ2VuZXJhdGUgfjMuOTIgbWlsbGlvbiBpbnRlcnJ1cHRz
LAo+IG5vdyBpdCBkZWNyZWFzZSB0byB+MTUlIENQVSBsb2FkIGFuZCAwLjE1IG1pbGxpb24gaW50
ZXJydXB0cy4KPiAKPiBUaGlzIHNob3VsZCBhbHNvIGZpeCB0aGUgaGlnaCBDUFUgdXNhZ2UgZm9y
IHN5c3RlbSB3aGljaCBkb24ndCBoYXZlIGEKPiBkZWRpY2F0ZWQgcG9sbCBzdGF0dXMgYmxvY2sg
bG9naWMgKGRlY3JlYXNlIHRvIH44MCUgQ1BVIGxvYWQgYW5kIH4xLjYxCj4gbWlsbGlvbiBpbnRl
cnJ1cHRzLikuCj4gCj4gU2lnbmVkLW9mZi1ieTog5ZGo55Cw5p2wIChaaG91IFlhbmppZSkgPHpo
b3V5YW5qaWVAd2FueWVldGVjaC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL3NwaS1ub3IvY29y
ZS5jIHwgNDIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJzL210ZC9zcGktbm9y
L2NvcmUuYwo+IGluZGV4IDUwMjk2N2MuLjZhMzExMzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9t
dGQvc3BpLW5vci9jb3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+IEBA
IC02MTcsMTkgKzYxNyw0MSBAQCBzdGF0aWMgaW50IHNwaV9ub3Jfd2FpdF90aWxsX3JlYWR5X3dp
dGhfdGltZW91dChzdHJ1Y3Qgc3BpX25vciAqbm9yLAo+ICAJdW5zaWduZWQgbG9uZyBkZWFkbGlu
ZTsKPiAgCWludCB0aW1lb3V0ID0gMCwgcmV0Owo+ICAKPiAtCWRlYWRsaW5lID0gamlmZmllcyAr
IHRpbWVvdXRfamlmZmllczsKPiArCWlmIChub3ItPnNwaW1lbSAmJiAhbm9yLT5wYXJhbXMtPnJl
YWR5KSB7Cj4gKwkJc3RydWN0IHNwaV9tZW1fb3Agb3AgPSBTUElfTUVNX09QKFNQSV9NRU1fT1Bf
Q01EKFNQSU5PUl9PUF9SRFNSLCAwKSwKPiArCQkJCQkJICAgICAgIFNQSV9NRU1fT1BfTk9fQURE
UiwKPiArCQkJCQkJICAgICAgIFNQSV9NRU1fT1BfTk9fRFVNTVksCj4gKwkJCQkJCSAgICAgICBT
UElfTUVNX09QX0RBVEFfSU4oMSwgbm9yLT5ib3VuY2VidWYsIDApKTsKCiAgIFN0cmFuZ2UgaW5k
ZW50YXRpb24uLi4KClsuLi5dCj4gKwkJcmV0dXJuIHNwaV9tZW1fcG9sbF9zdGF0dXMobm9yLT5z
cGltZW0sICZvcCwgU1JfV0lQLCAwLCAwLCAxMCwKPiArCQkJCQkJICAgICAgIGppZmZpZXNfdG9f
bXNlY3ModGltZW91dF9qaWZmaWVzKSk7CgogICBIZXJlIGFzIHdlbGwuLi4KClsuLi5dCgpNQlIs
IFNlcmdleQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
