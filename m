Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02A1C25B79
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2024 09:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=azfxY5M6dIi1pUihwJAgfLhjBxMIg9f2JBFcEEUC82w=; b=cZL0w76G6J0PcF
	0qzzzWSZDcFhGwj0HTs7OzRhwwxcJNfyt6TUlBMy4H3HkM3RI8USIl5pNIsGvulc5h9kKXFKIPfln
	Q8qy7w+QJQvH2czNoHR4SvHyezz6FpVzwdYoMvD/p2ZaYHlFGXT1Qus0CZxLunHZ1m6cvAZj+6rWH
	dVMgs3RiaL0ZXnO1m/3oR7+CHyuis8IPJ3mqm/WqRqryAqbOo7MzI+9KOj/WzIVXDS8PqnUGrMtwc
	L/SGanFdv0STj79BJIAsJM+2ZItNAmJ9b0oNU7TEPH9Es7c6/z8GqUhh83ZyYOssNKcJRqIEvmtA4
	NDHpGMpB3R9bAIbRxWaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7XsX-00000004P9f-3WEi;
	Thu, 16 May 2024 09:58:25 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7XsU-00000004P5Q-2Gy6
	for linux-mtd@lists.infradead.org;
	Thu, 16 May 2024 09:58:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B404C6000B;
	Thu, 16 May 2024 09:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715853496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TU3V61Z0wIgectXTOIoDLF/0Qh2EeUmNqA0N7zoS8Fk=;
	b=haXHGLgz3tHlAGjx+O1RqDE769xASBsIP31pnB6qeDP/6DRuA5rEgbCNRfKkoOuh2o8NCJ
	cS9gdO6Y3agDJYU02S6GW66q/YtgfnGnupHOM92XlEN1JXXZmFPP7ZAbRgQgV9tqD8Y+42
	XxoFhWhqQjWSV17YB+pD+PrHSYnxm7J/WKrQ81ahbzZ88hnQHRnB5yPlWapVNQ36OW8GWd
	546YDtKUVZkgodHY01eVqBAyQe53oBoml+aDOhMbhQfYF+M+nYBY9tuLvloq2HAk4FXXtr
	keK+xZncK/Mq/jdl8xhuWTo5zPGO7zn0IbG+KAV6YHlS2KdCCeo15mzntBlzvA==
Date: Thu, 16 May 2024 11:58:12 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Richard
 Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: rawnand: onfi: read parameter pages in one go
Message-ID: <20240516115812.02908822@xps-13>
In-Reply-To: <20240516101350.78e5ee29@xps-13>
References: <20240514134140.1050141-1-s.hauer@pengutronix.de>
	<20240516101350.78e5ee29@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_025822_756282_8BC09101 
X-CRM114-Status: GOOD (  21.58  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Cm1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20gd3JvdGUgb24gVGh1LCAxNiBNYXkgMjAyNCAxMDox
Mzo1MCArMDIwMDoKCj4gSGkgU2FzY2hhLAo+IAo+IHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGUgd3Jv
dGUgb24gVHVlLCAxNCBNYXkgMjAyNCAxNTo0MTo0MCArMDIwMDoKPiAKPiA+IG5hbmRfcmVhZF9k
YXRhX29wKCkgaXMgbm90IHN1cHBvcnRlZCBieSBhbGwgTkFORCBjb250cm9sbGVycy4KPiA+IG5h
bmRfY2hhbmdlX3JlYWRfY29sdW1uX29wKCkgaXMgbm90IHN1cHBvcnRlZCBvciBhdCBsZWFzdCBp
cyBoYXJkIHRvCj4gPiBzdXBwb3J0IGJ5IE5BTkQgY29udHJvbGxlcnMgdGhhdCB1c2UgYSBkaWZm
ZXJlbnQgcGFnZSBsYXlvdXQgdGhhbgo+ID4gZXhwZWN0ZWQgYnkgdGhlIE5BTkQgY29yZS4gIAo+
IAo+IEknbSBzb3JyeSBidXQgUk5ET1VUIGlzIG5vdCBzbyBoYXJkIHRvIHN1cHBvcnQsIGFuZCBJ
IGtub3cgbm8gTkFORAo+IGNvbnRyb2xsZXIgd2l0aG91dCB0aGlzIGZlYXR1cmUgKEkgdGhpbmsg
ZXZlbiB0aGUgZmlyc3QgbXhjIGNvbnRyb2xsZXIKPiBzdXBwb3J0cyBpdD8pLiBIb3dldmVyLCB0
aGUgY29tbWFuZCBkb2VzIG5vdCBleGlzdCBvbiBzbWFsbCBwYWdlIE5BTkRzCj4gKDUxMiBieXRl
cykuCgpOZXZlcm1pbmQsIHRoZSBPTkZJIHNwZWMgKGluIGFsbCB2ZXJzaW9ucykgc3RhdGVzIHRo
YXQgUk5ET1VUIGFyZQphbGxvd2VkIGR1cmluZyBwYXJhbWV0ZXIgcGFnZSByZWFkcywgcmVnYXJk
bGVzcyBvZiB0aGUgc2l6ZSBvZiB0aGUgY2hpcAooYXQgbGVhc3QsIHRoYXQgaXMgbm90IG1lbnRp
b25lZCkuCgo+IFRCSCBJIGhhdmUgbmV2ZXIgc2VlbiBzdWNoIGEgZGV2aWNlIG15c2VsZiwgc28g
SSB3b25kZXIKPiBob3cgc3ByZWFkIHRoZXkgc3RpbGwgYXJlLgo+IAo+IFdoYXQgbWF5IG5vdCBi
ZSBzdXBwb3J0ZWQgaG93ZXZlciBhcmUgdGhlIERBVEFfSU4gY3ljbGVzLgo+IAo+ID4gSW5zdGVh
ZCBvZiByZWx5aW5nIG9uIHRoZXNlIGZ1bmN0aW9ucwo+ID4ganVzdCByZWFkIHRoZSB0aHJlZSBw
YXJhbWV0ZXIgcGFnZXMgaW4gb25lIGdvLiAgCj4gCj4gQml0ZmxpcHMgaW4gcGFyYW1ldGVyIHBh
Z2VzIGFyZSB2ZXJ5IHJhcmUsIHRoZXkgYXJlIG5vcm1hbGx5IHF1aXRlCj4gcm9idXN0LiBUaGUg
cHJvcG9zZWQgc29sdXRpb24gaW1wYWN0cyAqYWxsKiBOQU5EcywgYmVjYXVzZSB0aGUgSS9PCj4g
Y2hpcCBzcGVlZCBpcyBhdCBpdHMgbG93ZXN0LiBUaGVyZSBpcyBubyByZWFzb24gaW4gbW9zdCBj
YXNlcyB0byBkbwo+IHRoYXQuCj4gCj4gSSBhZ3JlZSB0aGVyZSBpcyBhIHByb2JsZW0gd2l0aCB0
aGUgcGF0Y2ggSSBwcm9wb3NlZCBhbmQgd2UgbmVlZCB0bwo+IHNldHRsZS4gQW5kIHdlIHNpbXBs
eSBjYW5ub3QgbWFrZSBSTkRPVVQgY2FsbHMgcmFuZG9tbHkgaGVyZSBhcyBsb25nIGFzCj4gd2Ug
d2FudCB0byBzdXBwb3J0IHNtYWxsIHBhZ2UgTkFORHMuCj4gCj4gSSBiZWxpZXZlIHdlIHNob3Vs
ZCBkbyBzb21ldGhpbmcgbGlrZToKPiAKPiBuYW5kX3JlYWRfcGFyYW1fcGFnZV9vcCgwKQo+IGlm
IChjb3JydXB0ZWQpIHsKPiAJaWYgKHN1cHBvcnRlZC5kYXRhaW4pCj4gCQlkYXRhX2luKCk7IC8q
IHRoaXMgaXMgZmFzdGVyICovCj4gCWVsc2UJCQo+IAkJbmFuZF9yZWFkX3BhcmFtX3BhZ2Vfb3Ao
MSkKClRoaXMgY2FuJ3Qgd29yaywgdGhlcmUgaXMgYSBzaW5nbGUgYWRkcmVzcyBieXRlLiBUaGUg
cGFyYW1ldGVyIHBhZ2UKYmVpbmcgMjU2IGJ5dGVzLCB3ZSBjYW4ndCB1c2UgdGhlIGFkZHJlc3Mg
cGFyYW1ldGVyLgoKU28gSSdtIHNvcnJ5IGJ1dCB0aGUgc29sdXRpb25zIGFyZToKLSBEQVRBX0lO
IGN5Y2xlcyAobm90IGFsd2F5cyBzdXBwb3J0ZWQgYnV0IHRoZSBiZXN0KQpvciBpZiB1bnN1cHBv
cnRlZDoKLSBSTkRPVVQKClJlLXJlYWRpbmcgdGhlIHRocmVlIHBhZ2VzIHdvdWxkIGJlIHNsb3dl
ciBhbmQgaXMgbm90IHN1cHBvcnRlZCBieSBhbGwKY29udHJvbGxlcnMgYW55d2F5LiBFeGFtcGxl
IG9mIGNvbnRyb2xsZXIgbm90IHN1cHBvcnRpbmcgaXQ6IHFjb20gWzFdLgpUaGF0J3Mgd2h5IEkg
d2FudCB0aGUgY29uc3RyYWludHMgdG8gYmUgZmFpcmx5IHdlbGwgZGVzY3JpYmVkIGluIHRoZQpw
YXJzZXIuCgpbMV0gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJj
ZS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMjTDI5NjUKClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
