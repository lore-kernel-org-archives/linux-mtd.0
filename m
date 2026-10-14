Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A215CC6B27
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 09:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1y9NY7fC6mY2GJFmwmOmUjo5ujyST9TEJS4aH9fdK2U=; b=hncijalGdwhk1T
	YCzWh2AwyJVmgGTh7lbepn715SFCFhtdTUDotXPiUHK0mvJRePMD084rSkAduHsWPSBHYg90kNeBm
	uV03H77hb3oxzQDZPiAbgCtR9UO+vzGLsjtWsmQpo4Ck7nAOrJUKttUsd5boE1tp7OylA9KZf0zoA
	8Y4/rQ7o7L0oXEtSTzLnH9J4+qHS1Y2LXGDbbwHFDM/jpZeYmuz6DDTDlEWk3h/x2l6lFCxso+jTk
	w2hQxelzEMNOplOJYr6yfrqrPbFO/igB1TdFXPjH0sY+ApEQyyfrIJ5G1Pl2XoqQaML92Zlocn/vx
	Y1JLeG/cDuPOcMBxW4Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuz1-0000000EzHM-0ITC;
	Wed, 14 Oct 2026 09:09:11 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuyy-0000000EzGn-3S9s
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 09:09:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F22294E4120C;
	Wed, 14 Oct 2026 09:09:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C69D260368;
	Wed, 14 Oct 2026 09:09:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D297B10328B5A;
	Wed, 14 Oct 2026 11:09:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791968944; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Kz1QzeFPXpgXoxH0dqLkiCCXCL7vc/GTZmF74AAJUAs=;
	b=MpQucQfw6G11Qn9TOznwb9oYKLOcWxWNyWHPZQPZR9EP7+WIvF0ipyUidKiTgHTl4q/XAJ
	D88htoj8Sql7zcGskcH1TYiKUolXARayBM9klBe3Qx1CAWcKVRh3LGQAUZieMUdsLhwXWh
	PHTbQSRurI2F8uJ0LL03Tlaw+hCPrDzgWUsSz0DawO0V1pMTq4mbwb8Y/dGE/hjanUgxic
	PcgksMrEAX3a961e0AGQH3kiKhtVwDNA6MQWNhmhHPy40Jp++pjn7WlQhcGVAcocehjlM9
	xQIAw9IvOVlWT7r9vK3NJzqaSvg0DNr2ViacEV4vJB9Rl4Xnrwv9aJDq7JC9ng==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Michael Walle"
 <mwalle@kernel.org>,  "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
  "Richard Weinberger" <richard@nod.at>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  sashiko-reviews@lists.linux.dev,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 09/17] mtd: spi-nor: Allow configuring the actual
 number of dummy cycles
In-Reply-To: <sashiko-outbox-170162@kernel.org> (sashiko-bot@kernel.org's
	message of "Tue, 13 Oct 2026 16:49:52 +0000")
References: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
	<20261013-winbond-master-spi-nor-w35t-v3-9-6dde1d513df8@bootlin.com>
	<sashiko-outbox-170162@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 14 Oct 2026 11:09:01 +0200
Message-ID: <874ieozm1e.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_020909_001264_55C89854 
X-CRM114-Status: GOOD (  12.56  )
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

Cj4+IEBAIC0zMTAwLDYgKzMxMTgsMTAgQEAgc3RhdGljIGludCBzcGlfbm9yX2luaXQoc3RydWN0
IHNwaV9ub3IgKm5vcikKPj4gIAlzdHJ1Y3Qgc3BpX25vcl9mbGFzaF9wYXJhbWV0ZXIgKnBhcmFt
cyA9IG5vci0+cGFyYW1zOwo+PiAgCWludCBlcnI7Cj4+ICAKPj4gKwllcnIgPSBzcGlfbm9yX3Nl
dF9kdW1teShub3IpOwo+PiArCWlmIChlcnIpCj4+ICsJCXJldHVybiBlcnI7Cj4+ICsKPj4gIAll
cnIgPSBzcGlfbm9yX3NldF9vY3RhbF9kdHIobm9yLCB0cnVlKTsKPj4gIAlpZiAoZXJyKSB7Cj4+
ICAJCWRldl9kYmcobm9yLT5kZXYsICJvY3RhbCBtb2RlIG5vdCBzdXBwb3J0ZWRcbiIpOwo+PiAg
CQlyZXR1cm4gZXJyOwo+PiAgCX0KPgo+IFtTZXZlcml0eTogSGlnaF0KPiBJZiBzcGlfbm9yX3Nl
dF9vY3RhbF9kdHIoKSByZXR1cm5zIGFuIGVycm9yLCBkb2VzIHRoaXMgbGVhdmUgdGhlIGZsYXNo
IGNoaXAKPiBpbiBhIG5vbi1kZWZhdWx0IGhhcmR3YXJlIHN0YXRlPwo+Cj4gSXQgYXBwZWFycyB0
aGF0IGlmIGVudGVyaW5nIG9jdGFsIG1vZGUgZmFpbHMsIHRoZSBmdW5jdGlvbiByZXR1cm5zIGlt
bWVkaWF0ZWx5Cj4gd2l0aG91dCB1bmRvaW5nIHRoZSBqdXN0LWFwcGxpZWQgc3BpX25vcl9zZXRf
ZHVtbXkoKSBjb25maWd1cmF0aW9uLgo+Cj4gU2ltaWxhcmx5LCBpZiBhIG1lbW9yeSBhbGxvY2F0
aW9uIGZhaWxzIGxhdGVyIGR1cmluZyBkcml2ZXIgcHJvYmUgYWZ0ZXIKPiBzcGlfbm9yX3NjYW4o
KSBoYXMgc3VjY2Vzc2Z1bGx5IG11dGF0ZWQgdGhlIGZsYXNoIHN0YXRlOgo+Cj4gZHJpdmVycy9t
dGQvc3BpLW5vci9jb3JlLmM6c3BpX25vcl9wcm9iZSgpIHsKPiAgICAgLi4uCj4gCWVyciA9IHNw
aV9ub3Jfc2Nhbihub3IsIG5hbWUsICZod2NhcHMpOwo+IAlpZiAoZXJyKQo+IAkJcmV0dXJuIGVy
cjsKPgo+IAlpZiAobm9yLT5ib3VuY2VidWZfc2l6ZSkgewo+IAkJbm9yLT5ib3VuY2VidWYgPSBk
ZXZtX2ttYWxsb2MoZGV2LCBub3ItPmJvdW5jZWJ1Zl9zaXplLAo+IAkJCQkJICAgICAgR0ZQX0tF
Uk5FTCk7Cj4gCQlpZiAoIW5vci0+Ym91bmNlYnVmKQo+IAkJCXJldHVybiAtRU5PTUVNOwo+ICAg
ICAuLi4KPiB9Cj4KPiBEb2VzIHRoZSBkcml2ZXIgcmV0dXJuIGhlcmUgd2l0aG91dCBjYWxsaW5n
IHNwaV9ub3JfcmVzdG9yZSgpIHRvIHVuZG8gdGhlCj4gZHVtbXkgY3ljbGVzIGNvbmZpZ3VyYXRp
b24/Cj4KPiBJZiB0aGUgZmxhc2ggY2hpcCBpcyBsZWZ0IGV4cGVjdGluZyB0aGUgbmV3bHkgY29u
ZmlndXJlZCBkdW1teSBjeWNsZXMsCj4gcmVhZHMgdXNpbmcgZGVmYXVsdCBTUEkgcGFyYW1ldGVy
cyAoZS5nLiwgc3RhbmRhcmQgZHVtbXkgY3ljbGVzKSBkdXJpbmcgYSB3YXJtCj4gcmVib290IG1p
Z2h0IHJldHVybiBnYXJiYWdlLCBwb3RlbnRpYWxseSBoYW5naW5nIHRoZSBib290IHByb2Nlc3Mu
CgpUaGVyZSBpcyBubyAiZGVmYXVsdCIgaGFyZHdhcmUgc3RhdGUgcmVnYXJkaW5nIGR1bW15IGN5
Y2xlcy4gVGhpcyBpcyBhCnN0YXRlIHRoYXQgbXVzdCBiZSBuZWdvY2lhdGVkIGF0IGV2ZXJ5ICJi
b290IiAod2hlbiByZWxldmFudCksIHdhcm0gb3IKbm90LCBzbyB0aGVyZSBpcyBubyBicmVha2Fn
ZSBoZXJlIHNpbmNlIG5leHQgd2FybSBib290IHRoZSBzYW1lIGRhbmNlCndpbGwgaGFwcGVuIGFn
YWluIGZyb20gc2NyYXRjaC4gSW4gY2FzZSBvY3RhbCBpcyBub3QgcmVhY2hhYmxlIHdlCmFscmVh
ZHkgcmVjYWxjdWxhdGUgdGhlIGR1bW15IGN5Y2xlcyBmb3IgdGhlIFNTRFIgY2FzZSB3aGVuIHJl
bGV2YW50LgoKU286IHdvbid0IGZpeCBlaXRoZXIuCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
