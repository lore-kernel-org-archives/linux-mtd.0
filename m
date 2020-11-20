Return-Path: <SRS0=dDgs=E2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD7CC5519F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 11:44:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 048472222A
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 11:44:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nSc5WlRM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 048472222A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fnljKsGgjHV0iJ90f0UwpQze10iaglrF6Tqsqkrz4E8=; b=nSc5WlRMkSAJIgZ1uXGcCoZez
	3frpI+HKJ3FdiKwOtNZnxOjQAzc1RGYpx53aODsQwA4yfLO0QUw2VYxkPZgjckFsbx7G9TIAOb46i
	bSA03WV3aEFYnihOE5F+ejfkPt/JmmDmPKMiVCtAeJwDWZ9wBiAWM33A2WaLRY6YbaNw4ypI7Yx/4
	SQQ5qwpLElxOBbwctlIdtV6NbJ0wRc36QUKXnamA7Vck2LHBZsUqQvKAK+wrNLZJOdUOYKXkgvusn
	J1jESk6y0I0NImYUdlB2Ka2LktgDdu+FZsThY799yJdGJKMbXwu85rqOzlh3J315bnJaAhsBMA6HB
	winxKo31A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg4og-0002xW-3S; Fri, 20 Nov 2020 11:43:02 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg4ob-0002vS-9k
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2020 11:42:59 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id AE8DE240009;
 Fri, 20 Nov 2020 11:42:47 +0000 (UTC)
Date: Fri, 20 Nov 2020 12:42:46 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 23/23] mtd: devices: powernv_flash: Add function
 names to headers and fix 'dev'
Message-ID: <20201120124246.4aee04d6@xps13>
In-Reply-To: <20201120075000.GA1869941@dell>
References: <20201109182206.3037326-24-lee.jones@linaro.org>
 <20201119210716.25046-1-miquel.raynal@bootlin.com>
 <20201120075000.GA1869941@dell>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_064257_474018_5FB57916 
X-CRM114-Status: GOOD (  13.57  )
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
 Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiB3cm90ZSBvbiBGcmksIDIw
IE5vdiAyMDIwIDA3OjUwOjAwCiswMDAwOgoKPiBPbiBUaHUsIDE5IE5vdiAyMDIwLCBNaXF1ZWwg
UmF5bmFsIHdyb3RlOgo+IAo+ID4gT24gTW9uLCAyMDIwLTExLTA5IGF0IDE4OjIyOjA2IFVUQywg
TGVlIEpvbmVzIHdyb3RlOiAgCj4gPiA+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBi
dWlsZCB3YXJuaW5nKHMpOgo+ID4gPiAKPiA+ID4gIGRyaXZlcnMvbXRkL2RldmljZXMvcG93ZXJu
dl9mbGFzaC5jOjEyOTogd2FybmluZzogQ2Fubm90IHVuZGVyc3RhbmQgICogQG10ZDogdGhlIGRl
dmljZQo+ID4gPiAgZHJpdmVycy9tdGQvZGV2aWNlcy9wb3dlcm52X2ZsYXNoLmM6MTQ1OiB3YXJu
aW5nOiBDYW5ub3QgdW5kZXJzdGFuZCAgKiBAbXRkOiB0aGUgZGV2aWNlCj4gPiA+ICBkcml2ZXJz
L210ZC9kZXZpY2VzL3Bvd2VybnZfZmxhc2guYzoxNjE6IHdhcm5pbmc6IENhbm5vdCB1bmRlcnN0
YW5kICAqIEBtdGQ6IHRoZSBkZXZpY2UKPiA+ID4gIGRyaXZlcnMvbXRkL2RldmljZXMvcG93ZXJu
dl9mbGFzaC5jOjE4NDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnZGV2
JyBub3QgZGVzY3JpYmVkIGluICdwb3dlcm52X2ZsYXNoX3NldF9kcml2ZXJfaW5mbycKPiA+ID4g
Cj4gPiA+IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4g
PiBDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KPiA+ID4gQ2M6IFZpZ25l
c2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KPiA+ID4gQ2M6IE1pY2hhZWwgRWxsZXJt
YW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4KPiA+ID4gQ2M6IEJlbmphbWluIEhlcnJlbnNjaG1pZHQg
PGJlbmhAa2VybmVsLmNyYXNoaW5nLm9yZz4KPiA+ID4gQ2M6IFBhdWwgTWFja2VycmFzIDxwYXVs
dXNAc2FtYmEub3JnPgo+ID4gPiBDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+
ID4gQ2M6IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnCj4gPiA+IFNpZ25lZC1vZmYtYnk6
IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+ICAKPiA+IAo+ID4gQXBwbGllZCB0byBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXgu
Z2l0IG5hbmQvbmV4dCwgdGhhbmtzLiAgCj4gCj4gU3VwZXJzdGFyLiAgVGhhbmtzIGZvciB5b3Vy
IGhlbHAgTWlxdWVsLgo+IAoKaGFoYSA6KSB3ZWxsIGl0IHdhcyBsYXRlLCBJIGFwcGxpZWQgdGhl
c2UgcGF0Y2hlcyB0byB0aGUgd3JvbmcgYnJhbmNoLApJIGp1c3QgbW92ZWQgdGhlbSB0byB0aGUg
bXRkL25leHQgYnJhbmNoLCBzb3JyeSBmb3IgdGhlIHB1c2ggLWYgOikKCkNoZWVycywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
