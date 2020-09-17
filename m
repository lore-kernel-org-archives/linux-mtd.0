Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E318C433E2
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 16:46:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBCF021D7B
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 16:46:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aeTfabn9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBCF021D7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MjYI9drijUC9+bv4wKNBmTJ7zKOzHcAValVcTrrb74s=; b=aeTfabn9vz6pdolNlKIuno6d5
	WYIhH1ieV+sW2q9NJHhx1H8Ej0LBhnSA/XCiK2a2OzpjkR/iN5AqkMJbvIFtBLmj8ty/oeg4JOvS4
	cb2IMxzu8ZLnkab5aCgCqRXB4OggHXnC2F+9vF3FzhXn69D7ShQqZHuVhKsNhHSBvl5h7ixqO1RMc
	HLO0twqtHZSmityMXVQPbRImPiML/d03nmHYOISmy2TZeRPQCQXgb8+9fYV6+3H0/6HW79wpkcYvl
	JLvlIss7SBrmqEhghPbnEiVjOVBSd8KKW/tC4e+OZPu0Md+ghDTDbIlWgxAkS86dJS26pi9MG+CWV
	XdYiMRr0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIx2K-0005hW-QU; Thu, 17 Sep 2020 16:45:32 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIx2I-0005h4-6N
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 16:45:31 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 4C3141C000D;
 Thu, 17 Sep 2020 16:45:25 +0000 (UTC)
Date: Thu, 17 Sep 2020 18:45:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: imx27: Unsupported ECC algorithm
Message-ID: <20200917184524.44500d51@xps13>
In-Reply-To: <20200917181318.3fd9965d@xps13>
References: <CAOMZO5DnGGbZg_th=kjwBmNa8FznYErYCGvmD6dKgBbMV869+w@mail.gmail.com>
 <20200917181318.3fd9965d@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_124530_326004_61D3ECE3 
X-CRM114-Status: GOOD (  15.51  )
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
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRmFiaW8sCgpNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90
ZSBvbiBUaHUsIDE3IFNlcCAyMDIwCjE4OjEzOjE4ICswMjAwOgoKPiBIaSBGYWJpbywKPiAKPiBG
YWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+IHdyb3RlIG9uIFdlZCwgMTYgU2VwIDIw
MjAgMTA6NDk6MDMKPiAtMDMwMDoKPiAKPiA+IEhpIE1pcXVlbCwKPiA+IAo+ID4gT24gYSBpbXgy
Ny1waHl0ZWMtcGh5Y2FyZC1zLXJkayAgYm9hcmQgcnVubmluZyBsaW51eC1uZXh0LCB0aGUKPiA+
IGZvbGxvd2luZyB3YXJuaW5nIGlzIHNlZW46Cj4gPiAKPiA+IDEwOjE1OjI2LjIzMjA2OSAgLS0t
LS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4gPiAxMDoxNToyNi4yMzI4ODAgIFdB
Uk5JTkc6IENQVTogMCBQSUQ6IDEgYXQKPiA+IGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFz
ZS5jOjUyNDIgbmFuZF9zY2FuX3dpdGhfaWRzKzB4OWJjLzB4MTAwOAo+ID4gMTA6MTU6MjYuMjQx
MTMyICBVbnN1cHBvcnRlZCBFQ0MgYWxnb3JpdGhtIQo+ID4gCj4gPiBJIGJlbGlldmUgaXQgaGFz
IGJlZW4gY2F1c2VkIGJ5IDc0YTg5ZDdmOWVkNyAoIm10ZDogcmF3bmFuZDogVXNlIHRoZQo+ID4g
RUNDIGZyYW1ld29yayB1c2VyIGlucHV0IHBhcnNpbmcgYml0cyIpCj4gPiAKPiA+IEl0cyBkdHMg
dXNlcyBuYW5kLWVjYy1tb2RlID0gImh3IiA6Cj4gPiAKPiA+ICZuZmMgewo+ID4gcGluY3RybC1u
YW1lcyA9ICJkZWZhdWx0IjsKPiA+IHBpbmN0cmwtMCA9IDwmcGluY3RybF9uZmM+Owo+ID4gbmFu
ZC1idXMtd2lkdGggPSA8OD47Cj4gPiBuYW5kLWVjYy1tb2RlID0gImh3IjsKPiA+IG5hbmQtb24t
Zmxhc2gtYmJ0Owo+ID4gc3RhdHVzID0gIm9rYXkiOwo+ID4gfTsKPiA+IAo+ID4gSSBkb24ndCBo
YXZlIGFjY2VzcyB0byB0aGlzIGhhcmR3YXJlLCBidXQgSSBzYXcgdGhlIHJlcG9ydCBieSB0aGUK
PiA+IFBlbmd1dHJvbml4IGxhYiBpbiBrZXJuZWxjaToKPiA+IGh0dHBzOi8vc3RvcmFnZS5rZXJu
ZWxjaS5vcmcvbmV4dC9tYXN0ZXIvbmV4dC0yMDIwMDkxNi9hcm0vaW14X3Y0X3Y1X2RlZmNvbmZp
Zy9nY2MtOC9sYWItcGVuZ3V0cm9uaXgvYmFzZWxpbmUtaW14MjctcGh5dGVjLXBoeWNhcmQtcy1y
ZGsuaHRtbAo+ID4gCj4gPiBBbnkgaWRlYXM/ICAKPiAKPiBUaGFua3MgZm9yIHRoZSByZXBvcnQs
IEkgZG9uJ3Qga25vdyB3aGF0IGlzIGhhcHBlbmluZyB5ZXQgYnV0IEknbGwKPiBpbnZlc3RpZ2F0
ZS4KPiAKPiBBcyBJJ2xsIGJlIG9mZiBuZXh0IHdlZWssIGl0IG1pZ2h0IHRha2UgYSBiaXQgbG9u
Z2VyIHRoYW4gZXhwZWN0ZWQKPiB0byBzZWUgdGhpcyBzb2x2ZWQgaWYgSSBkb24ndCBjb21lIHVw
IHdpdGggc29tZXRoaW5nIGJ5IHRvbW9ycm93Li4uCgpQZXJoYXBzIFR1ZG9yJ3Mgc2VyaWVzIGlz
IHJlbGF0ZWQgdG8geW91ciBpc3N1ZSwgd291bGQgeW91IG1pbmQgdGVzdGluZwppdD8KCmh0dHBz
Oi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1tdGQvbGlzdC8/c2VyaWVzPTIw
MjM0NAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
