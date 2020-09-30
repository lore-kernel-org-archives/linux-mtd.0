Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 983D7C4363D
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 21:31:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4238C20739
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 21:31:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X+gE4YM+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOvN2DZk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4238C20739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xa733WutVeLCxEpdZtbkkkEhPpL/KweDezcxpbtnr/E=; b=X+gE4YM+ur2HixpeNIV4nVR2O
	2iwS0E+vLdRBdZtavG/VnFF3s30lrdiXJW8pnkQnTf5SfkoX9o3UEy2kZeAJK/ImpN/Wb60ysPJvF
	gcUAx7q2aUvrTOiJzBJl2Qo62LSTCGDzIhIzrYNagcotQrrbJz/3xN6XPoEOaMG+S6Ca91Or18r60
	VDl5nC1GeMgazW2Um182vqXPEqZEGzH9IrdKSGczmCxOZbr1dEQ+9VMBK4wEQrOiENd7DZ10v5hcf
	M8Vf26C3L6VV7tFp2LNNyEUtx40CJfezXmYvZ0sfKsCc6AFRnj25Vfn+y4+pwOE/k3Osmyn0+LPSg
	u9gj91tsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNjgc-00011W-Mq; Wed, 30 Sep 2020 21:30:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNjga-00010l-4n
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 21:30:52 +0000
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A19720739;
 Wed, 30 Sep 2020 21:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601501451;
 bh=feeviU9+A/gTyUPoDCemRtabALCS/oslSvMzA1uSTlc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iOvN2DZkfruxM4tVe4v/noGq5UC5MncnkeoZiocJeejKgelDd1XQHw++sgRbjdkVw
 5om65naAvbW/rdeJjUwCC90cIKG5Jk7MHWG+kgO2vNtK29kKitcE4/NVmhpLiKeRmX
 Mvxb+Rh/naYoC7WrYSwsgeW62an08UQ3yJ0oRYqs=
Date: Wed, 30 Sep 2020 16:36:34 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Jann Horn <jannh@google.com>
Subject: Re: [PATCH][next] mtd: rawnand: Replace one-element array with
 flexible-array member
Message-ID: <20200930213634.GA12855@embeddedor>
References: <20200930210824.GA12277@embeddedor>
 <CAG48ez3X3aZwfde3_2Sc+gdtUGRHfzan6oNFiffAvNzFDSsFDw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAG48ez3X3aZwfde3_2Sc+gdtUGRHfzan6oNFiffAvNzFDSsFDw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_173052_262691_61835330 
X-CRM114-Status: GOOD (  24.32  )
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
Cc: Lucas Stach <dev@lynxeye.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 kernel list <linux-kernel@vger.kernel.org>, Stefan Agner <stefan@agner.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-hardening@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBTZXAgMzAsIDIwMjAgYXQgMTE6MTA6NDNQTSArMDIwMCwgSmFubiBIb3JuIHdyb3Rl
Ogo+IE9uIFdlZCwgU2VwIDMwLCAyMDIwIGF0IDExOjAyIFBNIEd1c3Rhdm8gQS4gUi4gU2lsdmEK
PiA8Z3VzdGF2b2Fyc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+IFRoZXJlIGlzIGEgcmVndWxhciBu
ZWVkIGluIHRoZSBrZXJuZWwgdG8gcHJvdmlkZSBhIHdheSB0byBkZWNsYXJlIGhhdmluZwo+ID4g
YSBkeW5hbWljYWxseSBzaXplZCBzZXQgb2YgdHJhaWxpbmcgZWxlbWVudHMgaW4gYSBzdHJ1Y3R1
cmUuIEtlcm5lbCBjb2RlCj4gPiBzaG91bGQgYWx3YXlzIHVzZSDigJxmbGV4aWJsZSBhcnJheSBt
ZW1iZXJz4oCdWzFdIGZvciB0aGVzZSBjYXNlcy4gVGhlIG9sZGVyCj4gPiBzdHlsZSBvZiBvbmUt
ZWxlbWVudCBvciB6ZXJvLWxlbmd0aCBhcnJheXMgc2hvdWxkIG5vIGxvbmdlciBiZSB1c2VkWzJd
Lgo+IAo+IEJ1dCB0aGlzIGlzIG5vdCBzdWNoIGEgY2FzZSwgcmlnaHQ/IElzbid0IHRoaXMgYSB0
cnVlIGZpeGVkLXNpemUKPiBhcnJheT8gSXQgc291bmRzIGxpa2UgeW91J3JlIGp1c3QgY2hhbmdp
bmcgaXQgYmVjYXVzZSBpdAo+IHBhdHRlcm4tbWF0Y2hlZCBvbiAiYXJyYXkgb2YgbGVuZ3RoIDEg
YXQgdGhlIGVuZCBvZiBhIHN0cnVjdCIuCgpZZWFoOyBJIHNob3VsZCBoYXZlIGNoYW5nZWQgdGhh
dCAnZHluYW1pY2FsbHknIHBhcnQgb2YgdGhlIHRleHQgYWJvdmUKYSBiaXQuIEhvd2V2ZXIsIGFz
IEkgY29tbWVudGVkIGluIHRoZSB0ZXh0IGJlbG93LCBpbiB0aGUgY2FzZSB0aGF0IG1vcmUKQ1Mg
SURzIGFyZSBuZWVkZWQgKGxldCdzIHdhaXQgZm9yIHRoZSBtYWludGFpbmVycyB0byBjb21tZW50
IG9uIHRoaXMuLi4pCmluIHRoZSBmdXR1cmUsIHRoaXMgY2hhbmdlIG1ha2VzIHRoZSBjb2RlIG1v
cmUgbWFpbnRhaW5hYmxlLCBhcyBmb3IKdGhlIGFsbG9jYXRpb24gcGFydCwgdGhlIGRldmVsb3Bl
ciB3b3VsZCBvbmx5IGhhdmUgdG8gdXBkYXRlIHRoZSBDU19OCm1hY3JvIHRvIHRoZSBudW1iZXIg
b2YgQ1MgSURzIHRoYXQgYXJlIG5lZWRlZC4KClRoYW5rcwotLQpHdXN0YXZvCgo+IAo+ID4gUmVm
YWN0b3IgdGhlIGNvZGUgYWNjb3JkaW5nIHRvIHRoZSB1c2Ugb2YgYSBmbGV4aWJsZS1hcnJheSBt
ZW1iZXIKPiA+IGluc3RlYWQgb2YgYSBvbmUtZWxlbWVudCBhcnJheS4gQWxzbywgbWFrZSB1c2Ug
b2YgdGhlIHN0cnVjdF9zaXplKCkKPiA+IGhlbHBlciB0byBjYWxjdWxhdGUgdGhlIHNpemUgb2Yg
dGhlIGFsbG9jYXRpb24gZm9yIF9uYW5kXy4gSW4gb3JkZXIKPiA+IHRvIGtlZXAgdGhlIGNvZGUg
YXMgbWFpbnRhaW5hYmxlIGFzIHBvc3NpYmxlIGFuZCB0byBrZWVwIF9jc18gYXMgYW4KPiA+IGFy
cmF5LCBhZGQgYSBuZXcgbWFjcm8gQ1NfTiB0byBhaWQgaW4gdGhlIGFsbG9jYXRpb24gc2l6ZSBj
YWxjdWxhdGlvbiwKPiA+IGluIGNhc2UgdGhlcmUgaXMgYSBuZWVkIGZvciBtb3JlIENoaXAgU2Vs
ZWN0IElEcyBpbiB0aGUgZnV0dXJlLiBJbiB0aGUKPiA+IG1lYW50aW1lLCB0aGUgbWFjcm8gaXMg
c2V0IHRvIDEuIFRoaXMgYWxzbyBhdm9pZHMgaGF2aW5nIHRvIHVzZSBhIG1hZ2ljCj4gPiBudW1i
ZXIgJzEnIGFzIHRoZSBsYXN0IGFyZ3VtZW50IGZvciBzdHJ1Y3Rfc2l6ZSgpLgo+IFsuLi5dCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvdGVncmFfbmFuZC5jIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvdGVncmFfbmFuZC5jCj4gWy4uLl0KPiA+ICsvKiBOdW1iZXIgb2YgQ2hp
cCBTZWxlY3RzLiBDdXJyZW50bHksIG9ubHkgb25lLiAqLwo+ID4gKyNkZWZpbmUgQ1NfTiAgICAg
ICAgICAgICAgICAgICAxCj4gPiArCj4gPiAgc3RydWN0IHRlZ3JhX25hbmRfY29udHJvbGxlciB7
Cj4gPiAgICAgICAgIHN0cnVjdCBuYW5kX2NvbnRyb2xsZXIgY29udHJvbGxlcjsKPiA+ICAgICAg
ICAgc3RydWN0IGRldmljZSAqZGV2Owo+ID4gQEAgLTE4Myw3ICsxODYsNyBAQCBzdHJ1Y3QgdGVn
cmFfbmFuZF9jaGlwIHsKPiA+ICAgICAgICAgdTMyIGNvbmZpZzsKPiA+ICAgICAgICAgdTMyIGNv
bmZpZ19lY2M7Cj4gPiAgICAgICAgIHUzMiBiY2hfY29uZmlnOwo+ID4gLSAgICAgICBpbnQgY3Nb
MV07Cj4gPiArICAgICAgIGludCBjc1tdOwo+ID4gIH07Cj4gWy4uLl0KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
