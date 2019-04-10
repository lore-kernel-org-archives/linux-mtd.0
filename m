Return-Path: <SRS0=ukLJ=SM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AFAC10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 21:15:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B98A92082A
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 21:15:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sXEKJjfO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B98A92082A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BCROeKNE/1JY/ax7RxJjL9Enjubnrg3D6r1JtYGtONw=; b=sXEKJjfO9R8W3M
	4quPqsftCuLN/QzbrbBOK+dufEF+Gx6UmZuY1M8sUivsfBcPMNEterXHFnYYA7rSBuhvALzt7qcYc
	CY9Xn/mj30P5RM7i1PtqBfxgLYD+zawfaP84xSLmphT1eRmf5aztxdlh9ds9DgDbFphU6VamVyE4k
	XR1hzI7TWnLGGxgb1IsDpOXli//QF9oZ/DOuu0Z0ZXYZ7FuL4EemtqZ5xPiAmuSLaWdUTo6m7MnDh
	gXUI0XjnkUrrCgVGoJcTX/RVv9wWrK+F2k5vfEY70nAnx3yYncqvuR2kA2odbQSP6mcbTr2YCbmnj
	WDhMSngN4sU1ZK5c9gOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEKZF-00086j-0O; Wed, 10 Apr 2019 21:15:37 +0000
Received: from gateway30.websitewelcome.com ([192.185.148.2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEKZC-00085K-4b
 for linux-mtd@lists.infradead.org; Wed, 10 Apr 2019 21:15:35 +0000
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway30.websitewelcome.com (Postfix) with ESMTP id A18571656D
 for <linux-mtd@lists.infradead.org>; Wed, 10 Apr 2019 16:15:21 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id EKYzhN7WL2PzOEKYzhwiZ3; Wed, 10 Apr 2019 16:15:21 -0500
X-Authority-Reason: nr=8
Received: from [189.250.139.70] (port=43110 helo=[192.168.1.76])
 by gator4166.hostgator.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hEKYy-002ATJ-Re; Wed, 10 Apr 2019 16:15:20 -0500
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: Mark expected switch fall-throughs
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Tokunori Ikegami <ikegami.t@gmail.com>,
 'David Woodhouse' <dwmw2@infradead.org>,
 'Brian Norris' <computersforpeace@gmail.com>,
 'Boris Brezillon' <bbrezillon@kernel.org>,
 'Marek Vasut' <marek.vasut@gmail.com>, 'Richard Weinberger' <richard@nod.at>
References: <20190208180615.GA24601@embeddedor>
 <000001d4c051$9f66deb0$de349c10$@gmail.com>
 <807d4551-ec5e-5d99-2087-e72a2dcdf931@embeddedor.com>
Openpgp: preference=signencrypt
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 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
 VtSixD1uOgytAP7RWS474w==
Message-ID: <4e83c8d7-8d21-10ae-3cf4-5fbaa7b98cf4@embeddedor.com>
Date: Wed, 10 Apr 2019 16:15:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <807d4551-ec5e-5d99-2087-e72a2dcdf931@embeddedor.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.139.70
X-Source-L: No
X-Exim-ID: 1hEKYy-002ATJ-Re
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.76]) [189.250.139.70]:43110
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 7
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_141534_270156_D7EC0B32 
X-CRM114-Status: GOOD (  10.65  )
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

SGkgYWxsLAoKSWYgbm8gb25lIGNhcmVzIEknbGwgYWRkIHRoaXMgdG8gbXkgdHJlZSBmb3IgNS4y
LgoKVGhhbmtzCi0tCkd1c3Rhdm8KCk9uIDMvMjAvMTkgMzoxNiBQTSwgR3VzdGF2byBBLiBSLiBT
aWx2YSB3cm90ZToKPiBIaSBhbGwsCj4gCj4gRnJpZW5kbHkgcGluZzoKPiAKPiBXaG8gY2FuIHRh
a2UgdGhpcz8KPiAKPiBUaGFua3MKPiAtLQo+IEd1c3Rhdm8KPiAKPiBPbiAyLzkvMTkgMjoyOSBB
TSwgVG9rdW5vcmkgSWtlZ2FtaSB3cm90ZToKPj4gUmV2aWV3ZWQtYnk6IFRva3Vub3JpIElrZWdh
bWkgPGlrZWdhbWkudEBnbWFpbC5jb20+Cj4+Cj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQo+Pj4gRnJvbTogbGludXgtbXRkIFttYWlsdG86bGludXgtbXRkLWJvdW5jZXNAbGlzdHMuaW5m
cmFkZWFkLm9yZ10gT24gQmVoYWxmCj4+PiBPZiBHdXN0YXZvIEEuIFIuIFNpbHZhCj4+PiBTZW50
OiBTYXR1cmRheSwgRmVicnVhcnkgOSwgMjAxOSAzOjA2IEFNCj4+PiBUbzogRGF2aWQgV29vZGhv
dXNlOyBCcmlhbiBOb3JyaXM7IEJvcmlzIEJyZXppbGxvbjsgTWFyZWsgVmFzdXQ7IFJpY2hhcmQK
Pj4+IFdlaW5iZXJnZXIKPj4+IENjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgR3VzdGF2bwo+Pj4gQS4gUi4gU2lsdmEKPj4+IFN1
YmplY3Q6IFtQQVRDSF0gbXRkOiBjZmlfY21kc2V0XzAwMDI6IE1hcmsgZXhwZWN0ZWQgc3dpdGNo
IGZhbGwtdGhyb3VnaHMKPj4+Cj4+PiBJbiBwcmVwYXJhdGlvbiB0byBlbmFibGluZyAtV2ltcGxp
Y2l0LWZhbGx0aHJvdWdoLCBtYXJrIHN3aXRjaAo+Pj4gY2FzZXMgd2hlcmUgd2UgYXJlIGV4cGVj
dGluZyB0byBmYWxsIHRocm91Z2guCj4+Pgo+Pj4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgZm9sbG93
aW5nIHdhcm5pbmdzOgo+Pj4KPj4+IGRyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5j
OiBJbiBmdW5jdGlvbiDigJhnZXRfY2hpcOKAmToKPj4+IGRyaXZlcnMvbXRkL2NoaXBzL2NmaV9j
bWRzZXRfMDAwMi5jOjg3MDo2OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkKPj4+IGZhbGwg
dGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4+PiAgICBpZiAobW9kZSA9PSBGTF9S
RUFEWSAmJiBjaGlwLT5vbGRzdGF0ZSA9PSBGTF9SRUFEWSkKPj4+ICAgICAgIF4KPj4+IGRyaXZl
cnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jOjg3MzoyOiBub3RlOiBoZXJlCj4+PiAgIGRl
ZmF1bHQ6Cj4+PiAgIF5+fn5+fn4KPj4+IGRyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAw
Mi5jOiBJbiBmdW5jdGlvbiDigJhjZmlfYW1kc3RkX3N5bmPigJk6Cj4+PiBkcml2ZXJzL210ZC9j
aGlwcy9jZmlfY21kc2V0XzAwMDIuYzoyNzQ1OjE2OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBt
YXkKPj4+IGZhbGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4+PiAgICAgY2hp
cC0+c3RhdGUgPSBGTF9TWU5DSU5HOwo+Pj4gICAgIH5+fn5+fn5+fn5+fl5+fn5+fn5+fn5+fgo+
Pj4gZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmM6Mjc1MDozOiBub3RlOiBoZXJl
Cj4+PiAgICBjYXNlIEZMX1NZTkNJTkc6Cj4+PiAgICBefn5+Cj4+Pgo+Pj4gV2FybmluZyBsZXZl
bCAzIHdhcyB1c2VkOiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoPTMKPj4+Cj4+PiBUaGlzIHBhdGNo
IGlzIHBhcnQgb2YgdGhlIG9uZ29pbmcgZWZmb3J0cyB0byBlbmFibGluZwo+Pj4gLVdpbXBsaWNp
dC1mYWxsdGhyb3VnaC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZh
IDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgo+Pj4gLS0tCj4+PiAgZHJpdmVycy9tdGQvY2hpcHMv
Y2ZpX2NtZHNldF8wMDAyLmMgfCAyICsrCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAw
MDIuYwo+Pj4gYi9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYwo+Pj4gaW5kZXgg
NzI0MjhiNmJmYzQ3Li4wYjBhMTg3NGQzYmYgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL210ZC9j
aGlwcy9jZmlfY21kc2V0XzAwMDIuYwo+Pj4gKysrIGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2Nt
ZHNldF8wMDAyLmMKPj4+IEBAIC04NjksNiArODY5LDcgQEAgc3RhdGljIGludCBnZXRfY2hpcChz
dHJ1Y3QgbWFwX2luZm8gKm1hcCwgc3RydWN0IGZsY2hpcAo+Pj4gKmNoaXAsIHVuc2lnbmVkIGxv
bmcgYWRyCj4+PiAgCQkvKiBPbmx5IGlmIHRoZXJlJ3Mgbm8gb3BlcmF0aW9uIHN1c3BlbmRlZC4u
LiAqLwo+Pj4gIAkJaWYgKG1vZGUgPT0gRkxfUkVBRFkgJiYgY2hpcC0+b2xkc3RhdGUgPT0gRkxf
UkVBRFkpCj4+PiAgCQkJcmV0dXJuIDA7Cj4+PiArCQkvKiBmYWxsIHRocm91Z2ggKi8KPj4+Cj4+
PiAgCWRlZmF1bHQ6Cj4+PiAgCXNsZWVwOgo+Pj4gQEAgLTI3NDcsNiArMjc0OCw3IEBAIHN0YXRp
YyB2b2lkIGNmaV9hbWRzdGRfc3luYyAoc3RydWN0IG10ZF9pbmZvICptdGQpCj4+PiAgCQkJICog
YXMgdGhlIHdob2xlIHBvaW50IGlzIHRoYXQgbm9ib2R5IGNhbiBkbyBhbnl0aGluZwo+Pj4gIAkJ
CSAqIHdpdGggdGhlIGNoaXAgbm93IGFueXdheS4KPj4+ICAJCQkgKi8KPj4+ICsJCQkvKiBmYWxs
IHRocm91Z2ggKi8KPj4+ICAJCWNhc2UgRkxfU1lOQ0lORzoKPj4+ICAJCQltdXRleF91bmxvY2so
JmNoaXAtPm11dGV4KTsKPj4+ICAJCQlicmVhazsKPj4+IC0tCj4+PiAyLjIwLjEKPj4+Cj4+Pgo+
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4+PiBMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKPj4+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo+PgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
