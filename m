Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04697C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jan 2022 11:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R7hU9LzvfPLd5TJNiCJisAnfpjTxzjBZ7fvydah9HiQ=; b=mzijRA+fNBiyeJ
	5yuMGG1oriBDx2G0vdimSC0DIfpUnJPfZTmaPg7OdAuBopHVMSCPEyYg4KTqEmYCaCuNjhsVzGP03
	keOTjXSPTamuyilCUoM2F6LrF/D7D9Pxvzt0PqD4wRaGCs2yyRYoTyHgVWJkgP2XRFvg69nZ5Clrk
	3Z0wAShC+6xpBUqLLLXCFiskcqAQENt1NIhCTFc7Zq2NPnoOWZKRPav8AfFpZu96wsHQxxj6gcnqS
	S8wZsaTLN781MIeieJS4stYk3XSmnYQJdv9WCltRKwR8FSE9vRf3VxVNbd5pn3tFNk5GOIGkqYOfQ
	hgnrM1WlhHsYho9u8eCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Q3k-00EdZx-5Q; Mon, 17 Jan 2022 11:20:24 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Q25-00EcxS-6Q
 for linux-mtd@lists.infradead.org; Mon, 17 Jan 2022 11:18:43 +0000
Received: by mail-ed1-x52b.google.com with SMTP id k15so63984273edk.13
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jan 2022 03:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1U+MO7BClWc4cGfvNBl6cQXhNHZ2EpawrE7wpyjmSlU=;
 b=H68wnCWCkg20QgNO8XJpB6pf6OSiPm1Nv2FITEANqlmGTdw2efMMfOEbbWmNs9ajC9
 46SEzeFfEUUG1Q/9PaOAZouyJ8WfFBMtiGHqKWTh4ATWtEAnoAmpTTA7L0zQqcpY85gy
 RCaHaQrgR8L7gGP6hTcWXy4Wk0mTaW2Y4VInA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1U+MO7BClWc4cGfvNBl6cQXhNHZ2EpawrE7wpyjmSlU=;
 b=rlfWeTHyrY5KW/b9vqWAT5mYqe1mOlsS01BvF6jnJsCygOzIgYaSq9p6mH1pk0ln0S
 QoySBg3yGPiZHhZKV/4iwMXxHQG/d70DIvIUzko/5L0Xk9K1eat4iW+A+lfA/o9a56AN
 v2DgiIIdOJtVB7qa7WyB0/2YlzqSu5QzJWWkeuJVPu3vUbIA8GYXbaIpO88ZzU0zBDdy
 i25GN25Vj4LS60ChjiL8NKLjf4QhkIpUJMztliEWXwWTaSL+Zr8Bbq4uUqJkDai2d083
 cK26P+CY2imbl2eLyEzKGpi9A2Uuqby3yPfT+QFOBHeQuPoPDwMo4PaG2+3eRpZRa/oJ
 uoEg==
X-Gm-Message-State: AOAM533AcP6FYPlvaXUFCdRNfy/6qaga9DkAb+1DeslmAMIBIjqQIPj8
 usACkJdGko6ZJpAXDeBSP+nbwA==
X-Google-Smtp-Source: ABdhPJwYitGMTeD2cK5kj6+zGxi4gy5j3Ikqrx28OOGxKCPjSf2TZwLzdfYgk1MnXae2y9supUWsRQ==
X-Received: by 2002:a17:906:8cf:: with SMTP id
 o15mr15146840eje.603.1642418320033; 
 Mon, 17 Jan 2022 03:18:40 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-52-8-210.retail.telecomitalia.it. [82.52.8.210])
 by smtp.gmail.com with ESMTPSA id f11sm5142713edv.67.2022.01.17.03.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 03:18:39 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: [RFC PATCH v2 5/5] mtd: rawnand: gpmi: support fast edo timings for
 mx28
Date: Mon, 17 Jan 2022 12:18:29 +0100
Message-Id: <20220117111829.1811997-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220117111829.1811997-1-dario.binacchi@amarulasolutions.com>
References: <20220117111829.1811997-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_031841_305897_3D68D4AC 
X-CRM114-Status: GOOD (  15.69  )
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

SW4gdGhlIGkuTVgyOCBtYW51YWwgKE1DSU1YMjhSTSwgUmV2LiAxLCAyMDEwKSB5b3UgY2FuIGZp
bmQgYW4gZXhhbXBsZQooMTUuMi40IEhpZ2gtU3BlZWQgTkFORCBUaW1pbmcpIG9mIGhvdyB0byBj
b25maWd1cmUgdGhlIEdQTUkgY29udHJvbGxlcgp0byBtYW5hZ2UgSGlnaC1TcGVlZCDigIvigItO
QU5EIGRldmljZXMsIHNvIGl0IHdhcyB3cm9uZyB0byBhc3N1bWUgdGhhdCBvbmx5CmkuTVg2IGNh
biBhY2hpZXZlIEVETyB0aW1pbmdzLgoKVGhpcyBwYXRjaCBoYXMgYmVlbiB0ZXN0ZWQgb24gYSAy
MDQ4LzY0IGJ5dGUgTkFORCAoTWljcm9uIE1UMjlGMkcwOEFCQUVBSDQpLgpLZXJuZWwgbXRkIHRl
c3RzOgogLSBtdGRfbmFuZGJpdGVycnMKIC0gbXRkX25hbmRlY2N0ZXN0CiAtIG10ZF9vb2J0ZXN0
CiAtIG10ZF9wYWdldGVzdAogLSBtdGRfcmVhZHRlc3QKIC0gbXRkX3NwZWVkdGVzdAogLSBtdGRf
c3RyZXNzdGVzdAogLSBtdGRfc3VicGFnZXRlc3QKIC0gbXRkX3RvcnR1cmV0ZXN0IFtjeWNsZXNf
Y291bnQgPSAxMDAwMDAwMF0KcnVuIHdpdGhvdXQgZXJyb3JzLgoKQmVmb3JlIHRoaXMgcGF0Y2gg
KG1vZGUgMCk6Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQplcmFzZWJsb2NrIHdyaXRlIHNw
ZWVkIGlzIDIwOTggS2lCL3MKZXJhc2VibG9jayByZWFkIHNwZWVkIGlzIDI2ODAgS2lCL3MKcGFn
ZSB3cml0ZSBzcGVlZCBpcyAxNjg5IEtpQi9zCnBhZ2UgcmVhZCBzcGVlZCBpcyAyNTIyIEtpQi9z
CjIgcGFnZSB3cml0ZSBzcGVlZCBpcyAxODk5IEtpQi9zCjIgcGFnZSByZWFkIHNwZWVkIGlzIDI1
NzkgS2lCL3MKZXJhc2Ugc3BlZWQgaXMgMTI4MDAwIEtpQi9zCjJ4IG11bHRpLWJsb2NrIGVyYXNl
IHNwZWVkIGlzIDczMTQyIEtpQi9zCjR4IG11bHRpLWJsb2NrIGVyYXNlIHNwZWVkIGlzIDIwNDgw
MCBLaUIvcwo4eCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZCBpcyAyNTYwMDAgS2lCL3MKMTZ4IG11
bHRpLWJsb2NrIGVyYXNlIHNwZWVkIGlzIDI1NjAwMCBLaUIvcwozMnggbXVsdGktYmxvY2sgZXJh
c2Ugc3BlZWQgaXMgMjU2MDAwIEtpQi9zCjY0eCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZCBpcyAy
NTYwMDAgS2lCL3MKCkFmdGVyIHRoaXMgcGF0Y2ggKG1vZGUgNSk6Ci0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KZXJhc2VibG9jayB3cml0ZSBzcGVlZCBpcyAzMzkwIEtpQi9zCmVyYXNlYmxvY2sg
cmVhZCBzcGVlZCBpcyA1Njg4IEtpQi9zCnBhZ2Ugd3JpdGUgc3BlZWQgaXMgMjY4MCBLaUIvcwpw
YWdlIHJlYWQgc3BlZWQgaXMgNDg3NiBLaUIvcwoyIHBhZ2Ugd3JpdGUgc3BlZWQgaXMgMjkwOSBL
aUIvcwoyIHBhZ2UgcmVhZCBzcGVlZCBpcyA1MjI0IEtpQi9zCmVyYXNlIHNwZWVkIGlzIDE3MDY2
NiBLaUIvcwoyeCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZCBpcyAyMDQ4MDAgS2lCL3MKNHggbXVs
dGktYmxvY2sgZXJhc2Ugc3BlZWQgaXMgMjU2MDAwIEtpQi9zCjh4IG11bHRpLWJsb2NrIGVyYXNl
IHNwZWVkIGlzIDI1NjAwMCBLaUIvcwoxNnggbXVsdGktYmxvY2sgZXJhc2Ugc3BlZWQgaXMgMjU2
MDAwIEtpQi9zCjMyeCBtdWx0aS1ibG9jayBlcmFzZSBzcGVlZCBpcyAyNTYwMDAgS2lCL3MKNjR4
IG11bHRpLWJsb2NrIGVyYXNlIHNwZWVkIGlzIDI1NjAwMCBLaUIvcwoKQ28tZGV2ZWxvcGVkLWJ5
OiBNaWNoYWVsIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4KU2lnbmVk
LW9mZi1ieTogTWljaGFlbCBUcmltYXJjaGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+
ClNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29s
dXRpb25zLmNvbT4KCi0tLQoKQ2hhbmdlcyBpbiB2MjoKLSBJbXByb3ZlIHRoZSBjb21taXQgbWVz
c2FnZS4KLSBNb3ZlIHRoZSBwYXRjaCB0byB0aGUgZW5kIG9mIHRoZSBzZXJpZXMuCgogZHJpdmVy
cy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5jIHwgNCArKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYwppbmRleCA3YWU3YTM3Nzc1YTMuLjdiOTE5MWE3MGVk
MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5j
CisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYwpAQCAtODA2
LDggKzgwNiw4IEBAIHN0YXRpYyBpbnQgZ3BtaV9zZXR1cF9pbnRlcmZhY2Uoc3RydWN0IG5hbmRf
Y2hpcCAqY2hpcCwgaW50IGNoaXBuciwKIAlpZiAoSVNfRVJSKHNkcikpCiAJCXJldHVybiBQVFJf
RVJSKHNkcik7CiAKLQkvKiBPbmx5IE1YNiBHUE1JIGNvbnRyb2xsZXIgY2FuIHJlYWNoIEVETyB0
aW1pbmdzICovCi0JaWYgKHNkci0+dFJDX21pbiA8PSAyNTAwMCAmJiAhR1BNSV9JU19NWDYodGhp
cykpCisJLyogT25seSBNWDI4L01YNiBHUE1JIGNvbnRyb2xsZXIgY2FuIHJlYWNoIEVETyB0aW1p
bmdzICovCisJaWYgKHNkci0+dFJDX21pbiA8PSAyNTAwMCAmJiAhR1BNSV9JU19NWDI4KHRoaXMp
ICYmICFHUE1JX0lTX01YNih0aGlzKSkKIAkJcmV0dXJuIC1FTk9UU1VQUDsKIAogCS8qIFN0b3Ag
aGVyZSBpZiB0aGlzIGNhbGwgd2FzIGp1c3QgYSBjaGVjayAqLwotLSAKMi4zMi4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
