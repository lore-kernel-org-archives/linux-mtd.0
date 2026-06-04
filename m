Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEABDCD6E4A
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jun 2026 07:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gEdGMc+jrd780pPtW0r2m3EzDS/hFKFXpTm7bKbXjT4=; b=vqdTsDBtc7trK+
	kslnOaqYP6FJq7T/CTjHvhP5DbNr/M8Yykdjr2b+VlGa+qcFPGP8izoImSKkzGW8os4TD04X4msee
	8A9qS2ugZRKeCxJ75x6i96SyG5ieL7NSiGWfZEgDvFYsAHDNVT/JvcEozEgZrOND9hfGVO7R44i2X
	6YaKbIvj/Ynt7ASg6Qhyuts0Acld4G5u/6H7X1iB2/8lSNDLMcmFDPWUg9GCqmnvArLbgwcYJ9la+
	uVMrLQiHPZrLMOLg1XGpO8Rxazqum9tVwLMtwXREjSnMIhaJDM0Rlv9h7ySDG+Vkc682G+k2i/ZFS
	N8mafzgYfppxRM7h2ycA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2VL-0000000GJ1M-07pB;
	Thu, 04 Jun 2026 07:28:39 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2VI-0000000GJ0p-3HkU
	for linux-mtd@lists.infradead.org;
	Thu, 04 Jun 2026 07:28:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0CA894E40505;
	Thu,  4 Jun 2026 07:28:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D1AD45FEF7;
	Thu,  4 Jun 2026 07:28:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 456D4106A1395;
	Thu,  4 Jun 2026 09:28:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780558113; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=N3FYJH0Na6n0IvoTQRLh82Jz6KolB+LqBxz9CxTQz94=;
	b=dMdEvho48GdK6q0uOpDC6L/F42yGqD6zMP7d3/DWu1YG2xKyP41yvy8Ls25V2u26R+R6mw
	Ll8krPj+hKwrsNoDpMuj6gqO1kVC+8FcKaFegFHR63i2FrG67i9r6U8z8dRxVmTqI13OQA
	NX2h+kXu06x/b60IjPtlrP5XOA2ctB2D1VbJrrCyv+UqChU71mwngXqLITHqc0KydvPqmL
	cbnLanbbpXYvPYaGr97h/TB2WNJjKlhWQgdfl1rKPz0RdVX3ZtPAm+UGv36GIz2XtI32oW
	GfA4m28YL1V5ltQLEpS1UbcvdoPPjQ7phMVD5k/7mEnV5IG5CEJjfLEZJXDryg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Santhosh Kumar K <s-k6@ti.com>,  broonie@kernel.org,
  krzk+dt@kernel.org,  conor+dt@kernel.org,  richard@nod.at,
  vigneshr@ti.com,  pratyush@kernel.org,  mwalle@kernel.org,
  takahiro.kuwano@infineon.com,  linux-spi@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  praneeth@ti.com,  u-kumar1@ti.com,
  a-dutta@ti.com
Subject: Re: [PATCH v3 02/13] spi: dt-bindings: cdns,qspi-nor: add PHY
 tuning pattern partition property
In-Reply-To: <CAL_JsqJwxgcFOB=kE7bVQYDn740-w4RppMF5W-3Ne9=9qV9OrQ@mail.gmail.com>
	(Rob Herring's message of "Wed, 3 Jun 2026 12:38:46 -0500")
References: <20260527175527.2247679-1-s-k6@ti.com>
	<20260527175527.2247679-3-s-k6@ti.com>
	<20260602164945.GA475455-robh@kernel.org> <87zf1by5oc.fsf@bootlin.com>
	<CAL_JsqJwxgcFOB=kE7bVQYDn740-w4RppMF5W-3Ne9=9qV9OrQ@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 04 Jun 2026 09:28:29 +0200
Message-ID: <87cxy6ydb6.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_002836_959601_666B2058 
X-CRM114-Status: GOOD (  24.45  )
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

T24gMDMvMDYvMjAyNiBhdCAxMjozODo0NiAtMDUsIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+IHdyb3RlOgoKPiBPbiBXZWQsIEp1biAzLCAyMDI2IGF0IDExOjAx4oCvQU0gTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4+Cj4+IEhlbGxvLAo+Pgo+
PiBPbiAwMi8wNi8yMDI2IGF0IDExOjQ5OjQ1IC0wNSwgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4+Cj4+ID4gT24gV2VkLCBNYXkgMjcsIDIwMjYgYXQgMTE6MjU6MTZQTSAr
MDUzMCwgU2FudGhvc2ggS3VtYXIgSyB3cm90ZToKPj4gPj4gUEhZIHR1bmluZyByZXF1aXJlcyBh
IGtub3duIGRhdGEgcGF0dGVybiB0byBiZSByZWFkYWJsZSBmcm9tIGZsYXNoLgo+PiA+PiBXaGVu
IG5vIHBhcnRpdGlvbiBpcyBleHBsaWNpdGx5IGlkZW50aWZpZWQsIHRoZSBjb250cm9sbGVyIG11
c3Qgc2VhcmNoCj4+ID4+IGFsbCBhdmFpbGFibGUgcGFydGl0aW9ucyB0byBsb2NhdGUgdGhlIHBh
dHRlcm4gYnkgbGFiZWwsIHdoaWNoIGFkZHMKPj4gPj4gb3ZlcmhlYWQgYW5kIHJlbGllcyBvbiBs
YWJlbCBuYW1pbmcgY29udmVudGlvbnMgb3V0c2lkZSB0aGUKPj4gPj4gY29udHJvbGxlcidzIGNv
bnRyb2wuCj4+ID4KPj4gPiBJIGFncmVlICdsYWJlbCcgaXMgbm90IHRoZSBiZXN0IGNob2ljZS4g
U29mdHdhcmUgc2hvdWxkIG5vdCBjYXJlIHdoYXQKPj4gPiAnbGFiZWwnIGNvbnRhaW5zLiBJdCBz
aG91bGQgcmVhbGx5IGJlICdjb21wYXRpYmxlJyBpbnN0ZWFkLgo+Pgo+PiBCdXQgY29tcGF0aWJs
ZSBkb2VzIG5vdCBzZWVtIHJlbGV2YW50IGluIHRoaXMgY2FzZSwgcmlnaHQ/IFdlIGFyZSBqdXN0
Cj4+IGZsYWdnaW5nIHRoZSBsb2NhdGlvbiBvZiAic29tZSB1c2VmdWwgZGF0YSBmb3IgdGhlIGNv
bnRyb2xsZXIiLgo+Cj4gY29tcGF0aWJsZSBpcyB3aGF0IHRlbGxzIHVzIHdoYXQgYSByZWdpb24g
Y29udGFpbnMgYW5kIGhvdyB0byB1c2UgaXQuCj4gVGhhdCBzZWVtcyBleGFjdGx5IHdoYXQgd2Ug
bmVlZCB0byBkZWZpbmUgaGVyZS4KCldlIHVzdWFsbHkgdGFsayBhYm91dCAicHJvZ3JhbW1pbmcg
bW9kZWwiIHdoZW4gaXQgY29tZXMgdG8gY29tcGF0aWJsZSwKaGVyZSB3ZSBqdXN0IG5lZWQgdG8g
cG9pbnQgYXQgYW4gb2Zmc2V0IHdoaWNoIGlzIGluIG5vIHdheSBkaWZmZXJlbnQKKGZyb20gYSBo
YXJkd2FyZSBzdGFuZHBvaW50KSB0aGFuIHRoZSBvdGhlciBvZmZzZXRzLiBJIGhvbmVzdGx5IGZl
ZWwKbGlrZSBhIHBoYW5kbGUgcHJvcGVydHkgd291bGQgYmUgc2ltcGxlciwgYWxzbyBiZWNhdXNl
IGNvbXBhdGlibGVzIGluCk1URCBhcmUgYWxyZWFkeSBxdWl0ZSBjb21wbGV4IHRvIG1hbmFnZSBh
bmQgSSB3b3VsZCBwcmVmZXIgbm90IHRvIGFkZAptb3JlIGNvbXBsZXhpdHkgaW50byB0aGUgcGFy
c2luZyBsb2dpYy4KCj4+ID4+IEFkZCBjZG5zLHBoeS1wYXR0ZXJuLXBhcnRpdGlvbiwgYSBwaGFu
ZGxlIHByb3BlcnR5IHRoYXQgYWxsb3dzIHRoZSBEVAo+PiA+PiBhdXRob3IgdG8gZGlyZWN0bHkg
cmVmZXJlbmNlIHRoZSBmbGFzaCBwYXJ0aXRpb24gaG9sZGluZyB0aGUgUEhZIHR1bmluZwo+PiA+
PiBwYXR0ZXJuLiBUaGUgY29udHJvbGxlciB1c2VzIHRoaXMgcGFydGl0aW9uIGR1cmluZyBjYWxp
YnJhdGlvbiwgYXZvaWRpbmcKPj4gPj4gdGhlIHBhcnRpdGlvbiBzZWFyY2ggZW50aXJlbHkuCj4+
ID4KPj4gPiBEbyB5b3UgaGF2ZSBhbnkgZGF0YSB0aGF0IHRoaXMgYXBwcm9hY2ggYmVpbmcgImRp
cmVjdCIgaXMgZmFzdGVyPyBJbgo+PiA+IGZhY3QsIGl0IG1pZ2h0IGJlIHdvcnNlLiBJbnN0ZWFk
IG9mIHNlYXJjaGluZyBqdXN0IHRoZSBsaW1pdGVkIG51bWJlciBvZgo+PiA+IHBhcnRpdGlvbiBz
dWJub2RlcywgeW91IG5vdyBzZWFyY2ggdGhlIGVudGlyZSB0cmVlIGZvciBhIG1hdGNoaW5nCj4+
ID4gcGhhbmRsZSB2YWx1ZS4gV2UgZG8gaGF2ZSBwaGFuZGxlIGNhY2hpbmcsIHNvIHRoYXQgbWln
aHQgc2F2ZSB5b3UKPj4gPiBoZXJlLgo+Pgo+PiBUcnVlLCBidXQgYmVzaWRlcyBwZXJmb3JtYW5j
ZSBjb25zaWRlcmF0aW9ucywgSSBwZXJzb25hbGx5IGRvIG5vdCBmaW5kCj4+IGVsZWdhbnQgdXNp
bmcgYSBwYXJ0aXRpb24gbmFtZS9sYWJlbCwgYnV0IG1heWJlIHRoYXQncyBqdXN0IHBlcnNvbmFs
Cj4+IHRhc3RlIDotKQo+Cj4gSSBhZ3JlZS4gVGhhdCdzIHRydWUgZm9yIGFsbCB0aGUgcGFydGl0
aW9uIG5vZGVzIHdpdGggb25seSBub2RlIG5hbWUKPiBvciBsYWJlbCB0byBnbyBvbi4gV2Ugc2hv
dWxkIGZpeCB0aGF0IGF0IHRoZSBzb3VyY2UuIEhvd2V2ZXIsIHlvdQo+IGFscmVhZHkgaGF2ZSB0
byBzdXBwb3J0IHVzaW5nIGxhYmVsLAoKSHVtLCBubz8gVGhlcmUgaXMgZG93bnN0cmVhbSBzdXBw
b3J0IGZvciBsYWJlbHMgaW4gVEkga2VybmVscywgYnV0IHdlCmV4cGxpY2l0bHkgYXNrZWQgU2Fu
dGhvc2ggdG8gZHJvcCBpdCBmb3IgbWFpbmxpbmUgaW5jbHVzaW9uLiBIaXMgY29tbWl0Cm1lc3Nh
Z2UgbWF5IGJlIGEgYml0IG1pc2xlYWRpbmcgb24gdGhpcyByZWdhcmQgYmVjYXVzZSBoZSBpcyBt
ZW50aW9uaW5nCmxhYmVscyBsaWtlIGlmIHdlIHdlcmUgYWxyZWFkeSB1c2luZyB0aGVtLCBkZXNw
aXRlIHRoZSBmYWN0IHRoYXQgd2UgYXJlCm5vdC4KCj4gc28gYW55dGhpbmcgZWxzZSBpcyBzdXBw
b3J0aW5nIGEKPiAybmQgd2F5IHdoZXRoZXIgaXQgaXMgY29tcGF0aWJsZSBvciBhIHBoYW5kbGUg
cHJvcGVydHkuIElzIGl0IHJlYWxseQo+IHdvcnRoIGl0IGhlcmU/Cj4KPiBSb2IKClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
