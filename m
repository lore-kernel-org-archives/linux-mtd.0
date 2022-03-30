Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78ABAC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Mar 2022 07:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ejq0eCiiiDOS2lAcSqtLnFLIVb318KgAVdj3yWLnccg=; b=xQvePVwcthOkZF
	Wedd5crJEkPWgwKD0MjFnEBJMEq5//8nDWzSzTwEnS4cWmsI0s3zRwK/GyeWIb+8sSAQzltEWauY+
	tV4+2h1Df+hkov+UE89X0jsdXefneczcgRbt/dr+t4oBt7AqiaqkLWXolOIW4JCjEXGGAwkfgldzP
	RcZSYN1nAhqFJXvJMp2o4zPUtJm/dFp+4WRYCnrOlFgU2V4CNhyXXvIymctWaN1GBdk/8axz13eDd
	uZ+TxdlMtfqz74r/Zt6fjoteYMIPrfqHSjpyyKq9YeIF9Vrve/43YgE43eoOZyCl3VUxd8SApBsWv
	s1Lgew7OFWYTtRwzpY1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZSqg-00Ec3B-Mn; Wed, 30 Mar 2022 07:34:34 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZSqZ-00EbzV-CO
 for linux-mtd@lists.infradead.org; Wed, 30 Mar 2022 07:34:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6F62F40005;
 Wed, 30 Mar 2022 07:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1648625663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xPfgkZOladdR15a2MCEBT2OjHxKiQBCr7V4GEPMOqvk=;
 b=U8eQk5w0WGhtwLRrHpCp6JCQUXsSbioy5hz+rAXIEeHtF0TA6YOOBeHZmp9QGww1Hy9dkP
 7me1P2rZjd2pPSPTsAVdkITS0xHSgYmJRDnpPFHeQ2m3/UycwmDWBanRJpUboTz/mCGNvh
 8BLdR2T0nQtDzLZmm0+FJdRlFZPs/aRJwSURDKM/CEn7fbiTEJEN39X/jn63hYU8LUZEk8
 65TkfTkog5/rVgERANVqI2KWw4AyejfouMUb0uJ2pnNimGg2Ljs8jcUfd25WQvtY58dQvk
 wrJIqkbuplWEKpatpSeEctHp0H0g9154m6c0hCDqamHWG+6HwxDUdqtdr9jfZw==
Date: Wed, 30 Mar 2022 09:34:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jean-Marc Eurin <jmeurin@google.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Create a proper header for the saved mtdoops.
Message-ID: <20220330093421.35de104d@xps13>
In-Reply-To: <20220329225328.396209-1-jmeurin@google.com>
References: <20220329225328.396209-1-jmeurin@google.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_003427_829027_F6457759 
X-CRM114-Status: GOOD (  11.33  )
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

SGkgSmVhbi1NYXJjLAoKam1ldXJpbkBnb29nbGUuY29tIHdyb3RlIG9uIFR1ZSwgMjkgTWFyIDIw
MjIgMTU6NTM6MjggLTA3MDA6Cgo+IEF2b2lkIGEgcGFuaWMgaWYgdGhlIGhlYWRlciBzaXplIGNo
YW5nZXMuCj4gQWRkIGEgdGltZXN0YW1wIHRvIHRoZSBvb3BzIGhlYWRlci4KPiAKPiBUZXN0ZWQ6
Cj4gVHJpZ2dlcmVkIHBhbmljIHNhdmVkIGNvcnJlY3RseToKPiB4eGQgLWwgMHgyMCAtcyAweDAw
MDAgL2Rldi9tdGRibG9jazEKPiAwMDAwMDAwMDogMDEwMCAwMDAwIDAwNWUgMDA1ZCA5MzVkIDQx
MTcgYzViZiBkZjE2ICAuLi4uLl4uXS5dQS4uLi4uCj4gMDAwMDAwMTA6IDNjMzYgM2U1YiAyMDIw
IDMxMzMgMzkyZSAzOTM4IDMwMzkgMzUzMyAgPDY+WyAgMTM5Ljk4MDk1MwoKWW91ciBwcmV2aW91
cyBwYXRjaHNldCB3YXMgbm90IGFwcGxpZWQgYmVjYXVzZSBJIHJlcXVlc3RlZCBzZXZlcmFsCmNo
YW5nZXMsIHlldCB5b3Ugc2VlbSBub3QgdG8gaGF2ZSB0YWtlbiB0aGVtIGludG8gYWNjb3VudC4g
Rm9yIHRoZQpyZWNvcmQ6CgoJQ2FuIHlvdSBwbGVhc2Ugc2VuZCBhIHYyIHdpdGg6CgktIFlvdXIg
dHdvIHBhdGNoZXMgaW4gdGhlIHNhbWUgc2VyaWVzIChmb3JtYXR0ZWQgd2l0aAoJICBnaXQtZm9y
bWF0LXBhdGNoIHRvIGdldCB0aGUgZGVwZW5kZW5jeS9vcmRlciByaWdodCkKCS0gSW4gdGhlIG90
aGVyIGNvbW1pdCwgZHJvcCB0aGUgcmVmZXJlbmNlIHBvaW50aW5nIHRvIChJCgkgIGJlbGlldmUp
IGEgY29tbWl0IGhhc2ggdGhhdCBpcyBsb2NhbCB0byB5b3VyIHRyZWUgb25seS4KCS0gVXNlIHRo
ZSByaWdodCBwcmVmaXggKCJtdGQ6IG10ZG9vcHM6IikuCgpJZiB5b3UgYXJlIGZpeGluZyBzb21l
dGhpbmcgZGlmZmVyZW50IHRoZW4gY3JlYXRlIGFub3RoZXIgcGF0Y2ggaW4gdGhpcwpzZXJpZXMs
IGJ1dCBwbGVhc2Uga2VlcCB5b3UgY2hhbmdlcyBhdG9taWMgYW5kIHdlbGwgc2VwYXJhdGVkLCBp
bmNsdWRlCmEgY2hhbmdlbG9nIGFuZCB1c2UgcHJvcGVyIHN1YmplY3QgcHJlZml4ZXMuCgpUaGFu
a3MsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
