Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C211C43458
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 14:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFfOfhTG9Uwj+vh7scm/l9On+W/7/ANXCYEtRF7O99M=; b=jCkRPvendPV7wM
	KJO/Rty7TYOkLchTJS8dwvRkMJmBPZ+Mw6hl2cZqpZj9VPXv6zPoLaqtmi/0G54a9IMh9b7z9Qtln
	M24C2eo6hSqukoCgrH0SzV9hu+OX0xn4LdQi/uqIVZhg0c2YZq4120Lw5Ms1iM6F+PVULf3TBH7VH
	eZVKOFrgX52iEijF4+FDIG1SodvNbOFIr8XgqdZFVOCa2ZhoVvOhTX4JT8VpATHRpqtSijMOEiRMT
	H/utfNdshKSUMT+o5CKUnIc+fAAA0scWkApD7qKiL/l6hWMZ1NYTB7ks2g+T9Lc+Cj4Tn2CcCjreg
	zp0p0+S7CK+7xRdsbSnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgk0k-0000000CguU-1MKx;
	Mon, 06 Jul 2026 14:09:26 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgk0i-0000000CgtS-024w
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 14:09:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E67BFC8EC79;
	Mon,  6 Jul 2026 14:09:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CCD03601A2;
	Mon,  6 Jul 2026 14:09:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6C29D11BBA405;
	Mon,  6 Jul 2026 16:09:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783346959; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=q18cFpOTGqCaz9ynq10iN9aMsadVtoOzS+aRl3AJ/Jw=;
	b=AQOQMyRms/9CEJOy5i56vZ5Ut/DSKJkRecbiHR7A8VBU9uWlQTTi1uhgDdLna1JEB36vqI
	hlrHK36WiFggRX7DGCni26gq//r0WABmsRVDWCFGuT4G1RR22HNiK/Iyd/e5EZlltoIrz2
	N33Cu4TYvGIv9WgFJu4H2PVVc61nvY4oCD+qaQx/UK3PrFn0wAQzXMjX4tecuXW7pSJPBT
	xsgb8TofmAmPwcp04lHbds7X326LWdKz2aGDDarXHWb+dne3isF/U5gSHJ9P9tJFEnOEY1
	FV6pLvOF6Y9IhNyRxnoq4Xsj5+KwncSivqvmiDGmBg2TwfPQxDO6tNg44JonSA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: realtek: add missing MODULE_DEVICE_TABLE()
In-Reply-To: <20260704123044.31740-1-pengpeng@iscas.ac.cn> (Pengpeng Hou's
	message of "Sat, 4 Jul 2026 20:30:44 +0800")
References: <20260704123044.31740-1-pengpeng@iscas.ac.cn>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 06 Jul 2026 16:09:15 +0200
Message-ID: <87tsqcky5w.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_070924_218666_DD4B5C84 
X-CRM114-Status: UNSURE (   9.08  )
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

SGkgUGVuZ3BlbmcsCgpPbiAwNC8wNy8yMDI2IGF0IDIwOjMwOjQ0ICswOCwgUGVuZ3BlbmcgSG91
IDxwZW5ncGVuZ0Bpc2Nhcy5hYy5jbj4gd3JvdGU6Cgo+IFRoZSBkcml2ZXIgaGFzIGFuIE9GIG1h
dGNoIHRhYmxlIHdpcmVkIHRvIC5vZl9tYXRjaF90YWJsZSwgYnV0IGRvZXMKPiBub3QgZXhwb3J0
IHRoZSB0YWJsZSB3aXRoIE1PRFVMRV9ERVZJQ0VfVEFCTEUoKS4KPgo+IEFkZCB0aGUgbWlzc2lu
ZyBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCAuLi4pIGVudHJ5IHNvIG1vZHVsZSBhbGlhcwo+IGlu
Zm9ybWF0aW9uIGlzIGdlbmVyYXRlZCBmb3IgT0YgYmFzZWQgbW9kdWxlIGF1dG9sb2FkaW5nLgo+
Cj4gVGhpcyBpcyBhIHNvdXJjZS1sZXZlbCBmaXguICBJdCBkb2VzIG5vdCBjbGFpbSBkeW5hbWlj
IGhhcmR3YXJlCj4gcmVwcm9kdWN0aW9uOyB0aGUgZXZpZGVuY2UgaXMgdGhlIGRyaXZlci1vd25l
ZCBtYXRjaCB0YWJsZSwgaXRzIHVzZSBieQo+IHRoZSBwbGF0Zm9ybSBkcml2ZXIsIGFuZCB0aGUg
bWlzc2luZyBtb2R1bGUgYWxpYXMgcHVibGljYXRpb24uCgpXaHkgZG8geW91IG5ldmVyIGFkZCBh
bnkgRml4ZXMgYW5kIENjIHN0YWJsZSB0YWdzPyBUaGlzIGlzIGEgYmVoYXZpb3VyYWwKZml4LCB3
aGljaCBwcm9iYWJseSBkZXNlcnZlcyB0byBiZSBiYWNrcG9ydGVkLiBJdCBpcyB0aGUgdGhpcmQg
b3IgZXZlbgptYXliZSBmb3VydGggdGltZSB0aGF0IEkgaGF2ZSB0byBhc2sgZm9yIHRob3NlIHRh
Z3Mgd2l0aGluIDIKd2Vla3MuIFBsZWFzZSBjb25zaWRlciBhZGRpbmcgdGhlbSBwcm9hY3RpdmVs
eSB3aGVuIHJlbGV2YW50LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
