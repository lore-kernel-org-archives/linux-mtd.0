Return-Path: <SRS0=de6p=NP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26CD0C4320A
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Aug 2021 17:23:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E215361504
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Aug 2021 17:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E215361504
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lKrHiX0EAS+tGv86aWGXqSdRR8Fd80uNA/YNh9lEHTU=; b=Tyo/2K+9RYMghg
	3LIFXVWnc5QlX3oIQLweKjsWwYIAd5pfs5liWL9XEkF1kDv5YWIigUrBUZdfrernDlSUgjK9/4W4v
	mG1MqFt4qLiqhBhbwo0kcTtmlQp1Tu7wzhYZ7gDOAV2tjaNlglrIsXcq/Q7cTeQI4i9UHhqyQNVdm
	JTvYp/GOxFDycI6NGClnWzL7hA7M30zimBta4BodBkhsYV1Yx3g/yM5NJAqOeUG7gqyko8dbs251R
	KPwMBYd9rcVlgCIAGV1fL5MvW4bojsNnYoiBJZ0hzV4EWUEUqg2y50nqDz6qTvMXJeb9TLNLKgpH7
	wzBW3PnHttlzvocRWc5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIa7q-0048cQ-8e; Tue, 24 Aug 2021 17:22:14 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIa7k-0048ZP-GB
 for linux-mtd@lists.infradead.org; Tue, 24 Aug 2021 17:22:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0A9BF200003;
 Tue, 24 Aug 2021 17:22:04 +0000 (UTC)
Date: Tue, 24 Aug 2021 19:22:03 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kestrel seventyfour <kestrelseventyfour@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: xway: No hardcoded ECC engine, use
 device tree setting
Message-ID: <20210824192203.076df55e@xps13>
In-Reply-To: <CAE9cyGTKFcMuxePo2SgxkBe_cWvP5nZ_SDcnuUtwaE5o9oVq3g@mail.gmail.com>
References: <20210808072643.GA5084@ubuntu> <20210816093126.442f74a1@xps13>
 <CAE9cyGQ+Bb3rQxiF4My9zXwg_+QYifaCckE=C6spAtN9_4dBFQ@mail.gmail.com>
 <20210819100334.6af2d86e@xps13>
 <CAE9cyGSF2vTCptSZd3uMFaZPD=as=PwZY14S+zDhzjWCmsfmpQ@mail.gmail.com>
 <20210823172413.0bc4ab3a@xps13>
 <CAE9cyGTKFcMuxePo2SgxkBe_cWvP5nZ_SDcnuUtwaE5o9oVq3g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_102208_699984_952EBD2E 
X-CRM114-Status: GOOD (  26.74  )
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

SGVsbG8sCgpLZXN0cmVsIHNldmVudHlmb3VyIDxrZXN0cmVsc2V2ZW50eWZvdXJAZ21haWwuY29t
PiB3cm90ZSBvbiBUdWUsIDI0IEF1ZwoyMDIxIDA5OjE1OjQ5ICswMjAwOgoKPiBIaSBNaXF1w6hs
LAo+IAo+IEFtIE1vLiwgMjMuIEF1Zy4gMjAyMSB1bSAxNzoyNCBVaHIgc2NocmllYiBNaXF1ZWwg
UmF5bmFsCj4gPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Ogo+ID4KPiA+IEhpIEtlc3RyZWws
Cj4gPgo+ID4gS2VzdHJlbCBzZXZlbnR5Zm91ciA8a2VzdHJlbHNldmVudHlmb3VyQGdtYWlsLmNv
bT4gd3JvdGUgb24gTW9uLCAyMyBBdWcKPiA+IDIwMjEgMTM6MTk6NDMgKzAyMDA6Cj4gPiAgCj4g
PiA+IEhpIE1pcXXDqGwsCj4gPiA+Cj4gPiA+IEFtIERvLiwgMTkuIEF1Zy4gMjAyMSB1bSAxMDow
MyBVaHIgc2NocmllYiBNaXF1ZWwgUmF5bmFsCj4gPiA+IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPjogIAo+IC4uLgo+ID4gPgo+ID4gPiB0aGFuayB5b3UgZm9yIHlvdXIgcmVzcG9uc2UuCj4g
PiA+IElmIEkgcmVtb3ZlIHRoZSBuYW5kLWVjYy14eHggcHJvcGVydGllcyBpbiB0aGUgZGV2aWNl
IHRyZWUsIHRoZSBkZXZpY2Ugd2l0aAo+ID4gPiB0aGUgVG9zaGliYSBOQU5EIGNoaXAgaXMgd29y
a2luZy4gSG93ZXZlciwgdGhlIGRldmljZSB3aXRoIHRoZSBNaWNyb24KPiA+ID4gTkFORCBmYWls
cyB3aXRoIE5PIEVDQyBmdW5jdGlvbnMgc3VwcGxpZWQ7IGhhcmR3YXJlIEVDQyBub3QgcG9zc2li
bGUsCj4gPiA+IHNlZW1zIHRvIGJlIGF0IGxpbmUgNTM2NyBvciBlcXVpdmFsZW50Lgo+ID4gPiBo
dHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvbXRk
L25hbmQvcmF3L25hbmRfYmFzZS5jI0w1MzY3Cj4gPiA+Cj4gPiA+IEl0IGxvb2tzIGxpa2UgdGhl
IG1pY3JvbiBuYW5kIGRyaXZlciBzdXBwb3J0cyBvbiBkaWUgb25seSBpZiBpdHMKPiA+ID4gc3Bl
Y2lmaWVkIGludCB0aGUKPiA+ID4gRGV2aWNlIHRyZWU6Cj4gPiA+IGh0dHBzOi8vZWxpeGlyLmJv
b3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9t
aWNyb24uYyNMNTExCj4gPiA+IFRoZSBNaWNyb24gTkFORCBkcml2ZXIgcHJvYmFibHkgbmVlZHMg
dG8gc2V0IHRoZSBFQ0MgdHlwZSB0byBPTiBESUUgaWYgdGhlCj4gPiA+IHZhcmlhYmxlIG9uZGll
IGNvbnRhaW5zIHRoZSBzdXBwb3J0ZWQgYXR0cmlidXRlPyEgIAo+ID4KPiA+IFlvdSdyZSByaWdo
dCBidXQgSSBkb24ndCBzZWUgYW55IGVhc3kgdXBzdHJlYW0tYWJsZSBzb2x1dGlvbiBoZXJlLgo+
ID4gQ2hhbmdpbmcgdGhlIGJlaGF2aW9yIGluIHRoZSBYd2F5IGRyaXZlciB3b3VsZCBjZXJ0YWlu
bHkgYnJlYWsgdXNlcnMsCj4gPiBjaGFuZ2luZyB0aGUgYmVoYXZpb3IgaW4gdGhlIE1pY3JvbiBk
cml2ZXIgd291bGQgY2VydGFpbmx5IGJyZWFrIGV2ZW4KPiA+IG1vcmUgdXNlcnMuIFRoZSByb290
IGNhdXNlIGJlaW5nIGFuIGFic2VuY2Ugb2YgcHJvcGVyIGRlc2NyaXB0aW9uICh0aGUKPiA+IGlu
dGVncmF0aW9uIGNoYW5nZWQpLiBIb25lc3RseSBJIGZlZWwgc3R1Y2ssIG1heWJlIHlvdSBjYW4g
dHJ5IHRvCj4gPiByZWdpc3RlciB5b3VyIGRldmljZSwgaWYgaXQgZmFpbHMsIGNoYW5nZSB0aGUg
aW50ZWdyYXRpb24gaW4gdGhlIGRyaXZlcgo+ID4gKHRvIGFuIG9uZGllIGVjYyBlbmdpbmUpIHRo
ZW4gcmV0cnk/Cj4gPgo+ID4gVGhhbmtzLAo+ID4gTWlxdcOobCAgCj4gCj4gRG8geW91IHRoaW5r
IGFkZGluZyBzb21ldGhpbmcgbGlrZSBiZWxvdyBhdCB0aGUgZm9sbG93aW5nIGxvY2F0aW9uCj4g
aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy94d2F5X25hbmQuYyNMMjIzCj4gd291bGQgYmUgdXBzdHJlYW1hYmxlICh3aXRo
IG9yIHdpdGhvdXQgZGV2aWNlIHRyZWUgcHJvcGVydHk/KT8KPiAKPiAgICAgICAgIGVyciA9IG5h
bmRfc2NhbigmZGF0YS0+Y2hpcCwgMSk7Cj4gICAgICAgICBpZiAoZXJyIC8qICYmIG9mX3Byb3Bl
cnR5X3JlYWRfYm9vbChucCwgImxhbnRpcSxyZXRyeS1vbi1kaWUiKSAqLykgewo+ICAgICAgICAg
ICAgICAgICBkYXRhLT5jaGlwLmVjYy5lbmdpbmVfdHlwZSA9IE5BTkRfRUNDX0VOR0lORV9UWVBF
X09OX0RJRTsKPiAgICAgICAgICAgICAgICAgZXJyID0gbmFuZF9zY2FuKCZkYXRhLT5jaGlwLCAx
KTsKPiAgICAgICAgICAgICAgICAgaWYgKGVycikgcmV0dXJuIGVycjsKPiAgICAgICAgIH0KPiAK
PiBJdCBzdGlsbCB0aHJvd3MgdGhlIGtlcm5lbCB3YXJuaW5nIG9uIGZpcnN0IHRyeSwgYnV0IHRo
ZSBzZWNvbmQgdHJ5IHRoZW4gd29ya3MuCgpDYW4geW91IHBsZWFzZSByZW1pbmQgbWUgd2hhdCBp
cyB4d2F5L2xhbnRpcS95b3VyIHNldHVwL2hvdyBwdWJsaWMgaXQKaXMvd2hvJ3MgdXNpbmcgdGhp
cyBkcml2ZXI/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
