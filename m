Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEAFC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Nov 2021 11:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CGR587FgQTEM7UDNJ8oUAqVfrKd0NtOmvBUCXqakjXg=; b=Pjn0WSfXAmoR4q
	XhTGlWBH3RUXsuxOKQEEvt7/zWei2ZX0z+GJkH32B8JA2Szbd6Y+g+cBXawG+5tMwAezZD/fjZ9bq
	smnsqIsFjb+vZST4wEVtpA0yIA++91PlWMnFUq4iwsKQBFsJzwjW60semvYFIMXJkJoNRaizhxT59
	eCOGL43MBHQxxvEq1CSoQOqBg6k21GoWcotatukG17f+/zKDXOtq8t8bs+F8A5XvbuZzbRuakCqib
	SjjZHhAfAC7Oa2CMIAiT/ds8cpcagH0pKorrIAZHswefDLvErweop0SkeXIeoLKw2nm1b0XzqgYMc
	tyLXfmLhQial02yBBNTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms12i-004mXQ-3r; Tue, 30 Nov 2021 11:11:24 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms12c-004mUl-Nr
 for linux-mtd@lists.infradead.org; Tue, 30 Nov 2021 11:11:22 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id B01DF6000C;
 Tue, 30 Nov 2021 11:11:11 +0000 (UTC)
Date: Tue, 30 Nov 2021 12:11:10 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Mark Brown
 <broonie@kernel.org>
Subject: Re: [PATCH] mtd: dataflash: Add device-tree SPI IDs
Message-ID: <20211130121110.6026f788@xps13>
In-Reply-To: <a799095a-e046-ae56-c2db-f527e199b5fb@nvidia.com>
References: <20211119183316.1329089-1-miquel.raynal@bootlin.com>
 <a799095a-e046-ae56-c2db-f527e199b5fb@nvidia.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_031118_968469_0E8445FD 
X-CRM114-Status: GOOD (  17.60  )
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

SGkgSm9uLAoKam9uYXRoYW5oQG52aWRpYS5jb20gd3JvdGUgb24gVHVlLCAzMCBOb3YgMjAyMSAw
ODo1MzowOCArMDAwMDoKCj4gSGkgTWlxdWVsLAo+IAo+IE9uIDE5LzExLzIwMjEgMTg6MzMsIE1p
cXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBPbiBNb24sIDIwMjEtMTEtMTUgYXQgMTE6MzY6NTUgVVRD
LCBKb24gSHVudGVyIHdyb3RlOiAgCj4gPj4gQ29tbWl0IDVmYTY4NjNiYTY5MiAoInNwaTogQ2hl
Y2sgd2UgaGF2ZSBhIHNwaV9kZXZpY2VfaWQgZm9yIGVhY2ggRFQKPiA+PiBjb21wYXRpYmxlIikg
YWRkZWQgYSB0ZXN0IHRvIGNoZWNrIHRoYXQgZXZlcnkgU1BJIGRyaXZlciBoYXMgYQo+ID4+IHNw
aV9kZXZpY2VfaWQgZm9yIGVhY2ggRFQgY29tcGF0aWFibGUgc3RyaW5nIGRlZmluZWQgYnkgdGhl
IGRyaXZlcgo+ID4+IGFuZCB3YXJucyBpZiB0aGUgc3BpX2RldmljZV9pZCBpcyBtaXNzaW5nLiBU
aGUgc3BpX2RldmljZV9pZHMgYXJlCj4gPj4gbWlzc2luZyBmb3IgdGhlIGRhdGFmbGFzaCBkcml2
ZXIgYW5kIHRoZSBmb2xsb3dpbmcgd2FybmluZ3MgYXJlIG5vdwo+ID4+IHNlZW4uCj4gPj4KPiA+
PiAgIFdBUk5JTkcgS0VSTiBTUEkgZHJpdmVyIG10ZF9kYXRhZmxhc2ggaGFzIG5vIHNwaV9kZXZp
Y2VfaWQgZm9yIGF0bWVsLGF0NDUKPiA+PiAgIFdBUk5JTkcgS0VSTiBTUEkgZHJpdmVyIG10ZF9k
YXRhZmxhc2ggaGFzIG5vIHNwaV9kZXZpY2VfaWQgZm9yIGF0bWVsLGRhdGFmbGFzaAo+ID4+Cj4g
Pj4gRml4IHRoaXMgYnkgYWRkaW5nIHRoZSBuZWNlc3Nhcnkgc3BpX2RldmljZV9pZHMuCj4gPj4K
PiA+PiBTaWduZWQtb2ZmLWJ5OiBKb24gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNvbT4gIAo+
ID4gCj4gPiBBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbXRkL25leHQsIHRoYW5rcy4gIAo+IAo+IAo+IFBsZWFz
ZSBjYW4geW91IHN1Ym1pdCBhcyBhIGZpeCBmb3IgdjUuMTY/IFRoZSBjb21taXQgdGhhdCBpbnRy
b2R1Y2VkIHRoaXMgaXMgYWxyZWFkeSBpbiB0aGUgbWFpbmxpbmUuCgpZZXMgb2YgY291cnNlLiBD
YW4geW91IHJlc3VibWl0IHdpdGggYSBGaXhlcyB0YWc/Cgo+IAo+IFRoYW5rcwo+IEpvbgo+IAoK
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
