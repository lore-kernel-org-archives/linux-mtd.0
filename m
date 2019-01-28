Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91FEC282C8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 10:20:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C85120882
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 10:20:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cyXZfdOe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C85120882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AuczU9klhw3ISdjVLfbGkTVEuKGc2jxXRHgjW0Ai6Ks=; b=cyXZfdOeUZnWom
	WvDr/4z0nb9Ae7DY6Gq7vvPiyTmxNYskeCpMO5dZB0ftuRzmX/vBDmKnToP5cmAvRQu1G44Su/yx8
	RvaQFr3ZKMyNgKD499g8F8IEvmxAhgGeZGYpPRlev/Eo4PuKP50WJrhcz4R5ztKS3luvtobev1Xyp
	Jz16rpov5qhvP3dFeqycvO2OqGetaN0QzEJaVzI+eYt00lvoQXqdXHfullqZOH0f4Iekbyp8GAHXX
	dTtsTG8FnSzWAMhJIz2BPXCrLXMRfNhePrvw0+pw43UFvfhw3Pc1UK1llenyUlTdr5XW5PWrpTeS3
	35Wp0+TloDVH8EtW+jUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go41d-0004M2-V6; Mon, 28 Jan 2019 10:20:21 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go41a-0004Le-Sw
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2019 10:20:20 +0000
X-Originating-IP: 90.88.29.206
Received: from xps13 (aaubervilliers-681-1-87-206.w90-88.abo.wanadoo.fr
 [90.88.29.206]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 3EC4740017;
 Mon, 28 Jan 2019 10:20:09 +0000 (UTC)
Date: Mon, 28 Jan 2019 11:20:07 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH] mtd: rawnand: denali_dt: remove single anonymous clock
 support
Message-ID: <20190128112007.440046e6@xps13>
In-Reply-To: <CAK7LNATnfTQXHrXJQp7732-e7hvd8ORcYubyDmz0KHaRXRMDqQ@mail.gmail.com>
References: <1547539894-12898-1-git-send-email-yamada.masahiro@socionext.com>
 <20190115092229.59e09c2d@xps13>
 <CAK7LNATnfTQXHrXJQp7732-e7hvd8ORcYubyDmz0KHaRXRMDqQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_022019_085855_BF051354 
X-CRM114-Status: GOOD (  16.94  )
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
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRGluaCwKCk1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+
IHdyb3RlIG9uIFdlZCwgMTYgSmFuCjIwMTkgMTA6Mjc6MTEgKzA5MDA6Cgo+ICgrQ0MgRGluaCBO
Z3V5ZW4pCj4gCj4gT24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgNToyMiBQTSBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBNYXNhaGlybywK
PiA+Cj4gPiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPiB3
cm90ZSBvbiBUdWUsIDE1IEphbgo+ID4gMjAxOSAxNzoxMTozNCArMDkwMDoKPiA+ICAKPiA+ID4g
Q29tbWl0IDZmMWZlOTdiZWMzNCAoIm10ZDogcmF3bmFuZDogZGVuYWxpX2R0OiBhZGQgbW9yZSBj
bG9ja3MgYmFzZWQKPiA+ID4gb24gSVAgZGF0YXNoZWV0IikgaW50cm9kdWNlZCBhIG1vcmUgY29y
cmVjdCBiaW5kaW5nIHRoYXQgcmVxdWlyZXMKPiA+ID4gdGhyZWUgbmFtZWQgY2xvY2tzLgo+ID4g
Pgo+ID4gPiBOb3cgdGhhdCBhbGwgdXBzdHJlYW0gRFQgZmlsZXMgbWlncmF0ZWQgb3ZlciB0byBp
dCwgcmVtb3ZlIHRoZSBzaW5nbGUKPiA+ID4gYW5vbnltb3VzIGNsb2NrIHN1cHBvcnQuICAKPiA+
Cj4gPiBJIHdvdWxkIGxvdmUgdG8gZG8gdGhhdCBidXQgSSB0aGluayB0aGlzIGlzIGFnYWluc3Qg
dGhlICJEVCBiYWNrd2FyZAo+ID4gY29tcGF0aWJpbGl0eSBydWxlIi4gIAo+IAo+IFllYWgsIEkg
a25vdyB0aGlzIHJ1bGUsIGJ1dCB3ZSBicmVhayBEVCBiaW5kaW5nIGZyb20gdGltZSB0byB0aW1l
Lgo+IAo+IAo+IAo+ID4gQW55d2F5LCBJSVJDIGl0IGlzIGFjY2VwdGVkIHRoYXQgdGhpcyBraW5k
IG9mCj4gPiBydWxlIG1pZ2h0IGJlIGJyb2tlbiBpZiBkZWNpZGVkIHBlciB0aGUgYXJjaC1tYWlu
dGFpbmVyIChpbiB0aGlzCj4gPiBjYXNlLCB5b3UgSSBzdXBwb3NlKS4gU28gaWYgdGhpcyBpcyBy
ZWFsbHkgd2hhdCB5b3Ugd2FudCwgSSdsbCBxdWV1ZQo+ID4gaXQuICAKPiAKPiBNeSBwbGF0Zm9y
bSBpcyBmaW5lLCBidXQgdGhpcyBkcml2ZXIgaXMgdXNlZCBieSBTT0NGUEdBIGJvYXJkcyBhcyB3
ZWxsLgo+IAo+IEkgQ0NlZCB0aGUgU09DRlBHQSBtYWludGFpbmVyLCBEaW5oIE5ndXllbi4KPiAK
CkdlbnRsZSBwaW5nIG9uIHRoaXMgdG9waWMuCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
