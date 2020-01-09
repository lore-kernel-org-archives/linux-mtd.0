Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F85C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 17:52:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BC132067D
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 17:52:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lxuuoQp2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BC132067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=emWU4bswOjfRKd2MgfM/suUTsoO85nKuBkBjLFBL2dg=; b=lxuuoQp2mwId1r
	3ixTe2k2JGI6XBjnsnjQZkuRF5nu4lhqyPIx7I986GVIOeQ/WjwF7peEzW2f962AVUxc8GJBDS6/s
	StqbOUa68jLLmtPTE6c580SLqn9zm4LdUwVmwWkR+77MV/gWzIV7v2ysNVD82k5qGCqaYzIyQsly9
	BBlbNZAMNA0/SNOlSTYjuBIBesKs20ps0HRV0TvBQr+fiO3dvn9tVSqQ1afV+b2p5z2QdSMR0THqT
	L7CL13TsImgY6hxyhJ5rM1mdkLLCugj8CY7LohVTs2F5NRyf+ovZQB+w8Fg6+bcocpauxFy9bLo7g
	ZZlNlIf7dvaMI1x0TshQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipbyx-00043r-La; Thu, 09 Jan 2020 17:52:31 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipbyu-00042c-63
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 17:52:30 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B647D20004;
 Thu,  9 Jan 2020 17:52:19 +0000 (UTC)
Date: Thu, 9 Jan 2020 18:52:18 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kursad Oney <kursad.oney@broadcom.com>
Subject: Re: Number of bytes for spi-nand bad block marker
Message-ID: <20200109185218.685fb746@xps13>
In-Reply-To: <CAMm8Nh3dccj9iAQvHhXbRcO22ROhoSmQ48bFqCC80+NiBXoTDA@mail.gmail.com>
References: <CAMm8Nh0+BgomkSMrDHgzA5SkQZczp5CVAJefE79z=vfoPrui_Q@mail.gmail.com>
 <20200109173632.618fe684@xps13>
 <CAMm8Nh3dccj9iAQvHhXbRcO22ROhoSmQ48bFqCC80+NiBXoTDA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_095228_496745_DF3B5587 
X-CRM114-Status: GOOD (  29.07  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, David Regan <david.regan@broadcom.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgS3Vyc2FkLAoKS3Vyc2FkIE9uZXkgPGt1cnNhZC5vbmV5QGJyb2FkY29tLmNvbT4gd3JvdGUg
b24gVGh1LCA5IEphbiAyMDIwCjEyOjQ5OjAwIC0wNTAwOgoKPiBIaSBNaXF1w6hsLAo+IAo+IE9u
IFRodSwgSmFuIDksIDIwMjAgYXQgMTE6MzYgQU0gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5h
bEBib290bGluLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgS3Vyc2FkLAo+ID4KPiA+IEt1cnNhZCBP
bmV5IDxrdXJzYWQub25leUBicm9hZGNvbS5jb20+IHdyb3RlIG9uIE1vbiwgMTIgQXVnIDIwMTkK
PiA+IDE2OjI0OjU3IC0wNDAwOgo+ID4gIAo+ID4gPiBIaSwKPiA+ID4KPiA+ID4gVGhlIHNwaS1u
YW5kIGRyaXZlciBpbiBib3RoIGxpbnV4IGFuZCB1LWJvb3QgY2hlY2sgMiBieXRlcyBmb3IgYmFk
Cj4gPiA+IGJsb2NrIG1hcmtlcnMgaW4gc3BpbmFuZF9pc2JhZCgpLiBIb3dldmVyLCB0aGUgZGF0
YXNoZWV0IGZvcgo+ID4gPiBXMjVOMDFHVnh4SUcgc2F5cyAnQSDigJxCYWQgQmxvY2sgTWFya2Vy
4oCdIGlzIGEgbm9uLUZGaCBkYXRhIGJ5dGUgc3RvcmVkCj4gPiA+IGF0IEJ5dGUgMCBvZiBQYWdl
IDAgZm9yIGVhY2ggYmFkIGJsb2NrLiBBbiBhZGRpdGlvbmFsIG1hcmtlciBpcyBhbHNvCj4gPiA+
IHN0b3JlZCBpbiB0aGUgZmlyc3QgYnl0ZSBvZiB0aGUgNjQtQnl0ZSBzcGFyZSBhcmVhLicgd2hp
Y2ggaXMKPiA+ID4gYmFzaWNhbGx5IG9uZSBieXRlIGZvciBCQk0gaW4gc3BhcmUuCj4gPiA+Cj4g
PiA+IEJvcmlzIHNheXMgdGhleSBoYXZlIHVzZWQgdGhlIHNhbWUgcGF0dGVybiBmb3IgcGFyYWxs
ZWwgTkFORCBiZWNhdXNlCj4gPiA+IHNvbWUgTkFORHMgYXJlIGludGVyZmFjZXMgdGhyb3VnaCBh
IDE2LWJpdCBidXMuCj4gPiA+Cj4gPiA+IEhlcmUgaXMgdGhlIHNpdHVhdGlvbiBJIGFtIGZhY2lu
ZzogV2Ugcm9sbGVkIG91ciBvd24gb3duIHNwaS1uYW5kCj4gPiA+IGtlcm5lbC9ib290bG9hZGVy
IGRyaXZlcnMgYmVmb3JlIHRoZSBrZXJuZWwgc3BpLW5hbmQgZHJpdmVyIHdhcwo+ID4gPiBpbnRl
Z3JhdGVkLCBhbmQgc2V0IEJCTSBzaXplIHRvIDEgYnl0ZSBmb3IgdGhpcyB0eXBlIG9mIGZsYXNo
LiBUaGlzCj4gPiA+IG1lYW5zIHRoZSAybmQgYnl0ZSBpcyBhdmFpbGFibGUgZm9yIHVzZS4gU29t
ZSBkZXZpY2VzIGluIHRoZSBmaWVsZAo+ID4gPiB1dGlsaXplIHRoZSBleHRyYSBieXRlIGZvciB0
aGUgamZmczIgY2xlYW4gbWFya2VyLgo+ID4gPgo+ID4gPiBXZSB3b3VsZCBsaWtlIHRvIG1pZ3Jh
dGUgdG8gdGhlIG1haW5saW5lIGRyaXZlcnMgYnV0IHRoaXMgcHJlc2VudHMgYW4KPiA+ID4gaXNz
dWUuIFdoZW4gd2UgZmxhc2ggYW4gaW1hZ2Ugd2l0aCB0aGUgbWFpbmxpbmUgdS1ib290IHNwaS1u
YW5kCj4gPiA+IGRyaXZlciwgaXQgdGhpbmtzIHRoZSBjbGVhbmVkIGpmZnMyIGJsb2NrcyBhcmUg
ImJhZCBibG9ja3MiIHNpbmNlIG9uZQo+ID4gPiBvZiB0aGUgYnl0ZXMgaW5jbHVkZXMgdGhlIGNs
ZWFuIG1hcmtlci4KPiA+ID4KPiA+ID4gTWFyZWsgc3VnZ2VzdGVkIHdlIGRvIGEgb25lLXRpbWUg
dXBncmFkZSBzY3JpcHQgd2hlcmUgd2UgcmV3cml0ZSB0aGUKPiA+ID4gT09CIGJ1dCBpdCdzIGEg
cmlza3kgb3BlcmF0aW9uLCBlc3BlY2lhbGx5IGluIHRoZSBmaWVsZC4gQm9yaXMgYXNrZWQKPiA+
ID4gbWUgdG8gZW1haWwgdGhlIE1URCBsaXN0IGFuZCBjb250aW51ZSB0aGUgZGlzY3Vzc2lvbiBo
ZXJlLiBJCj4gPiA+IGFwcHJlY2lhdGUgYW55IG9waW5pb25zL3N1Z2dlc3Rpb25zLiAgCj4gPgo+
ID4gU29ycnkgZm9yIHRoZSB2ZXJ5IHZlcnkgbGF0ZSByZXBseS4KPiA+Cj4gPiBIb3cgZGlkIHlv
dSBtYW5hZ2UgdGhpcyBzaXR1YXRpb24/Cj4gPiAgCj4gCj4gTm8gcHJvYmxlbSB3aXRoIHRoZSBs
YXRlIHJlcGx5LiBJIGFtIGFkZGluZyBEYXZpZCBSZWdhbiBvbiBjb3B5IHdobyBpcwo+IG1vcmUg
ZmFtaWxpYXIgd2l0aCBvdXIgU1BJLU5BTkQgZHJpdmVyIGFuZCB0aGUgcGxhbnMgZ29pbmcgZm9y
d2FyZC4KPiAKPiA+IEFzIHlvdSBoYXZlIGEgdmVyeSBzcGVjaWZpYyBuZWVkIHdoaWNoIGlzIG5v
dCBhY3R1YWxseSByZWxhdGVkIHRvCj4gPiBoYXJkd2FyZSBzdXBwb3J0IGJ1dCBtb3JlIGEgcHJv
YmxlbSBvZiBjb2hlcmVuY2UgYmV0d2VlbiB5b3VyIG9sZAo+ID4gZHJpdmVycyBhbmQgbWFpbmxp
bmUsIHdoYXQgYWJvdXQgd3JpdGluZyBzdXBwb3J0IGZvciAxLWJ5dGUgQkJNIGluCj4gPiBzcGkt
bmFuZD8gSWYgaXQgaXMgdG9vIGludmFzaXZlIEkgZG9uJ3QgdGhpbmsgaXQgY2FuIGJlIG1haW5s
aW5lZCwgYnV0Cj4gPiBhdCBsZWFzdCB5b3UgY291bGQgdXNlIGEgbWFpbmxpbmUgZHJpdmVyIHdp
dGggYSBzbWFsbCBjaGFuZ2Ugb24gdG9wIG9mCj4gPiBpdCBvbiB5b3VyIG9sZC1ydW5uaW5nIGlu
LXRoZS1maWVsZCBib2FyZHM/Cj4gPiAgCj4gCj4gWWVzLCBleGFjdGx5LiBJIHRoaW5rIHRoaXMg
bWlnaHQgYmUgdGhlIHdheSB3ZSB3aWxsIGdvIGZvcndhcmQuIEFzIGZvcgo+IG1haW5saW5pbmcs
IHRoZXJlIHdlcmUgcXVlc3Rpb25zIGFib3V0IHdoZXRoZXIgdGhpcyBpcyBzb21ldGhpbmcgdGhh
dAo+IGNhbi9zaG91bGQgYmUgZG9uZSBpbiB0aGUgZGV2aWNlIHRyZWUgb3IgYXMgYSBLY29uZmln
IG9yIHNvbWUgb3RoZXIKPiB3YXkuIElmIHRoZXJlIGlzIGFuIGFjY2VwdGFibGUgc29sdXRpb24s
IHdlIGNhbiBpbXBsZW1lbnQgYW5kIHNlbmQgaXQKPiBmb3IgYSByZXZpZXcuCgpJIGRvbid0IGtu
b3cgd2hhdCB3b3VsZCBiZSB0aGUgImxlc3Mgd29yc2UiLiBNYXliZSBpdCB3b24ndCBiZSBtYWlu
bGluZQphdCBhbGwuIEJ1dCB5b3UgY2FuIHNoYXJlIGFzIGFuIFJGQyB3aGF0IHlvdSd2ZSBkb25l
LCB0aGF0IG1pZ2h0IGhlbHAKb3RoZXJzIQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
