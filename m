Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DC4C169C4
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 21:45:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55F0D21908
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 21:45:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l/C1TgZO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55F0D21908
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OqDmamwHeUnlNob1qX7RaykwOvk/bsWt+w9dLAkJ1C8=; b=l/C1TgZOgGHpOF
	TS9qiUWZ7R2mhp+ZGT5UgmL6y/2qJ1XDC0pEv31JeTY1Grg87u7mmFtcZlSTK7DfaH7nMSKpaRIIX
	uyA9qMXY7cqG8cr9gv2E2wr1qS+t+LRuRiC/aRfZTBjEBuKq2oMWLlSYuW3AS1S/y05dp27CoLQnl
	V14DmezfxKw86oe9Mp3EjzQfemKn7YNZ+RoKbNbbCPJ5TnWsQula+Imyutirpjk6ch5b//eobKban
	qXrAJt1Ia/u6BGZl6eydTZsDoPotfoqZO6G7EWxQ1sD+PYExB7GUOps2VI53ZU+Sra9tUhjsc87oN
	hIdJKEPu5Sg7VxeDRClA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsDy7-0005zD-P5; Fri, 08 Feb 2019 21:45:55 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsDy3-0005yT-Jc
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 21:45:53 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 279CC240006;
 Fri,  8 Feb 2019 21:45:41 +0000 (UTC)
Date: Fri, 8 Feb 2019 22:45:40 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] mtd: rawnand: call onfi_fill_data_interface() once
 again after nand_detect
Message-ID: <20190208224540.7e5b628c@xps13>
In-Reply-To: <CAK7LNAQ7P8iEkhyRBbHLdt6yN-dDgpLZOs256qwk2BpADiGcGw@mail.gmail.com>
References: <1549533476-3742-1-git-send-email-yamada.masahiro@socionext.com>
 <20190207111606.6b72dc34@xps13>
 <CAK7LNASEvAUeJsBcp4eh+XW+gaVp921SU-d1m-DEs+Hs+YA8TA@mail.gmail.com>
 <20190207140136.2ae62982@xps13>
 <CAK7LNAQ7P8iEkhyRBbHLdt6yN-dDgpLZOs256qwk2BpADiGcGw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_134551_947169_691DA1FC 
X-CRM114-Status: GOOD (  31.43  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBGcmksIDggRmViCjIwMTkgMTc6MzU6MzIgKzA5MDA6Cgo+IEhJIE1pcXVl
bCwKPiAKPiBPbiBUaHUsIEZlYiA3LCAyMDE5IGF0IDEwOjAyIFBNIE1pcXVlbCBSYXluYWwgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIE1hc2FoaXJvLAo+ID4K
PiA+IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+IHdyb3Rl
IG9uIFRodSwgNyBGZWIKPiA+IDIwMTkgMTk6NDY6NTQgKzA5MDA6Cj4gPiAgCj4gPiA+IE9uIFRo
dSwgRmViIDcsIDIwMTkgYXQgNzoxNiBQTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPiB3cm90ZTogIAo+ID4gPiA+Cj4gPiA+ID4gSGkgTWFzYWhpcm8sCj4gPiA+ID4K
PiA+ID4gPiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPiB3
cm90ZSBvbiBUaHUsICA3IEZlYgo+ID4gPiA+IDIwMTkgMTg6NTc6NTYgKzA5MDA6Cj4gPiA+ID4g
IAo+ID4gPiA+ID4gbmFuZF9zY2FuX2lkZW50KCkgY2FsbHMgb25maV9maWxsX2RhdGFfaW50ZXJm
YWNlKCkgYXQgaXRzIGVudHJ5Cj4gPiA+ID4gPiB0byBzZXQgdXAgdGhlIGluaXRpYWwgdGltaW5n
IHBhcmFtZXRlcnMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhlIHRpbWluZyBwYXJhbWV0ZXJzIGFy
ZSBuZWVkZWQgbm90IG9ubHkgZm9yIC0+c2V0dXBfZGF0YV9pbnRlcmZhY2UoKSwKPiA+ID4gPiA+
IGJ1dCBhbHNvIGZvciBnaXZpbmcgdGhlIGNvcnJlY3QgZGVsYXkgdG8gTkFORF9PUF9XQUlUX1JE
WSwgZm9yIGV4YW1wbGUuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSWYgdGhlIGRyaXZlciBzZXRzIHRo
ZSBOQU5EX0tFRVBfVElNSU5HUyBmbGFnLCBvciBkb2VzIG5vdCBzdXBwb3J0ICAKPiA+ID4gPiA+
IC0+c2V0dXBfZGF0YV9pbnRlcmZhY2UoKSBob29rLCB0aG9zZSBwYXJhbWV0ZXJzIHdpbGwgbmV2
ZXIgdXBkYXRlZC4gIAo+ID4gPiA+Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXiBiZSAgCj4gPiA+Cj4gPiA+IFdpbGwg
Zml4IChpZiB2MiBpcyB3ZWxjb21lKQo+ID4gPgo+ID4gPiAgCj4gPiA+ID4gPgo+ID4gPiA+ID4g
QmVmb3JlIG5hbmRfZGV0ZWN0KCksIHdlIG5ldmVyIGtub3cgd2hldGhlciB0aGUgY2hpcCBpcyBP
TkZpIG9yIG5vdC4KPiA+ID4gPiA+IFNvLCBvbmZpX2ZpbGxfZGF0YV9pbnRlcmZhY2UoKSBoYXMg
dG8gYXNzdW1lIHRoZSB3b3JzdCBjYXNlLCBpLmUuCj4gPiA+ID4gPiBub24tT05GaS4gIAo+ID4g
PiA+Cj4gPiA+ID4gcy9PTkZpL09ORkkvPyAgCj4gPiA+Cj4gPiA+IFdpbGwgZml4Lgo+ID4gPgo+
ID4gPiBMb29rcyBsaWtlIEkgd2FzIG1pc3VuZGVyc3RhbmRpbmcKPiA+ID4gbWF5YmUgYmVjYXVz
ZSB0aGUgbGV0dGVyICdJJyBpbiB0aGUgbG9nbwo+ID4gPiAoaHR0cDovL3d3dy5vbmZpLm9yZy8p
Cj4gPiA+IGxvb2tzIGxpa2UgYSBsb3dlcmNhc2UuLi4KPiA+ID4KPiA+ID4gIAo+ID4KPiA+IE9o
IHJpZ2h0LiBJIGRvbid0IGtub3cgd2hhdCdzIGJlc3QuIFBpY2sgeW91ciBmYXZvcml0ZSA6KQo+
ID4gIAo+ID4gPgo+ID4gPiAgCj4gPiA+ID4gIAo+ID4gPiA+ID4KPiA+ID4gPiA+IEFmdGVyIG5h
bmRfZGV0ZWN0KCksIGlmIHRoZSBjaGlwIHR1cm5zIG91dCB0byBiZSBPTkZpLWNvbXBsaWFudCwK
PiA+ID4gPiA+IHdlIGNhbiBvcHRpbWl6ZSB0UFJPR19tYXgsIHRCRVJTX21heCwgZXRjLgo+ID4g
PiA+ID4KPiA+ID4gPiA+IENhbGwgb25maV9maWxsX2RhdGFfaW50ZXJmYWNlKCkgb25jZSBhZ2Fp
bi4gIAo+ID4gPiA+Cj4gPiA+ID4gU29ycnkgYnV0IEkgZG9uJ3QgZ2V0IHdoeSB0aGlzIGlzIG5l
ZWRlZCBhcyB0aGVyZSBpcyB0aGUgc2FtZSBjYWxsIGF0Cj4gPiA+ID4gdGhlIHRvcCBvZiB0aGlz
IGZ1bmN0aW9uLiBDYW4geW91IGJlIG1vcmUgc3BlY2lmaWMgb24gd2hlcmUvd2hlbiB0aGUKPiA+
ID4gPiBtaXNzaW5nIGNhbGwgcHJvZHVjZXMgYSBmYWlsdXJlPyAgCj4gPiA+Cj4gPiA+Cj4gPiA+
IG9uZmlfZmlsbF9kYXRhX2ludGVyZmFjZSgpIHNldHMgZGlmZmVyZW50IHZhbHVlcwo+ID4gPiBm
b3IgdFBST0dfbWF4LCB0QkVSX21heCwgdFJfbWF4LCB0Q0NTX21pbgo+ID4gPiBkZXBlbmRpbmcg
b24gd2hldGhlciB0aGUgY2hpcCBpcyBPTkZJIG9yIG5vdC4KPiA+ID4KPiA+ID4gRm9yIHRoZSBm
aXJzdCBjYWxsLCBvbmZpX2ZpbGxfZGF0YV9pbnRlcmZhY2UoKQo+ID4gPiBjaG9vc2VzIHRoZSBl
bHNlLXBhcnQgc2luY2Ugd2UgbmV2ZXIga25vdwo+ID4gPiB0aGUgY2hpcCBzcGVjaWZpY2F0aW9u
IGF0IHRoaXMgcG9pbnQuCj4gPiA+Cj4gPiA+IElmIHdlIGNhbGwgb25maV9maWxsX2RhdGFfaW50
ZXJmYWNlKCkgb25jZSBhZ2Fpbgo+ID4gPiBhZnRlciBuYW5kX2RldGVjdCgpLCBpdCBtYXkgY2hv
b3NlIHRoZSBpZi1wYXJ0Lgo+ID4gPgo+ID4gPgo+ID4gPiBJZiBhIGRyaXZlciBzdXBwb3J0cyAt
PnNldHVwX2RhdGFfaW50ZXJmYWNlKCksCj4gPiA+IG5hbmRfaW5pdF9kYXRhX2ludGVyZmFjZSgp
IHdpbGwgc2V0IHRoZSBvcHRpbWFsCj4gPiA+IHRpbWluZyBwYXJhbWV0ZXJzIGFueXdheS4KPiA+
ID4KPiA+ID4gQnV0LCBpZiBhIGRyaXZlciBkb2VzIG5vdCBzdXBwb3J0IC0+c2V0dXBfZGF0YV9p
bnRlcmZhY2UoKSwKPiA+ID4gaXQgd2lsbCBub3QgaGFwcGVuIHNpbmNlIG5hbmRfaGFzX3NldHVw
X2RhdGFfaWZhY2UoKSByZXR1cm5zIGZhbHNlLiAgCj4gPgo+ID4gQW5kIEkgdGhpbmsgdGhpcyBp
cyB0aGUgZXhwZWN0ZWQgYmVoYXZpb3IuIENhbGxpbmcgYWdhaW4KPiA+IG9uZmlfZmlsbF9kYXRh
X2ludGVyZmFjZSgpIHdvdWxkIHByb2JhYmx5IGVuaGFuY2UgYSBiaXQgdGhlIHRpbWluZ3MuCj4g
PiBUaGUgZWZmZWN0IGlzIHRoYXQgbGF0ZXIgZXhjaGFuZ2VzIHdpdGggdGhlIE5BTkQgY2hpcCB3
b3VsZCBiZSBqdXN0IGEKPiA+IGJpdCBmYXN0ZXIuIEJ1dCBpZiB5b3UgY2FyZSBhYm91dCBwZXJm
b3JtYW5jZSwgdGhlbiB3aHkgbm90IGltcGxlbWVudGluZyAgCj4gPiAtPnNldHVwX2RhdGFfaW50
ZXJmYWNlKCk/IEV2ZW4gYSBkdW1teSBpbXBsZW1lbnRhdGlvbiB3b3VsZCBkbyB0aGUgIAo+ID4g
dHJpY2s6IG9ubHkgYWNjZXB0IHRpbWluZyBtb2RlIDAgd2l0aG91dCBhbnkgY2hhbmdlcyBvbiB0
aGUgY29udHJvbGxlcgo+ID4gc2lkZS4gIAo+IAo+IAo+IE15IGRyaXZlciAoZGVuYWxpKSBkb2Vz
IGltcGxlbWVudCAtPnNldHVwX2RhdGFfaW50ZXJmYWNlKCkuCgpGb3J0dW5hdGVseSwgeWVzISA6
KQoKPiAKPiBXaGVuIEkgd2FzIHRlc3RpbmcgdGhpcyB0aG9yb3VnaGx5IG9uIG15IGJvYXJkLAo+
IEkgbm90aWNlZCB0aGUgdGltaW5nIHBhcmFtZXRlcnMgd2VyZSBzbGlnaHRseSBjaGFuZ2VkCj4g
YWZ0ZXIgbmFuZF9kZXRlY3QoKSBkZXRlY3RlZCBPTkZJIGNoaXAuCgpJIHNlZS4KCj4gCj4gPiBV
bmxlc3MgeW91IGdpdmUgbWUgYSB1c2UgY2FzZSB3aGVyZSB0aGlzIGlzIG5vdCBwb3NzaWJsZSwg
SSBkb24ndCB0aGluawo+ID4gaXQgaXMgd29ydGggY2hhbmdpbmcgdGhpcyBwYXRoLiAgCj4gCj4g
T25seSB0aGUgdXNlIGNhc2UgSSBjYW4gY29tZSB1cCB3aXRoIGlzIHdoZW4gTkFORF9LRUVQX1RJ
TUlOR1Mgd2FzIHNldC4KPiBCdXQsIGl0IGlzIGp1c3QgYSBtYXR0ZXIgb2YgdGltZW91dCB2YWx1
ZXMuCj4gCj4gU28sIHBsZWFzZSB0aHJvdyBhd2F5IHRoaXMgcGF0Y2guCgpPayEKCgpUaGFua3Mg
YW55d2F5IGZvciB0aGUgcHJvcG9zYWwhCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
