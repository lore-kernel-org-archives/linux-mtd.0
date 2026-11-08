Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0B2606A31C
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 23:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SFJrUWrx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FsFmBTkU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OkAaGU0UYYnoNCYJ5WnCbPvXaha86PFY7bKqkRtnsfk=; b=SFJrUWrxN/kA6znK2WfOnVo0OD
	qxt4YMczOGcm9xcDvbcxIlqzaos+tQk+rTDXArlcMTlpluFi39wlhE9iaDx6A0JmTuSSVxgJeDgjR
	II3X/maMlKgt+lWWtw8JnCXENBo0QCkXmxdjdjoCy0rFztVahbNYiDh3vjT+F+mUTsuTmxI4aKQWb
	LiN/dTS/NUudkkhwi8yXSL7i6J1qcrW5Fl5CYq7ZF/wTE1hmZUie/EiisN2Nc6rDA6UdxlUtVSAu9
	FbGzBEO4KgAbgS44EjebF4Qm+SdSojs+MpPe1w9NFJD+nc5AK6rYqY2xXKuMSXXsnEMxBIaYQaGTx
	gPkF/dRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCXf-0000000GvmN-2nVa;
	Sun, 08 Nov 2026 23:43:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCXe-0000000GvmH-3Yxo
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 23:43:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 44C55400FC;
	Sun,  8 Nov 2026 23:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC64A1F0089F;
	Sun,  8 Nov 2026 23:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794181398;
	bh=1bhayKETY5gEXg2d2BXWGmDhvDq0PIDRsOqD5xzCRog=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FsFmBTkUrExPUndGkk3OyZdTcQ+pugVUllO/ptTfy7rt3JMg1bDJaeCYvBziE0p+J
	 jMkVTpW6wd4DTV3PXzj4ZZAU+2IeocxWwnFDiR35DGCMzC0ruSn0qf6FxlnOJrhLsW
	 HNNuD3QhBFlrd9NDEvJQDsdzAP5IskbOXLO9CD/ETR0buTNI4yq5smmWJoHZnjHwIf
	 MmEnMeP1UwaxfM/3tNF268GiXG8UQxi5DOQt+Dy0ueg0sTZGUtwOZ+kwTlz01RCayU
	 K/9sPNL9O34/0JMc+VqyNHzq4/LV2tVUnG8wMPWQhjTQZ172zaq5d1qclsx7Kq4sLv
	 /Acz8BzBk9/JQ==
Message-ID: <sashiko-outbox-204169@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: r852: preserve card changes during
 detection work
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Maxim
 Levitsky" <maximlevitsky@gmail.com>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20261108-submit-r852-card-detect-lock-v1-v2-1-e3251bc3680a@gmail.com>
References: <20261108-submit-r852-card-detect-lock-v1-v2-1-e3251bc3680a@gmail.com>
Date: Sun, 08 Nov 2026 23:43:17 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiByYXduYW5kOiBy
ODUyOiBpbmNvbnNpc3RlbnQgY2FyZCBzdGF0ZSBpbgogIHI4NTJfdXBkYXRlX21lZGlhX3N0YXR1
cygpCi0tCgpjb21taXQgMDQ3Yjk1NTVmZTg0M2FhMjJmYjA0ZGFiYmM0MDBjY2QyMTE3ZmQwYQpB
dXRob3I6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgoKbXRkOiBy
YXduYW5kOiByODUyOiBwcmVzZXJ2ZSBjYXJkIGNoYW5nZXMgZHVyaW5nIGRldGVjdGlvbiB3b3Jr
CgpUaGlzIGNvbW1pdCBzZXJpYWxpemVzIGNhcmQtZGV0ZWN0IGludGVycnVwdCBtYXNrIHVwZGF0
ZXMgdW5kZXIgaXJxbG9jawphbmQgc2FtcGxlcyBjYXJkIHByZXNlbmNlIG9uY2UgaW4gcjg1Ml9j
YXJkX2RldGVjdF93b3JrKCkgdG8gYXZvaWQgbG9zaW5nCmNvbmN1cnJlbnQgY2FyZCBzdGF0ZSB0
cmFuc2l0aW9ucy4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3I4NTIuYyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L3I4NTIuYwo+IGluZGV4IDkyYzQ3ZDM1MWMyNzguLjRjMDk0
NjQ4NjczYjQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcjg1Mi5jCj4gKysr
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcjg1Mi5jClsgLi4uIF0KPiBAQCAtNjg0LDIwICs3MDEs
MjAgQEAgc3RhdGljIHZvaWQgcjg1Ml9jYXJkX2RldGVjdF93b3JrKHN0cnVjdCB3b3JrX3N0cnVj
dCAqd29yaykKPiAgewo+ICAJc3RydWN0IHI4NTJfZGV2aWNlICpkZXYgPQo+ICAJCWNvbnRhaW5l
cl9vZih3b3JrLCBzdHJ1Y3Qgcjg1Ml9kZXZpY2UsIGNhcmRfZGV0ZWN0X3dvcmsud29yayk7Cj4g
Kwlib29sIHByZXNlbnQ7Cj4gIAo+IC0Jcjg1Ml9jYXJkX3VwZGF0ZV9wcmVzZW50KGRldik7Cj4g
KwlwcmVzZW50ID0gcjg1Ml9jYXJkX3VwZGF0ZV9wcmVzZW50KGRldik7Cj4gIAlyODUyX3VwZGF0
ZV9jYXJkX2RldGVjdChkZXYpOwo+IC0JZGV2LT5jYXJkX3Vuc3RhYmxlID0gMDsKPiAgCj4gIAkv
KiBGYWxzZSBhbGFybSAqLwo+IC0JaWYgKGRldi0+Y2FyZF9kZXRlY3RlZCA9PSBkZXYtPmNhcmRf
cmVnaXN0ZXJlZCkKPiArCWlmIChwcmVzZW50ID09IGRldi0+Y2FyZF9yZWdpc3RlcmVkKQo+ICAJ
CWdvdG8gZXhpdDsKPiAgCj4gIAkvKiBSZWFkIG1lZGlhIHByb3BlcnRpZXMgKi8KPiAgCXI4NTJf
dXBkYXRlX21lZGlhX3N0YXR1cyhkZXYpOwo+ICAKPiAgCS8qIFJlZ2lzdGVyIHRoZSBjYXJkICov
Cj4gLQlpZiAoZGV2LT5jYXJkX2RldGVjdGVkKQo+ICsJaWYgKHByZXNlbnQpCj4gIAkJcjg1Ml9y
ZWdpc3Rlcl9uYW5kX2RldmljZShkZXYpOwo+ICAJZWxzZQo+ICAJCXI4NTJfdW5yZWdpc3Rlcl9u
YW5kX2RldmljZShkZXYpOwoKW1NldmVyaXR5OiBNZWRpdW1dCkNhbiByODUyX3VwZGF0ZV9tZWRp
YV9zdGF0dXMoKSBvYnNlcnZlIGEgZGlmZmVyZW50IGNhcmQgc3RhdGUgdGhhbgpyODUyX2NhcmRf
ZGV0ZWN0X3dvcmsoKSB3aGVuIGFuIGludGVycnVwdCBmaXJlcyBhZnRlcgpyODUyX3VwZGF0ZV9j
YXJkX2RldGVjdCgpIHVubWFza3MgY2FyZCBpbnRlcnJ1cHRzPwoKa3dvcmtlciAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgPGhhcmRpcnE+CnI4NTJfY2FyZF9kZXRlY3Rfd29yaygp
CiAgcHJlc2VudCA9IHI4NTJfY2FyZF91cGRhdGVfcHJlc2VudChkZXYpCiAgICAvKiBwcmVzZW50
ID09IHRydWUgKi8KICByODUyX3VwZGF0ZV9jYXJkX2RldGVjdChkZXYpCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHI4NTJfaXJxKCkKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBkZXYtPmNhcmRfZGV0ZWN0ZWQgPSAwCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2LT5jYXJkX3Vuc3RhYmxlID0g
MQogIHI4NTJfdXBkYXRlX21lZGlhX3N0YXR1cyhkZXYpCiAgICBpZiAoIWRldi0+Y2FyZF9kZXRl
Y3RlZCkKICAgICAgcmV0dXJuOyAgPC0tIHNraXBzIHJlYWRpbmcgbWVkaWEgc3RhdHVzCiAgaWYg
KHByZXNlbnQpCiAgICByODUyX3JlZ2lzdGVyX25hbmRfZGV2aWNlKGRldikKCkJlY2F1c2Ugcjg1
Ml91cGRhdGVfbWVkaWFfc3RhdHVzKCkgc3RpbGwgY2hlY2tzIGRldi0+Y2FyZF9kZXRlY3RlZCB3
aGlsZQpyODUyX2NhcmRfZGV0ZWN0X3dvcmsoKSBicmFuY2hlcyBvbiBwcmVzZW50LCBhIHJlbW92
YWwgaW50ZXJydXB0IGR1cmluZwppbnNlcnRpb24gY2F1c2VzIHI4NTJfdXBkYXRlX21lZGlhX3N0
YXR1cygpIHRvIHJldHVybiBlYXJseSB3aXRob3V0CnVwZGF0aW5nIGRldi0+cmVhZG9ubHkgb3Ig
ZGV2LT5zbS4gIHI4NTJfcmVnaXN0ZXJfbmFuZF9kZXZpY2UoKSB0aGVuIHJ1bnMKd2l0aCBzdGFs
ZSBtZWRpYSBwcm9wZXJ0aWVzLCBlbmFibGVzIHRoZSBoYXJkd2FyZSBlbmdpbmUgdmlhCnI4NTJf
ZW5naW5lX2VuYWJsZSgpLCBhbmQgZmFpbHMgaW4gc21fcmVnaXN0ZXJfZGV2aWNlKCkgd2l0aG91
dCBkaXNhYmxpbmcKdGhlIGVuZ2luZSBvbiB0aGUgZXJyb3IxIHBhdGg7IHRoZSBzdWJzZXF1ZW50
IGRlbGF5ZWQgd29yayBzZWVzCnByZXNlbnQgPT0gZGV2LT5jYXJkX3JlZ2lzdGVyZWQgKDAgPT0g
MCkgYW5kIGV4aXRzIGVhcmx5LCBsZWF2aW5nIHRoZQplbmdpbmUgZW5hYmxlZCB3aXRoIG5vIGNh
cmQgcHJlc2VudC4KCkNvbnZlcnNlbHksIGlmIGFuIGluc2VydGlvbiBpbnRlcnJ1cHQgZmlyZXMg
d2hpbGUgaGFuZGxpbmcgYSByZW1vdmFsCihwcmVzZW50ID09IGZhbHNlKSwgcjg1Ml91cGRhdGVf
bWVkaWFfc3RhdHVzKCkgc2VlcyBkZXYtPmNhcmRfZGV0ZWN0ZWQgc2V0CmFuZCByZWFkcyBSODUy
X0NBUkRfU1RBIGFuZCBSODUyX0RNQV9DQVAgd2hpbGUgZGV2LT5jYXJkX3Vuc3RhYmxlIGlzIHNl
dApyaWdodCBiZWZvcmUgcjg1Ml91bnJlZ2lzdGVyX25hbmRfZGV2aWNlKCkgcnVucy4gIFBhc3Np
bmcgcHJlc2VudCB0bwpyODUyX3VwZGF0ZV9tZWRpYV9zdGF0dXMoKSAob3Igb25seSBjYWxsaW5n
IGl0IHdoZW4gcHJlc2VudCBpcyB0cnVlKSB3b3VsZAprZWVwIGJvdGggc3RlcHMgY29uc2lzdGVu
dC4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hz
ZXQvMjAyNjExMDgtc3VibWl0LXI4NTItY2FyZC1kZXRlY3QtbG9jay12MS12Mi0xLWUzMjUxYmMz
NjgwYUBnbWFpbC5jb20/cGFydD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
