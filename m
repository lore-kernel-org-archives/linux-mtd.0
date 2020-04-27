Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2215AC54FCB
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 14:49:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E29BD20661
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 14:49:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m2MGsGWk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E29BD20661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lv+09TAl3PymeZvBNkzT1WKpTdps5sjODxevilTGEs4=; b=m2MGsGWkqpwRsQ
	w86OsYoRgVqOuew2Cyo3nT+5GP8yfqjIke0+U4RhXeLNmAAoWL+GaPP7Ww2i/0m5zdmue9yblwOOy
	Yd3RdJs9bHSrfKXenIUU3t4yWS/4l3wti/s1gg0WQQWyw3y8gD0h+KdZQYdh/VFVjJ69OAuQvK1IJ
	OL+Qq+jzLq9edoTABL66t2kUfLmtJawHJIqNoFahxJMq/pPX0PFHYtfSWVIUWPD3XYQsyOEz7Ge6K
	uXyVVoIi4e6hzDyMBg/GkK5dsJ1KrmGJNwVbmQYNbPn9cRcSrwwTRsh4Pr0xTH3b7ByQgdKwKrzh5
	cTUVk/uGN2gQEIwTm86Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT54c-00055Z-W1; Mon, 27 Apr 2020 14:49:30 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT54Y-00054T-SE
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 14:49:29 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 47E66FF803;
 Mon, 27 Apr 2020 14:49:24 +0000 (UTC)
Date: Mon, 27 Apr 2020 16:49:22 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2] mtd: Fix mtd not the same name not registered if nvmem
Message-ID: <20200427164922.5829717f@xps13>
In-Reply-To: <20200427163711.07614619@collabora.com>
References: <20200401100240.445447-1-ribalda@kernel.org>
 <20200402065953.9974-1-ribalda@kernel.org>
 <CAPybu_34nSmbu4JMK-uA3SWrj_eMUftZ8S6zf1Vpg3Etkz3SPw@mail.gmail.com>
 <20200427162222.1c2b2c85@xps13>
 <20200427163711.07614619@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_074927_179260_958A7780 
X-CRM114-Status: GOOD (  22.25  )
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
Cc: Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBNb24sIDI3IEFwcgoyMDIwIDE2OjM3OjExICswMjAwOgoKPiBPbiBNb24sIDI3
IEFwciAyMDIwIDE2OjIyOjIyICswMjAwCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4gd3JvdGU6Cj4gCj4gPiBIaSBSaWNhcmRvLAo+ID4gCj4gPiBSaWNhcmRvIFJp
YmFsZGEgRGVsZ2FkbyA8cmliYWxkYUBrZXJuZWwub3JnPiB3cm90ZSBvbiBUdWUsIDE0IEFwciAy
MDIwCj4gPiAxNTo0NzoyMyArMDIwMDoKPiA+ICAgCj4gPiA+IFBpbmc/Cj4gPiA+IAo+ID4gPiBP
biBUaHUsIEFwciAyLCAyMDIwIGF0IDg6NTkgQU0gUmljYXJkbyBSaWJhbGRhIERlbGdhZG8KPiA+
ID4gPHJpYmFsZGFAa2VybmVsLm9yZz4gd3JvdGU6ICAgIAo+ID4gPiA+Cj4gPiA+ID4gV2hlbiB0
aGUgbnZtZW0gZnJhbWV3b3JrIGlzIGVuYWJsZWQsIGEgbnZtZW0gZGV2aWNlIGlzIGNyZWF0ZWQg
cGVyIG10ZAo+ID4gPiA+IGRldmljZS9wYXJ0aXRpb24uCj4gPiA+ID4KPiA+ID4gPiBJdCBpcyBu
b3QgdW5jb21tb24gdGhhdCBhIGRldmljZSBjYW4gaGF2ZSBtdWx0aXBsZSBtdGQgZGV2aWNlcyB3
aXRoCj4gPiA+ID4gcGFydGl0aW9ucyB0aGF0IGhhdmUgdGhlIHNhbWUgbmFtZS4gRWcsIHdoZW4g
dGhlcmUgRFQgb3ZlcmxheSBpcyBhbGxvd2VkCj4gPiA+ID4gYW5kIHRoZSBzYW1lIGRldmljZSB3
aXRoIG10ZCBpcyBhdHRhY2hlZCB0d2ljZS4KPiA+ID4gPgo+ID4gPiA+IFVuZGVyIHRoYXQgY2ly
Y3Vtc3RhbmNlcywgdGhlIG10ZCBmYWlscyB0byByZWdpc3RlciBkdWUgdG8gYSBuYW1lCj4gPiA+
ID4gZHVwbGljYXRpb24gb24gdGhlIG52bWVtIGZyYW1ld29yay4KPiA+ID4gPgo+ID4gPiA+IFdp
dGggdGhpcyBwYXRjaCB3ZSBhZGQgYSBfMSwgXzIsIF9YIHRvIHRoZSBzdWJzZXF1ZW50IG5hbWVz
IGlmIHRoZXJlIGlzCj4gPiA+ID4gYSBjb2xsaXRpb24sIGFuZCB0aHJvdyBhIHdhcm5pbmcsIGlu
c3RlYWQgb2Ygbm90IHN0YXJ0aW5nIHRoZSBtdGQKPiA+ID4gPiBkZXZpY2UuCj4gPiA+ID4KPiA+
ID4gPiBbICAgIDguOTQ4OTkxXSBzeXNmczogY2Fubm90IGNyZWF0ZSBkdXBsaWNhdGUgZmlsZW5h
bWUgJy9idXMvbnZtZW0vZGV2aWNlcy9Qcm9kdWN0aW9uIERhdGEnCj4gPiA+ID4gWyAgICA4Ljk0
ODk5Ml0gQ1BVOiA3IFBJRDogMjQ2IENvbW06IHN5c3RlbWQtdWRldmQgTm90IHRhaW50ZWQgNS41
LjAtcXRlYy1zdGFuZGFyZCAjMTMKPiA+ID4gPiBbICAgIDguOTQ4OTkzXSBIYXJkd2FyZSBuYW1l
OiBBTUQgRGliYmxlci9EaWJibGVyLCBCSU9TIDA1LjIyLjA0LjAwMTkgMTAvMjYvMjAxOQo+ID4g
PiA+IFsgICAgOC45NDg5OTRdIENhbGwgVHJhY2U6Cj4gPiA+ID4gWyAgICA4Ljk0ODk5Nl0gIGR1
bXBfc3RhY2srMHg1MC8weDcwCj4gPiA+ID4gWyAgICA4Ljk0ODk5OF0gIHN5c2ZzX3dhcm5fZHVw
LmNvbGQrMHgxNy8weDJkCj4gPiA+ID4gWyAgICA4Ljk0OTAwMF0gIHN5c2ZzX2RvX2NyZWF0ZV9s
aW5rX3NkLmlzcmEuMCsweGMyLzB4ZDAKPiA+ID4gPiBbICAgIDguOTQ5MDAyXSAgYnVzX2FkZF9k
ZXZpY2UrMHg3NC8weDE0MAo+ID4gPiA+IFsgICAgOC45NDkwMDRdICBkZXZpY2VfYWRkKzB4MzRi
LzB4ODUwCj4gPiA+ID4gWyAgICA4Ljk0OTAwNl0gIG52bWVtX3JlZ2lzdGVyLnBhcnQuMCsweDFi
Zi8weDY0MAo+ID4gPiA+IC4uLgo+ID4gPiA+IFsgICAgOC45NDg5MjZdIG10ZCBtdGQ4OiBGYWls
ZWQgdG8gcmVnaXN0ZXIgTlZNRU0gZGV2aWNlCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBSaWNhcmRvIFJpYmFsZGEgRGVsZ2FkbyA8cmliYWxkYUBrZXJuZWwub3JnPiAgICAKPiA+IAo+
ID4gVGhhbmtzIGZvciBwcm9wb3NpbmcgdGhpcyBjaGFuZ2UuIEluZGVlZCB3ZSBhcmUgYXdhcmUg
b2YgdGhlIHByb2JsZW0KPiA+IGFuZCB0aGUgYmVzdCBzb2x1dGlvbiB0aGF0IHdlIGNvdWxkIGNv
bWUgdXAgd2l0aCB3YXMgdG8gY3JlYXRlIGFuCj4gPiBhZGRpdGlvbmFsICJ1bmlxdWVfbmFtZSIg
ZmllbGQgdG8gdGhlIG10ZF9pbmZvIHN0cnVjdHVyZS4gVGhpcyBuZXcKPiA+IGZpZWxkIHdvdWxk
IGhhdmUgdGhlIGZvcm06Cj4gPiAKPiA+ICAgICBbPHBhcmVudC11bmlxdWUtbmFtZT48c2VwYXJh
dG9yPl08bXRkLW5hbWU+Cj4gPiAKPiA+IFRoZSBzZXBhcmF0b3IgbWlnaHQgYmUgJ34nIChidXQg
SSBhbSBjb21wbGV0ZWx5IG9wZW4gb24gdGhhdCksIGFuZCB0aGF0Cj4gPiB3b3VsZCBnaXZlIGZv
ciBpbnN0YW5jZToKPiA+IAo+ID4gICAgIG15LWNvbnRyb2xsZXJ+bXktZGV2aWNlfm15LXBhcnR+
bXlzdWItcGFydCAgCj4gCj4gSSdkIHByZWZlciBzb21ldGhpbmcgc2xpZ2h0bHkgbW9yZSBzdGFu
ZGFyZCBmb3IgdGhlIHNlcGFyYXRvciwgbGlrZSAnLycsCj4gd2hpY2ggaXMgd2hhdCB3ZSB1c3Vh
bGx5IHVzZSB3aGVuIHdlIHdhbnQgdG8gcmVwcmVzZW50IGEgcGF0aCBpbiBhIHRyZWUuCj4gSSBk
byBhZ3JlZSBvbiB0aGUgZ2VuZXJhbCBhcHByb2FjaCB0aG91Z2guCgpJIGFtIG5vdCBzdXJlIC8g
aXMgYSB2YWxpZCBzZXBhcmF0b3IgaGVyZSB3ZSB3b3VsZCB1c2UgdGhpcwpuYW1lIHRvIGNyZWF0
ZSBhIHN5c2ZzIGVudHJ5LiBXb3VsZCBpdCB3b3JrPwoKPiBOb3RlIHRoYXQgY29udHJvbGxlciBu
YW1lIGlzIG5vcm1hbGx5IGhpZGRlbiBpbiB0aGUgcm9vdCBNVEQgZGV2aWNlCj4gbmFtZSwgYW5k
IGl0J3MgdGhlIGRyaXZlciByZXNwb25zaWJpbGl0eSB0byBjb21lIHVwIHdpdGggYSBuYW1lIHRo
YXQKPiBkb2VzIG5vdCBjb2xsaWRlIHdpdGggb3RoZXIgTVREIGRyaXZlcnMuIFdlIGNhbiBvZiBj
b3Vyc2UgdHJ5IHRvIHBpY2sgYQo+IGRpZmZlcmVudCBuYW1lIGlmIHdlIHNlZSBhbm90aGVyIGRl
dmljZSB3aXRoIHRoZSBzYW1lIG5hbWUsIGJ1dCB3ZQo+IHNob3VsZCBkZWZpbml0ZWx5IHdhcm4g
YWJvdXQgdGhhdCBzbyBkcml2ZXJzIGFyZSBwYXRjaGVkIGFjY29yZGluZ2x5LgoKWWVzIGFic29s
dXRlbHkuCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
