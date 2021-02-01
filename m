Return-Path: <SRS0=Ud6c=HD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B4BC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 14:15:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B5CD64EA1
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 14:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B5CD64EA1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sDmjhI6eVQO4Ta/zF7HhrmeL0h0MkJYbSf5qxq80ISU=; b=IbvH8dp497ryTZ3IUE/+9Yu5w
	s3hs+ordAkyzDBmBnTCEYwHHmNE4PrP4j+cOkLgffOM/OJtDqMG2GF5zzJyNJuxUbeSp63d0C7f5H
	teXV/IfZ8/FBFM0zDl0pUIT6eH075Z+WRxb7dTNU7Qyp/+Ff/A0FoYjSdHJSg8Hg6YU0LcIR6uqBY
	q+4iGf02NG2buqxNPk81UBUGgP+25Erkr0/kD0+pjRIOj+qRhXBuiZtkJJxhi4qoSgdxgCmDCj/Qe
	7oMpCs37mLAJXeiyD1ZQrpmLY7uAXKM1zQr71Pt3WVxDvvc+9AVFYUpOPvCZXUGI2Mkr5KIhyP5wk
	VM13MQuIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6Zxg-0004a8-OJ; Mon, 01 Feb 2021 14:13:52 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6Zxd-0004Ze-RE
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2021 14:13:51 +0000
X-Originating-IP: 86.210.203.150
Received: from xps13 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr
 [86.210.203.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A49481BF216;
 Mon,  1 Feb 2021 14:13:36 +0000 (UTC)
Date: Mon, 1 Feb 2021 15:13:35 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Subject: Re: GPMI iMX6ull timeout on DMA
Message-ID: <20210201151335.210af8ca@xps13>
In-Reply-To: <CAOf5uwm93+ARf=_BckjMar1tpeBs6YHeUwORj5cyhFfvu5fNWQ@mail.gmail.com>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <20190730103822.7576645d@xps13>
 <0a6afd79-d5ca-24da-a62c-11146a3522f6@kernel.org>
 <20190731082823.6284f5a9@collabora.com>
 <e47b1de2-501a-9a1f-e980-48d2c396811a@kernel.org>
 <20190802145109.00c4a4eb@collabora.com>
 <b739696d-bb1d-bb04-cd45-3019712e29ad@kernel.org>
 <20190808183651.7c0962e7@collabora.com>
 <694cb2ac-68e6-72b1-3d55-e405b176a17f@kernel.org>
 <20190809082356.0cf60555@collabora.com>
 <ce7157e2-a8d0-7204-4003-8a711acb65b8@kernel.org>
 <20190809093235.09d89e20@collabora.com>
 <c5af9334-f679-6fc9-4d2a-1366a295598a@kernel.org>
 <20190809155934.40c43f29@collabora.com>
 <00b31833-69ba-42c5-57c9-37fa1f70efc5@kernel.org>
 <20190812093129.75888dad@collabora.com>
 <a47792dc-b19f-8af3-8748-5a21fb63271e@kernel.org>
 <CAOf5uwmPzCU8WFRQ1tQBdN7OVGZZ9SvdAG0YqVAyxmA1zwtUhg@mail.gmail.com>
 <2e9e1f1c-ee57-425d-1791-70c66de52637@kernel.org>
 <CAOf5uwm93+ARf=_BckjMar1tpeBs6YHeUwORj5cyhFfvu5fNWQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_091350_059734_F99BE93A 
X-CRM114-Status: GOOD (  16.48  )
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
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Greg Ungerer <gerg@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWljaGFlbCwKCk1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxh
c29sdXRpb25zLmNvbT4gd3JvdGUgb24KU2F0LCAzMCBKYW4gMjAyMSAxMDo0MToyOSArMDEwMDoK
Cj4gSGkgTWlxdWVsCj4gCj4gY29tbWl0IGY4ZTZhZDE0Mzg4MDY3ZjkxYjI2ZDA0NDE4NWQ5NTYy
M2ZiYzk1MzUKPiBBdXRob3I6IE1pY2hhZWwgVHJpbWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFzb2x1
dGlvbnMuY29tPgo+IERhdGU6ICAgRnJpIEphbiAyOSAwODo0Njo1MyAyMDIxICswMTAwCj4gCj4g
ICAgIG10ZDogbmFuZDogQ2FsY3VsYXRlIHRoZSBjbG9jayBiZWZvcmUgZW5hYmxlIGl0Cj4gCj4g
ICAgIFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgVHJpbWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFzb2x1
dGlvbnMuY29tPgo+ICAgICBDaGFuZ2UtSWQ6IEk3OWIwZGEzOWRlMGE5YjMyZWEwYjAwMmZhMjAw
ZDdmNDRkNGY4Y2U3Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWkt
bmFuZC9ncG1pLWxpYi5jCj4gYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1s
aWIuYwo+IGluZGV4IDMyMmEwMDgyOTBlNS4uMGJjYTUyYjNiYzhmIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLWxpYi5jCj4gKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbGliLmMKPiBAQCAtMzc3LDYgKzM3Nyw3IEBAIHN0
YXRpYyB2b2lkIGdwbWlfbmZjX2NvbXB1dGVfdGltaW5ncyhzdHJ1Y3QKPiBncG1pX25hbmRfZGF0
YSAqdGhpcywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3Ry
dWN0IG5hbmRfc2RyX3RpbWluZ3MgKnNkcikKPiAgewo+ICAgICAgICAgc3RydWN0IGdwbWlfbmZj
X2hhcmR3YXJlX3RpbWluZyAqaHcgPSAmdGhpcy0+aHc7Cj4gKyAgICAgICBzdHJ1Y3QgcmVzb3Vy
Y2VzICpyID0gJnRoaXMtPnJlc291cmNlczsKPiAgICAgICAgIHVuc2lnbmVkIGludCBkbGxfdGhy
ZXNob2xkX3BzID0gdGhpcy0+ZGV2ZGF0YS0+bWF4X2NoYWluX2RlbGF5Owo+ICAgICAgICAgdW5z
aWduZWQgaW50IHBlcmlvZF9wcywgcmVmZXJlbmNlX3BlcmlvZF9wczsKPiAgICAgICAgIHVuc2ln
bmVkIGludCBkYXRhX3NldHVwX2N5Y2xlcywgZGF0YV9ob2xkX2N5Y2xlcywgYWRkcl9zZXR1cF9j
eWNsZXM7Cj4gQEAgLTQ0MCw2ICs0NDEsOCBAQCBzdGF0aWMgdm9pZCBncG1pX25mY19jb21wdXRl
X3RpbWluZ3Moc3RydWN0Cj4gZ3BtaV9uYW5kX2RhdGEgKnRoaXMsCj4gICAgICAgICAgICAgICAg
IGh3LT5jdHJsMW4gfD0gQkZfR1BNSV9DVFJMMV9SRE5fREVMQVkoc2FtcGxlX2RlbGF5X2ZhY3Rv
cikgfAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJNX0dQTUlfQ1RSTDFfRExMX0VO
QUJMRSB8Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHVzZV9oYWxmX3BlcmlvZCA/
IEJNX0dQTUlfQ1RSTDFfSEFMRl9QRVJJT0QgOiAwKTsKPiArCj4gKyAgICAgICBjbGtfc2V0X3Jh
dGUoci0+Y2xvY2tbMF0sIGh3LT5jbGtfcmF0ZSk7Cj4gIH0KPiAKPiAgdm9pZCBncG1pX25mY19h
cHBseV90aW1pbmdzKHN0cnVjdCBncG1pX25hbmRfZGF0YSAqdGhpcykKPiBAQCAtNDQ5LDggKzQ1
Miw2IEBAIHZvaWQgZ3BtaV9uZmNfYXBwbHlfdGltaW5ncyhzdHJ1Y3QgZ3BtaV9uYW5kX2RhdGEg
KnRoaXMpCj4gICAgICAgICB2b2lkIF9faW9tZW0gKmdwbWlfcmVncyA9IHItPmdwbWlfcmVnczsK
PiAgICAgICAgIHVuc2lnbmVkIGludCBkbGxfd2FpdF90aW1lX3VzOwo+IAo+IC0gICAgICAgY2xr
X3NldF9yYXRlKHItPmNsb2NrWzBdLCBody0+Y2xrX3JhdGUpOwo+IC0KPiAgICAgICAgIHdyaXRl
bChody0+dGltaW5nMCwgZ3BtaV9yZWdzICsgSFdfR1BNSV9USU1JTkcwKTsKPiAgICAgICAgIHdy
aXRlbChody0+dGltaW5nMSwgZ3BtaV9yZWdzICsgSFdfR1BNSV9USU1JTkcxKTsKPiAKPiBSaWdo
dCBub3cgSSBoYXZlIHRoaXMgY2hhbmdlIGFwcGxpZWQgYW5kIHNlZW1zIGZpbmUuIFRoYXQgaXMg
dGhlIG9ubHkKPiBkaWZmZXJlbmNlIEkgZ2V0LiBDbG9jayBpcyBhcHBseSBhIGJpdCBlYXJsaWVy
IHRoYXQgd2hlbiBpcyBlbmFibGVkCj4gaXQuCgpUaGlzIGlzIHZlcnkgaW50ZXJlc3RpbmcuIFNv
IHRoaXMgd291bGQgbWVhbiB0aGUgaXNzdWUgeW91IGFyZQpleHBlcmllbmNpbmcgY29tZXMgZnJv
bSB0aGUgY2xvY2sgZHJpdmVyIHdoaWNoIGtpbmQgb2YgcmV0dXJucyB0b28KZWFybHkgZnJvbSBj
bGtfc2V0X3JhdGUoKT8gQ291bGQgeW91IHJlcG9ydCB0aGlzIHRvIHRoZSBjbGsgTUwvTlhQIGNs
awptYWludGFpbmVycyBhbmQga2VlcCB1cyBpbiBjb3B5PyBJZiBpdCBpcyBhcyBnbG9iYWwgYXMg
aXQgc291bmRzLCB3ZQptaWdodCBub3QgYmUgdGhlIG9ubHkgb25lcyBhZmZlY3RlZC4KClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
