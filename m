Return-Path: <SRS0=ZMJ0=QO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF8FC282C2
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 13:01:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D30B21904
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 13:01:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JvI7kT3t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D30B21904
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P8UcmmXREPf8MwqyB+JxeEi4DgrndKTRaLBd64kEszY=; b=JvI7kT3tIVlgWY
	1+aWsLPc7/bN4Gcad9WdqXSdxDCIkpo+/iMbZj0wrm8kYf4FgMmT7VqXjEcYqhMa9JIPwm6imuzYi
	kYb7jMf7+1MGybuhzF6gpaQALlWl8H3CMl8jKH1ifxjm7q2vKTyrYB9/e46B7qW6UKTkxbFYLQHeo
	xhtoGXRCkm3/rjRVKMpjyDBzwRxp4cCKTJUScNh9MZkL2Hug+V3DzNuy8lrd7FKfBQ4Skq/MaULbG
	QvH4iCko8paz42S8GWjOXRtfwyNUz2LHaZv7E6/6yWmYK89Yxom7eZaKad4xQWsyUv5yCR/sQlW2b
	gfYmwTBJcNJMkPYNMyNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grjJN-0002Gh-NM; Thu, 07 Feb 2019 13:01:49 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grjJJ-0002FY-Kv
 for linux-mtd@lists.infradead.org; Thu, 07 Feb 2019 13:01:47 +0000
Received: from xps13 (aaubervilliers-681-1-80-177.w90-88.abo.wanadoo.fr
 [90.88.22.177]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 587DC100002;
 Thu,  7 Feb 2019 13:01:36 +0000 (UTC)
Date: Thu, 7 Feb 2019 14:01:36 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] mtd: rawnand: call onfi_fill_data_interface() once
 again after nand_detect
Message-ID: <20190207140136.2ae62982@xps13>
In-Reply-To: <CAK7LNASEvAUeJsBcp4eh+XW+gaVp921SU-d1m-DEs+Hs+YA8TA@mail.gmail.com>
References: <1549533476-3742-1-git-send-email-yamada.masahiro@socionext.com>
 <20190207111606.6b72dc34@xps13>
 <CAK7LNASEvAUeJsBcp4eh+XW+gaVp921SU-d1m-DEs+Hs+YA8TA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_050145_988941_F5843B61 
X-CRM114-Status: GOOD (  26.43  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBUaHUsIDcgRmViCjIwMTkgMTk6NDY6NTQgKzA5MDA6Cgo+IE9uIFRodSwg
RmViIDcsIDIwMTkgYXQgNzoxNiBQTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3Rs
aW4uY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBNYXNhaGlybywKPiA+Cj4gPiBNYXNhaGlybyBZYW1h
ZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPiB3cm90ZSBvbiBUaHUsICA3IEZlYgo+
ID4gMjAxOSAxODo1Nzo1NiArMDkwMDoKPiA+ICAKPiA+ID4gbmFuZF9zY2FuX2lkZW50KCkgY2Fs
bHMgb25maV9maWxsX2RhdGFfaW50ZXJmYWNlKCkgYXQgaXRzIGVudHJ5Cj4gPiA+IHRvIHNldCB1
cCB0aGUgaW5pdGlhbCB0aW1pbmcgcGFyYW1ldGVycy4KPiA+ID4KPiA+ID4gVGhlIHRpbWluZyBw
YXJhbWV0ZXJzIGFyZSBuZWVkZWQgbm90IG9ubHkgZm9yIC0+c2V0dXBfZGF0YV9pbnRlcmZhY2Uo
KSwKPiA+ID4gYnV0IGFsc28gZm9yIGdpdmluZyB0aGUgY29ycmVjdCBkZWxheSB0byBOQU5EX09Q
X1dBSVRfUkRZLCBmb3IgZXhhbXBsZS4KPiA+ID4KPiA+ID4gSWYgdGhlIGRyaXZlciBzZXRzIHRo
ZSBOQU5EX0tFRVBfVElNSU5HUyBmbGFnLCBvciBkb2VzIG5vdCBzdXBwb3J0ICAKPiA+ID4gLT5z
ZXR1cF9kYXRhX2ludGVyZmFjZSgpIGhvb2ssIHRob3NlIHBhcmFtZXRlcnMgd2lsbCBuZXZlciB1
cGRhdGVkLiAgCj4gPgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXiBiZSAgCj4gCj4gV2lsbCBmaXggKGlmIHYyIGlzIHdlbGNv
bWUpCj4gCj4gCj4gPiA+Cj4gPiA+IEJlZm9yZSBuYW5kX2RldGVjdCgpLCB3ZSBuZXZlciBrbm93
IHdoZXRoZXIgdGhlIGNoaXAgaXMgT05GaSBvciBub3QuCj4gPiA+IFNvLCBvbmZpX2ZpbGxfZGF0
YV9pbnRlcmZhY2UoKSBoYXMgdG8gYXNzdW1lIHRoZSB3b3JzdCBjYXNlLCBpLmUuCj4gPiA+IG5v
bi1PTkZpLiAgCj4gPgo+ID4gcy9PTkZpL09ORkkvPyAgCj4gCj4gV2lsbCBmaXguCj4gCj4gTG9v
a3MgbGlrZSBJIHdhcyBtaXN1bmRlcnN0YW5kaW5nCj4gbWF5YmUgYmVjYXVzZSB0aGUgbGV0dGVy
ICdJJyBpbiB0aGUgbG9nbwo+IChodHRwOi8vd3d3Lm9uZmkub3JnLykKPiBsb29rcyBsaWtlIGEg
bG93ZXJjYXNlLi4uCj4gCj4gCgpPaCByaWdodC4gSSBkb24ndCBrbm93IHdoYXQncyBiZXN0LiBQ
aWNrIHlvdXIgZmF2b3JpdGUgOikKCj4gCj4gCj4gPiAgCj4gPiA+Cj4gPiA+IEFmdGVyIG5hbmRf
ZGV0ZWN0KCksIGlmIHRoZSBjaGlwIHR1cm5zIG91dCB0byBiZSBPTkZpLWNvbXBsaWFudCwKPiA+
ID4gd2UgY2FuIG9wdGltaXplIHRQUk9HX21heCwgdEJFUlNfbWF4LCBldGMuCj4gPiA+Cj4gPiA+
IENhbGwgb25maV9maWxsX2RhdGFfaW50ZXJmYWNlKCkgb25jZSBhZ2Fpbi4gIAo+ID4KPiA+IFNv
cnJ5IGJ1dCBJIGRvbid0IGdldCB3aHkgdGhpcyBpcyBuZWVkZWQgYXMgdGhlcmUgaXMgdGhlIHNh
bWUgY2FsbCBhdAo+ID4gdGhlIHRvcCBvZiB0aGlzIGZ1bmN0aW9uLiBDYW4geW91IGJlIG1vcmUg
c3BlY2lmaWMgb24gd2hlcmUvd2hlbiB0aGUKPiA+IG1pc3NpbmcgY2FsbCBwcm9kdWNlcyBhIGZh
aWx1cmU/ICAKPiAKPiAKPiBvbmZpX2ZpbGxfZGF0YV9pbnRlcmZhY2UoKSBzZXRzIGRpZmZlcmVu
dCB2YWx1ZXMKPiBmb3IgdFBST0dfbWF4LCB0QkVSX21heCwgdFJfbWF4LCB0Q0NTX21pbgo+IGRl
cGVuZGluZyBvbiB3aGV0aGVyIHRoZSBjaGlwIGlzIE9ORkkgb3Igbm90Lgo+IAo+IEZvciB0aGUg
Zmlyc3QgY2FsbCwgb25maV9maWxsX2RhdGFfaW50ZXJmYWNlKCkKPiBjaG9vc2VzIHRoZSBlbHNl
LXBhcnQgc2luY2Ugd2UgbmV2ZXIga25vdwo+IHRoZSBjaGlwIHNwZWNpZmljYXRpb24gYXQgdGhp
cyBwb2ludC4KPiAKPiBJZiB3ZSBjYWxsIG9uZmlfZmlsbF9kYXRhX2ludGVyZmFjZSgpIG9uY2Ug
YWdhaW4KPiBhZnRlciBuYW5kX2RldGVjdCgpLCBpdCBtYXkgY2hvb3NlIHRoZSBpZi1wYXJ0Lgo+
IAo+IAo+IElmIGEgZHJpdmVyIHN1cHBvcnRzIC0+c2V0dXBfZGF0YV9pbnRlcmZhY2UoKSwKPiBu
YW5kX2luaXRfZGF0YV9pbnRlcmZhY2UoKSB3aWxsIHNldCB0aGUgb3B0aW1hbAo+IHRpbWluZyBw
YXJhbWV0ZXJzIGFueXdheS4KPiAKPiBCdXQsIGlmIGEgZHJpdmVyIGRvZXMgbm90IHN1cHBvcnQg
LT5zZXR1cF9kYXRhX2ludGVyZmFjZSgpLAo+IGl0IHdpbGwgbm90IGhhcHBlbiBzaW5jZSBuYW5k
X2hhc19zZXR1cF9kYXRhX2lmYWNlKCkgcmV0dXJucyBmYWxzZS4KCkFuZCBJIHRoaW5rIHRoaXMg
aXMgdGhlIGV4cGVjdGVkIGJlaGF2aW9yLiBDYWxsaW5nIGFnYWluCm9uZmlfZmlsbF9kYXRhX2lu
dGVyZmFjZSgpIHdvdWxkIHByb2JhYmx5IGVuaGFuY2UgYSBiaXQgdGhlIHRpbWluZ3MuClRoZSBl
ZmZlY3QgaXMgdGhhdCBsYXRlciBleGNoYW5nZXMgd2l0aCB0aGUgTkFORCBjaGlwIHdvdWxkIGJl
IGp1c3QgYQpiaXQgZmFzdGVyLiBCdXQgaWYgeW91IGNhcmUgYWJvdXQgcGVyZm9ybWFuY2UsIHRo
ZW4gd2h5IG5vdCBpbXBsZW1lbnRpbmcKLT5zZXR1cF9kYXRhX2ludGVyZmFjZSgpPyBFdmVuIGEg
ZHVtbXkgaW1wbGVtZW50YXRpb24gd291bGQgZG8gdGhlCnRyaWNrOiBvbmx5IGFjY2VwdCB0aW1p
bmcgbW9kZSAwIHdpdGhvdXQgYW55IGNoYW5nZXMgb24gdGhlIGNvbnRyb2xsZXIKc2lkZS4KClVu
bGVzcyB5b3UgZ2l2ZSBtZSBhIHVzZSBjYXNlIHdoZXJlIHRoaXMgaXMgbm90IHBvc3NpYmxlLCBJ
IGRvbid0IHRoaW5rCml0IGlzIHdvcnRoIGNoYW5naW5nIHRoaXMgcGF0aC4KCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
