Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7794DC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 20:19:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C53B2184D
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 20:19:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MnPmXebN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C53B2184D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AnUPQZE7atEwNJa1/7fbWFpaLukaFLyN317I7HWxSso=; b=MnPmXebN8rYZHA
	iCg7JFlBfc4Ekc8CDVurkGMwc9Z0VI7wSMzt4y4uFJZuebq0waTZHI4t1TnLstIVCbkVSa9ltdmg9
	TjHGRwsTNtliIOkmuG9rtlIWcXvuZPjoB5ji3jOmrMUoamovkqPxnkegyowD3l1dPZ+yLLsdeU3FM
	MSNERz0aCVsJNumfe0UcMxyZRV8J2Cx/b9jNAb7mfJCuNDqmp4gSCU3CMV8WHVgVwGe2XW6YTPQW8
	TEZ+X2rI1ZqCPl5+OR/tLsJ92FFXbal7je+fsMnGD1TdkV8TBPN5UEKNtO7jJRZGQaD05osBv+Y3z
	mXuDqFAIftb5r7+Zb/Gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6hgF-00017D-AD; Wed, 20 Mar 2019 20:19:19 +0000
Received: from gateway34.websitewelcome.com ([192.185.149.46])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6hgC-00016m-VX
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 20:19:17 +0000
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
 by gateway34.websitewelcome.com (Postfix) with ESMTP id 1D2AF78B9B9
 for <linux-mtd@lists.infradead.org>; Wed, 20 Mar 2019 15:19:16 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id 6hgBhuX644FKp6hgBh8B87; Wed, 20 Mar 2019 15:19:16 -0500
X-Authority-Reason: nr=8
Received: from [189.250.104.39] (port=34514 helo=[192.168.1.76])
 by gator4166.hostgator.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1h6hgB-003qGw-EJ; Wed, 20 Mar 2019 15:19:15 -0500
Subject: Re: [PATCH] mtd: phram: Mark expected switch fall-throughs
To: Joern Engel <joern@lazybastard.org>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
References: <20190208180911.GA32525@embeddedor>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Openpgp: preference=signencrypt
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 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
 VtSixD1uOgytAP7RWS474w==
Message-ID: <a5b310a1-d0ba-689b-100a-14a8204761a8@embeddedor.com>
Date: Wed, 20 Mar 2019 15:19:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190208180911.GA32525@embeddedor>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.104.39
X-Source-L: No
X-Exim-ID: 1h6hgB-003qGw-EJ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.76]) [189.250.104.39]:34514
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 37
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_131917_100779_8E702356 
X-CRM114-Status: GOOD (  16.20  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgYWxsLAoKRnJpZW5kbHkgcGluZzoKCldobyBjYW4gdGFrZSB0aGlzPwoKVGhhbmtzCi0tCkd1
c3Rhdm8KCk9uIDIvOC8xOSAxMjowOSBQTSwgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToKPiBJ
biBwcmVwYXJhdGlvbiB0byBlbmFibGluZyAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLCBtYXJrIHN3
aXRjaAo+IGNhc2VzIHdoZXJlIHdlIGFyZSBleHBlY3RpbmcgdG8gZmFsbCB0aHJvdWdoLgo+IAo+
IFRoaXMgcGF0Y2ggZml4ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nczoKPiAKPiBkcml2ZXJzL210
ZC9kZXZpY2VzL3BocmFtLmM6IEluIGZ1bmN0aW9uIOKAmHBhcnNlX251bTY04oCZOgo+IGRyaXZl
cnMvbXRkL2RldmljZXMvcGhyYW0uYzoxNDk6MTE6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1h
eSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQo+ICAgICAgc2hpZnQgKz0g
MTA7Cj4gICAgICB+fn5+fn5efn5+fgo+IGRyaXZlcnMvbXRkL2RldmljZXMvcGhyYW0uYzoxNTA6
NDogbm90ZTogaGVyZQo+ICAgICBjYXNlICdNJzoKPiAgICAgXn5+fgo+IGRyaXZlcnMvbXRkL2Rl
dmljZXMvcGhyYW0uYzoxNTE6MTE6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxsIHRo
cm91Z2ggWy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQo+ICAgICAgc2hpZnQgKz0gMTA7Cj4gICAg
ICB+fn5+fn5efn5+fgo+IGRyaXZlcnMvbXRkL2RldmljZXMvcGhyYW0uYzoxNTI6NDogbm90ZTog
aGVyZQo+ICAgICBjYXNlICdrJzoKPiAgICAgXn5+fgo+IAo+IFdhcm5pbmcgbGV2ZWwgMyB3YXMg
dXNlZDogLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD0zCj4gCj4gVGhpcyBwYXRjaCBpcyBwYXJ0IG9m
IHRoZSBvbmdvaW5nIGVmZm9ydHMgdG8gZW5hYmxpbmcKPiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdo
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRk
ZWRvci5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL2RldmljZXMvcGhyYW0uYyB8IDIgKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9kZXZpY2VzL3BocmFtLmMgYi9kcml2ZXJzL210ZC9kZXZpY2VzL3BocmFtLmMKPiBpbmRl
eCA5ZWUwNGI1ZjkzMTEuLjhhODYyN2MzMGFlZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9k
ZXZpY2VzL3BocmFtLmMKPiArKysgYi9kcml2ZXJzL210ZC9kZXZpY2VzL3BocmFtLmMKPiBAQCAt
MTQ3LDggKzE0NywxMCBAQCBzdGF0aWMgaW50IHBhcnNlX251bTY0KHVpbnQ2NF90ICpudW02NCwg
Y2hhciAqdG9rZW4pCj4gIAkJCXN3aXRjaCAodG9rZW5bbGVuIC0gMl0pIHsKPiAgCQkJY2FzZSAn
Ryc6Cj4gIAkJCQlzaGlmdCArPSAxMDsKPiArCQkJCS8qIGZhbGwgdGhyb3VnaCAqLwo+ICAJCQlj
YXNlICdNJzoKPiAgCQkJCXNoaWZ0ICs9IDEwOwo+ICsJCQkJLyogZmFsbCB0aHJvdWdoICovCj4g
IAkJCWNhc2UgJ2snOgo+ICAJCQkJc2hpZnQgKz0gMTA7Cj4gIAkJCQl0b2tlbltsZW4gLSAyXSA9
IDA7Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
