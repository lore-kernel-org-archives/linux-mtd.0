Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E0EFC433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 09:04:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCFA1208A7
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 09:04:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AFnPiqz2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="trpRupFW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCFA1208A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pa0hse/lRMbHOLWK+6ZWYcUPySNxPBEPhX3u9dgvCz4=; b=AFnPiqz2Cp7wkZ
	nsGGXkb12pWxI9TIhcNXN8GHnLKY2FEPVIostGyEJx95f5DQ4XOFTyKj49OEhqjTMnSVgKUjfsnYi
	9CWQoq/9LxyJwykx8rRvRbeaePN5iePNtDXiIXuCsTXDR7+VvsKA9EHhVH5MnIbrEf6b/MSXtl4hE
	Sk2j7O3Z01vjBhcXV+QmVKvukUQESr09C1mLRtgDoAQZEJkhgtUwUhRnUHSIAQef8QXO77agpXDQJ
	6SYjWnmWh1g8UwFi5XoLxvvzgBnirhOpNgAcA0yg9UK4F13KvY0ibQz1zVV6VVogoyEgxzumkGjz8
	DJGKjuuz8jFkGVIvfMjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jayAo-0003IV-O5; Tue, 19 May 2020 09:04:30 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jayAi-0003ES-II
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 09:04:26 +0000
Received: by mail-wm1-x343.google.com with SMTP id z72so2570877wmc.2
 for <linux-mtd@lists.infradead.org>; Tue, 19 May 2020 02:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TRUKrhEDvmas9xbqBpI5eK4i0cGdO3vlXJ/AHu3xRYU=;
 b=trpRupFW1M7ki7aL3dKNLYSFtviNCiZiGyEk0VI0fAwqLOew+P/vqdMH4PgeXYQwFQ
 0PDCWdXWwejp82rCVc68RCE9JnLxyrwu/H5cclySsYRlFzq27HVrviBrth84qv2TPY6R
 3pE69qBjyGmKdjZPgxhXi+e0L0PNqH4XQXFJmxFOjbAvr9msXKS0tfU6vHNFwgYKiM7/
 vCdtImiQn8S7LLG8+d0uwFh/4mNac5zA6t8N6qkZbDI+6j6XsLfWgh4hJlC6hRHA/68K
 wHZ3kARLfk5vmZ6Gen4L5NWrTVBwW+5B5fCzfeew0hxp7FzhOaulVLk4Twh+PnTe5Ytx
 jA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TRUKrhEDvmas9xbqBpI5eK4i0cGdO3vlXJ/AHu3xRYU=;
 b=NJQdCxcm7npy3lfv+G5blxtjEdV7UWF02/6M0a1ZoKahDAEmh2vU4ta7teB4Zh0vvA
 Tg6LjTB/9xzIObWxwyfw70oZkqu6vw25rfU6MBfPoOFI1h25KvVlrZHQ3voEP3CtYpXV
 euS13AdDKhqpfFyObj2uiLf+UqTUYkZOCDvUFhXltwuzUHVHfe8CJoisIFLYwE9FDLfZ
 /tWS7/r/1uVPnvq33F5jFHYPutpq2mTNoKegAbC1PaP/df2bX/+kEciFqQ6dzukM7YoJ
 pAnbPBarptC+uwGKmwiZCcFmwFZNse0CIoEGXsIe3JnGloEEcfNLxqhOwzavaIb0fSjQ
 A8+Q==
X-Gm-Message-State: AOAM531kcb0Bv8lK13bbnnQnrpAtItSTiphewKaYh7zD9fqy2fft71CD
 D4Qlm/F7E0ANXRozvGyzs3I=
X-Google-Smtp-Source: ABdhPJwWCcYoNzmHFAM5uYaZlva33QM5VyOq8Gd7cJm6+UEZuT5wDqwCSIb09WmBYIU9GQlcVz+1Xg==
X-Received: by 2002:a1c:2314:: with SMTP id j20mr2907200wmj.139.1589879062350; 
 Tue, 19 May 2020 02:04:22 -0700 (PDT)
Received: from ubuntu-g3.micron.com ([165.225.86.140])
 by smtp.googlemail.com with ESMTPSA id x22sm2923759wmi.32.2020.05.19.02.04.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 19 May 2020 02:04:21 -0700 (PDT)
Message-ID: <8de0911281b4c03671841027ec165422789b63f2.camel@gmail.com>
Subject: Re: [PATCH v4 0/5] Micron SLC NAND filling block
From: Bean Huo <huobean@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 19 May 2020 11:04:15 +0200
In-Reply-To: <20200518172253.1c3b9d32@xps13>
References: <20200518135943.11749-1-huobean@gmail.com>
 <20200518172253.1c3b9d32@xps13>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_020424_624761_B129A42D 
X-CRM114-Status: GOOD (  24.89  )
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
Cc: vigneshr@ti.com, richard@nod.at, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, derosier@gmail.com,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

aGksICBNaXF1ZWwKCk9uIE1vbiwgMjAyMC0wNS0xOCBhdCAxNzoyMiArMDIwMCwgTWlxdWVsIFJh
eW5hbCB3cm90ZToKPiBIaSBCZWFuLAo+IAo+IEJlYW4gSHVvIDxodW9iZWFuQGdtYWlsLmNvbT4g
d3JvdGUgb24gTW9uLCAxOCBNYXkgMjAyMCAxNTo1OTozOAo+ICswMjAwOgo+IAo+ID4gRnJvbTog
QmVhbiBIdW8gPGJlYW5odW9AbWljcm9uLmNvbT4KPiA+IAo+ID4gQWZ0ZXIgc3VibWlzc2lvbiBv
ZiBwYXRjaCBWMSBbMV0gYW5kIFYyIFsyXSwgd2Ugc3RvcHBlZCBpdHMgdXBkYXRlCj4gPiBzaW5j
ZSB3ZSBnZXQKPiA+IHN0dWNrIGluIHRoZSBzb2x1dGlvbiBvbiBob3cgdG8gYXZvaWQgdGhlIHBv
d2VyLWxvc3MgaXNzdWUgaW4gY2FzZQo+ID4gcG93ZXItY3V0Cj4gPiBoaXRzIHRoZSBibG9jayBm
aWxsaW5nLiBJbiB0aGUgdjEgYW5kIHYyLCB0byBhdm9pZCB0aGlzIGlzc3VlLCB3ZQo+ID4gYWx3
YXlzIGRhbWFnZWQKPiA+IHBhZ2UwLCBwYWdlMSwgdGhpcydzIGJhc2VkIG9uIHRoZSBoeXBvdGhl
c2lzIHRoYXQgTkFORCBGUyBpcyBVQklGUy4KPiA+IFRoaXMKPiA+IEZTLXNwZWNpZmljYWwgY29k
ZSBpcyB1bmFjY2VwdGFibGUgaW4gdGhlIE1URCBsYXllci4gQWxzbywgaXQKPiA+IGNhbm5vdCBj
b3ZlciBhbGwKPiA+IE5BTkQgYmFzZWQgZmlsZSBzeXN0ZW0uIEJhc2VkIG9uIHRoZSBjdXJyZW50
IGRpc2N1c3Npb24sIHNlZW1zIHRoYXQKPiA+IHJlLXdyaXRlIGFsbAo+ID4gZmlyc3QgMTUgcGFn
ZSBmcm9tIHBhZ2UwIGlzIGEgc2F0aXNmYWN0b3J5IHNvbHV0aW9uLgo+IAo+IFdlIGhhdmUgYSBs
YXllcmluZyBwcm9ibGVtIG5vdy4gTWF5YmUgd2Ugc2hvdWxkIGp1c3QgaGF2ZSBhbiBNVEQKPiBp
bnRlcm5hbCB2YXJpYWJsZSBsaWtlIG1pbl93cml0dGVuX3BhZ2VzX2JlZm9yZV9lcmFzZSB0aGF0
IHRoZSBNaWNyb24KPiBkcml2ZXIgY291bGQgc2V0IHRvIGEgITAgdmFsdWUuCj4gCj4gVGhlbiwg
dGhlIGhhbmRsaW5nIGNvdWxkIGJlIGRvbmUgYnkgdGhlIHVzZXIgKFVCSS9VQklGUywgSkZGUzIs
IE1URAo+IHVzZXIgaWYgZXhwb3J0ZWQpLgo+IAoKVGhpcyBpcyBOQU5EIGl0cyBvd24gcHJvYmxl
bSwgaWYgbm8gc2lnbmlmaWNhbnQgYWRhbnRhZ2UsIEkgZG9uJ3QgdGhpbmsKaXQncyBhIGdvb2Qg
c29sdXRpb24gdG8gZXh0ZW5kIHRoZSBwcm9ibGVtIHRvIHRoZSB1cHBlciBGUyBsYXllci4KYWxz
bywgaW4gdGhlIEZTIGVyYXNlIHBhdGgsIGRvZXNuJ3QgaGF2ZSB0aGUgcHJvZ3JhbW1lZCBwYWdl
cyBjb3VudGVyLgp3ZSBzaG91bGQgcmVwZWF0IHRoZSBzYW1lIGFwcHJvYWNoIGFzIHdlIGRpZCBp
biBNVEQgbGF5ZXIuCgo+ID4gCj4gPiBNZWFud2hpbGUsIEkgYm9ycm93ZWQgb25lIGlkZWEgZnJv
bSBNaXF1ZWwgUmF5bmFsIHBhdGNoc2V0IFszXSwgaW4KPiA+IHdoaWNoIGtlZXBzCj4gPiBhIHJl
Y29kZSBvZiBwcm9ncmFtbWVkIHBhZ2VzLCBiYXNlIG9uIGl0LCBmb3IgbW9zdCBvZiB0aGUgY2Fz
ZXMsIHdlCj4gPiBkb24ndCBuZWVkCj4gPiB0byByZWFkIGV2ZXJ5IHBhZ2UgdG8gc2VlIGlmIGN1
cnJlbnQgZXJhc2luZyBibG9jayBpcyBhIHBhcnRpYWxseQo+ID4gcHJvZ3JhbW1lZAo+ID4gYmxv
Y2suCj4gPiAKPiA+IENoYW5nZWxvZzoKPiA+IAo+ID4gdjMgLSB2NDoKPiA+ICAgICAxLiBJbiB0
aGUgcGF0Y2ggNC81LCBjaGFuZ2UgdG8gZGlyZWN0bHkgdXNlIGVjYy5zdHJlbmd0aCB0bwo+ID4g
anVkZ2UgdGhlIHBhZ2UKPiA+ICAgICAgICBpcyBhIGVtcHR5IHBhZ2Ugb3Igbm90LCByYXRoZXIg
dGhhbiBtYXhfYml0ZmxpcHMgPCBtdGQtCj4gPiA+Yml0ZmxpcF90aHJlc2hvbGQKPiA+ICAgICAy
LiBJbiB0aGUgcGF0Y2ggNS81LCBmb3IgdGhlIHBvd2VybG9zcyBjYXNlLCBmcm9tIHRoZSBuZXh0
IHRpbWUKPiA+IGJvb3QgdXAsCj4gPiAgICAgICAgbG90cyBvZiBwYWdlIHdpbGwgYmUgcHJvZ3Jh
bW1lZCBmcm9tID5wYWdlMTUgYWRkcmVzcywgaWYKPiA+IHN0aWxsIHVzaW5nCj4gPiAgICAgICAg
Zmlyc3RfcCBhcyBHRU5NQVNLKCkgYml0bWFzayBzdGFydGluZyBwb3NpdGlvbiwgd3JpdHRlbnAK
PiA+IHdpbGwgYmUgYWx3YXlzIDAsCj4gPiAgICAgICAgZml4IGl0IGJ5IGNoYW5naW5nIGl0cyBi
aXRtYXNrIHN0YXJ0aW5nIGF0IGJpdCBwb3NpdGlvbiAwLgo+ID4gCj4gPiB2MiAtIHYzOgo+ID4g
ICAgIDEuIFJlYmFzZSBwYXRjaCB0byB0aGUgbGF0ZXN0IE1URCBnaXQgdHJlZQo+ID4gICAgIDIu
IEFkZCBhIHJlY29yZCB0aGF0IGtlZXBzIHRyYWNraW5nIHRoZSBwcm9ncmFtbWVkIHBhZ2VzIGlu
IHRoZQo+ID4gZmlyc3QgMTYKPiA+ICAgICAgICBwYWdlcwo+ID4gICAgIDMuIENoYW5nZSBmcm9t
IHByb2dyYW0gb2RkIHBhZ2VzLCBkYW1hZ2UgcGFnZSAwIGFuZCBwYWdlIDEsIHRvCj4gPiBwcm9n
cmFtIGFsbAo+ID4gICAgICAgIGZpcnN0IDE1IHBhZ2VzCj4gPiAgICAgNC4gQWRkcmVzcyBpc3N1
ZXMgd2hpY2ggZXhpc3QgaW4gdGhlIFYyLgo+ID4gCj4gPiB2MSAtIHYyOgo+ID4gICAgIDEuIFJl
YmFzZWQgVjEgdG8gbGF0ZXN0IExpbnV4IGtlcm5lbC4KPiA+ICAgICAyLiBBZGQgZXJhc2UgcHJl
cGFyYXRpb24gZnVuY3Rpb24gcG9pbnRlciBpbgo+ID4gbmFuZF9tYW51ZmFjdHVyZXJfb3BzLgo+
ID4gCj4gPiAKPiA+IFsxXSBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9saW51eC1tdGQv
bXNnMDQxMTIuaHRtbAo+ID4gWzJdIGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2xpbnV4
LW10ZC9tc2cwNDQ1MC5odG1sCj4gPiBbM10gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMv
bGludXgtbXRkL21zZzEzMDgzLmh0bWwKPiA+IAo+ID4gCj4gPiBCZWFuIEh1byAoNSk6Cj4gPiAg
IG10ZDogcmF3bmFuZDogZ3JvdXAgYWxsIE5BTkQgc3BlY2lmaWMgb3BzIGludG8gbmV3IG5hbmRf
Y2hpcF9vcHMKPiA+ICAgbXRkOiByYXduYW5kOiBBZGQge3ByZSxwb3N0fV9lcmFzZSBob29rcyBp
biBuYW5kX2NoaXBfb3BzCj4gPiAgIG10ZDogcmF3bmFuZDogQWRkIHdyaXRlX29vYiBob29rIGlu
IG5hbmRfY2hpcF9vcHMKPiA+ICAgbXRkOiByYXduYW5kOiBJbnRyb2R1Y2UgYSBuZXcgZnVuY3Rp
b24KPiA+IG5hbmRfY2hlY2tfaXNfZXJhc2VkX3BhZ2UoKQo+ID4gICBtdGQ6IHJhd25hbmQ6IG1p
Y3JvbjogTWljcm9uIFNMQyBOQU5EIGZpbGxpbmcgYmxvY2sKPiAKPiBXaGVuIHlvdSB0YWtlIG15
IHBhdGNoZXMgaW4geW91ciBzZXJpZXMsIGVzcGVjaWFsbHkgd2hlbiBub3QgdG91Y2hpbmcKPiB0
aGVtIGF0IGFsbCwgeW91IHNob3VsZCBrZWVwIG15IEF1dGhvcnNoaXAgYW5kIFNvQiBmaXJzdCwg
dGhlbiBhZGQKPiB5b3VyCj4gU29CLgo+IAoKc29ycnkgZm9yIG15IGZhdWx0LCBJIHRob3VnaHQg
YWRkaW5nIHlvdXIgU2lnbmVkLW9mZi1ieSBpbiAzLzUgaXMKc3VmZmllbnQuIHlvdSBtZWFuIEkg
c2hvdWxkIGFkZCB5b3VyIHNpZ25lZC1vZmYtYnkgaW4gNS81IGFzIHdlbGw/Ckkgd2lsbCBkbyB0
aGF0IGluIG5leHQgdmVyc2lvbi4KCnRoYW5rcyBNaXF1ZWwuCgoKQlRXOiB3b3VsZCB5b3UgcGxl
YXNlIGhlbHAgbWUgcmV2aWV3IG90aGVyIGNvZGU/CgoKIApCZWFuCgoKPiAKPiBUaGFua3MsCj4g
TWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
