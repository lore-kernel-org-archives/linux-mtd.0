Return-Path: <SRS0=sSnz=6B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E82AC2D0EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2020 15:44:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01FC920857
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2020 15:44:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z96nzc1U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01FC920857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0UGpvQrc2rik7lfrRJBnMEChgQ/CjdvgnvEq8qIJtQY=; b=Z96nzc1UiyVMyA
	1k1OfwLe7bBNPMY5SMwbUg2IfVu0z3BcElVa5RrpY34/NdScUnT+4F7FEX6+8nZ1I9ZZM7i1nDByg
	KTC5T+n66uI1ffF2z1b3InJ4v8VYqUKwNslR8QU93EoBpysrslkHba2h4JXHGs3DUXj9c9eLPD/Dd
	LKu+/X/B0qKViQDuRmqcw8GvY+L9geZlecc7B4abstF2HpaP8QoOjPT41AGbORwV7g5KzzN/SacwM
	yu7A7LhgkYv9uvLmD5sD8pFA1QnLs5AkZLJh5ZBLiX1vL5LR26ucXMhQVyTC+x1nUGlNWPeM+z6g6
	RssNNtR2y0FB6i80xadQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPTAh-0002bP-05; Fri, 17 Apr 2020 15:44:51 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPTAd-0002aI-NP
 for linux-mtd@lists.infradead.org; Fri, 17 Apr 2020 15:44:49 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 493gQ33mVFz1qs3y;
 Fri, 17 Apr 2020 17:44:43 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 493gQ31pDhz1qr4G;
 Fri, 17 Apr 2020 17:44:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id pu2rDxhfP016; Fri, 17 Apr 2020 17:44:41 +0200 (CEST)
X-Auth-Info: EiS9QEFo0KzXwC4rFmeq9CTThwEot7Y2z7NEORWW5mE=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 17 Apr 2020 17:44:41 +0200 (CEST)
Subject: Re: [PATCH v2 03/12] bus: stm32-fmc2-ebi: add STM32 FMC2 EBI
 controller driver
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-4-git-send-email-christophe.kerello@st.com>
 <20200416215328.53982fef@collabora.com>
 <e4a21df4-b01b-1215-7a3b-fea94f099b8f@st.com>
 <c69f86f4-5904-3f35-dac1-87080402a096@denx.de>
 <20200417174140.00456f36@collabora.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <53011403-49c4-dfcb-2f8c-11cf1ac5e2c1@denx.de>
Date: Fri, 17 Apr 2020 17:44:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200417174140.00456f36@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_084448_079471_5851D7DF 
X-CRM114-Status: GOOD (  20.03  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Christophe Kerello <christophe.kerello@st.com>, vigneshr@ti.com,
 tony@atomide.com, richard@nod.at, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 lee.jones@linaro.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gNC8xNy8yMCA1OjQxIFBNLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4gT24gRnJpLCAxNyBB
cHIgMjAyMCAxNzozMTo0OSArMDIwMAo+IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPiB3cm90
ZToKPiAKPj4gT24gNC8xNy8yMCA1OjI5IFBNLCBDaHJpc3RvcGhlIEtlcmVsbG8gd3JvdGU6Cj4+
Pgo+Pj4KPj4+IE9uIDQvMTYvMjAgOTo1MyBQTSwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOiAgCj4+
Pj4gT24gV2VkLCAxNSBBcHIgMjAyMCAxNzo1NzoyNyArMDIwMAo+Pj4+IENocmlzdG9waGUgS2Vy
ZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0LmNvbT4gd3JvdGU6Cj4+Pj4gIAo+Pj4+PiBUaGUg
ZHJpdmVyIGFkZHMgdGhlIHN1cHBvcnQgZm9yIHRoZSBTVE1pY3JvZWxlY3Ryb25pY3MgRk1DMiBF
QkkKPj4+Pj4gY29udHJvbGxlcgo+Pj4+PiBmb3VuZCBvbiBTVE0zMk1QIFNPQ3MuCj4+Pj4+Cj4+
Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxv
QHN0LmNvbT4KPj4+Pj4gVGVzdGVkLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4+
Pj4gLS0tCj4+Pj4+IENoYW5nZXMgaW4gdjI6Cj4+Pj4+IMKgIC0gY2FsbCAyIEFQSXMgdG8gbWFu
YWdlIEZNQzIgZW5hYmxlL2Rpc2FibGUgaW5zdGVhZCBvZiBvcHMKPj4+Pj4gwqAgLSBjYWxsIDIg
QVBJcyB0byBtYW5hZ2UgRk1DMiBOV0FJVCBzaGFyZWQgc2lnbmFsIGluc3RlYWQgb2Ygb3BzCj4+
Pj4+Cj4+Pj4+IMKgIGRyaXZlcnMvYnVzL0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAg
MTEgKwo+Pj4+PiDCoCBkcml2ZXJzL2J1cy9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqAgfMKgwqDC
oCAxICsKPj4+Pj4gwqAgZHJpdmVycy9idXMvc3RtMzItZm1jMi1lYmkuYyB8IDEwOTEKPj4+Pj4g
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrICAKPj4+Pgo+Pj4+IEht
LCBJIHNlZSB0aGF0IG90aGVyIG1lbW9yeSBidXMgY29udHJvbGxlciBkcml2ZXJzIGFyZSBwbGFj
ZWQgdW5kZXIKPj4+PiBkcml2ZXJzL21lbW9yeS8sIGFueSByZWFzb24gZm9yIGNob29zaW5nIGRy
aXZlcnMvYnVzLz8gSWYgdGhhdCdzIHdoZXJlCj4+Pj4gd2Ugd2FudCB0byBoYXZlIGFsbCBnZW5l
cmljIG1lbW9yeSBidXMgY29udHJvbGxlcnMgdG8gbGl2ZSBpdCBtaWdodCBiZQo+Pj4+IHdvcnRo
IG1vdmluZyBleGlzdGluZyBkcml2ZXJzIHRvIHRoZSBkcml2ZXJzL2J1cy8gZGlyZWN0b3J5IGF0
IHNvbWUKPj4+PiBwb2ludC4KPj4+PiAgCj4+Pgo+Pj4gSGkgQm9yaXMsCj4+Pgo+Pj4gSSBzZWUg
dGhpcyBjb250cm9sbGVyIGFzIGFuIGV4dGVybmFsIGJ1cyBpbnRlcmZhY2UgYXMgd2UgYXJlIGFi
bGUgdG8KPj4+IGF0dGFjaCBkaWZmZXJlbnQgZGV2aWNlcyBvbiBpdCwgbGlrZSBhIFBTUkFNLCBh
biBldGhlcm5ldCBjb250cm9sbGVyLCBhCj4+PiBGUEdBLCBhIExDRCBkaXNwbGF5LCAuLi4KPj4+
Cj4+PiBXaGVuIEkgaGFkIGEgbG9vayBhdCBidXMvS2NvbmZpZyBmaWxlLCBJIGhhdmUgZm91bmQg
c2ltaWxhciBkcml2ZXJzCj4+PiAobGlrZSBJTVhfV0VJTSBvciBRQ09NX0VCSTIgZHJpdmVycyku
IFRoZXNlIGRyaXZlcnMgYXJlIGFibGUgdG8gY29ubmVjdAo+Pj4gZGV2aWNlcyBsaWtlIE5BTkQg
Rmxhc2gsIFNSQU0sIGV0aGVybmV0IGFkYXB0ZXJzLCBGUEdBcyBhbmQgTENEIGRpc3BsYXlzCj4+
PiBhcyBpdCBpcyB3cml0dGVuIGluIHRoZSBLY29uZmlnIGZpbGUuCj4+Pgo+Pj4gQnV0LCBhZnRl
ciBjaGVja2luZyBtZW1vcnkvS2NvbmZpZyBmaWxlLCBpdCBpcyBhbHNvIHBvc3NpYmxlIHRvIGZp
bmQKPj4+IHNpbWlsYXIgZHJpdmVycyAobGlrZSBBVE1FTF9FQkkgZHJpdmVyIHRoYXQgaXMgaW5z
cGlyZWQgYnkgdGhlIFdFSU0gYnVzCj4+PiBkcml2ZXIpLgo+Pj4KPj4+IFNvLCBJIHdpbGwgZm9s
bG93IHRoZSByZWNvbW1lbmRhdGlvbiBhbmQgSSB3aWxsIG1vdmUgaXQgdG8KPj4+IGRyaXZlcnMv
bWVtb3J5IGZvbGRlciBpZiBpdCBpcyB0aGUgcGxhY2Ugd2hlcmUgdGhpcyBkcml2ZXIgc2hvdWxk
IGJlLiAgCj4+Cj4+IFRoZSBFQkkgaXNuJ3QgYSBtZW1vcnkgYnVzLCB5b3UgY2FuIHZlcnkgd2Vs
bCBoYXZlIGEgbm9uLW1lbW9yeSBkZXZpY2UsCj4+IGxpa2UgYW4gZXh0ZXJuYWwgcGFyYWxsZWwg
YnVzIG1lbW9yeSBjb250cm9sbGVyIG9uIGl0LiBTbyB3aHkgc2hvdWxkIGl0Cj4+IGJlIGluIGRy
aXZlcnMvbWVtb3J5ID8KPiAKPiBKdXN0IGxpa2UgbW9zdCBvZiB0aG9zZSBzby1jYWxsZWQgbWVt
b3J5IGJ1cyBjb250cm9sbGVycyB3ZSBoYXZlIHVuZGVyCj4gZHJpdmVycy9tZW1vcnkvID0+IHRo
ZXkgYXJlIG1vc3Qgb2YgdGhlIHRpbWUgdXNlZCB0byBpbnRlcmFjdCB3aXRoCj4gbWVtb3JpZXMg
YnV0IGNhbiBhbHNvIGJlIHVzZWQgZm9yIG90aGVyIHRoaW5ncyAoQ2hyaXN0b3BoZSBsaXN0ZWQg
YSBmZXcKPiB1c2VzIGNhc2VzKS4gQW5kIEknbSBub3QgcHVzaGluZyBvbmUgd2F5IG9yIHRoZSBv
dGhlciwgYWxsIEkgc2FpZCB3YXMKPiB0aGF0IHdlIHNob3VsZCBtYWtlcyB0aGluZ3MgY29uc2lz
dGVudCBpbnN0ZWFkIG9mIGhhdmluZyBoYWxmIG9mCj4gdGhvc2UgY29udHJvbGxlciBkcml2ZXJz
IGluIGRyaXZlcnMvbWVtb3J5LyBhbmQgdGhlIG90aGVyIGhhbGYgaW4KPiBkcml2ZXJzL2J1cy8u
CgpJIGFncmVlIHdpdGggdGhhdC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
