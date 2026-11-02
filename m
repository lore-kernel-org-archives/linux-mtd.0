Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12D7606A329
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2026 12:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pn4Jl9Cp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VAA3qMaZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=g3DKNsPs/kv94XK486yPIzQ0fwS+a/pU1djWBSNjoCQ=; b=Pn4Jl9CpCkAKmiBP8UFXifOasH
	JaFf2DNAXppcy1ysmuF6tajWPX6uOZVJXhvSToYSm/H9opWXLwwpXTv1Hdx4kltJuJf9LiopZy39P
	WofUHK8J0BqKwNC2qy1p6gowFLxaV9hvASw+teUIKepxr1Z1F2diA7AShjZnRrqibzopbx4BCUdmI
	ZXhOIjEX0s3QBIWxX3NVcsskg5B+czRRlgEmoEhPuj77Wd9w6sHgSI7akyA4FhpuQbSlWgBt9PDuK
	jx1vuzzIfVg79yNxKzSTEHX8bdeRinr0abip/0UIzoxXMEfP0znGetAdgwPxMyAzY4er0tFVaMPGc
	ORJj8ydA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrDf-0000000GUhH-2JUy;
	Mon, 02 Nov 2026 12:32:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrDe-0000000GUgx-0k6b
	for linux-mtd@lists.infradead.org;
	Mon, 02 Nov 2026 12:32:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3AAFC60618;
	Mon,  2 Nov 2026 12:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8623E1F00A25;
	Mon,  2 Nov 2026 12:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793622776;
	bh=6b9vUqp9b7rOAttjju3j2NaTmGvOtpxStDpK1PhOElM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VAA3qMaZK6ItdiZXetcKTVAoCh/d6OaPJ6XZ2lEq/NzaMVmaiRpVS75ffYezFhNOz
	 F3JbrLlwqPZ2BqZVciFYAFNYKNshwu2HxzZqOaJpYBnIbFWSRHd0uSntgKd26mVBbD
	 uZuW6uVWicag9/yFYYFSiHCTfMn/Jlqnr2nKVcOoqq4K53+m6xA75lMGAbiPOOkl0l
	 ePAqhZ6QOqzSwh2CmMAzyZa9HnHZ35cnTOOaOK4bFB5hXUbY3ufOpUE1VxSlK6RB+F
	 Eigc7hU3qXr4DYFVNcId7bRadWjPFtXqUmtmvcCvhzYMZJFviY2LAOG/5XuUBU8uES
	 9GKKzCMC2fo0w==
Message-ID: <sashiko-outbox-193419@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v3] mtd: spi-nor: micron-st: Add support for
 is25wx01g
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>, linux-mtd@lists.infradead.org
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Michael Walle" <mwalle@kernel.org>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
In-Reply-To: <20261102-mtd-spi-nor-new-issi-chip-v3-1-f5e38e200fc8@analog.com>
References: <20261102-mtd-spi-nor-new-issi-chip-v3-1-f5e38e200fc8@analog.com>
Date: Mon, 02 Nov 2026 12:32:56 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogc3BpLW5vcjog
bWljcm9uLXN0OiBtaXNzaW5nIFNQSV9OT1JfSU9fTU9ERV9FTl9WT0xBVElMRSBmb3IgaXMyNXd4
MDFnCi0tCgpjb21taXQgNGE2ZGY1N2Q0MmYwNDI3ZWJlNmJkZTdjNzVlNTg1MmY4NGQyYzdjOApB
dXRob3I6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+CgptdGQ6IHNwaS1ub3I6IG1pY3Jv
bi1zdDogQWRkIHN1cHBvcnQgZm9yIGlzMjV3eDAxZwoKVGhpcyBjb21taXQgYWRkcyBzdXBwb3J0
IGZvciB0aGUgaXMyNXd4MDFnIG9jdGFsIGZsYXNoIGluIHRoZSBtaWNyb24tc3QKZHJpdmVyLCBp
bmNsdWRpbmcgaXRzIGZsYXNoIGluZm8gZW50cnkgYW5kIGEgcG9zdF9iZnB0IGZpeHVwIHRvIGNs
ZWFyCnJlYWRfc3IyIGFuZCB3cml0ZV9zcjFfYW5kX3NyMi4KCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL3NwaS1ub3IvbWljcm9uLXN0LmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL21pY3Jvbi1z
dC5jCj4gaW5kZXggZjk3ZjJkZWFkOGMyZi4uZWJhMDdlZmRjYTc1MyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL210ZC9zcGktbm9yL21pY3Jvbi1zdC5jCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5v
ci9taWNyb24tc3QuYwoKWyAuLi4gXQoKPiBAQCAtNjU1LDYgKzY4MCw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgc3BpX25vcl9maXh1cHMgbWljcm9uX3N0X25vcl9maXh1cHMgPSB7Cj4gIAo+ICBz
dGF0aWMgY29uc3Qgc3RydWN0IHNwaV9ub3JfZml4dXAgbWljcm9uX2ZpeHVwc1tdID0gewo+ICAJ
eyAuZml4dXBzID0gJm1pY3Jvbl9zdF9ub3JfZml4dXBzIH0sCj4gKwl7IC5pZCA9IFNOT1JfSUQo
MHg5ZCwgMHg1YiwgMHgxYiksIC5maXh1cHMgPSAmaXMyNXd4MDFnX2ZpeHVwcyB9LAoKW1NldmVy
aXR5OiBIaWdoXQpTaG91bGQgdGhlIG1pY3Jvbl9maXh1cHNbXSBlbnRyeSBmb3IgaXMyNXd4MDFn
IGluCmRyaXZlcnMvbXRkL3NwaS1ub3IvbWljcm9uLXN0LmMgYWxzbyBzZXQ6CgoJLmZpeHVwX2Zs
YWdzID0gU1BJX05PUl9JT19NT0RFX0VOX1ZPTEFUSUxFCgpsaWtlIHRoZSBhZGphY2VudCBtdDM1
eHUgZW50cmllcz8KCkR1cmluZyBzcGlfbm9yX3NjYW4oKSAtPiBzcGlfbm9yX2luaXRfcGFyYW1z
KCkgLT4gc3BpX25vcl9wYXJzZV9zZmRwKCksCnNwaV9ub3JfcGFyc2VfcHJvZmlsZTEoKSBwb3B1
bGF0ZXMgU05PUl9IV0NBUFNfUkVBRF84XzhfOF9EVFIgYW5kClNOT1JfSFdDQVBTX1BQXzhfOF84
X0RUUiBpbiBub3ItPnBhcmFtcy0+aHdjYXBzLm1hc2s6Cgpkcml2ZXJzL210ZC9zcGktbm9yL3Nm
ZHAuYzpzcGlfbm9yX3BhcnNlX3Byb2ZpbGUxKCkgewoJLi4uCglub3ItPnBhcmFtcy0+aHdjYXBz
Lm1hc2sgfD0gU05PUl9IV0NBUFNfUkVBRF84XzhfOF9EVFI7CglzcGlfbm9yX3NldF9yZWFkX3Nl
dHRpbmdzKCZub3ItPnBhcmFtcy0+cmVhZHNbU05PUl9DTURfUkVBRF84XzhfOF9EVFJdLAoJCQkJ
ICAwLCBkdW1teSwgb3Bjb2RlLAoJCQkJICBTTk9SX1BST1RPXzhfOF84X0RUUik7CgkuLi4KCW5v
ci0+cGFyYW1zLT5od2NhcHMubWFzayB8PSBTTk9SX0hXQ0FQU19QUF84XzhfOF9EVFI7CgkuLi4K
fQoKQmVjYXVzZSB0aGUgc2ZkcCB0YWJsZXMgb24gdGhpcyBwYXJ0IGRvIG5vdCBpbmNsdWRlIHRo
ZSBzY2NyIG1hcCB0YWJsZQooMHhmZjg3KSwgc3BpX25vcl9wYXJzZV9zY2NyKCkgaXMgbmV2ZXIg
Y2FsbGVkIGFuZCBTTk9SX0ZfSU9fTU9ERV9FTl9WT0xBVElMRQppcyBub3Qgc2V0IGR1cmluZyBz
ZmRwIHBhcnNpbmcuCgpMYXRlciwgc3BpX25vcl9sYXRlX2luaXRfcGFyYW1zKCkgY2FsbHMgbWlj
cm9uX3N0X25vcl9sYXRlX2luaXQoKSwgd2hpY2gKYXNzaWducyBwYXJhbXMtPnNldF9vY3RhbF9k
dHIgPSBtaWNyb25fc3Rfbm9yX3NldF9vY3RhbF9kdHIsIGFuZApzcGlfbm9yX2luaXRfZml4dXBf
ZmxhZ3MoKSBhcHBsaWVzIGZpeHVwX2ZsYWdzIGZyb20gbWljcm9uX2ZpeHVwc1tdLiBXaXRob3V0
ClNQSV9OT1JfSU9fTU9ERV9FTl9WT0xBVElMRSBpbiBtaWNyb25fZml4dXBzW10sIFNOT1JfRl9J
T19NT0RFX0VOX1ZPTEFUSUxFCnJlbWFpbnMgdW5zZXQgaW4gbm9yLT5wYXJhbXMtPmZsYWdzLgoK
V2hlbiBhdHRhY2hlZCB0byBhbiA4ZC04ZC04ZCBjYXBhYmxlIGNvbnRyb2xsZXIsIHNwaV9ub3Jf
c2V0dXAoKSBzZWxlY3RzClNOT1JfUFJPVE9fOF84XzhfRFRSIGZvciBub3ItPnJlYWRfcHJvdG8g
YW5kIG5vci0+d3JpdGVfcHJvdG8sIGFuZApzcGlfbm9yX2luaXQoKSB0aGVuIGNhbGxzIHNwaV9u
b3Jfc2V0X29jdGFsX2R0cihub3IsIHRydWUpOgoKZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmM6
c3BpX25vcl9zZXRfb2N0YWxfZHRyKCkgewoJLi4uCglpZiAoIW5vci0+cGFyYW1zLT5zZXRfb2N0
YWxfZHRyKQoJCXJldHVybiAwOwoKCWlmICghKG5vci0+cGFyYW1zLT5mbGFncyAmIFNOT1JfRl9J
T19NT0RFX0VOX1ZPTEFUSUxFKSkKCQlyZXR1cm4gMDsKCglyZXQgPSBub3ItPnBhcmFtcy0+c2V0
X29jdGFsX2R0cihub3IsIGVuYWJsZSk7CglpZiAocmV0KQoJCXJldHVybiByZXQ7CgoJaWYgKGVu
YWJsZSkKCQlub3ItPnJlZ19wcm90byA9IFNOT1JfUFJPVE9fOF84XzhfRFRSOwoJZWxzZQoJCW5v
ci0+cmVnX3Byb3RvID0gU05PUl9QUk9UT18xXzFfMTsKCglyZXR1cm4gMDsKfQoKV291bGRuJ3Qg
c3BpX25vcl9zZXRfb2N0YWxfZHRyKCkgcmV0dXJuIDAgZWFybHkgd2l0aG91dCBjYWxsaW5nCm1p
Y3Jvbl9zdF9ub3Jfc2V0X29jdGFsX2R0cigpIG9yIHVwZGF0aW5nIG5vci0+cmVnX3Byb3RvLCBs
ZWF2aW5nIHRoZSBmbGFzaAppbiAxcy0xcy0xcyBtb2RlIHdoaWxlIHRoZSBjb250cm9sbGVyIHVz
ZXMgU05PUl9QUk9UT184XzhfOF9EVFIgZm9yIHJlYWRzCmFuZCB3cml0ZXM/CgotLSAKU2FzaGlr
byBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTAyLW10
ZC1zcGktbm9yLW5ldy1pc3NpLWNoaXAtdjMtMS1mNWUzOGUyMDBmYzhAYW5hbG9nLmNvbT9wYXJ0
PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
