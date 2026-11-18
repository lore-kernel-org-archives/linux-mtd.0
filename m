Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95C7606A32F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 08:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1obwvmOg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fCOn2VL0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OmO992BhNsPc/d030rr2N2j5WrbX45p9PtPtFuUcWtw=; b=1obwvmOgjVkojYEy0rUasxvQl9
	SbbXepvi2R2IBsbIe1mXqKRD6DADp5dg27OBdWbDmK8syiVUmMKUBWnpWgE9uHpIz4OmeXqNT3WTI
	zBQQhFYSUoFJGNQTnSx4jbfY5tYZxWSoLIwoGmrSniBNy/CdP5jTRanTGLdzWd5ed5p6ubYTZJjZJ
	W2nOqSHfqw2rfBbuim2MJIEQcKtWPouHsqoTCtmxoYJDzwNUJImOGUSjqLMPvymF/CRj0HP1/cnAN
	jRLAtk+0+HbXnh0UaDNW8Em8QxD5hJ9AtSuP4EtLv31pZ32EfBmon3Ih0hUqOBtdb+dJBSxio/4ht
	fGayjVCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbIY-00000008DL3-3FBc;
	Wed, 18 Nov 2026 08:45:46 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbIT-00000008DFA-2HLH
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 08:45:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ABB004E4160A;
	Wed, 18 Nov 2026 08:45:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 77ADB5FE9B;
	Wed, 18 Nov 2026 08:45:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0875711BC0AAD;
	Wed, 18 Nov 2026 09:45:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794991536; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=D8aW/fvdy/qLsQ/bXMIpI7RqiPKFGY+NzzzViUtgqks=;
	b=fCOn2VL04CAe4uc6dNNRn8T9M6+C0SFFRTRTKjqQLDTSj+zt2weyl6UhwTCQLP1CirhTF2
	dX3lt9nkzB8WhYESBI57iKo5mPcVtzzpc3mq0OiRrLloQIKYQLxyU5q05+VtVizsKNdIcZ
	IQzZnd67Apy7fEK9U8BedwPaDjATqsCn1levczvqWIoES8I2cgNmgHmjIgDN9UlesQkd2j
	kwRbwg3Uckfcck8xT0GZEF9HvXUkTdxfO6Vfgf3RaAVkAS+SrrIRdIgivr1LdEzfrQPVA0
	E+Y2pXka3EguqmDdPtE0jHibIzQADHDnVV0L5Jmprx24e/eRfwouGfD8XkPt0g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Gabor Juhos" <j4g8y7@gmail.com>,  "Richard Weinberger"
 <richard@nod.at>,  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Boris
 Brezillon" <boris.brezillon@collabora.com>,
  sashiko-reviews@lists.linux.dev,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spinand: set request type explicitly in
 spinand_{is,mark}bad() functions
In-Reply-To: <sashiko-outbox-219169@kernel.org> (sashiko-bot@kernel.org's
	message of "Tue, 17 Nov 2026 16:27:11 +0000")
References: <20261117-spinand-set-req-type-in-bbm-functions-v1-1-f46d5b3b8cf3@gmail.com>
	<sashiko-outbox-219169@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 09:45:32 +0100
Message-ID: <87wlqajzo3.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_004541_724653_27577F52 
X-CRM114-Status: GOOD (  15.87  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgR2Fib3IsCgpPbiAxNy8xMS8yMDI2IGF0IDE2OjI3OjExIEdNVCwgc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyB3cm90ZToKCj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlr
byBBSSByZXZpZXcgZm91bmQgbm8gbmV3IGlzc3Vlcwo+IGluIHRoaXMgcGF0Y2gsIGJ1dCBub3Rp
Y2VkIDEgcmVsYXRlZCBwcmUtZXhpc3RpbmcgaXNzdWUgaXQgZG9lcyBub3QKPiBpbnRyb2R1Y2U6
Cj4gLSBbQ3JpdGljYWxdIG10ZDogc3BpbmFuZDogMS1ieXRlIGJhZCBibG9jayBtYXJrZXIgb3Zl
cmxhcCBpbgo+ICAgb29ibGF5b3V0X2ZyZWUoKSBbMV0KPiAtLQo+Cj4gY29tbWl0IGNkMzEzNmEy
OGNhYTRjNjVkMzYwZjY2NDA4NWNiYjFlNjMwYWNiMGYKPiBBdXRob3I6IEdhYm9yIEp1aG9zIDxq
NGc4eTdAZ21haWwuY29tPgo+Cj4gbXRkOiBzcGluYW5kOiBzZXQgcmVxdWVzdCB0eXBlIGV4cGxp
Y2l0bHkgaW4gc3BpbmFuZF97aXMsbWFya31iYWQoKSBmdW5jdGlvbnMKPgo+IFRoaXMgY29tbWl0
IGV4cGxpY2l0bHkgc2V0cyByZXEudHlwZSB0byBOQU5EX1BBR0VfUkVBRCBpbiBzcGluYW5kX2lz
YmFkKCkKPiBhbmQgTkFORF9QQUdFX1dSSVRFIGluIHNwaW5hbmRfbWFya2JhZCgpLgo+Cj4gTGlu
azogaHR0cHM6Ly9zYXNoaWtvLmRldi8jL2xvZy8xOTIzODMKPgo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4+
IGluZGV4IDE4YmJhMDJmYmQzMWYuLjM1YmNiNGE4ODYxYjQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZl
cnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3Jl
LmMKPj4gQEAgLTExMDUsNiArMTEwNSw3IEBAIHN0YXRpYyBib29sIHNwaW5hbmRfaXNiYWQoc3Ry
dWN0IG5hbmRfZGV2aWNlICpuYW5kLCBjb25zdCBzdHJ1Y3QgbmFuZF9wb3MgKnBvcykKPj4gIAlz
dHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQgPSBuYW5kX3RvX3NwaW5hbmQobmFuZCk7Cj4+
ICAJdTggbWFya2VyWzJdID0geyB9Owo+PiAgCXN0cnVjdCBuYW5kX3BhZ2VfaW9fcmVxIHJlcSA9
IHsKPj4gKwkJLnR5cGUgPSBOQU5EX1BBR0VfUkVBRCwKPj4gIAkJLnBvcyA9ICpwb3MsCj4+ICAJ
CS5vb2JsZW4gPSBzaXplb2YobWFya2VyKSwKPj4gIAkJLm9vYm9mZnMgPSAwLAo+Cj4gW1NldmVy
aXR5OiBDcml0aWNhbF0KPiBUaGlzIHByb2JsZW0gd2Fzbid0IGludHJvZHVjZWQgYnkgdGhpcyBw
YXRjaCwgYnV0IGNhbiB0aGUgMi1ieXRlIG1hcmtlcltdCj4gcmVhZCBpbiBzcGluYW5kX2lzYmFk
KCkgWzFdIGNvbGxpZGUgd2l0aCBmcmVlIE9PQiBzcGFjZSBvbiBjaGlwcyB0aGF0Cj4gcmVzZXJ2
ZSBvbmx5IDEgYnl0ZSBmb3IgdGhlIGJhZCBibG9jayBtYXJrZXI/Cj4KPiBzcGluYW5kX2lzYmFk
KCkgdHJlYXRzIGEgYmxvY2sgYXMgYmFkIHdoZW5ldmVyIG1hcmtlclswXSAhPSAweGZmIHx8Cj4g
bWFya2VyWzFdICE9IDB4ZmYsIHJlYWRpbmcgT09CIG9mZnNldHMgMCBhbmQgMS4gIEhvd2V2ZXIs
IHNldmVyYWwgdmVuZG9yCj4gb29ibGF5b3V0X2ZyZWUoKSBjYWxsYmFja3MgZXhwb3NlIE9PQiBv
ZmZzZXQgMSBhcyBmcmVlIHNwYWNlOgo+Cj4gZHJpdmVycy9tdGQvbmFuZC9zcGkvZ2lnYWRldmlj
ZS5jOmdkNWZ4Z3E0eGFfb29ibGF5b3V0X2ZyZWUoKSB7CgpUaGUgYnVnIGlzIGluIHRoZSBnaWdh
ZGV2aWNlIGRyaXZlci4gSXQgd2FzIGFyYnRyYXJpbHkgZGVjaWRlZCB0byBrZWVwCnVzaW5nIDIg
Ynl0ZXMgQkJNIGxpa2UgaW4gdGhlIHJhdyBOQU5EIHdvcmxkLgoKWW91IG1heSBmaXggdGhpcyBk
cml2ZXIgaW4gYSBzZXBhcmF0ZSBwYXRjaCwgYnV0IHRoYXQgaXMgbm90IGEKcHJlcmVxdWlzaXRl
IGZvciBtZS4KCkhvd2V2ZXIsIHdoeSBpcyB0aGlzIG5vdCBzdGFibGUgbWF0ZXJpYWw/CgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
