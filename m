Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74949C433E7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 18:01:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E42E920829
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 18:01:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p2SwE+PO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E42E920829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZrdxaJlcevSj957ymnMKQGk/F/fYthBctsQrbrPKY6Q=; b=p2SwE+POScMDwurx1XYn9gmYC
	DOGPqkaAGBgmyf7PlIzi20YMHjl2tN/NE3p72j5VbUFvYKoC9oJx4RXz4bqHTeb+IY982cnv/5tJq
	JTyzrM4Tx9rCF+expYCkvyqeYCk43OcI6SxOxZKcIuZL0RV/TgVcBxXw+zETELJDjlzVHrNfTqiv+
	moKBTqPrDFu33McutcA9WbgWPxswm1vv6LPppX3sguFF5cxBHid8Oucxjf/HKyMiNqf0Cas0gFf3E
	RbcmIdIBF9gfalpjoEjFYO5vdJkj/ZgAiI7nGS09036XFIyrjxcXgxRC8ZKtRFiGlYgf/Irxh2jwK
	sxfLL4V6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTU22-0004Ge-Bn; Fri, 16 Oct 2020 18:00:46 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTU1z-0004Fr-PU
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2020 18:00:45 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 50C451BF20A;
 Fri, 16 Oct 2020 18:00:41 +0000 (UTC)
Date: Fri, 16 Oct 2020 20:00:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <xhnjupt@gmail.com>
Subject: Re: [PATCH v13 09/20] mtd: rawnand: Separate the ECC engine type
 and the ECC byte placement
Message-ID: <20201016200040.7cac8c9a@xps13>
In-Reply-To: <CA+EcR20Lm2m-bkECKWC5RvB8wb1C_s7uH2PENzLK0iD14oAGUg@mail.gmail.com>
References: <20200827085208.16276-1-miquel.raynal@bootlin.com>
 <20200827085208.16276-10-miquel.raynal@bootlin.com>
 <CA+EcR21PQRrKMLiRYH+2mAkGhTPmxqKUO6hxwvAHQCZ4g3Jhvg@mail.gmail.com>
 <CAOMZO5AVU2RMPP55abXvueHMC=FE1rXjfPVn1+Xv4GqumD18vg@mail.gmail.com>
 <CA+EcR22BaKLMU7V9uDfgQctQm-ttfno9VKWqFpp4D-mPYR405g@mail.gmail.com>
 <20201015092502.2ea2a7fc@xps13>
 <CA+EcR23vtjOBzt+7v=s1i0YqCW-A1v_h2ZtHcToBzvSrPaZkpA@mail.gmail.com>
 <20201016191424.2a41b632@xps13>
 <CA+EcR20Lm2m-bkECKWC5RvB8wb1C_s7uH2PENzLK0iD14oAGUg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_140044_009477_A26C87F7 
X-CRM114-Status: GOOD (  29.45  )
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
MjAyMCAxMjo1MToyNCAtMDUwMDoKCj4gT24gRnJpLCBPY3QgMTYsIDIwMjAgYXQgMTI6MTQgUE0g
TWlxdWVsIFJheW5hbAo+IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Cj4g
PiBIaSBIYW4sCj4gPgo+ID4gSGFuIFh1IDx4aG5qdXB0QGdtYWlsLmNvbT4gd3JvdGUgb24gRnJp
LCAxNiBPY3QgMjAyMCAxMjowOToyMiAtMDUwMDoKPiA+ICAKPiA+ID4gT24gVGh1LCBPY3QgMTUs
IDIwMjAgYXQgMjoyNSBBTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29t
PiB3cm90ZTogIAo+ID4gPiA+Cj4gPiA+ID4gSGkgSGFuLAo+ID4gPiA+Cj4gPiA+ID4gSGFuIFh1
IDx4aG5qdXB0QGdtYWlsLmNvbT4gd3JvdGUgb24gV2VkLCAxNCBPY3QgMjAyMCAyMjowOTo1NiAt
MDUwMDoKPiA+ID4gPiAgCj4gPiA+ID4gPiBPbiBXZWQsIE9jdCAxNCwgMjAyMCBhdCA4OjM1IFBN
IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4gd3JvdGU6ICAKPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gSGkgSGFuIFh1LAo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBPbiBXZWQsIE9j
dCAxNCwgMjAyMCBhdCA2OjM4IFBNIEhhbiBYdSA8eGhuanVwdEBnbWFpbC5jb20+IHdyb3RlOgo+
ID4gPiA+ID4gPiAgCj4gPiA+ID4gPiA+ID4gSGkgTWlxdWVsLCB0aGUgY2hhbmdlcyB0byB0aGUg
bmVzdGVkIHN3aXRjaCBzdGF0ZW1lbnQgbWFrZSB0aGUgbG9naWMKPiA+ID4gPiA+ID4gPiBvZiB0
aGlzIGJyZWFrIHdyb25nLiAgCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IENhcmUgdG8gc2VuZCBh
IGZpeCwgcGxlYXNlPwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBXZSBoYXZlIHNlZW4gRUNDIE5B
TkQgcmVncmVzc2lvbnMgb24gbXgyNyBhbmQgTFMyMDg4IHBsYXRmb3Jtcy4KPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gSW4gd2hpY2ggcGxhdGZvcm0gZGlkIHlvdSBub3RpY2VkIHRoZSBFQ0MgaXNz
dWU/Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoYW5rcyAgCj4gPiA+ID4gPgo+ID4gPiA+ID4g
SGkgRmFiaW8sCj4gPiA+ID4gPgo+ID4gPiA+ID4gQ0kgdGVzdCByZXBvcnRlZCBhbGwgTFMgcGxh
dGZvcm1zIGhhdmUgdGhlIEVDQyByZWdyZXNzaW9uLiBUaGUgZXJyb3IKPiA+ID4gPiA+IGlzICJE
cml2ZXIgbXVzdCBzZXQgZWNjLnN0cmVuZ3RoIHdoZW4gdXNpbmcgaGFyZHdhcmUgRUNDIgo+ID4g
PiA+ID4KPiA+ID4gPiA+IEkgaGF2ZW4ndCB3b3JrZWQgb24gYW55IExTIHBsYXRmb3JtcyBzbyBJ
IHRlc3RlZCBvbiBpLk1YIHBsYXRmb3Jtcwo+ID4gPiA+ID4gd2l0aCBncG1pIE5BTkQgY29udHJv
bGxlciwKPiA+ID4gPiA+IHRoZSBjb2RlIHJhbiBpbnRvIE5BTkRfRUNDX0VOR0lORV9UWVBFX1NP
RlQgZHVlIHRvIHRoaXMgaXNzdWUuIFNvCj4gPiA+ID4gPiB0aGVzZSBhcmUgdHdvIGRpZmZlcmVu
dCBpc3N1ZXMsIEkgY2FuIHNlbmQgYSBwYXRjaCB0byBmaXggdGhlIG5lc3RlZAo+ID4gPiA+ID4g
c3dpdGNoIHN0YXRlbWVudCBwcm9ibGVtIGJ1dCB3b24ndCBmaXggdGhlIExTIHBsYXRmb3JtIGlz
c3VlLiAgCj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IEkgdGhpbmsgdGhlIGZhY3QgdGhhdCB0aGUg
ZXhlY3V0aW9uIHJhbiBpbnRvIE5BTkRfRUNDX0VOR0lORV9UWVBFX1NPRlQKPiA+ID4gPiBoYXMg
YmVlbiBmaXhlZC4gSG93ZXZlciB0aGVyZSBpcyBzdGlsbCB0aGUgb3RoZXIgaXNzdWUgdGhhdCBJ
IGFtIHVuYWJsZQo+ID4gPiA+IHRvIGZpbmQganVzdCBieSByZWFkaW5nIHRoZSBjb2RlIDovICAK
PiA+ID4KPiA+ID4gQ291bGQgeW91IHBsZWFzZSBzZW5kIG1lIHRoZSBsaW5rIG9mIHRoZSBmaXgg
cGF0Y2gsIEkgY2FuIHRlc3QgaXQgb24KPiA+ID4gaS5NWCBwbGF0Zm9ybXMuICAKPiA+Cj4gPiBU
aGUgZml4IGlzIGluIG5leHQgc2luY2UgbW9yZSB0aGFuIGEgd2VlaywgaWYgeW91IHN0aWxsIGhh
dmUgdGhlIGlzc3VlCj4gPiB0aGVuIGl0J3MgcHJvYmFibHkgdGhlIHNhbWUgaXNzdWUgdGhhdCBz
YXNjaGEgcmVwb3J0ZWQgaW4gYW5vdGhlcgo+ID4gdGhyZWFkIGFuZCBpbiB0aGlzIGNhc2UgZGVi
dWdnaW5nIGZyb20geW91ciBzaWRlIGlzIHdlbGNvbWUuICAKPiAKPiBJZiBJIGFtIGNvcnJlY3Qs
IHRoZSBwYXRjaCAibXRkOiByYXduYW5kOiBGaXggd3JvbmdmdWwgZmFsbHRocm91Z2gKPiBOQU5E
X0VDQ19TT0ZUIiBpcyB0aGUgZml4LiBCdXQgSSBkaWRuJ3Qgc2VlIGl0IGluIHRoZSBuZXh0IGJy
YW5jaCwKPiBvbmx5IHRoZSBvdGhlciB0d28gcGF0Y2hlcyBpbiB0aGUgcGF0Y2ggc2V0IGFwcGxp
ZWQuCgpJbmRlZWQsIEkgc3F1YXNoZWQgdGhhdCBwYXRjaCB3aXRoIHRoZSBmYXVsdHkgY29tbWl0
IHRvIHRyeSBrZWVwaW5nIGEKY2xlYW4vdW5kZXJzdGFuZGFibGUgaGlzdG9yeS4KCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
