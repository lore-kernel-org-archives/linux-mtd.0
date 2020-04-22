Return-Path: <SRS0=Xpy7=6G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F27BC5518B
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 15:36:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3B3B2076E
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 15:36:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NKlQsvXb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3B3B2076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4l+b9WyJk4VYqGtrB05gvmL/kC5QchIUd1FT8TWkr1c=; b=NKlQsvXbLmu8vK
	GVjYMaHokymln99JbmptBwdalWmV+lQLwHTdZCzNR7/Zau7VNe7fbOvLcvmzMTeQndeH570cnK9d8
	rlbJjRmFUtcmJ6bnp78BgUffUxOCywPmJcWTr+99lG99IHbF5uUPeKcNFPpbY0hgepzaTaYArnYoW
	YoqIn6e9auO5DsYo9kSfigH8lEnrDRgVZ86pD25xvGGg8V29GHT6MSnrCunf2kZpnJNjyocySccWX
	xorcQq6g6YBQppKAlgzKR596kkGzUf90TSHherKcp6o1hgQD4PjsofQQZiyb594KyeMudbAyirPcT
	cfNa3n92c/RbFXlAB5lA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRHQD-0005dt-Tp; Wed, 22 Apr 2020 15:36:21 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRHQ2-0005S7-6k
 for linux-mtd@lists.infradead.org; Wed, 22 Apr 2020 15:36:13 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2C69C20016;
 Wed, 22 Apr 2020 15:36:02 +0000 (UTC)
Date: Wed, 22 Apr 2020 17:36:00 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2] mtd: rawnand: denali: add more delays before
 latching incoming data
Message-ID: <20200422173600.304c7cf2@xps13>
In-Reply-To: <6093dfab-1e9e-824a-b639-33d340b377f9@denx.de>
References: <20200317071821.9916-1-yamada.masahiro@socionext.com>
 <6093dfab-1e9e-824a-b639-33d340b377f9@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_083610_401528_06A2B0AF 
X-CRM114-Status: GOOD (  17.52  )
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
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFyZWssCgpNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4gd3JvdGUgb24gV2VkLCAyMiBB
cHIgMjAyMCAxNzoyOTo1MyArMDIwMDoKCj4gT24gMy8xNy8yMCA4OjE4IEFNLCBNYXNhaGlybyBZ
YW1hZGEgd3JvdGU6Cj4gPiBUaGUgRGVuYWxpIElQIGhhdmUgc2V2ZXJhbCByZWdpc3RlcnMgdG8g
c3BlY2lmeSBob3cgbWFueSBjbG9jayBjeWNsZXMKPiA+IHNob3VsZCBiZSB3YWl0ZWQgYmV0d2Vl
biBmYWxsaW5nL3Jpc2luZyBzaWduYWxzLiBZb3UgY2FuIGltcHJvdmUgdGhlCj4gPiBOQU5EIGFj
Y2VzcyBwZXJmb3JtYW5jZSBieSBwcm9ncmFtbWluZyB0aGVzZSByZWdpc3RlcnMgd2l0aCBvcHRp
bWl6ZWQKPiA+IHZhbHVlcy4KPiA+IAo+ID4gQmVjYXVzZSBzdHJ1Y3QgbmFuZF9zZHJfdGltaW5n
cyByZXByZXNlbnRzIHRoZSBkZXZpY2UgcmVxdWlyZW1lbnQKPiA+IGluIHBpY28gc2Vjb25kcywg
ZGVuYWxpX3NldHVwX2RhdGFfaW50ZXJmYWNlKCkgY29tcHV0ZXMgdGhlIHJlZ2lzdGVyCj4gPiB2
YWx1ZXMgYnkgZGl2aWRpbmcgdGhlIGRldmljZSB0aW1pbmdzIHdpdGggdGhlIGNsb2NrIHBlcmlv
ZC4KPiA+IAo+ID4gTWFyZWsgVmFzdXQgcmVwb3J0ZWQgdGhpcyBkcml2ZXIgaW4gdGhlIGxhdGVz
dCBrZXJuZWwgZG9lcyBub3Qgd29yawo+ID4gb24gaGlzIFNPQ0ZQR0EgYm9hcmQuIChUaGUgb24t
Ym9hcmQgTkFORCBjaGlwIGlzIG1vZGUgNSkKPiA+IAo+ID4gVGhlIHN1c3BpY2lvdXMgcGFyYW1l
dGVyIGlzIGFjY19jbGtzLCBzbyB0aGlzIGNvbW1pdCByZWxheGVzIGl0Lgo+ID4gCj4gPiBUaGUg
RGVuYWxpIE5BTkQgRmxhc2ggTWVtb3J5IENvbnRyb2xsZXIgVXNlcidzIEd1aWRlIGRlc2NyaWJl
cyB0aGlzCj4gPiByZWdpc3RlciBhcyBmb2xsb3dzOgo+ID4gCj4gPiAgIGFjY19jbGtzCj4gPiAg
ICAgc2lnbmlmaWVzIHRoZSBudW1iZXIgb2YgYnVzIGludGVyZmFjZSBjbGtfeCBjbG9jayBjeWNs
ZXMsCj4gPiAgICAgY29udHJvbGxlciBzaG91bGQgd2FpdCBmcm9tIHJlYWQgZW5hYmxlIGdvaW5n
IGxvdyB0byBzZW5kaW5nCj4gPiAgICAgb3V0IGEgc3Ryb2JlIG9mIGNsa194IGZvciBjYXB0dXJp
bmcgb2YgaW5jb21pbmcgZGF0YS4KPiA+IAo+ID4gQ3VycmVudGx5LCBhY2NfY2xrcyBpcyBjYWxj
dWxhdGVkIG9ubHkgYmFzZWQgb24gdFJFQSwgdGhlIGRlbGF5IG9uIHRoZQo+ID4gY2hpcCBzaWRl
LiBUaGlzIGRvZXMgbm90IGluY2x1ZGUgYWRkaXRpb25hbCBkZWxheXMgdGhhdCBjb21lIGZyb20g
dGhlCj4gPiBkYXRhIHBhdGggb24gdGhlIFBDQiBhbmQgaW4gdGhlIFNvQywgbG9hZCBjYXBhY2l0
eSBvZiB0aGUgcGlucywgZXRjLgo+ID4gCj4gPiBUaGlzIHJlbGF0aXZlbHkgYmVjb21lcyBhIGJp
ZyBmYWN0b3Igb24gZmFzdGVyIHRpbWluZyBtb2RlcyBsaWtlIG1vZGUgNS4KPiA+IAo+ID4gQmVm
b3JlIHN1cHBvcnRpbmcgdGhlIC0+c2V0dXBfZGF0YV9pbnRlcmZhY2UoKSBob29rIChlLmcuIExp
bnV4IDQuMTIpLAo+ID4gdGhlIERlbmFsaSBkcml2ZXIgaGFja3MgYWNjX2Nsa3MgaW4gYSBjb3Vw
bGUgb2Ygd2F5cyBbMV0gWzJdIHRvIHN1cHBvcnQKPiA+IHRoZSB0aW1pbmcgbW9kZSA1Lgo+ID4g
Cj4gPiBXZSB3b3VsZCBub3QgZ28gYmFjayB0byB0aGUgaGFyZC1jb2RlZCBhY2NfY2xrcywgYnV0
IHdlIG5lZWQgdG8gaW5jbHVkZQo+ID4gdGhpcyBmYWN0b3IgaW50byB0aGUgZGVsYXkgc29tZWhv
dy4gTGV0J3Mgc2F5IHRoZSBhbW91bnQgb2YgdGhlIGFkZGl0aW9uYWwKPiA+IGRlbGF5IGlzIDEw
MDAwIHBpY28gc2VjLgo+ID4gCj4gPiBJbiB0aGUgbmV3IGNhbGN1bGF0aW9uLCBhY2NfY2xrcyBp
cyBkZXRlcm1pbmVkIGJ5IHRpbWluZ3MtPnRSRUFfbWF4ICsKPiA+IGRhdGFfc2V0dXBfb25faG9z
dC4KPiA+IAo+ID4gQWxzbywgcHJvbG9uZyB0aGUgUkUjIGxvdyBwZXJpb2QgdG8gbWFrZSBzdXJl
IHRoZSBkYXRhIGhvbGQgaXMgbWV0Lgo+ID4gCj4gPiBGaW5hbGx5LCByZS1jZW50ZXIgdGhlIGRh
dGEgbGF0Y2ggdGltaW5nIGZvciBleHRyYSBzYWZldHkuCj4gPiAKPiA+IFsxXSBodHRwczovL2dp
dGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi92NC4xMi9kcml2ZXJzL210ZC9uYW5kL2RlbmFs
aS5jI0wyNzYKPiA+IFsyXSBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi92
NC4xMi9kcml2ZXJzL210ZC9uYW5kL2RlbmFsaS5jI0wyODIKPiA+IAo+ID4gUmVwb3J0ZWQtYnk6
IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+ID4gU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8g
WWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4gIAo+IAo+IEkgdGVzdGVkIGl0
IG9uIHRoZSBBViBTb0NGUEdBLCB0aGlzIHNlZW1zIHRvIHdvcmssIHNvIGZlZWwgZnJlZSB0byBh
cHBseS4KCgpHcmVhdCEgVGhhbmtzIGEgbG90IGZvciB0ZXN0aW5nLCB3b3VsZCB5b3UgbWluZCBz
ZW5kaW5nIHlvdXIgVGVzdGVkLWJ5PwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
