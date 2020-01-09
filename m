Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A74C4C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 16:23:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5645B2067D
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 16:23:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XrOKqK17"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5645B2067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HkwqfiayXplJzAh2EsnOLgmooySYHwZetnVDsOqan1k=; b=XrOKqK17Wo2wui
	QAjetlJLylVEyH4TB7a/vFY23rUzBiON2dv8jWCMlMw7ZYm32dpa2GQerBrdLg2Pig2nLsnJBDS+K
	vcsC/V/nEWdGIoh7a6kO8QLfjYnM3cYOGe7ajzXKealyrSb10ie0SkgxJS8H/CaBjGCaD8IgnzWZI
	XABc+SdWSdzoPOvNko1L4ViP4uTLk1iKTxIFv0y5OheiEywoxmFi3S1rh2v7TPQP+0K8fsFzwhEMn
	DWCnNHY0Zx+rvr2iq6jI3kXhKuo9Qz5ZvTGulM/aIbLASoAjUrktXGiVW44F6lOJdWxZAin01ny/O
	UkPLj2K76L6srDrFBpGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipaaY-0001J6-Rg; Thu, 09 Jan 2020 16:23:14 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipaRX-0007hg-Ck
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 16:13:58 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 264D620000B;
 Thu,  9 Jan 2020 16:13:46 +0000 (UTC)
Date: Thu, 9 Jan 2020 17:13:37 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH V2] mtd: rawnand: denali_dt: Add support for configuring
 SPARE_AREA_SKIP_BYTES
Message-ID: <20200109171337.2c0cc213@xps13>
In-Reply-To: <CAK7LNARkwtNsRrmq=9Cv+hgM2b68m7_2sV1mnrLuYuZ6H4j=vA@mail.gmail.com>
References: <20191220093900.1855751-1-marex@denx.de>
 <CAK7LNARkwtNsRrmq=9Cv+hgM2b68m7_2sV1mnrLuYuZ6H4j=vA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_081355_599610_CC108FB8 
X-CRM114-Status: GOOD (  19.04  )
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
Cc: Marek Vasut <marex@denx.de>, Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPiB3cm90
ZSBvbiBGcmksIDEwIEphbiAyMDIwCjAxOjA2OjIwICswOTAwOgoKPiBPbiBGcmksIERlYyAyMCwg
MjAxOSBhdCA2OjM5IFBNIE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPiB3cm90ZToKPiA+Cj4g
PiBUaGUgU1BBUkVfQVJFQV9TS0lQX0JZVEVTIHJlZ2lzdGVyIGlzIHJlc2V0IHdoZW4gdGhlIGNv
bnRyb2xsZXIgcmVzZXQKPiA+IHNpZ25hbCBpcyB0b2dnbGVkLiBZZXQsIHRoaXMgcmVnaXN0ZXIg
bXVzdCBiZSBjb25maWd1cmVkIHRvIG1hdGNoIHRoZQo+ID4gY29udGVudCBvZiB0aGUgTkFORCBP
T0IgYXJlYS4gVGhlIGN1cnJlbnQgZGVmYXVsdCB2YWx1ZSBpcyBhbHdheXMgc2V0Cj4gPiB0byA4
IGFuZCBpcyBwcm9ncmFtbWVkIGludG8gdGhlIGhhcmR3YXJlIGluIGNhc2UgdGhlIGhhcmR3YXJl
IHdhcyBub3QKPiA+IHByb2dyYW1tZWQgYmVmb3JlIChlLmcuIGluIGEgYm9vdGxvYWRlcikgd2l0
aCBhIGRpZmZlcmVudCB2YWx1ZS4gVGhpcwo+ID4gaG93ZXZlciBkb2VzIG5vdCB3b3JrIHdoZW4g
dGhlIGJsb2NrIGlzIHJlc2V0IHByb3Blcmx5IGJ5IExpbnV4Lgo+ID4KPiA+IE9uIEFsdGVyYSBT
b0NGUEdBIEN5Y2xvbmVWLCBBcnJpYVYgYW5kIEFycmlhMTAsIHdoaWNoIGFyZSB0aGUgU29DRlBH
QQo+ID4gcGxhdGZvcm1zIHdoaWNoIHN1cHBvcnQgYm9vdGluZyBmcm9tIE5BTkQsIHRoZSBTUEFS
RV9BUkVBX1NLSVBfQllURVMKPiA+IHZhbHVlIG11c3QgYmUgc2V0IHRvIDIuIE9uIFNvY2lvbmV4
dCBVbmlwaGllciwgdGhlIHZhbHVlIGlzIDguIFRoaXMKPiA+IHBhdGNoIGFkZHMgc3VwcG9ydCBm
b3IgcHJlY29uZmlndXJpbmcgdGhlIGRlZmF1bHQgdmFsdWUgYW5kIGhhbmRsZXMKPiA+IHRoZSBz
cGVjaWFsIFNvQ0ZQR0EgY2FzZSBieSBzZXR0aW5nIHRoZSBkZWZhdWx0IHRvIDIgb24gYWxsIFNv
Q0ZQR0EKPiA+IHBsYXRmb3Jtcywgd2hpbGUgcmV0YWluaW5nIHRoZSBvcmlnaW5hbCBiZWhhdmlv
ciBhbmQgZGVmYXVsdCB2YWx1ZSBvZgo+ID4gOCBvbiBhbGwgdGhlIG90aGVyIHBsYXRmb3Jtcy4K
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPiA+IENj
OiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgo+ID4gQ2M6
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiBDYzogUmljaGFy
ZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KPiA+IENjOiBWaWduZXNoIFJhZ2hhdmVuZHJh
IDx2aWduZXNockB0aS5jb20+Cj4gPiBUbzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcK
PiA+IFJldmlld2VkLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQG1pY3JvY2hpcC5j
b20+Cj4gPiAtLS0KPiA+IFYyOiBNb3ZlIGRlbmFsaS0+b29iX3NraXBfYnl0ZXMgPSBkYXRhLT5v
b2Jfc2tpcF9ieXRlczsgcmlnaHQgYWZ0ZXIKPiA+ICAgICBvZl9kZXZpY2VfZ2V0X21hdGNoX2Rh
dGEoKSAgCj4gCj4gCj4gRllJLgo+IAo+IFRoaXMgcGF0Y2ggd2FzIHJlYmFzZWQgdG8gYXZvaWQg
YSBjb25mbGljdDoKPiBodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcGF0Y2gvMTIxNDAxOC8K
PiAKPiBNeSBBY2sgaXMgaW4gdjMuCgpJdCBpcyBpbmRlZWQgYWJvdXQgdG8gYmUgYXBwbGllZCA6
KQoKQ2hlZXJzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
