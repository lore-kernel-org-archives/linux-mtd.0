Return-Path: <SRS0=PNEu=GI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BDF8C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jan 2021 13:05:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19E1C22240
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jan 2021 13:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19E1C22240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HKjqnhq7bgZdbEIW5SGNvdnV46zZOV5htkAYnOhgcYY=; b=fMb/1cp8nddynfD1I2vrPNjZU
	8r/zPvaB7DLOY2TX2m06hvAfY27uWBLoQLibXGFXaRGaRhfgeaqUmcDaYInjguvJJVlBH/KlDnOfc
	juYoyNsTvX8UOI+ngsKqAypd/fkZ0Z1qvj/u4SFDZTwmHJeSyNmwEx3sTPqNapbEdkOMAe/U9mybv
	LkXx17b7+5DiD5H1yGXGCF8+n8DMBfcfXuawwn6zRN8FMwkzwZgjm+izjJ1LbFsAAOJUNXzVjLpQ8
	F0zUVtdZU0s0tBOeEFlZCbvGnCPZiJnR8b6yKa1SMMOBtKVck/xVXwPmFri1ahxm/sCjtDbrnZa5L
	xg1uCBR3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwm0v-0001hj-8M; Tue, 05 Jan 2021 13:04:41 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwm0s-0001gk-Vp
 for linux-mtd@lists.infradead.org; Tue, 05 Jan 2021 13:04:39 +0000
Received: from xps13 (lfbn-tou-1-1535-bdcst.w90-89.abo.wanadoo.fr
 [90.89.98.255]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 82D77240008;
 Tue,  5 Jan 2021 13:04:32 +0000 (UTC)
Date: Tue, 5 Jan 2021 14:04:31 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Palmer <daniel@0x0f.com>
Subject: Re: [PATCH 1/1] mtd: spinand: add support for Foresee FS35ND01G
Message-ID: <20210105140431.185e8ce1@xps13>
In-Reply-To: <CAFr9PXmPEQ2poQUTtaBH4CZ-S+sJjoUjJ5D_qA5aHZj7AASg7w@mail.gmail.com>
References: <20201229055059.2255021-1-daniel@0x0f.com>
 <20201229055059.2255021-2-daniel@0x0f.com>
 <20210104151746.21cdde24@xps13>
 <CAFr9PXmPEQ2poQUTtaBH4CZ-S+sJjoUjJ5D_qA5aHZj7AASg7w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_080439_132042_90197519 
X-CRM114-Status: GOOD (  23.64  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, vigneshr@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRGFuaWVsLAoKRGFuaWVsIFBhbG1lciA8ZGFuaWVsQDB4MGYuY29tPiB3cm90ZSBvbiBUdWUs
IDUgSmFuIDIwMjEgMjE6MTg6MjEgKzA5MDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBPbiBNb24sIDQg
SmFuIDIwMjEgYXQgMjM6MTcsIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+IHdyb3RlOgo+ID4gUGVyaGFwcyBnaXZpbmcgdGhlIGxpbmsgb2YgdGhlIGRhdGFzaGVldCBo
ZXJlIG1ha2VzIHNlbnNlLiAgCj4gCj4gTm90ZWQuIEknbGwgcHV0IHRoYXQgaW50byB2Mi4KPiAK
PiA+ID4gKyNkZWZpbmUgU1BJTkFORF9NRlJfTE9OR1NZUyAgICAgICAgICAweGNkICAKPiA+Cj4g
PiBOaXRwaWNrOiBJIHBlcnNvbmFsbHkgcHJlZmVyIHVwcGVyY2FzZSBoZXggbnVtYmVycy4KPiA+
ICAKPiAKPiBOb3RlZC4KPiAKPiA+ID4gKyAgICAgICAgICAgICAgICAgIE5BTkRfTUVNT1JHKDEs
IDIwNDgsIDY0LCA2NCwgMTAyNCwgMjAsIDEsIDEsIDEpLAo+ID4gPiArICAgICAgICAgICAgICAg
ICAgTkFORF9FQ0NSRVEoNCwgNTEyKSwKPiA+ID4gKyAgICAgICAgICAgICAgICAgIFNQSU5BTkRf
SU5GT19PUF9WQVJJQU5UUygmcmVhZF9jYWNoZV92YXJpYW50cywKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmd3JpdGVfY2FjaGVfdmFyaWFudHMsCj4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnVwZGF0ZV9j
YWNoZV92YXJpYW50cyksICAKPiA+Cj4gPiBUaGlzIGRldmljZSBwcm9iYWJseSBzdXBwb3J0cyBt
b3JlIHZhcmlhbnRzIChlc3BlY2lhbGx5IGR1YWwvcXVhZAo+ID4gb25lcykgYnV0IEkgZ3Vlc3Mg
aXQncyBub3QgYSBwcm9ibGVtIHRvIG5vdCBoYXZlIHRoZW0gaGVyZSByaWdodCBub3cuICAKPiAK
PiBSaWdodCBub3cgSSBjYW4ndCByZWFsbHkgdGVzdCBkdWFsIG9yIHF1YWQgYmVjYXVzZSBteSBT
UEkgZHJpdmVyCj4gZG9lc24ndCBrbm93IHRvIGRvIGR1YWwgb3IgcXVhZCBpby4KPiBJIHBsYW4g
dG8gYWRkIHRob3NlIGluIG9uY2UgSSBjYW4gdmFsaWRhdGUgdGhleSB3b3JrLgo+IAo+ID4gPiAr
ICAgICAgICAgICAgICAgICAgU1BJTkFORF9IQVNfUUVfQklULAo+ID4gPiArICAgICAgICAgICAg
ICAgICAgU1BJTkFORF9FQ0NJTkZPKE5VTEwsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgTlVMTCkpLCAgCj4gPgo+ID4gWW91IHNob3VsZCBkZWZpbmUgdGhlIC0+ZWNj
IGFuZCAtPmZyZWUgaG9va3Mgb2YgdGhlCj4gPiBtdGRfb29ibGF5b3V0X29wcyBzdHJ1Y3R1cmUg
YW5kIHBvaW50IHRvIGl0IGhlcmUuIEl0IGRlZmluZXMgdGhlIGZyZWUKPiA+IE9PQiBieXRlcyBh
bmQgYnl0ZXMgdXNlZCBieSB0aGUgb24tZGllIEVDQyBlbmdpbmUuIFlvdSBzaG91bGQgZmluZCB0
aGlzCj4gPiBpbiB0aGUgZGF0YXNoZWV0LiBZb3UgbWF5IGxvb2sgYXQgb3RoZXIgbWFudWZhY3R1
cmVyIGRyaXZlcnMgZm9yCj4gPiBleGFtcGxlcyBvZiBob3cgaXQgc2hvdWxkIGJlIGltcGxlbWVu
dGVkLiBJdCBpcyB0aGUgd2F5IHRvIHRlbGwgdGhlCj4gPiB1cHBlciBsYXllcnMgdGhhdCBlZy4g
ImJ5dGUgMiB0byAxNyBhcmUgRUNDIGJ5dGVzLCAxOCB1bnRpbCB0aGUgZW5kIGFyZQo+ID4gZnJl
ZSB0byB1c2UiLiAgCj4gCj4gT2sgSSdsbCBhZGQgdGhvc2UgaW4uIElzIHRoZXJlIGEgd2F5IEkg
Y2FuIHRlc3QgdGhhdCBteSBpbXBsZW1lbnRhdGlvbiBpcyByaWdodD8KPiBJLmUuIGlzIHdyaXRp
bmcgc29tZXRoaW5nLCByZWFkaW5nIGl0IGJhY2sgYW5kIGNoZWNraW5nIGlmIHRoZSBkYXRhIGlz
Cj4gY29ycmVjdCBhIGdvb2QgZW5vdWdoIHRlc3QgaGVyZT8KPiBJIGRvbid0IHJlYWxseSB3YW50
IHRvIG1ha2UgaXQgbG9vayBsaWtlIHRoaXMgZmxhc2ggaXMgc3VwcG9ydGVkIGFuZAo+IGJyZWFr
IHNvbWVvbmUncyBkYXRhLiA6KQoKWW91IG1heSB0cnkgdG8gdXNlIGZsYXNoX2VyYXNlL25hbmR3
cml0ZS9uYW5kZHVtcCBmcm9tIHRoZSBtdGQtdXRpbHMKcGFja2FnZS4gWW91IG1heSBmaXJzdCB1
c2UgYSBkdW1teSBmdW5jdGlvbnMgYW5kIGRlY2xhcmUgdGhlIGVudGlyZQp6b25lIGZyZWUgKGV4
Y2VwdCBmb3IgdGhlIGJhZCBibG9jayBtYXJrZXIgYXQgdGhlIGJlZ2lubmluZykuCgpUaGVuLCB5
b3UgbWF5IHdyaXRlIHRoZSBlbnRpcmUgT09CIGFyZWEgaW4gcmVndWxhciBtb2RlIHRoZW4gcmVh
ZCBpdCBpbgpyYXcgbW9kZSAoLW4pLiBTb21ldGltZXMgdGhlIEVDQyBieXRlcyBhcmUgbm90IHZp
c2libGUsIGluIHRoaXMgY2FzZSBpdAptYXkgYmUgd29ydGggdHJ5aW5nIHdyaXRpbmcgdGhlIE9P
QiBhcmVhIHdpdGgga25vd24gZGF0YSBhbmQgcmVhZCBpdApiYWNrIGFuZCBzZWUgd2hhdCB5b3Ug
Z2V0LiBCdXQgdGhlc2UgaW5mb3JtYXRpb24gcHJvYmFibHkgYXJlIGluIHRoZQpkYXRhc2hlZXQu
CgpHb29kIGx1Y2ssCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
