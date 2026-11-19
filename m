Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC20606A332
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 16:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hm5RYejT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zv9Cgpd3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OotJ8vCLlp0RagC4UAE44kYdFU9xt5IjVxe9Xp3BgAE=; b=Hm5RYejTGf6oaA6iIEECxBaeix
	KIQ4d6agC/TuXNVZEQQ2rzcQKRptQzIyxl3oG5bwKvodXRQjIi8yjMkF+FBX3vh9K70L5RDKm3HpT
	rzTQ8hYGdWExI+QaQsOgNf/ENU8+vAVnARnwQ1YqmU/XaYb0oxeWHyTsD4vwbaN9iWgmh/+zdvpQe
	SYg/lWDKg87GiLaUHyI6mYSzD6yvKNMHLSl3VsaNqtFRd/et+Tpr0Tl3IERVjpDMhxIhjHh/HIDZr
	LUgfvlQY71TcPlY+wd8J+LtTcr8CDxrDbtf2Rc90l8aR4+J5yWt4b49B/uQgV69KLWURtiMWVZSX9
	0HpLyf9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5NE-0000000CjYN-48mb;
	Thu, 19 Nov 2026 16:52:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5ND-0000000CjY7-3xk1
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 16:52:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 480A460620;
	Thu, 19 Nov 2026 16:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489DD1F000C6;
	Thu, 19 Nov 2026 16:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795107155;
	bh=vt/kxWN70AnYwHxvyb9WJGpSdz87RFRqSmNc9jjU2xY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zv9Cgpd32PRWnU8r5IVonnxwESDMj+m0zZyUuNQ7bfmU/W+pcxE8fJZ3o4uhej1DA
	 a22v5PvdDAjjkHyxfcJjXSLQxZlm5KrHvOAiz+4Ny6iFTgUgEjuKBd3wKwQyfyA0xR
	 e8uwcEavmSVJHr062hCZL4zuP2m/qKHdDwbyLL6EI07HVfFByYpqmk548E3qkcl4g6
	 RYk1AvEs+Os2M0WFrHn61KSn3KNvARqr64LxKF0i+KsuYM6ojj1TlsWsnwacoTroej
	 8EZgNjiaPN/B04Lq80JtG4tC7/odor6wNk/zJp91pzFi+Ur9EX1nsDZ2f3IqErOsdH
	 7FJdLY3sA3Q+A==
Message-ID: <sashiko-outbox-223589@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/11] nvmem: release write protection when the
 provider disconnects
To: "James Hilliard" <james.hilliard1@gmail.com>, "Srinivas Kandagatla" <srini@kernel.org>, "Mathieu
 Dubois-Briand" <mathieu.dubois-briand@bootlin.com>, "Michael Walle" <mwalle@kernel.org>,
 =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, "Michael Walle" <michael@walle.cc>, "Linus
 Walleij" <linusw@kernel.org>, "Khouloud Touil" <ktouil@baylibre.com>, "Bartosz
 Golaszewski" <brgl@kernel.org>
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Paul
 Cercueil" <paul@crapouillou.net>, linux-mtd@lists.infradead.org
In-Reply-To: <20261119-submit-nvmem-provider-lifetime-v1-v2-4-8fca3ec5f18c@gmail.com>
References: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
 <20261119-submit-nvmem-provider-lifetime-v1-v2-4-8fca3ec5f18c@gmail.com>
Date: Thu, 19 Nov 2026 16:52:33 +0000
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gbnZtZW06IGluYWNjdXJhdGUg
Rml4ZXMgdHJhaWxlciBpbiBjb21taXQgbWVzc2FnZSBmb3Igd3BfZ3BpbwogIHJlbGVhc2UKLS0K
CmNvbW1pdCAwMmM2YTVkOTg2YTY3OWRlY2M5NGM4OGI3NWFmMDNjNDkxMmM3ZjZkCkF1dGhvcjog
SmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cgo+IG52bWVtOiByZWxl
YXNlIHdyaXRlIHByb3RlY3Rpb24gd2hlbiB0aGUgcHJvdmlkZXIgZGlzY29ubmVjdHMKPgo+IFJl
dGFpbmVkIE5WTUVNIGNvbnN1bWVycyBrZWVwIHRoZSBkZXZpY2UgYWxsb2NhdGlvbiBhbGl2ZSBh
ZnRlciB1bnJlZ2lzdGVyLgo+IEtlZXBpbmcgdGhlIHdyaXRlLXByb3RlY3QgR1BJTyB1bnRpbCBm
aW5hbCBkZXZpY2UgcmVsZWFzZSBwcmV2ZW50cyBhCj4gcmVwbGFjZW1lbnQgcHJvdmlkZXIgZnJv
bSByZXF1ZXN0aW5nIHRoZSBzYW1lIEdQSU8uCj4KPiBSZWxlYXNlIGl0IGFmdGVyIGRyYWluaW5n
IHByb3ZpZGVyIGNhbGxiYWNrcywgd2hlbiBubyB3cml0ZSBjYW4gc3RpbGwKPiB1c2UgaXQuIERv
IHRoaXMgZm9yIHJlZ2lzdHJhdGlvbiBmYWlsdXJlcyBhcyB3ZWxsIGFzIHVucmVnaXN0ZXIuCj4K
PiBGaXhlczogMmExMjdkYTQ2MWE5ICgibnZtZW06IGFkZCBzdXBwb3J0IGZvciB0aGUgd3JpdGUt
cHJvdGVjdCBwaW4iKQo+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tPgoKW1NldmVyaXR5OiBMb3ddCkRvZXMgdGhlIEZpeGVzIHRhZyBwb2lu
dCB0byB0aGUgY29tbWl0IHRoYXQgYWN0dWFsbHkgY2F1c2VkIHdwX2dwaW8gdG8KcmVtYWluIGFj
cXVpcmVkIGFjcm9zcyBudm1lbV91bnJlZ2lzdGVyKCk/CgpDb21taXQgMmExMjdkYTQ2MWE5ICgi
bnZtZW06IGFkZCBzdXBwb3J0IGZvciB0aGUgd3JpdGUtcHJvdGVjdCBwaW4iKSBkaWQKbm90IHJl
bGVhc2Ugd3BfZ3BpbyBhdCBhbGw7IGNvbW1pdCBhOWMzNzY2Y2IxOWMgKCJudm1lbTogcmVsZWFz
ZSB0aGUKd3JpdGUtcHJvdGVjdCBwaW4iKSBsYXRlciBhZGRlZCBncGlvZF9wdXQobnZtZW0tPndw
X2dwaW8pIHRvCm52bWVtX3JlbGVhc2UoKS4gIEF0IHRoYXQgcG9pbnQgbnZtZW1fdW5yZWdpc3Rl
cigpIG9ubHkgZHJvcHBlZApudm1lbS0+cmVmY250LCBzbyBkZXZpY2UgdW5yZWdpc3RyYXRpb24g
d2FpdGVkIGZvciBhbGwgY29uc3VtZXJzLiAgSXQgd2FzCmNvbW1pdCA4NzM0MWM0ZGQ1ZGUgKCJu
dm1lbTogcmVtb3ZlIGR1cGxpY2F0ZWQgcmVmZXJlbmNlIGNvdW50aW5nIikgYW5kCmNvbW1pdCA2
YTdiNDEzNGZiN2EgKCJudm1lbTogcHJvdGVjdCBudm1lbV9kZXZpY2U6Om9wcyB3aXRoIFNSQ1Ui
KSB0aGF0CmNoYW5nZWQgbnZtZW1fdW5yZWdpc3RlcigpIHRvIGltbWVkaWF0ZWx5IHVucmVnaXN0
ZXIgYW5kIGRpc2Nvbm5lY3QgdGhlCnByb3ZpZGVyIHdoaWxlIGxlYXZpbmcgZ3Bpb2RfcHV0KG52
bWVtLT53cF9ncGlvKSBpbiBudm1lbV9yZWxlYXNlKCkuCgpTaG91bGQgdGhpcyBpbnN0ZWFkIHVz
ZToKCiAgRml4ZXM6IDZhN2I0MTM0ZmI3YSAoIm52bWVtOiBwcm90ZWN0IG52bWVtX2RldmljZTo6
b3BzIHdpdGggU1JDVSIpCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtv
LmRldi8jL3BhdGNoc2V0LzIwMjYxMTE5LXN1Ym1pdC1udm1lbS1wcm92aWRlci1saWZldGltZS12
MS12Mi0wLThmY2EzZWM1ZjE4Y0BnbWFpbC5jb20/cGFydD00CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
