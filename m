Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B914C28CF5
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 10:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IEQni0/2IW/xcDDEhUYUczEW1rqkhO/waj9TxtLmtTo=; b=VZgRVPPToJo2lr
	8fOOvhw3RoCH9pbqlCrqh6YyQFwO61B+60Y2gqjur/HYC5umFOQGluPuuerLIsi7IkBpSHU3xTFlk
	xT0kz7TtdW9+Po6bzUaeNKb1vMJD905ocDJDtoYXl2unh2B5Gj/jFcEIFhmk5eiKrVPi5rACwhOHl
	V6DCKZ9mTluzPx7N/V5BUrIkH/kb7X1/nsoaiU+wNHov3EaATyYVt5IOWy4zSze5hDTbD/gYYsF+8
	x0Tj6R++wAst9an0ljZAdtuN8xvipXl19YqgguJQOpQvWs6DLuphOdbALQCBPGgzaCoYNgSLB5ZHq
	4JsgYNNqx/WyaqfP+z6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCfkh-00BJ7X-Jt; Wed, 26 Jan 2022 10:42:11 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCfkc-00BJ5Q-Bb
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 10:42:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 41EA1FF80C;
 Wed, 26 Jan 2022 10:42:01 +0000 (UTC)
Date: Wed, 26 Jan 2022 11:42:00 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 jamipkettunen@somainline.org, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 mdalam@codeaurora.org, sricharan@codeaurora.org
Subject: Re: [PATCH] mtd: nand: raw: qcom_nandc: Don't clear_bam_transaction
 on READID
Message-ID: <20220126114200.4cc3c21b@xps13>
In-Reply-To: <20220126103316.GA212068@thinkpad>
References: <20220113184427.2259509-1-konrad.dybcio@somainline.org>
 <20220114082718.32a2fc83@xps13> <20220126111613.3ab0021e@xps13>
 <20220126103316.GA212068@thinkpad>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_024206_612982_271AF6AF 
X-CRM114-Status: GOOD (  28.67  )
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

SGkgTWFuaSwKCm1hbmlAa2VybmVsLm9yZyB3cm90ZSBvbiBXZWQsIDI2IEphbiAyMDIyIDE2OjAz
OjE2ICswNTMwOgoKPiBPbiBXZWQsIEphbiAyNiwgMjAyMiBhdCAxMToxNjoxM0FNICswMTAwLCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGVsbG8sCj4gPiAKPiA+IG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20gd3JvdGUgb24gRnJpLCAxNCBKYW4gMjAyMiAwODoyNzoxOCArMDEwMDoKPiA+ICAg
Cj4gPiA+IEhpIEtvbnJhZCwKPiA+ID4gCj4gPiA+IGtvbnJhZC5keWJjaW9Ac29tYWlubGluZS5v
cmcgd3JvdGUgb24gVGh1LCAxMyBKYW4gMjAyMiAxOTo0NDoyNiArMDEwMDoKPiA+ID4gICAKPiA+
ID4gPiBXaGlsZSBJIGhhdmUgYWJzb2x1dGVseSAwIGlkZWEgd2h5IGFuZCBob3csIHJ1bm5pbmcg
Y2xlYXJfYmFtX3RyYW5zYWN0aW9uCj4gPiA+ID4gd2hlbiBSRUFESUQgaXMgaXNzdWVkIG1ha2Vz
IHRoZSBETUEgdG90YWxseSBjbG9nIHVwIGFuZCByZWZ1c2UgdG8gZnVuY3Rpb24KPiA+ID4gPiBh
dCBhbGwgb24gbWRtOTYwNy4gSW4gZmFjdCwgaXQgaXMgc28gYmFkIHRoYXQgYWxsIHRoZSBkYXRh
IGdldHMgZ2FyYmxlZAo+ID4gPiA+IGFuZCBhZnRlciBhIHNob3J0IHdoaWxlIGluIHRoZSBuYW5k
IHByb2JlIGZsb3csIHRoZSBDUFUgZGVjaWRlcyB0aGF0Cj4gPiA+ID4gc2VwdWt1IGlzIHRoZSBv
bmx5IG9wdGlvbi4KPiA+ID4gPiAKPiA+ID4gPiBSZW1vdmluZyBfUkVBRElEIGZyb20gdGhlIGlm
IGNvbmRpdGlvbiBtYWtlcyBpdCB3b3JrIGxpa2UgYSBjaGFybSwgSSBjYW4KPiA+ID4gPiByZWFk
IGRhdGEgYW5kIG1vdW50IHBhcnRpdGlvbnMgd2l0aG91dCBhIHByb2JsZW0uCj4gPiA+ID4gCj4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogS29ucmFkIER5YmNpbyA8a29ucmFkLmR5YmNpb0Bzb21haW5s
aW5lLm9yZz4KPiA+ID4gPiAtLS0KPiA+ID4gPiBUaGlzIGlzIHRvdGFsbHkganVzdCBhbiBvYnNl
cnZhdGlvbiB3aGljaCB0b29rIG1lIGFuIGluaHVtYW5lIGFtb3VudCBvZgo+ID4gPiA+IGRlYnVn
IHByaW50cyB0byBmaW5kLi4gcGVyaGFwcyB0aGVyZSdzIGEgYmV0dGVyIHJlYXNvbiBiZWhpbmQg
dGhpcywgYnV0Cj4gPiA+ID4gSSBjYW4ndCBzZWVtIHRvIGZpbmQgYW55IGFuc3dlcnMuLiBUaGVy
ZWZvcmUsIHRoaXMgaXMgYSBCSUcgUkZDISAgICAKPiA+ID4gCj4gPiA+IEknbSBhZGRpbmcgdHdv
IHBlb3BsZSBmcm9tIGNvZGVhdXJvcmEgd2hvIHdvcmtlZCBhIGxvdCBvbiB0aGlzIGRyaXZlci4K
PiA+ID4gSG9wZWZ1bGx5IHRoZXkgd2lsbCBoYXZlIGFuIGlkZWEgOikgIAo+ID4gCj4gPiBTYWRy
ZSwgSSd2ZSBzcGVudCBhIHNpZ25pZmljYW50IGFtb3VudCBvZiB0aW1lIHJldmlld2luZyB5b3Vy
IHBhdGNoZXMsCj4gPiBub3cgaXQncyB5b3VyIHR1cm4gdG8gbm90IHRha2UgYSBtb250aCB0byBh
bnN3ZXIgdG8geW91ciBwZWVycwo+ID4gcHJvcG9zYWxzLgo+ID4gCj4gPiBQbGVhc2UgaGVscCBy
ZXZpZXdpbmcgdGhpcyBwYXRjaC4KPiA+ICAgCj4gCj4gU29ycnkuIEkgd2FzIGhvcGluZyB0aGF0
IFFjb20gZm9sa3Mgd291bGQgY2hpbWUgaW4gYXMgSSBkb24ndCBoYXZlIGFueSBpZGVhCj4gYWJv
dXQgdGhlIG1kbTk2MDcgcGxhdGZvcm0uIEl0IGNvdWxkIGJlIHRoYXQgdGhlIG1haWwgc2VydmVy
IG1pZ3JhdGlvbiBmcm9tCj4gY29kZWF1cm9yYSB0byBxdWljaW5jIHB1dCBhIGJhcnJpZXIgaGVy
ZS4KPiAKPiBMZXQgbWUgcGluZyB0aGVtIGludGVybmFsbHkuCgpPaCwgb2ssIEkgZGlkbid0IGtu
b3cuIFRoYW5rcyEKCj4gPiBCVFcgd2h5IGlzIHRoaXMgZHJpdmVyIHN0aWxsIHVzaW5nIGNtZGZ1
bmQ/IEl0IHNob3VsZCBoYXZlIGJlZW4KPiA+IG1pZ3JhdGVkIHRvIC0+ZXhlY19vcCgpIGEgbG9u
ZyB0aW1lIGFnby4gIAo+IAo+IEknbGwgbG9vayBpbnRvIGl0LgoKVGhhdCB3b3VsZCBiZSBncmVh
dCwgZ2l2ZW4gdGhlIG51bWJlciBvZiB1cGRhdGVzIHRoaXMgZHJpdmVyIGhhcwpyZWNlaXZlZCwg
aXQgd291bGQgYmUgbmljZSB0byB0YWNrbGUgdGhlIGxlZ2FjeSBiaXRzIHRoZXJlLgoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
