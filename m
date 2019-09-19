Return-Path: <SRS0=PkFq=XO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A0DFC3A5A6
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 11:35:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DED4C21BE5
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 11:35:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WwFvKI3b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DED4C21BE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6n1QuwxXp4LDNZ8L6//zCCbzqjMyqo35OGPoOBC/FW0=; b=WwFvKI3bdpwQlW
	VZBnxYwfHIXfT1quN08Oy6aaH08+YxNeq72ZD5QkDYe3UCjk4Cyh6ByFzcxFESl/ZXjfUF0lvLS2j
	aKOwD/z9vagMidsJTUamb4sh8yMqvOMnZbseKAcnL34O2Fzdpk3JAN92HBEY1QvusuO7oF9Xl+zc2
	LOWv6tlVhC2gSnPqiP+fLZUU2E8kzt1w+kHswMwjP/vAEbgQqUwITF9RVbnSZUCGDpvDogE4NiGk+
	HyYGHCQilcfCFbOnbjVktBe3yis7viElyHJvmuf6JUC2Zvgww6Thq2Ldnyz/IQFY9i968otCqkU78
	b/4fdAWMvSCLnwPCM2Ww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAuiR-0005Xv-AA; Thu, 19 Sep 2019 11:35:15 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAuiN-0005X1-Vj
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2019 11:35:13 +0000
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 7201910000A;
 Thu, 19 Sep 2019 11:35:07 +0000 (UTC)
Date: Thu, 19 Sep 2019 13:35:06 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] mtd: st_spi_fsm: Use devm_platform_ioremap_resource()
 in stfsm_probe()
Message-ID: <20190919133506.6e46601f@xps13>
In-Reply-To: <20190919112937.GA3072241@kroah.com>
References: <e1d32aa4-7c82-64e0-b7c4-33c94d9a2769@web.de>
 <20190919111014.6c569cf3@xps13>
 <20190919112937.GA3072241@kroah.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_043512_183042_F4D6C8DA 
X-CRM114-Status: GOOD (  21.42  )
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
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Lee Jones <lee.jones@linaro.org>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Armijn Hemel <armijn@tjaldur.nl>, linux-mtd@lists.infradead.org,
 Himanshu Jha <himanshujha199640@gmail.com>,
 Richard Weinberger <richard@nod.at>, Markus Elfring <Markus.Elfring@web.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgR3JlZywKCkdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
IHdyb3RlIG9uIFRodSwgMTkgU2VwCjIwMTkgMTM6Mjk6MzcgKzAyMDA6Cgo+IE9uIFRodSwgU2Vw
IDE5LCAyMDE5IGF0IDExOjEwOjE0QU0gKzAyMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBI
aSBNYXJrdXMsCj4gPiAKPiA+IE1hcmt1cyBFbGZyaW5nIDxNYXJrdXMuRWxmcmluZ0B3ZWIuZGU+
IHdyb3RlIG9uIFdlZCwgMTggU2VwIDIwMTkKPiA+IDE0OjUwOjI3ICswMjAwOgo+ID4gICAKPiA+
ID4gRnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0Pgo+
ID4gPiBEYXRlOiBXZWQsIDE4IFNlcCAyMDE5IDE0OjM3OjM0ICswMjAwCj4gPiA+IAo+ID4gPiBT
aW1wbGlmeSB0aGlzIGZ1bmN0aW9uIGltcGxlbWVudGF0aW9uIGJ5IHVzaW5nIGEga25vd24gd3Jh
cHBlciBmdW5jdGlvbi4KPiA+ID4gCj4gPiA+IFRoaXMgaXNzdWUgd2FzIGRldGVjdGVkIGJ5IHVz
aW5nIHRoZSBDb2NjaW5lbGxlIHNvZnR3YXJlLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTog
TWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0Pgo+ID4gPiAtLS0K
PiA+ID4gIGRyaXZlcnMvbXRkL2RldmljZXMvc3Rfc3BpX2ZzbS5jIHwgOCArLS0tLS0tLQo+ID4g
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA3IGRlbGV0aW9ucygtKQo+ID4gPiAK
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2RldmljZXMvc3Rfc3BpX2ZzbS5jIGIvZHJp
dmVycy9tdGQvZGV2aWNlcy9zdF9zcGlfZnNtLmMKPiA+ID4gaW5kZXggZjRkMTY2N2RhYWY5Li41
YmQxYzQ0YWU1MjkgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvbXRkL2RldmljZXMvc3Rfc3Bp
X2ZzbS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvbXRkL2RldmljZXMvc3Rfc3BpX2ZzbS5jCj4gPiA+
IEBAIC0yMDM0LDEzICsyMDM0LDcgQEAgc3RhdGljIGludCBzdGZzbV9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gPiAKPiA+ID4gIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShw
ZGV2LCBmc20pOwo+ID4gPiAKPiA+ID4gLQlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRl
diwgSU9SRVNPVVJDRV9NRU0sIDApOwo+ID4gPiAtCWlmICghcmVzKSB7Cj4gPiA+IC0JCWRldl9l
cnIoJnBkZXYtPmRldiwgIlJlc291cmNlIG5vdCBmb3VuZFxuIik7Cj4gPiA+IC0JCXJldHVybiAt
RU5PREVWOwo+ID4gPiAtCX0KPiA+ID4gLQo+ID4gPiAtCWZzbS0+YmFzZSA9IGRldm1faW9yZW1h
cF9yZXNvdXJjZSgmcGRldi0+ZGV2LCByZXMpOwo+ID4gPiArCWZzbS0+YmFzZSA9IGRldm1fcGxh
dGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsKPiA+ID4gIAlpZiAoSVNfRVJSKGZzbS0+
YmFzZSkpIHsKPiA+ID4gIAkJZGV2X2VycigmcGRldi0+ZGV2LAo+ID4gPiAgCQkJIkZhaWxlZCB0
byByZXNlcnZlIG1lbW9yeSByZWdpb24gJXBSXG4iLCByZXMpOwo+ID4gPiAtLQo+ID4gPiAyLjIz
LjAKPiA+ID4gICAKPiA+IAo+ID4gCj4gPiBJcyB0aGlzIGV2ZW4gY29tcGlsZWQgdGVzdGVkPyAn
cmVzJyBpcyBub3QgaW5pdGlhbGl6ZWQgYW55bW9yZSBzbyB5b3UKPiA+IGNhbid0IHVzZSBpdCBp
biB0aGUgZXJyb3IgdHJhY2UuIEkgc3VwcG9zZSB5b3Ugc2hvdWxkIGV2ZW4gZHJvcCBpdCBmcm9t
Cj4gPiB0aGUgc3RhY2sgcGFyYW1ldGVycy4gIAo+IAo+IFlvdSBhcmUgcmVzcG9uZGluZyB0byBh
IGVtYWlsIGFkZHJlc3MvYm90IHRoYXQgaXMgb24gYSBudW1iZXIgb2Yga2VybmVsCj4gZGV2ZWxv
cGVycyAiYmxhY2sgbGlzdCIgYXMgc29tZXRoaW5nIHRvIGp1c3QgdG90YWxseSBpZ25vcmUuICBJ
Cj4gcmVjb21tZW5kIHlvdSBkbyB0aGUgc2FtZSBpZiBwb3NzaWJsZS4uLgo+IAo+IGdyZWcgay1o
CgpPaCByaWdodC4uLiBTdXJlLCBJJ2xsIGlnbm9yZSBpdC9oaW0gYXMgd2VsbC4KClRoYW5rcyBm
b3IgdGhlIGluZm8sCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
