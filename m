Return-Path: <SRS0=kpjk=74=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E54C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 07:19:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CA71206D7
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 07:19:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="esiI71+O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CA71206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h2UxRE6x9/TZJARLbVie9ZWbeWQrgMyQLlttPEI0F9g=; b=esiI71+OAU5slQ
	m0m/RCEYVPE4+lwgxVW5RvXnIM8hMi8Y3cTk80gPWETnarRp1SGiqV2Rt3y1h0oim5W1Hu58QLxYq
	YafCNt9h9d0kN6S+SCxxNSHh+JF01t4np49JJE/VJfZDGWU/cuLMiBEidnG12X/AT7tEqp8dG0nZx
	rMdKwq2i8IJ6YkNOR32wm2m+r31fMwNhuRS6Di+8XoMxifmDDeyjhdKSaOXJFyyzj0Nf2uxUqUJdQ
	p4+rPDvE1gcsKa8d3GnUJc+T7+YQiYwJGkz6aJPzY9tfQZiAvhbcjMtz/YV7hR4sCDtMzlP5MXNB4
	ia7MYaMiGSlvkLwf9GIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkjP7-0000iw-Er; Mon, 15 Jun 2020 07:19:37 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkjP1-0000i5-N2
 for linux-mtd@lists.infradead.org; Mon, 15 Jun 2020 07:19:33 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 3BDC51C0015;
 Mon, 15 Jun 2020 07:19:25 +0000 (UTC)
Date: Mon, 15 Jun 2020 09:19:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: brcmnand: Ecc error handling on EDU
 transfers
Message-ID: <20200615091923.0c3c7aa7@xps13>
In-Reply-To: <CAC=U0a1oLPs_=SgUTxYPxiW8JpQXOpz-RbL2KrgzDjutt1v0mQ@mail.gmail.com>
References: <20200611054454.2547-1-kdasu.kdev@gmail.com>
 <20200611054454.2547-2-kdasu.kdev@gmail.com>
 <20200611092707.75da8c6a@xps13>
 <CAC=U0a3RXScu12LkU+hCv_5Lp_he92ExRFSgqLkwx40D6Xtrag@mail.gmail.com>
 <20200612090728.043b6baf@xps13>
 <CAC=U0a1oLPs_=SgUTxYPxiW8JpQXOpz-RbL2KrgzDjutt1v0mQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_001932_021002_CB36D84F 
X-CRM114-Status: GOOD (  22.18  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgS2FtYWwsCgpLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4gd3JvdGUgb24gRnJp
LCAxMiBKdW4gMjAyMCAxMjozNDoyMgotMDQwMDoKCj4gT24gRnJpLCBKdW4gMTIsIDIwMjAgYXQg
MzowNyBBTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToK
PiA+Cj4gPiBIaSBLYW1hbCwKPiA+Cj4gPiBLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNv
bT4gd3JvdGUgb24gVGh1LCAxMSBKdW4gMjAyMCAxMjowNDoyOQo+ID4gLTA0MDA6Cj4gPiAgCj4g
PiA+IE9uIFRodSwgSnVuIDExLCAyMDIwIGF0IDM6MjcgQU0gTWlxdWVsIFJheW5hbCA8bWlxdWVs
LnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6ICAKPiA+ID4gPgo+ID4gPiA+IEhpIEthbWFsLAo+
ID4gPiA+Cj4gPiA+ID4gS2FtYWwgRGFzdSA8a2Rhc3Uua2RldkBnbWFpbC5jb20+IHdyb3RlIG9u
IFRodSwgMTEgSnVuIDIwMjAgMDE6NDQ6NTQKPiA+ID4gPiAtMDQwMDoKPiA+ID4gPiAgCj4gPiA+
ID4gPiBJbXBsZW1lbnRlZCBFQ0MgY29ycmVjdGFibGUgYW5kIHVuY29ycmVjdGFibGUgZXJyb3Ig
aGFuZGxpbmcgZm9yIEVEVSAgCj4gPiA+ID4KPiA+ID4gPiBJbXBsZW1lbnQ/Cj4gPiA+ID4gIAo+
ID4gPiA+ID4gcmVhZHMuIElmIEVDQyBjb3JyZWN0YWJsZSBiaXRmbGlwcyBhcmUgZW5jb3VudGVy
ZWQgIG9uIEVEVSB0cmFuc2ZlciwgIAo+ID4gPiA+Cj4gPiA+ID4gZXh0cmEgc3BhY2UgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPiA+ID4gPiAgCj4gPiA+ID4gPiBy
ZWFkIHBhZ2UgYWdhaW4gdXNpbmcgcGlvLCBUaGlzIGlzIG5lZWRlZCBkdWUgdG8gYSBjb250cm9s
bGVyIGxtaXRhdGlvbiAgCj4gPiA+ID4KPiA+ID4gPiBzL3Bpby9QSU8vCj4gPiA+ID4gIAo+ID4g
PiA+ID4gd2hlcmUgcmVhZCBhbmQgY29ycmVjdGVkIGRhdGEgaXMgbm90IHRyYW5zZmVycmVkIHRv
IHRoZSBETUEgYnVmZmVyIG9uIEVDQwo+ID4gPiA+ID4gZXJyb3JzLiBUaGlzIGhvbGRzIHRydWUg
Zm9yIEVDQyBjb3JyZWN0YWJsZSBlcnJvcnMgYmV5b25kIHNldCB0aHJlc2hvbGQuICAKPiA+ID4g
Pgo+ID4gPiA+IGVycm9yLgo+ID4gPiA+Cj4gPiA+ID4gTm90IHN1cmUgd2hhdCB0aGUgbGFzdCBz
ZW50ZW5jZSBtZWFucz8KPiA+ID4gPiAgCj4gPiA+Cj4gPiA+IE5BTkQgY29udHJvbGxlciBhbGxv
d3MgZm9yIHNldHRpbmcgYSBjb3JyZWN0YWJsZSAgRUNDIHRocmVzaG9sZCBudW1iZXIKPiA+ID4g
b2YgYml0cyBiZXlvbmQgd2hpY2ggaXQgd2lsbCBhY3R1YWxseSByZXBvcnQgdGhlIGVycm9yIHRv
IHRoZSBkcml2ZXIuCj4gPiA+IGUuZy4gZm9yIEJDSC00IHRoZSB0aHJlc2hvbGQgaXMgMywgc28g
My1iaXQgYW5kIDQtYml0IGVycm9ycyB3aWxsCj4gPiA+IGdlbmVyYXRlIGNvcnJlY3RhYmxlIEVD
QyBpbnRlcnJ1cHQgaG93ZXZlciAxLWJpdCBhbmQgMi1iaXQgZXJyb3JzIHdpbGwKPiA+ID4gYmUg
Y29ycmVjdGVkIHNpbGVudGx5Lgo+ID4gPiBGcm9tIHRoZSBhYm92ZSBleGFtcGxlIEVEVSBoYXJk
d2FyZSB3aWxsIG5vdCB0cmFuc2ZlciBjb3JyZWN0ZWQgZGF0YQo+ID4gPiB0byB0aGUgRE1BIGJ1
ZmZlciBmb3IgMy1iaXQgYW5kIDQtYml0IGVycm9ycyB0aGF0IGdldCByZXBvcnRlZC4gU28KPiA+
ID4gb25jZSB3ZSBkZXRlY3QKPiA+ID4gdGhlIGVycm9yIGR1aW5nIEVEVSB3ZSByZWFkIHRoZSBw
YWdlIGFnYWluIHVzaW5nIHBpby4gIAo+ID4KPiA+IE9rIEkgc2VlIHdoYXQgeW91IG1lYW4sIGNh
bid0IHlvdSBmYWtlIHRoZSB0aHJlc2hvbGQgaW5zdGVhZD8gVGhlIE5BTkQKPiA+IGNvbnRyb2xs
ZXIgaW4gTGludXggaXMgbm90IHN1cHBvc2VkIHRvIGhhbmRsZSB0aGlzIHRocmVzaG9sZCwgdGhl
IE5BTkQKPiA+IGNvcmUgaXMgaW4gY2hhcmdlLiBTbyB3aGF0IHRoZSBjb250cm9sbGVyIGRyaXZl
ciBzaG91bGQgZG8gaXMganVzdDoKPiA+IGluY3JlYXNlIHRoZSBudW1iZXIgb2YgYml0ZmxpcHMg
KyByZXR1cm4gdGhlIG1heGltdW0gbnVtYmVyIG9yIGJpdGZsaXAKPiA+IG9yIGluY3JlYXNlIHRo
ZSBmYWlsdXJlIGNvdW50ZXIuIElzIHRoaXMgYWxyZWFkeSB0aGUgY2FzZT8KPiA+ICAKPiAvKiB0
aHJlc2hvbGQgPSBjZWlsKEJDSC1sZXZlbCAqIDAuNzUpICovCj4gYnJjbW5hbmRfd3JfY29ycl90
aHJlc2goaG9zdCwgRElWX1JPVU5EX1VQKGNoaXAtPmVjYy5zdHJlbmd0aCAqIDMsIDQpKTsKPiBU
aGlzIGhvdyB0aGUgdGhyZXNob2xkIGlzIHNldCwgYWxsIGl0IG1lYW5zIGlzIHRoYXQgZm9yIGhp
Z2ggQkNICj4gbGV2ZWxzIGRvbid0IGludGVycnVwdCBvbiBsb3cgbnVtYmVyIChsZXNzIHRoYW4g
dGhyZXNob2xkKSBvZgo+IGJpdF9mbGlwcy4gWWVzIHRoZSBjb250cm9sbGVyIGRyaXZlciBvbmx5
IGluY3JlbWVudHMgY29ycmVjdGFibGUgRUNDCj4gY291bnQuIEJ1dCBkdWUgdGhlIEVEVSBkZXNp
Z24gYW4gRURVIG9wZXJhdGlvbiBpcyBkaXNydXB0ZWQgd2hlbiB0aGUKPiBjb250cm9sbGVyIGlu
dGVycnVwdHMgb24gY29ycmVjdGFibGUgRUNDIGVycm9ycyBkdXJpbmcgc3VicGFnZSBFQ0MKPiBj
YWxjdWxhdGlvbnMuIEhlbmNlIHRoZSBkcml2ZXIgbmVlZHMgdG8gcmVhZCB0aGUgcGFnZSBhZ2Fp
biB3aXRoIFBJTwo+IHRvIHRyYW5zZmVyIGNvcnJlY3RlZCBkYXRhLgoKSUlVQywgeW91IGFyZSBk
b2luZyB0aGUgam9iIHR3aWNlOiB5b3Ugc2hvdWxkIGp1c3QgcmV0dXJuIGEgbnVtYmVyIG9mCmJp
dGZsaXBzIG9yIGFuIGVycm9yIHRvIHRoZSBOQU5EIGNvcmUuIFNvIHRoYXQncyB3aHkgSSdtIHRl
bGxpbmcgdGhhdAp5b3Ugc2hvdWxkIGdldCByaWQgb2YgdGhpcyB0aHJlc2hvbGQuIEl0IHdvdWxk
IGF2b2lkIHRoZSBuZWVkIGZvciB0aGUKUElPIHRyYW5zZmVyIHRvby4KCllvdSBhbHNvIHNheSB0
aGF0IHRoZSBjb250cm9sbGVyICJvbmx5IGluY3JlbWVudHMgY29ycmVjdGFibGUgRUNDCmNvdW50
Iiwgd2hhdCBkbyB5b3UgbWVhbiBleGFjdGx5PyBUaGUgY29udHJvbGxlciBkb2VzIG5vdCByZXBv
cnQgZXJyb3JzCndoZW4gdGhlIG51bWJlciBvZiBiaXRmbGlwcyBoYXBwZW5zIHRvIGJlIGFib3Zl
IHRoZSBCQ0ggdGhyZXNob2xkPyBUaGlzCndvdWxkIGJlIHRoZSBvbmx5IGNhc2Ugd2hlcmUgd2hh
dCBpcyBjdXJyZW50bHkgZG9uZSB3b3VsZCBiZSBhY3R1YWxseQpuZWVkZWQgdGhvdWdoLgoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
