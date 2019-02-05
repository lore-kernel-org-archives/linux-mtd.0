Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837E0C282D7
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 13:19:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 530632175B
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 13:19:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t36qv310"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 530632175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXZlWWNLzPRfZFpUI5l07I/fqTa4hFIO0F8OQU2Pn+I=; b=t36qv310Atsqnr
	1azdmkzUJEkJs3rvCNF4jCFC3Hj0TV6AITac11+3SniRRRWEW05ZmdtcgtX7/4IlFtC67T/U6yEve
	F/RfWRa8DNS8QbSe2DhYiBCjdVAMkKljlpOao/RUeRgeRg+7L8t77dFL7bt/1JPC0sl5E+IiyKIoO
	ZnMtzdx1TZ+riBvQ4rySNeClm3OT1ydy6zBYn1Iz7fhlfosVMdAIbZd+f7RJFSfaI1qeGTMFAsDGj
	OAQhK6JFcPlKuLmb4aC2uEEbpwkYYWiJCGQWo/SdcwEr020AQQhywdB7tAb86cM0rdoSMiER9UsEQ
	nPgmqVLT/gmIGJhU0m6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr0cw-0003lQ-Py; Tue, 05 Feb 2019 13:19:02 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr0cs-0003kP-DI
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 13:19:01 +0000
Received: from xps13 (aaubervilliers-681-1-80-177.w90-88.abo.wanadoo.fr
 [90.88.22.177]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id B7DB7240011;
 Tue,  5 Feb 2019 13:18:54 +0000 (UTC)
Date: Tue, 5 Feb 2019 14:18:53 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH] mtd: rawnand: denali_dt: remove single anonymous clock
 support
Message-ID: <20190205141853.4b7ed954@xps13>
In-Reply-To: <20190131182644.366a54a5@bbrezillon>
References: <1547539894-12898-1-git-send-email-yamada.masahiro@socionext.com>
 <20190115092229.59e09c2d@xps13>
 <CAK7LNATnfTQXHrXJQp7732-e7hvd8ORcYubyDmz0KHaRXRMDqQ@mail.gmail.com>
 <20190128112007.440046e6@xps13>
 <da2ea926-30e9-c7b9-8b1f-ee65ccc0fb7a@kernel.org>
 <20190131182644.366a54a5@bbrezillon>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_051858_596320_D4E401B5 
X-CRM114-Status: GOOD (  18.01  )
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
Cc: Dinh Nguyen <dinguyen@kernel.org>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRGluaCwKCkJvcmlzIEJyZXppbGxvbiA8YmJyZXppbGxvbkBrZXJuZWwub3JnPiB3cm90ZSBv
biBUaHUsIDMxIEphbiAyMDE5CjE4OjI2OjQ0ICswMTAwOgoKPiBIaSBEaW5oLAo+IAo+IE9uIFRo
dSwgMzEgSmFuIDIwMTkgMTE6MjQ6MTYgLTA2MDAKPiBEaW5oIE5ndXllbiA8ZGluZ3V5ZW5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gCj4gPiBPbiAxLzI4LzE5IDQ6MjAgQU0sIE1pcXVlbCBSYXluYWwg
d3JvdGU6ICAKPiA+ID4gSGkgRGluaCwKPiA+ID4gCj4gPiA+IE1hc2FoaXJvIFlhbWFkYSA8eWFt
YWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+IHdyb3RlIG9uIFdlZCwgMTYgSmFuCj4gPiA+IDIw
MTkgMTA6Mjc6MTEgKzA5MDA6Cj4gPiA+ICAgICAKPiA+ID4+ICgrQ0MgRGluaCBOZ3V5ZW4pCj4g
PiA+Pgo+ID4gPj4gT24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgNToyMiBQTSBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZTogICAgCj4gPiA+Pj4KPiA+ID4+PiBI
aSBNYXNhaGlybywKPiA+ID4+Pgo+ID4gPj4+IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2Fo
aXJvQHNvY2lvbmV4dC5jb20+IHdyb3RlIG9uIFR1ZSwgMTUgSmFuCj4gPiA+Pj4gMjAxOSAxNzox
MTozNCArMDkwMDoKPiA+ID4+PiAgICAgIAo+ID4gPj4+PiBDb21taXQgNmYxZmU5N2JlYzM0ICgi
bXRkOiByYXduYW5kOiBkZW5hbGlfZHQ6IGFkZCBtb3JlIGNsb2NrcyBiYXNlZAo+ID4gPj4+PiBv
biBJUCBkYXRhc2hlZXQiKSBpbnRyb2R1Y2VkIGEgbW9yZSBjb3JyZWN0IGJpbmRpbmcgdGhhdCBy
ZXF1aXJlcwo+ID4gPj4+PiB0aHJlZSBuYW1lZCBjbG9ja3MuCj4gPiA+Pj4+Cj4gPiA+Pj4+IE5v
dyB0aGF0IGFsbCB1cHN0cmVhbSBEVCBmaWxlcyBtaWdyYXRlZCBvdmVyIHRvIGl0LCByZW1vdmUg
dGhlIHNpbmdsZQo+ID4gPj4+PiBhbm9ueW1vdXMgY2xvY2sgc3VwcG9ydC4gICAgICAKPiA+ID4+
Pgo+ID4gPj4+IEkgd291bGQgbG92ZSB0byBkbyB0aGF0IGJ1dCBJIHRoaW5rIHRoaXMgaXMgYWdh
aW5zdCB0aGUgIkRUIGJhY2t3YXJkCj4gPiA+Pj4gY29tcGF0aWJpbGl0eSBydWxlIi4gICAgICAK
PiA+ID4+Cj4gPiA+PiBZZWFoLCBJIGtub3cgdGhpcyBydWxlLCBidXQgd2UgYnJlYWsgRFQgYmlu
ZGluZyBmcm9tIHRpbWUgdG8gdGltZS4KPiA+ID4+Cj4gPiA+Pgo+ID4gPj4gICAgCj4gPiA+Pj4g
QW55d2F5LCBJSVJDIGl0IGlzIGFjY2VwdGVkIHRoYXQgdGhpcyBraW5kIG9mCj4gPiA+Pj4gcnVs
ZSBtaWdodCBiZSBicm9rZW4gaWYgZGVjaWRlZCBwZXIgdGhlIGFyY2gtbWFpbnRhaW5lciAoaW4g
dGhpcwo+ID4gPj4+IGNhc2UsIHlvdSBJIHN1cHBvc2UpLiBTbyBpZiB0aGlzIGlzIHJlYWxseSB3
aGF0IHlvdSB3YW50LCBJJ2xsIHF1ZXVlCj4gPiA+Pj4gaXQuICAgICAgCj4gPiA+Pgo+ID4gPj4g
TXkgcGxhdGZvcm0gaXMgZmluZSwgYnV0IHRoaXMgZHJpdmVyIGlzIHVzZWQgYnkgU09DRlBHQSBi
b2FyZHMgYXMgd2VsbC4KPiA+ID4+Cj4gPiA+PiBJIENDZWQgdGhlIFNPQ0ZQR0EgbWFpbnRhaW5l
ciwgRGluaCBOZ3V5ZW4uCj4gPiA+PiAgICAKPiA+ID4gCj4gPiA+IEdlbnRsZSBwaW5nIG9uIHRo
aXMgdG9waWMuCj4gPiA+ICAgICAKPiA+IAo+ID4gVGhpcyBwYXRjaCBsb29rcyBmaW5lIHRvIGJl
LiBGZWVsIGZyZWUgdG8gYWRkOgo+ID4gCj4gPiBUZXN0ZWQtYnk6IERpbmggTmd1eWVuIDxkaW5n
dXllbkBrZXJuZWwub3JnPiAgCj4gCj4gSSB0aGluayBNaXF1ZWwgaXMgd2FpdGluZyBmb3IgYW4g
QWNrZWQtYnkgdG8gY29uZmlybSB0aGF0IHlvdSdyZSBva2F5Cj4gYnJlYWtpbmcgYmFja3dhcmQg
Y29tcGF0IHdpdGggb2xkIERULgoKWWVzLCBJIGFtIHdhaXRpbmcgZm9yIHlvdXIgQWNrZWQtYnku
CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
