Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46042C282DB
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 10:10:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 043342085A
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 10:10:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X6IHzkLo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DsqJIRZ+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 043342085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tufw6Sl3ftV3N+QMRJitw9QV/RQcRiisgVjWGXLKmq0=; b=X6IHzkLo++rp8H
	BuKnKoW4MnwOKRV+fIT8oAcqRqyTSNhp6OrbVoZh7iGOur5f8/iV7ZKuVnBsz3TZwjUlVavuyOp3l
	5RelD+EB/M1+1LO5MG4aoFgG2h85bHbyjs18nI/A9JbDMxqxDiFtaNAT9jPwNyC+0pSdl8xYDzeJc
	jlzkEFv+pYnlbQfBidjGenGIxzgIGm01abfyRue+aGTQOtJZ+PtxY1XOoWLPOsQjVURFbMMe6kGkV
	uv055EiWqM5rVGFi0OstEk7kKiTYtPRROUqH93jqO00Up7cdQF2lCA+D5BjX7bmqAtwNjLaeTFPDN
	oygLj6muF7Yj+W5KqkxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glWXW-0001Jp-SZ; Mon, 21 Jan 2019 10:10:46 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glWXV-0001Jg-1Y
 for linux-mtd@bombadil.infradead.org; Mon, 21 Jan 2019 10:10:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4y9U8P8E0r3tjNRyQQQl9YP7E38tf6UFjzspxPXKA+k=; b=DsqJIRZ+qasXcrGngNdYNJKGJP
 4gJ1uUs0jeYzbN9dZ16cU7sGMZNRlYECUM0EuMy06cGC/1/8+Gj2psZ08KK9wWeYFO4qXb9dhllPp
 jxHXWr0pTIvoa7IVuRNzVAyqv4WXxa76/4DNNMjRBVjmDeRUy+k0VP89GLl6pqXNwFlgAI5hg9oFs
 lT93JLUwXidy+8EXmoI0STJNP5r719zB2zaHOTa6KKVVN2jFDuk6Ieh1LrX9lzqEzRfZCW8Q1apvM
 9OHntw+Kf3FsdniSeshTW8CUbDXpdcbiVNsDbdqsb0bZakGxOSNeJIgAUsbIrhSzIBZOxiRLLhteD
 Nwfh9pcg==;
Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glVdJ-0000ft-7R
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 09:12:42 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 051DE20A2E; Mon, 21 Jan 2019 10:12:35 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-37-87.w90-88.abo.wanadoo.fr
 [90.88.156.87])
 by mail.bootlin.com (Postfix) with ESMTPSA id 8796520C04;
 Mon, 21 Jan 2019 10:11:41 +0100 (CET)
Date: Mon, 21 Jan 2019 10:11:41 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH] mtd: rawnand: denali_dt: remove single anonymous clock
 support
Message-ID: <20190121101141.494ff8dc@xps13>
In-Reply-To: <CAK7LNATnfTQXHrXJQp7732-e7hvd8ORcYubyDmz0KHaRXRMDqQ@mail.gmail.com>
References: <1547539894-12898-1-git-send-email-yamada.masahiro@socionext.com>
 <20190115092229.59e09c2d@xps13>
 <CAK7LNATnfTQXHrXJQp7732-e7hvd8ORcYubyDmz0KHaRXRMDqQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_041241_395367_B756E314 
X-CRM114-Status: GOOD (  18.72  )
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
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
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
CkNhbiB5b3UgcGxlYXNlIHNoYXJlIHlvdXIgdGhvdWdodHMgb24gdGhpcyB0b3BpYyBwbGVhc2U/
CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
