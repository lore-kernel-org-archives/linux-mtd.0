Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E78C4451B
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 15:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aaeT6GT6myIXYWRiju1WgXAhIcDxIRt1hkgea9oJrjk=; b=Dk+8F+uW2InDgc
	Sn62LK/+HlQs17G5wG2PW9vGShnb/WWDu0sDqhPekV7Cqz5Lde50s9ZeCY/f9q7H274Id6BIa5J9C
	wLUxEw0lSVoPZ96ZKRkCezNhiIQsvWDaGPsqcFr7JH/OiZ/0dlPcHBHFD01wP7lH6kt3Y0oo4+IpI
	VOnqilAeC7dkkFoxbw0ct4wZ+ZZyHhIHBT1yKC6aNMxzwID1a8XTvH94Tw6qvRyI8A2/V4W9b4otO
	1SK3t/QJouR4QUcJu95yTRx49I3/M8kJ8sUaFzaGPYZff6DP8YkyUVi/94H1Ctualzyeap+gCMYJi
	ktYRTe6PaInSAoIrqHQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkpw-00000002fGk-20gK;
	Fri, 17 Jul 2026 15:50:52 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkpt-00000002fBV-2YNK
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 15:50:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 264231A106B;
	Fri, 17 Jul 2026 15:50:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDD5060361;
	Fri, 17 Jul 2026 15:50:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23ADA11BD0B40;
	Fri, 17 Jul 2026 17:50:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784303447; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RlpOR2hQnjsKRnEmWR65VlWNVy2hx4ffoGcWJTmsnjg=;
	b=onnw7U403jrPUo24OjG95EFKfHyLNVy/reRKnJyuXJIQx6Nj9QWRERIuEzFt5urzyGAsv5
	BdhuzedMKbJ3+fHqyEqAEWy0kYCHrS0QjsQP7C6OCYvFaWUDrqT9lkv2Z+nncFQ/wjBHko
	Lf6TafpM6jRpW0cGd96LRMXirpaSKI0VcqH43YmmBtmO3N703iShRtmrbkES8EYN5A2mO9
	2blTb0OOUcOyz2DYCEbea4LWoQabcgYr8QuHKhXO65h48GwvGL3YM6NKg7FAA4htfU1bYG
	GjNyPCdlZKHJ08FmbriiSSDY659ZTXedTJJ3RdPlO1P1KPNA86OBbb1CeH8OVw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
In-Reply-To: <20260713231722.1095470-1-rosenp@gmail.com>
References: <20260713231722.1095470-1-rosenp@gmail.com>
Subject: Re: [PATCH] mtd: mpc5121_nfc: use platform for irq and ioremap
Message-Id: <178430344591.4129650.4707095787373481148.b4-ty@bootlin.com>
Date: Fri, 17 Jul 2026 17:50:45 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_085049_814423_0C8603AA 
X-CRM114-Status: UNSURE (   7.04  )
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

T24gTW9uLCAxMyBKdWwgMjAyNiAxNjoxNzoyMiAtMDcwMCwgUm9zZW4gUGVuZXYgd3JvdGU6Cj4g
UmVwbGFjZSB0aGUgb3Blbi1jb2RlZCBvZl9hZGRyZXNzX3RvX3Jlc291cmNlKCkgcGx1cyBkZXZt
X3JlcXVlc3RfbWVtX3JlZ2lvbigpCj4gYW5kIGRldm1faW9yZW1hcCgpIHNlcXVlbmNlIHdpdGgg
YSBzaW5nbGUgZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKCkKPiBjYWxsLCB3aGljaCBm
b2xkcyB0aGUgcmVzb3VyY2UgbG9va3VwLCByZWdpb24gcmVzZXJ2YXRpb24gYW5kIG1hcHBpbmcg
aW50bwo+IG9uZSBzdGVwIGFuZCByZXR1cm5zIGFuIEVSUl9QVFIgb24gZmFpbHVyZSwgY2hlY2tl
ZCB3aXRoIElTX0VSUigpIGFuZAo+IHByb3BhZ2F0ZWQgdmlhIFBUUl9FUlIoKS4KPiAKPiBTd2l0
Y2ggSVJRIGFjcXVpc2l0aW9uIGZyb20gaXJxX29mX3BhcnNlX2FuZF9tYXAoKSB0byBwbGF0Zm9y
bV9nZXRfaXJxKCksCj4gd2hpY2ggb25seSByZXRyaWV2ZXMgdGhlIGludGVycnVwdCB0aGUgT0Yv
cGxhdGZvcm0gY29yZSBoYXMgYWxyZWFkeSBzZXQgdXAKPiByYXRoZXIgdGhhbiB0cmFuc2ZlcnJp
bmcgbWFwcGluZyBvd25lcnNoaXAgdG8gdGhlIGRyaXZlci4gRHJvcCB0aGUgbm93Cj4gdW5uZWVk
ZWQgb2ZfaXJxLmggaW5jbHVkZS4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvbmV4dCwgdGhh
bmtzIQoKWzEvMV0gbXRkOiBtcGM1MTIxX25mYzogdXNlIHBsYXRmb3JtIGZvciBpcnEgYW5kIGlv
cmVtYXAKICAgICAgY29tbWl0OiAzNTVlZmEzNjBiYTNiOWVkMjQyZjQ0NGM2OWZiYWZhODRhMjlh
NTI1CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3
aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxh
aW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
