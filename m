Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA03C5AD5A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 10:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7+F/9iOx8Nvx58O0obrRr00tG75gra7WmOrpP3+W4Vg=; b=jrjRQw3lXC9NMi
	TfVbaWz95yLOj0NfhT6mBSlf7+w6VJKx2FrfzSdxxL06x53JfYminSIOsxeTOAp1mVdqHsTBLEdTJ
	RxFuu3+JM4fecBZoV3af0/d6amJ2LRS9Ve41DMmisLxh4ypqhs0FOlHziwstEZODJb0i06u1JPPOB
	ASDKiVqwJGBMEaC5dxviY/8e/iz1YLeDT/PN/AyzTmHfdGlAOoJu70G1OzCmJd+v6doTMKIkD50m1
	MVtIom0bXDV5TRshcWeuErtYmSRcrLy+4zjX7rYB9h8WKxQ6z3vAPCVQ1vxddHnlGAtt9xl8N9kye
	0b6iVh9QjIwKC0izdUYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5n4-0000000Fpt2-40FU;
	Wed, 12 Aug 2026 10:02:30 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5n2-0000000Fprg-0IfB
	for linux-mtd@lists.infradead.org;
	Wed, 12 Aug 2026 10:02:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 294D81A15AC;
	Wed, 12 Aug 2026 10:02:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EADC86045E;
	Wed, 12 Aug 2026 10:02:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A96911C4CBBE;
	Wed, 12 Aug 2026 12:02:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786528941; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cNiBZHt9kBQLY9Pvle7ghRA8gmUmPsgLNZWvyn6d4Fs=;
	b=QXeQ/l3rqQbZPi2SFx690Mf7wrlgCIPYcIzVTdm3x3N+LR0BunqRKE5/PkPJn5ah3iZTSz
	dqOG8NFj3QbWExuVHA2nzkfO7+3lgsePMv+oUldVz6Coj/eeFerkg19VbYVbYvAQNj1MxP
	f5/jwsokmbtVEgABox4TNTWbVVJfQO7RgI4K7HspEFuC0ZIEh4q9JamTqkpfbWwsg3Q0Lp
	MnIpt/ypg+eN+otJRt5TgYjcxJvsvMa93PQCH3OFjuqjzKOBBowHoe+u0/MDZWZCPMX95F
	9A07l+e1mhP3RAKuB385fyN50g/1YvVoiruTKBiCf6RAC61GAxU8i1wLhN2wBA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: Unprepare legacy controllers upon RWW
 wait interruption
In-Reply-To: <e0d2710a-2a67-40e0-aacb-5d18742cea76@linaro.org> (Tudor
	Ambarus's message of "Wed, 12 Aug 2026 12:52:48 +0300")
References: <20260811-perso-rww-fixes-v1-1-5866a70e5d1c@bootlin.com>
	<e0d2710a-2a67-40e0-aacb-5d18742cea76@linaro.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 12 Aug 2026 12:02:17 +0200
Message-ID: <87o6f7mzbq.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_030228_253846_39C4BF37 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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

T24gMTIvMDgvMjAyNiBhdCAxMjo1Mjo0OCArMDMsIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFy
dXNAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IE9uIDgvMTEvMjYgNjo1NiBQTSwgTWlxdWVsIFJheW5h
bCB3cm90ZToKPj4gQWxsIHRoZSBwYXJhbGxlbCBsb2NraW5nIGhlbHBlcnMgKHNwaV9ub3JfcHJl
cF9hbmRfbG9jaygpLAo+PiBzcGlfbm9yX3ByZXBfYW5kX2xvY2tfcGUoKSBhbmQgc3BpX25vcl9w
cmVwX2FuZF9sb2NrX3JkKCkpIGNhbGwKPj4gc3BpX25vcl9wcmVwKCkgdGhlbiB3YWl0IHdpdGgg
YSBraWxsYWJsZSBzbGVlcC4gSWYgdGhlIHNsZWVwIGdldHMKPj4ga2lsbGVkLCB3ZSBsZWF2ZSB0
aGUgY29udHJvbGxlciBpbiBpdHMgcHJlcGFyZWQgc3RhdGUuCj4+IAo+PiBDYWxsIC0+dW5wcmVw
YXJlKCkgaW4gdGhlc2UgY2FzZXMuCj4KPgo+IFdlIGRvbid0IGV2ZW4gY2FyZSBhYm91dCBTUEkg
Tk9SIGNvbnRyb2xsZXJzLiBJIHN0b3BwZWQgYWRkaW5nL2FjY2VwdGluZwo+IG5ldyBzdXBwb3J0
IGZvciB0aGVtIGZldyB5ZWFycyBhZ28sIHNvIHRoYXQgd2UgZW5jb3VyYWdlIHBlb3BsZSB0byB1
cGRhdGUKPiB0aGUgZHJpdmVycyB0byB1c2UgU1BJIE1FTS4KClllYWgsIHRvdGFsbHkgYWdyZWVk
LgoKPiBUaGUgYWx0ZXJuYXRpdmUgaXMgdG8gZHJvcCBwcmVwIHVucHJlcCBlbnRpcmVseS4KClRo
YXQncyBpbmRlZWQgd2hhdCB3ZSBhaW0gZm9yLCBidXQgaW4gb3JkZXIgdG8gImZpeCIgdGhhdCBy
ZXBvcnQsIHRoZQpjdXJyZW50IHNvbHV0aW9uIGlzIHRvIGNhbGwgLT51bnByZXBhcmUoKS4gSG9w
ZWZ1bGx5IHdlIGNhbiByZW1vdmUgdGhlbQphdCBzb21lIHBvaW50LgoKPgo+IEFueXdheSwgYWxs
IGdvb2QsIHJlZ2FyZGxlc3MgdGhlIHBhdGggY2hvc2VuOgo+Cj4gQWNrZWQtYnk6IFR1ZG9yIEFt
YmFydXMgPHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZz4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
