Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A158AC54FD0
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 15:39:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4776420656
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 15:39:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rKboozW9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4776420656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m/pKcMiP0h6TePB1uzVvJ+C8waEBhOx2RXnmeffX6AA=; b=rKboozW98PDCpj
	tdKjU81PyIAaCnTcTUU631hOMSRhbchgZaKrg7UoMX8qUmc04+SkV1VpNYuGhSuZrtTdTDFkIWSg5
	g/E5qg95b28TnTYwktYdjNvmR1tJOY4d31vD5ARB/BC9D20pvOQ8ynQ/TiF7JbsFW7h9/QK0JlIHD
	JdzWUg4ng5VTdm9pArqu+Y6WzsZO59HC2AV5ZLZ/paigluzO7RstwMBERu149Z3O0OdLoDSlWamQu
	89eYLpd63ndKJGCU5B63JMpyJX9D1Cm5itGXYL10AVw7pgLuAE5sH/mPhd61IGB97F58G9W3A/jG2
	ssS9jNCO/JMEBUWoSVwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT5qX-0001Li-9b; Mon, 27 Apr 2020 15:39:01 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT5qR-0001Eo-Dh
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 15:38:57 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2D5C0C0011;
 Mon, 27 Apr 2020 15:38:48 +0000 (UTC)
Date: Mon, 27 Apr 2020 17:38:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200427173846.3866c506@xps13>
In-Reply-To: <20200418105533.477ce529@collabora.com>
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200418105533.477ce529@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_083855_606112_47F91E9A 
X-CRM114-Status: GOOD (  14.90  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 andriy.shevchenko@intel.com, anders.roxell@linaro.org, vigneshr@ti.com,
 arnd@arndb.de, hauke.mehrtens@intel.com, richard@nod.at, qi-ming.wu@intel.com,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, tglx@linutronix.de,
 masonccyang@mxic.com.tw, piotrs@cadence.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBTYXQsIDE4IEFwcgoyMDIwIDEwOjU1OjMzICswMjAwOgoKPiBPbiBGcmksIDE3
IEFwciAyMDIwIDE2OjIxOjQ3ICswODAwCj4gIlJhbXV0aGV2YXIsVmFkaXZlbCBNdXJ1Z2FuWCIK
PiA8dmFkaXZlbC5tdXJ1Z2FueC5yYW11dGhldmFyQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4g
Cj4gPiBGcm9tOiBSYW11dGhldmFyIFZhZGl2ZWwgTXVydWdhbiA8dmFkaXZlbC5tdXJ1Z2FueC5y
YW11dGhldmFyQGxpbnV4LmludGVsLmNvbT4KPiA+IAo+ID4gVGhpcyBwYXRjaCBhZGRzIHRoZSBu
ZXcgSVAgb2YgTmFuZCBGbGFzaCBDb250cm9sbGVyKE5GQykgc3VwcG9ydAo+ID4gb24gSW50ZWwn
cyBMaWdodG5pbmcgTW91bnRhaW4oTEdNKSBTb0MuCj4gPiAKPiA+IERNQSBpcyB1c2VkIGZvciBi
dXJzdCBkYXRhIHRyYW5zZmVyIG9wZXJhdGlvbiwgYWxzbyBETUEgSFcgc3VwcG9ydHMKPiA+IGFs
aWduZWQgMzJiaXQgbWVtb3J5IGFkZHJlc3MgYW5kIGFsaWduZWQgZGF0YSBhY2Nlc3MgYnkgZGVm
YXVsdC4KPiA+IERNQSBidXJzdCBvZiA4IHN1cHBvcnRlZC4gRGF0YSByZWdpc3RlciB1c2VkIHRv
IHN1cHBvcnQgdGhlIHJlYWQvd3JpdGUKPiA+IG9wZXJhdGlvbiBmcm9tL3RvIGRldmljZS4KPiA+
IAo+ID4gTkFORCBjb250cm9sbGVyIGRyaXZlciBpbXBsZW1lbnRzIC0+ZXhlY19vcCgpIHRvIHJl
cGxhY2UgbGVnYWN5IGhvb2tzLAo+ID4gdGhlc2Ugc3BlY2lmaWMgY2FsbC1iYWNrIG1ldGhvZCB0
byBleGVjdXRlIE5BTkQgb3BlcmF0aW9ucy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogUmFtdXRo
ZXZhciBWYWRpdmVsIE11cnVnYW4gPHZhZGl2ZWwubXVydWdhbngucmFtdXRoZXZhckBsaW51eC5p
bnRlbC5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnICAgICAg
ICAgIHwgICA3ICsKPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9NYWtlZmlsZSAgICAgICAgIHwg
ICAxICsKPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9pbnRlbF9sZ21fbmFuZC5jIHwgNzQwICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysgIAo+IAo+IEkgd29uZGVyIGlmIHdlIHNo
b3VsZG4ndCBuYW1lIHRoZSBkcml2ZXIgaW5maW5lb24tbmFuZC1jb250cm9sbGVyLmMKPiBzaW5j
ZSB0aGUgb3JpZ2luYWwgZGVzaWduIGNvbWVzIGZyb20gSW5maW5lb24gSUlVQy4gaW50ZWxfbGdt
X25hbmQuYyBpcwo+IGRlZmluaXRlbHkgbWlzbGVhZGluZywgYXMgd2UgYWxzbyBoYXZlIGEgbmFu
ZF9pbnRlbC5jIGZpbGUgd2hpY2ggaXMgZm9yCj4gSW50ZWwgTkFORCBjaGlwcyAobm90IE5BTkQg
Y29udHJvbGxlcnMpLiBJZiB3ZSBrZWVwIGludGVsIGluIHRoZSBuYW1lLAo+IGxldCdzIGF0IGxl
YXN0IGFkZCBhICItY29udHJvbGxlciIgc3VmZml4IHRvIG1ha2UgaXQgY2xlYXIuCj4gCj4gU2lk
ZSBub3RlIGZvciBNaXF1ZWw6IEkgZ3Vlc3Mgd2Ugd291bGQgYWxzbyBiZW5lZml0IGZyb20gaGF2
aW5nIGEgY2xlYXIKPiBjb3JlIHZzIGNvbnRyb2xsZXItZHJpdmVycyBzcGxpdCBhcyByZWNlbnRs
eSBkb25lIGZvciBzcGktbm9yIChhCj4gY29udHJvbGxlciBzdWJkaXIgaGFzIGJlZW4gY3JlYXRl
ZCkuCgpJIHdvdWxkIGV2ZW4gbGlrZSBhIGNvcmUgdnMgY29udHJvbGxlciBkcml2ZXJzIHZzIG5h
bmQgY2hpcHMgZHJpdmVycy4KCk1hY3Jvbml4IGZvciBpbnN0YW5jZSBoYXMgYSBOQU5EIGNvbnRy
b2xsZXIgZHJpdmVyIGFuZCBhIE5BTkQgY2hpcApkcml2ZXIsIHRoYXQncyB3aHksIGV2ZW4gaWYg
aXQgaXMgYSBiaXQgbG9uZywgSSBlbmZvcmNlIHRoZSAtbmZjIG9yCi1uYW5kLWNvbnRyb2xsZXIg
KG15IGZhdm9yaXRlKSBzdWZmaXggbm93LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
