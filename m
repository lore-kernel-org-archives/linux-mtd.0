Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2073CC6B01
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2026 18:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Remg0R88rFxVSLEoZlald0xb8WYEg7mJ5Fv1J7gGQDU=; b=Jb4yswzam506pm
	2oaUW7sVfzLgJL60flxKQTKSuYVEknn0psGYfhLjRKBSFkVWAVVSuUQm80SX4f5ENDAWJuou/a2nT
	RrWC8vQpwwuwee3xiPxP5VEG801/xeLOjOEhMwFlPVIuxcyaP0t0hOllNnkRGDloeOQRWE7k0qmsc
	5M74GdmTV5tGd+zA84/lPoFm5Gbjmzd+fj7pcsveHSjpi5eydYJjJWbIObUTZU50R5IKcBOdCSBjP
	jqlv9qiDaeUuBKlAdMLRoOupTp2naPd9VHRdeVS2bakf4PaGje1ZR1ApakT8sjaalOMaG8nuVH0h9
	uoKSwkcp1EKj37T/TnaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKeF-0000000BDJj-26Om;
	Mon, 12 Oct 2026 18:21:22 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKeB-0000000BDGN-3zh1
	for linux-mtd@lists.infradead.org;
	Mon, 12 Oct 2026 18:21:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 80F291A11E9;
	Mon, 12 Oct 2026 18:21:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46A26601A6;
	Mon, 12 Oct 2026 18:21:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E6B611D70C57;
	Mon, 12 Oct 2026 20:21:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791829273; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4S+StvxCrWot/Jq/df8EjklJA6CqyPLDthyRqelFSZM=;
	b=lk2NL9rFR8uP+JAGp/LrU05emFPH/y0gHIoThjy8l+VkNQwDIgnyGk/AK0GDmXgNmqc0T+
	cTfmtb9PvmY7jT5y3FUEeUbGuuuRIjM6nV78bpRfaVZNRW2208EnndB7YRQ1C2pCQ7TFWr
	in/mI5e5LGphEyur+pbzNGPKDAm0FWlC1Bd7jFHJfooBT+8Gd20pI8N/hWduCrGLcXmqP5
	ZMKahT6m6L9vhJhdn6EPPG9eib05skxecUPH5n5opoxea0/uleVpPpyHHhHvvRX8L8XYKc
	CQDzREfFB5n75N8DlGzUM0Zdb3qocvP/p4qpNhHHzYSeHDphXy3PUhyiwULVow==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michal Simek <michal.simek@amd.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261009060610.3162795-1-vulab@iscas.ac.cn>
References: <20261009060610.3162795-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] mtd: rawnand: pl353: fix clk reference leak in
 pl35x_nfc_setup_interface()
Message-Id: <179182927105.590599.6369377417023484373.b4-ty@bootlin.com>
Date: Mon, 12 Oct 2026 20:21:11 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_112116_660151_688E951F 
X-CRM114-Status: UNSURE (   7.24  )
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

T24gRnJpLCAwOSBPY3QgMjAyNiAxNDowNjoxMCArMDgwMCwgSGFvdGlhbiBaaGFuZyB3cm90ZToK
PiBwbDM1eF9uZmNfc2V0dXBfaW50ZXJmYWNlKCkgb2J0YWlucyBhIHJlZmVyZW5jZSB0byB0aGUg
U01DICJtZW1jbGsiIHdpdGgKPiBvZl9jbGtfZ2V0X2J5X25hbWUoKSBhbmQgb25seSB1c2VzIGl0
IHRvIHJlYWQgdGhlIGNsb2NrIHJhdGUuIFRoZQo+IHJlZmVyZW5jZSBpcyBuZXZlciByZWxlYXNl
ZDogdGhlIGZ1bmN0aW9uIGhhcyBtYW55IGVhcmx5IHJldHVybiBwYXRocwo+IGFuZCBubyBjbGtf
cHV0KCkgY2FsbCBhbnl3aGVyZSwgc28gdGhlIGNsb2NrIHJlZmVyZW5jZSBpcyBsZWFrZWQuCj4g
Cj4gVGhlIGhvb2sgaXMgaW52b2tlZCByZXBlYXRlZGx5IGJ5IHRoZSBOQU5EIGNvcmUgKG5hbmRf
cmVzZXQoKSwKPiBuYW5kX3NldHVwX2ludGVyZmFjZSgpIGFuZCB0aGUgTkFORF9EQVRBX0lGQUNF
X0NIRUNLX09OTFkgbW9kZSBwcm9iaW5nCj4gbG9vcHMpLCBzbyB0aGUgcmVmZXJlbmNlIGNvdW50
IGtlZXBzIGdyb3dpbmcuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3Mh
CgpbMS8xXSBtdGQ6IHJhd25hbmQ6IHBsMzUzOiBmaXggY2xrIHJlZmVyZW5jZSBsZWFrIGluIHBs
MzV4X25mY19zZXR1cF9pbnRlcmZhY2UoKQogICAgICBjb21taXQ6IDFjZTQ1ZjBlNzRkNjBlODI3
OWVkMzgwYzk3MDQ3ZTZjMzUxYWVlMWIKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9u
IG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQg
dGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
