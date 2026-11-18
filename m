Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1DA606A320
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 10:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gFSU3Ae/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lUdLy0q7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mycJJU+xUTnqdBCvXqiutUhhsndtroVaX+DmOdgcwAg=; b=gFSU3Ae/yiqgx1fvCltujeF7bW
	13TPs/Gv6aKqHlplgo+raGQazcYIcg40ESpQTO+6QrzFoKi8cTGdUQwWS8FRsvwjznA3G29R6ePjj
	qMfFUeePTacnOLAORa3T7M/GedeiqboIP7dx1ZDDvFU8F03tfOMe05wbop3/OyJIblSLxZ1zqhKh+
	Sgisp5nbl/8Bv3C+oSpyEfQJsbhJ7lfeismhB3YePJEyEaupGzQ1B9hdwAR0iqmaMXM57rA8jnGIV
	ZkRfiaOOQ8qLwRsOoy1lL+sBhdpOzIZDsZagXL0PSIA8RNfkqZ6n4AONvicbdK9L+3EbXcIPJS1Gl
	1Rs7FlfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcth-00000008YXB-3btK;
	Wed, 18 Nov 2026 10:28:13 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTctf-00000008YWl-0fmi
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 10:28:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2ECAEC4CBDE;
	Wed, 18 Nov 2026 10:28:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6518A5FE9B;
	Wed, 18 Nov 2026 10:28:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35BCB11BC1054;
	Wed, 18 Nov 2026 11:28:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794997687; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WTHIX/qp7Jnj/BOwjhzLa4IXBs5/UwCDK2s4rST4pQ0=;
	b=lUdLy0q760khVWphycTcUyg1TKxCuX9tmHvM5Ud/Ge5zxTbQhLmGU/9k2FkIASoMZGVUaD
	Oy8pipx7y4fzRgJrFkUJzM3DCOG262OLY6HFCyJ2yin8lTFh5WZDFRXZhrQQftRCwC8Rwq
	oq11crIuIvReO9ExB+svND9b/fECKZXShvgZVTAvPzQyA9a5Y8MoV878lmoR39siZBZoRc
	fEV1nik2bxHGa4O5yu6YlHKTyiMlHTxxgXM6mHSheDk0yX7v1lhoCpOonpiEMiakRe6d0b
	Q+meiYVgU6FJh2iQ+cP31G+mw33IIZGJvUXct3ju/qPMaNzLv51O6UgQ8PgxTg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Boris Brezillon <bbrezillon@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: propagate timing-mode recovery failures
In-Reply-To: <20261103-submit-rawnand-timing-recovery-v1-v1-1-1cc33723e052@gmail.com>
	(James Hilliard's message of "Tue, 03 Nov 2026 23:13:18 -0700")
References: <20261103-submit-rawnand-timing-recovery-v1-v1-1-1cc33723e052@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 11:28:05 +0100
Message-ID: <874idejux6.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_022811_401022_759ED171 
X-CRM114-Status: GOOD (  12.18  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMDMvMTEvMjAyNiBhdCAyMzoxMzoxOCAtMDcsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tPiB3cm90ZToKCj4gV2hlbiBHRVRfRkVBVFVSRVMgc3VjY2VlZHMgYnV0
IHRoZSBjaGlwIGRvZXMgbm90IGFja25vd2xlZGdlIHRoZSByZXF1ZXN0ZWQKPiB0aW1pbmcgbW9k
ZSwgbmFuZF9zZXR1cF9pbnRlcmZhY2UoKSBmYWxscyBiYWNrIHRvIG1vZGUgMC4gQm90aCB0aGUK
PiBjb250cm9sbGVyLWludGVyZmFjZSByZXNldCBhbmQgdGhlIE5BTkQgUkVTRVQgY29tbWFuZCBj
YW4gZmFpbCwgYnV0IHRoZWlyCj4gcmV0dXJuIHZhbHVlcyBhcmUgZGlzY2FyZGVkLiBUaGUgZnVu
Y3Rpb24gdGhlbiByZXR1cm5zIHRoZSBzdWNjZXNzZnVsCj4gR0VUX0ZFQVRVUkVTIHN0YXR1cyBl
dmVuIHRob3VnaCB0aGUgZmFsbGJhY2sgZGlkIG5vdCBjb21wbGV0ZS4KPgo+IENoZWNrIHRoZSBj
b250cm9sbGVyIHJlc2V0IGJlZm9yZSBpc3N1aW5nIFJFU0VUIGFuZCBwcm9wYWdhdGUgZWl0aGVy
Cj4gcmVjb3ZlcnkgZXJyb3Igd2hlbiB0aGVyZSB3YXMgbm8gZWFybGllciBlcnJvci4gUHJlc2Vy
dmUgYW4gZWFybGllcgo+IEdFVF9GRUFUVVJFUyBmYWlsdXJlIGFuZCBrZWVwIHJldHVybmluZyBz
dWNjZXNzIHdoZW4gYSB0aW1pbmcgbWlzbWF0Y2gKPiBpcyByZWNvdmVyZWQgYnkgYSBzdWNjZXNz
ZnVsIG1vZGUtMCBmYWxsYmFjay4KCllvdSBhcmUgY2FycnlpbmcgYSByZXR1cm4gdmFsdWUgaW4g
YW4gZXJyb3IgcGF0aCBvZiBhbiBlcnJvciBwYXRoLiBJZgp0aGUgcmVzZXQgYWN0dWFsbHkgZmFp
bHMsIHRoZSB2ZXJ5IG5leHQgYXR0ZW1wdCB3aWxsIGZhaWwgYW5kIHByb2JlIHdpbGwKYmUgYWJv
cnRlZCBhbnl3YXkuIFNvIHdoaWxlIHRoZSBmaXggaXMgbm90IGluaGVyZW50bHkgd3JvbmcsIHRo
ZSB0aXRsZQphbmQgY29tbWl0IGxvZyBvdmVyc3RhdGUgdGhlIHByb2JsZW0uCgpNeSBwcm9wb3Nh
bDoKCm10ZDogcmF3bmFuZDogcHJvcGFnYXRlIG1vZGUtMCBmYWxsYmFjayBmYWlsdXJlcwoKV2hl
biBhIGNoaXAgZG9lcyBub3QgYWNrbm93bGVkZ2UgdGhlIHJlcXVlc3RlZCB0aW1pbmcgbW9kZSwK
bmFuZF9zZXR1cF9pbnRlcmZhY2UoKSBmYWxscyBiYWNrIHRvIG1vZGUgMCBieSByZXNldHRpbmcg
dGhlIGNvbnRyb2xsZXIKaW50ZXJmYWNlIGFuZCBpc3N1aW5nIGEgTkFORCBSRVNFVC4gRWl0aGVy
IHN0ZXAgY2FuIGZhaWw7IHJldHVybmluZwpzdWNjZXNzIHdpbGwgbGlrZWx5IGxlYWQgdG8gYW55
IGxhdGVyIGF0dGVtcHQgYXQgdGFsa2luZyB0byB0aGUgY2hpcCB0bwpmYWlsLgoKTWFrZSBzdXJl
IHRoZSBlcnJvciBwYXRoIHByb3BhZ2F0ZXMgdGhvc2UgZmFpbHVyZXMgaW4gdGhlIG1vZGUtMApm
YWxsYmFjayBjYXNlLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
