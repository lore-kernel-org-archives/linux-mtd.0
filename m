Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A27C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 17:15:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 017942084C
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 17:15:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J+liO39+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 017942084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p5K23IKBK85+15uHgsWtu5b1mU0kUXM4cU58dKgp2mg=; b=J+liO39+hZ9YPgTvXtTgV4Reu
	mTcfd1pUwGFNB/xECZw+vI5b+By5c9jmzPWcOHOTUtkQBUZ5B7KamaIZcU8hPtZXEw3JlMO0F63mE
	YG3NKOTtpC0JjHSc7JyLgU5Tdzf/R6Cdy5mw4j983Ps8y4mC06RpaluDEbAja9KelQbvj7qITgr6g
	NSqYgKqjdc3/hpqzsJIyO9S+a1pS1M/YmBdJapPyFvvqwymYAAR9jTxcgewBTNTKZQexp+K2zhqmb
	/aSVQO0ofgOYioxJDlXCBT+6IIBkTjuYCvmPH66KoB9zD3VEJt7Lb6brzYRDEJ9z5pJf+QF/HnTvZ
	ElwfivJ6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTTJI-00050x-PW; Fri, 16 Oct 2020 17:14:32 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTTJG-00050N-3p
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2020 17:14:31 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A0C5F1BF207;
 Fri, 16 Oct 2020 17:14:25 +0000 (UTC)
Date: Fri, 16 Oct 2020 19:14:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <xhnjupt@gmail.com>
Subject: Re: [PATCH v13 09/20] mtd: rawnand: Separate the ECC engine type
 and the ECC byte placement
Message-ID: <20201016191424.2a41b632@xps13>
In-Reply-To: <CA+EcR23vtjOBzt+7v=s1i0YqCW-A1v_h2ZtHcToBzvSrPaZkpA@mail.gmail.com>
References: <20200827085208.16276-1-miquel.raynal@bootlin.com>
 <20200827085208.16276-10-miquel.raynal@bootlin.com>
 <CA+EcR21PQRrKMLiRYH+2mAkGhTPmxqKUO6hxwvAHQCZ4g3Jhvg@mail.gmail.com>
 <CAOMZO5AVU2RMPP55abXvueHMC=FE1rXjfPVn1+Xv4GqumD18vg@mail.gmail.com>
 <CA+EcR22BaKLMU7V9uDfgQctQm-ttfno9VKWqFpp4D-mPYR405g@mail.gmail.com>
 <20201015092502.2ea2a7fc@xps13>
 <CA+EcR23vtjOBzt+7v=s1i0YqCW-A1v_h2ZtHcToBzvSrPaZkpA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_131430_245365_0FCA081A 
X-CRM114-Status: GOOD (  23.34  )
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
Cc: Richard Weinberger <richard@nod.at>, Fabio Estevam <festevam@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSGFuLAoKSGFuIFh1IDx4aG5qdXB0QGdtYWlsLmNvbT4gd3JvdGUgb24gRnJpLCAxNiBPY3Qg
MjAyMCAxMjowOToyMiAtMDUwMDoKCj4gT24gVGh1LCBPY3QgMTUsIDIwMjAgYXQgMjoyNSBBTSBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Cj4gPiBI
aSBIYW4sCj4gPgo+ID4gSGFuIFh1IDx4aG5qdXB0QGdtYWlsLmNvbT4gd3JvdGUgb24gV2VkLCAx
NCBPY3QgMjAyMCAyMjowOTo1NiAtMDUwMDoKPiA+ICAKPiA+ID4gT24gV2VkLCBPY3QgMTQsIDIw
MjAgYXQgODozNSBQTSBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+IHdyb3RlOiAg
Cj4gPiA+ID4KPiA+ID4gPiBIaSBIYW4gWHUsCj4gPiA+ID4KPiA+ID4gPiBPbiBXZWQsIE9jdCAx
NCwgMjAyMCBhdCA2OjM4IFBNIEhhbiBYdSA8eGhuanVwdEBnbWFpbC5jb20+IHdyb3RlOgo+ID4g
PiA+ICAKPiA+ID4gPiA+IEhpIE1pcXVlbCwgdGhlIGNoYW5nZXMgdG8gdGhlIG5lc3RlZCBzd2l0
Y2ggc3RhdGVtZW50IG1ha2UgdGhlIGxvZ2ljCj4gPiA+ID4gPiBvZiB0aGlzIGJyZWFrIHdyb25n
LiAgCj4gPiA+ID4KPiA+ID4gPiBDYXJlIHRvIHNlbmQgYSBmaXgsIHBsZWFzZT8KPiA+ID4gPgo+
ID4gPiA+IFdlIGhhdmUgc2VlbiBFQ0MgTkFORCByZWdyZXNzaW9ucyBvbiBteDI3IGFuZCBMUzIw
ODggcGxhdGZvcm1zLgo+ID4gPiA+Cj4gPiA+ID4gSW4gd2hpY2ggcGxhdGZvcm0gZGlkIHlvdSBu
b3RpY2VkIHRoZSBFQ0MgaXNzdWU/Cj4gPiA+ID4KPiA+ID4gPiBUaGFua3MgIAo+ID4gPgo+ID4g
PiBIaSBGYWJpbywKPiA+ID4KPiA+ID4gQ0kgdGVzdCByZXBvcnRlZCBhbGwgTFMgcGxhdGZvcm1z
IGhhdmUgdGhlIEVDQyByZWdyZXNzaW9uLiBUaGUgZXJyb3IKPiA+ID4gaXMgIkRyaXZlciBtdXN0
IHNldCBlY2Muc3RyZW5ndGggd2hlbiB1c2luZyBoYXJkd2FyZSBFQ0MiCj4gPiA+Cj4gPiA+IEkg
aGF2ZW4ndCB3b3JrZWQgb24gYW55IExTIHBsYXRmb3JtcyBzbyBJIHRlc3RlZCBvbiBpLk1YIHBs
YXRmb3Jtcwo+ID4gPiB3aXRoIGdwbWkgTkFORCBjb250cm9sbGVyLAo+ID4gPiB0aGUgY29kZSBy
YW4gaW50byBOQU5EX0VDQ19FTkdJTkVfVFlQRV9TT0ZUIGR1ZSB0byB0aGlzIGlzc3VlLiBTbwo+
ID4gPiB0aGVzZSBhcmUgdHdvIGRpZmZlcmVudCBpc3N1ZXMsIEkgY2FuIHNlbmQgYSBwYXRjaCB0
byBmaXggdGhlIG5lc3RlZAo+ID4gPiBzd2l0Y2ggc3RhdGVtZW50IHByb2JsZW0gYnV0IHdvbid0
IGZpeCB0aGUgTFMgcGxhdGZvcm0gaXNzdWUuICAKPiA+Cj4gPgo+ID4gSSB0aGluayB0aGUgZmFj
dCB0aGF0IHRoZSBleGVjdXRpb24gcmFuIGludG8gTkFORF9FQ0NfRU5HSU5FX1RZUEVfU09GVAo+
ID4gaGFzIGJlZW4gZml4ZWQuIEhvd2V2ZXIgdGhlcmUgaXMgc3RpbGwgdGhlIG90aGVyIGlzc3Vl
IHRoYXQgSSBhbSB1bmFibGUKPiA+IHRvIGZpbmQganVzdCBieSByZWFkaW5nIHRoZSBjb2RlIDov
ICAKPiAKPiBDb3VsZCB5b3UgcGxlYXNlIHNlbmQgbWUgdGhlIGxpbmsgb2YgdGhlIGZpeCBwYXRj
aCwgSSBjYW4gdGVzdCBpdCBvbgo+IGkuTVggcGxhdGZvcm1zLgoKVGhlIGZpeCBpcyBpbiBuZXh0
IHNpbmNlIG1vcmUgdGhhbiBhIHdlZWssIGlmIHlvdSBzdGlsbCBoYXZlIHRoZSBpc3N1ZQp0aGVu
IGl0J3MgcHJvYmFibHkgdGhlIHNhbWUgaXNzdWUgdGhhdCBzYXNjaGEgcmVwb3J0ZWQgaW4gYW5v
dGhlcgp0aHJlYWQgYW5kIGluIHRoaXMgY2FzZSBkZWJ1Z2dpbmcgZnJvbSB5b3VyIHNpZGUgaXMg
d2VsY29tZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
