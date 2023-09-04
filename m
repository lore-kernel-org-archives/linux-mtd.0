Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0ECC83F33
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Sep 2023 14:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQ2PqUROcixcVK+gfJ9f1+vn2PhnI41BMBLfQ7aCrvY=; b=gZtwVuhs5kmvsO
	pGyjXgsqqEexh+WWuOEH7ntsNH7LZe2ZjazDFjZOC2NChrVmWvM8wfD0tnjq1m3KTBj9rXI8lRqk9
	b34B2I51ogZ1vX3V5vDvHm7RGaFBouOcV0vqbqJy4Fe1eiTz3y+rVeKYPCNvNv9C8buS7UISWsveY
	s1RSm1/hrP3gH7LwrvetIXYJ4S60bwMoVpb8AHbMOccShJopye3YtItQIVrvTd2PNQCxe6zuO/5h2
	fPZogQcoVnlT2zIbwx7UfKxhs5ONUAeRWAn2ASFqdWJSSVTBZ0XgmUiI1L5mcxeRxPqTAHIBaEQGg
	L3wnCvEzYy45RXjqMh2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdASA-004GHd-1X;
	Mon, 04 Sep 2023 14:21:22 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdAS5-004GGC-2M
	for linux-mtd@lists.infradead.org;
	Mon, 04 Sep 2023 14:21:20 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id E4924100006;
	Mon,  4 Sep 2023 17:21:00 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru E4924100006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1693837260;
	bh=K5PBNaEmVwQgh+6nGxCDIICD8oocRdp+hUWhXTnxwNc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type:From;
	b=WFvefeOXqRQ1KVlw/NKqBA5QtXZ8OJWV0iXBX+N6MJgdiIhYS62bo8C4j8ALDzkiv
	 +1gvdehgu5frKMYrEUr+/1i2B1iQvR3DHehb9B7/s1FWzspU4jTKfLrBpinsap8m3f
	 jPKnGvTafSfb7Vmh2Fw/YYUtN/oyTCljJbA/fhCx9oFfKnvK/n8ntZj/VETE9GMA1r
	 s5Q3gfoDhZK3DQV6n8EOPrrLHp9R26u7S+VfhAi75JZzCYEUZjcuaVyXAVZv73A4cG
	 JcrLgEGmlT4zMzFd4vbgjpR5r+Jlqm35ndSx3cS6UlWB2bvbZYtMj0LK3qimaffSvD
	 AXNeBo6YuhCJg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  4 Sep 2023 17:21:00 +0300 (MSK)
Received: from [192.168.1.146] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 4 Sep 2023 17:20:59 +0300
Message-ID: <90a53eda-bbeb-dffa-0f90-6fd229f555e6@sberdevices.ru>
Date: Mon, 4 Sep 2023 17:20:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 2/2] mtd: spinand: micron: fixing the offset for OOB
From: Martin Kurbanov <mmkurbanov@sberdevices.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <kernel@sberdevices.ru>
References: <20230822122534.872646-1-mmkurbanov@sberdevices.ru>
 <20230822122534.872646-3-mmkurbanov@sberdevices.ru>
 <20230822153556.630e65b9@xps-13>
 <01925ff8-1d19-a729-429a-89866fad319f@sberdevices.ru>
 <20230823104143.760cc5bc@xps-13>
 <f873d775-cda9-302d-a651-0113c7c7dc84@sberdevices.ru>
 <20230823133956.0a505a20@xps-13>
 <ccf3099f-0e10-a87c-be83-4a414f01dca7@sberdevices.ru>
Content-Language: en-US
In-Reply-To: <ccf3099f-0e10-a87c-be83-4a414f01dca7@sberdevices.ru>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 179629 [Sep 04 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 529 529 a773548e495283fecef97c3e587259fde2135fef, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;sberdevices.ru:5.0.1,7.1.1, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/09/04 08:01:00 #21789634
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_072118_525878_6C689316 
X-CRM114-Status: GOOD (  16.97  )
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

SGkgTWlxdWVsLAoKT24gMjQuMDguMjAyMyAxMjozNSwgTWFydGluIEt1cmJhbm92IHdyb3RlOgo+
IAo+IAo+IE9uIDIzLjA4LjIwMjMgMTQ6MzksIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+IEhpIE1h
cnRpbiwKPj4KPj4gbW1rdXJiYW5vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBXZWQsIDIzIEF1
ZyAyMDIzIDE0OjMzOjU3ICswMzAwOgo+Pgo+Pj4gSGkgTWlxdWVsLAo+Pj4KPj4+IE9uIDIzLjA4
LjIwMjMgMTE6NDEsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+Pj4gSGkgTWFydGluLAo+Pj4+Cj4+
Pj4gSSBkb24ndCB0aGluayB0aGUgZm91ciBieXRlcyBoYXZlIGFueSAiYmFkIGJsb2NrIHNwZWNp
ZmljIiBtZWFuaW5nLiBJbgo+Pj4+IHByYWN0aWNlLCB0aGUgZGF0YXNoZWV0IHN0YXRlczoKPj4+
Pgo+Pj4+IAlWYWx1ZSBwcm9ncmFtbWVkIGZvciBiYWQgYmxvY2sgYXQgdGhlIGZpcnN0IGJ5dGUg
b2Ygc3BhcmUKPj4+PiAJYXJlYTogMDBoCj4+Pj4KPj4+PiBTbyBvbmx5IHRoZSBmaXJzdCBieXRl
IGlzIHVzZWQgdG8gbWFyayB0aGUgYmxvY2sgYmFkLCB0aGUgcmVzdCBpcwo+Pj4+IHByb2JhYmx5
IG1hcmtlZCAicmVzZXJ2ZWQiIGZvciBzaW1wbGljaXR5LiBJIGJlbGlldmUgd2Ugc2hvdWxkIGtl
ZXAgdGhlCj4+Pj4gY3VycmVudCBsYXlvdXQgYmVjYXVzZSBpdCB3b3VsZCBvdGhlcndpc2UgYnJl
YWsgdXNlcnMgZm9yIG5vIHJlYWwKPj4+PiByZWFzb24uICAKPj4+Cj4+PiBJIGFncmVlIHdpdGgg
eW91IHRoYXQgdGhpcyBjYW4gYnJlYWsgdGhlIHdvcmsgb2YgdXNlcnMgd2hvIHVzZSBPT0IuCj4+
PiBIb3dldmVyLCBJIGJlbGlldmUgaXQgd291bGQgYmUgbW9yZSBhcHByb3ByaWF0ZSB0byB1c2Ug
YW4gb2Zmc2V0IG9mIDQsCj4+PiBhcyB0aGUgbWljcm9uIGNoaXAgY2FuIHVzZSBhbGwgNCBieXRl
cyBmb3IgYWRkaXRpb25hbCBkYXRhIGFib3V0IHRoZQo+Pj4gYmFkIGJsb2NrLiBTbywgdGhlcmUg
aXMgYSBub24temVybyBwcm9iYWJpbGl0eSBvZiBsb3NpbmcgT09CIGRhdGEgaW4KPj4+IHRoZSBy
ZXNlcnZlZCBhcmVhICgyIGJ5dGVzKSB3aGVuIHRoZSBoYXJkd2FyZSBjaGlwIGF0dGVtcHRzIHRv
IG1hcmsKPj4+IHRoZSBibG9jayBhcyBiYWQuCj4+Cj4+IElzIHRoaXMgcmVhbGx5IGEgcHJvY2Vz
cyB0aGUgY2hpcCBjYW4gZG8/IEFyZW4ndCBiYWQgYmxvY2tzIGZhY3RvcnkKPj4gbWFya2VkIG9u
bHk/Cj4gCj4gQWN0dWFsbHksIHRoZXJlIGlzIG15IHVuZGVyc3RhbmRpbmcsIEnigJltIG5vdCBz
dXJlIGV4YWN0bHkuCgpJIHRlc3RlZCB3aXRoIGFuIG9mZnNldCBvZiAyLCBubyByZWFkL3dyaXRl
IGVycm9ycyB3ZXJlIGRldGVjdGVkCihpbmNsdWRpbmcgcmVhZC93cml0ZSB0byBPT0IpLiBCdXQg
SSBkb24ndCBoYXZlIGEgZmxhc2ggY2hpcCB3aXRoCmZhY3RvcnkgYmFkIGJsb2NrcyB5ZXQsIHdo
ZW4gSSBmaW5kIHN1Y2ggYSBmbGFzaCwgSSB3aWxsIHJlcG9ydCB0aGUKcmVzdWx0cy4KRG8gSSBu
ZWVkIHRvIHNlbmQgdGhlIHYzIG9mIHRoZSBwYXRjaCB3aXRoIG9ubHkgZmlyc3QgY29tbWl0ICgi
Y29ycmVjdApiaXRtYXNrIGZvciBlY2Mgc3RhdHVzIik/CgotLSAKQmVzdCBSZWdhcmRzLApNYXJ0
aW4gS3VyYmFub3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
