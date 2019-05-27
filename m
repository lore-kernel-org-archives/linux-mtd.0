Return-Path: <SRS0=9XVy=T3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9500C07542
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2019 09:28:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A146F2173B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2019 09:28:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qahRakGs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A146F2173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8CezyDx1PGMYXISVBqvSNRgwdpDtzVHYPMb1+pUMKvA=; b=qahRakGsMvWa3v
	3RWdwQggmUiZM7AwxLwehNd9l/26eSa7ImThgBQLA88X/r20TcPHP9j2x2j95KbjBdgnAvtBgC7dD
	io5DetA1DTmzDEBuyhRMbl/quPkUgEazpsZdG+TkuytH1MpM05oVVxUutkQeAfdYYNGbxa8atZI1o
	NvRb4OiVrAaD1val4EeVoIgG7FSRN+0SLD0nlRIDvDHNCZpdxQruuSvUkrh1KeFEa8X14XGMJwgPL
	sIo7Nk7J4dvqhFkbpF4R9cq/yaHKO+HyMDJGylkVXW8LTaoHOG32+bM/Ai4Wk5Is2oec3aqNXl2zU
	q83ncBMjKaPPR5+vke/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVBvZ-0007El-L2; Mon, 27 May 2019 09:28:21 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVBvV-0007EH-SS
 for linux-mtd@lists.infradead.org; Mon, 27 May 2019 09:28:19 +0000
Received: from xps13 (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr
 [90.88.147.134]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id EC5A420000F;
 Mon, 27 May 2019 09:28:03 +0000 (UTC)
Date: Mon, 27 May 2019 11:28:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v4 3/3] mtd: spinand: Add support for GigaDevice
 GD5F1GQ4UFxxG
Message-ID: <20190527112802.08b86fa5@xps13>
In-Reply-To: <34004a59-5643-e405-13ca-3581659fc745@kontron.de>
References: <20190522220555.11626-1-lede@allycomm.com>
 <20190522220555.11626-4-lede@allycomm.com>
 <e438022f-3444-9aae-adac-2dd3dd0071b7@kontron.de>
 <e0682730-b69d-d774-d98f-53858e390d8b@allycomm.com>
 <34004a59-5643-e405-13ca-3581659fc745@kontron.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_022818_071046_9422AA0A 
X-CRM114-Status: GOOD (  22.31  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jeff Kletsky <lede@allycomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2NocmVtcGYsCgpTY2hyZW1wZiBGcmllZGVyIDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24u
ZGU+IHdyb3RlIG9uIE1vbiwgMjcgTWF5CjIwMTkgMDY6MzU6NTkgKzAwMDA6Cgo+IEhpIEplZmYs
Cj4gCj4gT24gMjQuMDUuMTkgMDI6MTIsIEplZmYgS2xldHNreSB3cm90ZToKPiA+IChyZWR1Y2Vk
IGRpcmVjdCBhZGRyZXNzZWVzLCB0aG91Z2ggc3RpbGwgb24gbGlzdHMpCj4gPiAKPiA+IE9uIDUv
MjIvMTkgMTE6NDIgUE0sIFNjaHJlbXBmIEZyaWVkZXIgd3JvdGU6Cj4gPiAgIAo+ID4+IE9uIDIz
LjA1LjE5IDAwOjA1LCBKZWZmIEtsZXRza3kgd3JvdGU6ICAKPiA+Pj4gRnJvbTogSmVmZiBLbGV0
c2t5IDxnaXQtY29tbWl0c0BhbGx5Y29tbS5jb20+Cj4gPj4+Cj4gPj4+IFRoZSBHaWdhRGV2aWNl
IEdENUYxR1E0VUZ4eEcgU1BJIE5BTkQgaXMgaW4gY3VycmVudCBwcm9kdWN0aW9uIGRldmljZXMK
PiA+Pj4gYW5kLCB3aGlsZSBpdCBoYXMgdGhlIHNhbWUgbG9naWNhbCBsYXlvdXQgYXMgdGhlIEUt
c2VyaWVzIGRldmljZXMsCj4gPj4+IGl0IGRpZmZlcnMgaW4gdGhlIFNQSSBpbnRlcmZhY2luZyBp
biBzaWduaWZpY2FudCB3YXlzLgo+ID4+Pgo+ID4+PiBUaGlzIHN1cHBvcnQgaXMgY29udGluZ2Vu
dCBvbiBwcmV2aW91cyBjb21taXRzIHRvOgo+ID4+Pgo+ID4+PiDCoMKgwqAgKiBBZGQgc3VwcG9y
dCBmb3IgdHdvLWJ5dGUgZGV2aWNlIElEcwo+ID4+PiDCoMKgwqAgKiBEZWZpbmUgbWFjcm9zIGZv
ciBwYWdlLXJlYWQgb3BzIHdpdGggdGhyZWUtYnl0ZSBhZGRyZXNzZXMKPiA+Pj4KPiA+Pj4gaHR0
cDovL3d3dy5naWdhZGV2aWNlLmNvbS9kYXRhc2hlZXQvZ2Q1ZjFncTR4Znh4Zy8KPiA+Pj4KPiA+
Pj4gU2lnbmVkLW9mZi1ieTogSmVmZiBLbGV0c2t5IDxnaXQtY29tbWl0c0BhbGx5Y29tbS5jb20+
ICAKPiA+PiBSZXZpZXdlZC1ieTogRnJpZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBr
b250cm9uLmRlPgo+ID4+ICAKPiA+Pj4gUmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxs
a3BAaW50ZWwuY29tPiAgCj4gPj4gSSBkb250J3QgdGhpbmsgdGhhdCB0aGlzIFJlcG9ydGVkLWJ5
IHRhZyBzaG91bGQgYmUgdXNlZCBoZXJlLiBUaGUgYm90Cj4gPj4gcmVwb3J0ZWQgYnVpbGQgZXJy
b3JzIGNhdXNlZCBieSB5b3VyIHBhdGNoIGFuZCB5b3UgZml4ZWQgaXQgaW4gYSBuZXcKPiA+PiB2
ZXJzaW9uLiBBcyBmYXIgYXMgSSB1bmRlcnN0YW5kIHRoaXMgdGFnLCBpdCByZWZlcmVuY2VzIHNv
bWVvbmUgd2hvCj4gPj4gcmVwb3J0ZWQgYSBmbGF3L2J1ZyB0aGF0IGxlZCB0byB0aGlzIGNoYW5n
ZSBpbiB0aGUgZmlyc3QgcGxhY2UuCj4gPj4gVGhlIHZlcnNpb24gaGlzdG9yeSBvZiB0aGUgY2hh
bmdlcyB3b24ndCBiZSB2aXNpYmxlIGluIHRoZSBnaXQgaGlzdG9yeQo+ID4+IGxhdGVyLCBidXQg
dGhlIHRhZyB3aWxsIGJlIGFuZCB3b3VsZCBiZSByYXRoZXIgY29uZnVzaW5nLiAgCj4gPiAKPiA+
IFRoYW5rIHlvdSBmb3IgeW91ciBwYXRpZW5jZSBhbmQgZXhwbGFuYXRpb25zLiBJJ3ZlIGJlZW4g
YmVpbmcgY29uc2VydmF0aXZlCj4gPiBhcyBJJ20gbm90IGEgInNlYXNvbmVkLCBMaW51eCBwcm9m
ZXNzaW9uYWwiIGFuZCBhbSBzdGlsbCBnZXR0aW5nIG15Cj4gPiBnaXQgc2VuZC1lbWFpbCBjb25m
aWcgLyBjb21tYW5kIGxpbmUgZm9yIExpbnV4IHByb3Blcmx5IHN0cmFpZ2h0ZW5lZCBvdXQuICAK
PiAKPiBCZWluZyBjb25zZXJ2YXRpdmUgaW4gc3VjaCBjYXNlcyBpcyBub3QgYSBmYXVsdCBhdCBh
bGwuIEknbSBub3QgYW4gCj4gZXhwZXJ0IGVpdGhlci4gSSdtIGp1c3QgcmVjb21tZW5kaW5nIHdo
YXQgSSB0aGluayBtaWdodCBiZSB0aGUgImNvcnJlY3QiIAo+IHdheSB0byBkbyBpdC4KPiAKPiA+
IFNob3VsZCBJIHNlbmQgYW5vdGhlciBwYXRjaCBzZXQgd2l0aCB0aGUgYGtidWlsZC4uLmAgdGFn
IHJlbW92ZWQsCj4gPiBvciB3b3VsZCBpdCBiZSByZW1vdmVkIGluIHRoZSBwcm9jZXNzIG9mIGFu
IGFwcHJvcHJpYXRlIG1lbWJlcgo+ID4gb2YgdGhlIExpbnV4IE1URCB0ZWFtIGFkZGluZyB0aGVp
ciB0YWcgZm9yIGFwcHJvdmFsLCBpZiBhbmQgd2hlbgo+ID4gdGhhdCBoYXBwZW5zPyAgCj4gCj4g
SSBkb24ndCB0aGluayB0aGF0J3MgbmVjZXNzYXJ5LiBNaXF1w6hsIGlzIHRoZSBvbmUgdG8gcGlj
ayB1cCB0aGUgcGF0Y2gsIAo+IHNvIGhlIGNvdWxkIHByb2JhYmx5IGRyb3AgdGhlICJSZXBvcnRl
ZC1ieToga2J1aWxkIiB3aGVuIGhlIGFwcGxpZXMgaXQuCgpJIHdpbGwgZHJvcCBpdC4KCkFsc28s
IHBsZWFzZSBkbyBub3QgYWRkIGFuIGVtcHR5IGxpbmUgYmV0d2VlbiB0YWdzLCB0aGV5IHNob3Vs
ZCBiZSBhCnNpbmdsZSBibG9jay4gSSB3aWxsIGFsc28gbW9kaWZ5IHlvdXIgY29tbWl0cyBmb3Ig
dGhpcyB0aW1lLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
