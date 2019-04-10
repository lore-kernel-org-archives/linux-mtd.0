Return-Path: <SRS0=ukLJ=SM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B25C10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 21:15:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F19C32082A
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 21:15:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OBOjp77v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F19C32082A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TYawR1IZmC2DFg0arVCJrdqCBwXclgWNR9c/8i7l3aU=; b=OBOjp77vfJ/b7t
	barSHFNMEG9i32ll61q1mf9TyQUP9mZM/770vrYMR+MaDEPKTTiFSVEu81GbhnWtYopVwTITSktw+
	mRex8ZPM4P+UnRaLVk2ViEEpEma3C2gMZeRhVjeA6/WIidYS/5J0XVqNVyR4t+Z3XMxWtempsGPLH
	2D9OBjZ/oUxqwWyxWjvfacd40wI1IvVi0xKYvWUUaUaPKsWEs9wSB74+3u7tk8tzbSJtIKf93WLbD
	RbocmLYr3o+l3SK6dFUV3YnbcRHSQ3vRRqrbaa1puVTPXqDNUobPz+nQJkxKqEDDmdmWRZBAAjT6N
	pv9KNhQ75nQUF1261WJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEKZT-0008KO-O6; Wed, 10 Apr 2019 21:15:51 +0000
Received: from gateway20.websitewelcome.com ([192.185.59.4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEKZQ-0008Iq-3S
 for linux-mtd@lists.infradead.org; Wed, 10 Apr 2019 21:15:50 +0000
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway20.websitewelcome.com (Postfix) with ESMTP id 20B71400D34BA
 for <linux-mtd@lists.infradead.org>; Wed, 10 Apr 2019 16:15:47 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id EKZPhN7xn2PzOEKZPhwj0H; Wed, 10 Apr 2019 16:15:47 -0500
X-Authority-Reason: nr=8
Received: from [189.250.139.70] (port=43116 helo=[192.168.1.76])
 by gator4166.hostgator.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hEKZO-002AjI-LX; Wed, 10 Apr 2019 16:15:46 -0500
Subject: Re: [PATCH] mtd: lpddr_cmds: Mark expected switch fall-through
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
References: <20190208181210.GA8388@embeddedor>
 <c7b425ea-b5fd-6620-bead-10f8f4984ce1@embeddedor.com>
Openpgp: preference=signencrypt
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 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
 VtSixD1uOgytAP7RWS474w==
Message-ID: <1a963008-9f8a-834f-8c87-5641b653e06d@embeddedor.com>
Date: Wed, 10 Apr 2019 16:15:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c7b425ea-b5fd-6620-bead-10f8f4984ce1@embeddedor.com>
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
X-Exim-ID: 1hEKZO-002AjI-LX
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.76]) [189.250.139.70]:43116
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 15
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_141548_231651_99B0E816 
X-CRM114-Status: GOOD (  15.31  )
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
LgoKVGhhbmtzCi0tCkd1c3Rhdm8KCk9uIDMvMjAvMTkgMzoxNyBQTSwgR3VzdGF2byBBLiBSLiBT
aWx2YSB3cm90ZToKPiBIaSBhbGwsCj4gCj4gRnJpZW5kbHkgcGluZzoKPiAKPiBXaG8gY2FuIHRh
a2UgdGhpcz8KPiAKPiBUaGFua3MKPiAtLQo+IEd1c3Rhdm8KPiAKPiBPbiAyLzgvMTkgMTI6MTIg
UE0sIEd1c3Rhdm8gQS4gUi4gU2lsdmEgd3JvdGU6Cj4+IEluIHByZXBhcmF0aW9uIHRvIGVuYWJs
aW5nIC1XaW1wbGljaXQtZmFsbHRocm91Z2gsIG1hcmsgc3dpdGNoCj4+IGNhc2VzIHdoZXJlIHdl
IGFyZSBleHBlY3RpbmcgdG8gZmFsbCB0aHJvdWdoLgo+Pgo+PiBUaGlzIHBhdGNoIGZpeGVzIHRo
ZSBmb2xsb3dpbmcgd2FybmluZ3M6Cj4+Cj4+IGRyaXZlcnMvbXRkL2xwZGRyL2xwZGRyX2NtZHMu
YzogSW4gZnVuY3Rpb24g4oCYY2hpcF9yZWFkeeKAmToKPj4gZHJpdmVycy9tdGQvbHBkZHIvbHBk
ZHJfY21kcy5jOjMxOTo2OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdo
IFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KPj4gICAgaWYgKG1vZGUgPT0gRkxfUkVBRFkgJiYg
Y2hpcC0+b2xkc3RhdGUgPT0gRkxfUkVBRFkpCj4+ICAgICAgIF4KPj4gZHJpdmVycy9tdGQvbHBk
ZHIvbHBkZHJfY21kcy5jOjMyMjoyOiBub3RlOiBoZXJlCj4+ICAgZGVmYXVsdDoKPj4gICBefn5+
fn5+Cj4+Cj4+IFdhcm5pbmcgbGV2ZWwgMyB3YXMgdXNlZDogLVdpbXBsaWNpdC1mYWxsdGhyb3Vn
aD0zCj4+Cj4+IFRoaXMgcGF0Y2ggaXMgcGFydCBvZiB0aGUgb25nb2luZyBlZmZvcnRzIHRvIGVu
YWJsaW5nCj4+IC1XaW1wbGljaXQtZmFsbHRocm91Z2guCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEd1
c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+Cj4+IC0tLQo+PiAgZHJp
dmVycy9tdGQvbHBkZHIvbHBkZHJfY21kcy5jIHwgMSArCj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2xwZGRyL2xwZGRyX2Nt
ZHMuYyBiL2RyaXZlcnMvbXRkL2xwZGRyL2xwZGRyX2NtZHMuYwo+PiBpbmRleCBiMTM1NTdmZTUy
YmQuLjc2YTRjNzNlMTAwZSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvbHBkZHIvbHBkZHJf
Y21kcy5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL2xwZGRyL2xwZGRyX2NtZHMuYwo+PiBAQCAtMzE4
LDYgKzMxOCw3IEBAIHN0YXRpYyBpbnQgY2hpcF9yZWFkeShzdHJ1Y3QgbWFwX2luZm8gKm1hcCwg
c3RydWN0IGZsY2hpcCAqY2hpcCwgaW50IG1vZGUpCj4+ICAJCS8qIE9ubHkgaWYgdGhlcmUncyBu
byBvcGVyYXRpb24gc3VzcGVuZGVkLi4uICovCj4+ICAJCWlmIChtb2RlID09IEZMX1JFQURZICYm
IGNoaXAtPm9sZHN0YXRlID09IEZMX1JFQURZKQo+PiAgCQkJcmV0dXJuIDA7Cj4+ICsJCS8qIGZh
bGwgdGhyb3VnaCAqLwo+PiAgCj4+ICAJZGVmYXVsdDoKPj4gIHNsZWVwOgo+PgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
