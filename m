Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0C0606A335
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 11:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OLgyAVdL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DrdTW7Rb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:To:Subject:From:Message-ID:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1DsYhJ/44ZOanRX+NEyrJtfePUfWOzVxed1JL71dnlQ=; b=OLgyAVdL1RKR+K9d6uNxBJOqR4
	otuBhLh4YZP2h3WQKxLXcmXm3FHKZqMeFtSxuIHehSIgC7iR1sxwsQvGSdeOoIdOWHKKyTDukRf26
	1l1OvxN0c5bE53lUEWtOjFoPO//9OEJ6DrNqOMhIt/OmFwJQvQ4oCFBBCtpgqE5fO1jUhn7IRYaMm
	i6sPTCifd5DrL1ZI/d3IiP5WY53RE4yqSofWJ4Bv7aBElZpmxF+wDFAPeibHMzZVUpiGZHExBAPti
	uWRPBCNOxTNxsNJjC433CvpMXlzd2vAbEf62sEzd/yvOsmLL0MrHU/sv++UrCNiyjeS/Myly+Yjrq
	GGn/Nfkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTQl-00000009nRL-20hv;
	Thu, 12 Nov 2026 11:57:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTQj-00000009nQc-1e5L
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 11:57:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FDCF40E3A;
	Thu, 12 Nov 2026 11:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B871F00A05;
	Thu, 12 Nov 2026 11:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794484643;
	bh=bp/lLZL1SBFmFEQkQH5gmAHuHmDO473OO1jYcQt5nwo=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=DrdTW7RbwQixGyITa2oRKKftxgf8uk5C5Q4gQPa4V7h4+B/Il0SqVgubFA1AEZGW3
	 hPtb8WMpSAhCt2HkYkHhmj3QOF+gMa3MNHtq9YJtvRjM5eGn/oeUkNHcJEghCkNRm8
	 2A6HUzabaOgnOtqc7hPUB3Ojr6mhXa+dwNl8vpGd4ZmnvXkszOi5b0qU0T9Fo/2gQF
	 evYImBInlYGw3DbqEhlSd2hVUy1sEwRrVxhJFCnxLQmMwG37M3Gg019cFCZUfPRC0p
	 2k37qnz4fgvIgEcOcFqBJipDX9j8gQ4CyFmpA6pLsVnQL2J+Gjak5Pv8cxJZ+UiCvf
	 e2BzuZkSE/rKw==
Message-ID: <sashiko-outbox-211056@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/8] nvmem: core: take a reference on dev.of_node in
 nvmem_register()
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>, pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, arnd@arndb.de, linusw@kernel.org, enelsonmoore@gmail.com, aaro.koskinen@iki.fi, pengpeng@iscas.ac.cn, mathieu.dubois-briand@bootlin.com, gregkh@linuxfoundation.org, michael@walle.cc, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <2bc9cde2ff5bfa2bc55bf12407bfc08f6a467bb6.1794391660.git.manikandan.m@microchip.com>
References: <cover.1794391660.git.manikandan.m@microchip.com>
 <2bc9cde2ff5bfa2bc55bf12407bfc08f6a467bb6.1794391660.git.manikandan.m@microchip.com>
Date: Thu, 12 Nov 2026 11:57:22 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gbnZtZW06IGNvcmU6IG1pc3Np
bmcgRml4ZXMgdHJhaWxlciBmb3IgbnZtZW1fcmVnaXN0ZXIoKSBvZl9ub2RlCiAgcmVmZXJlbmNl
IGZpeAotLQoKY29tbWl0IDM0MTQ1YTMwNjdjZGZiYjZiZjEyMjBjNTI0YTQxYTQ0OGQ2YjdjODUK
QXV0aG9yOiBNYW5pa2FuZGFuIE11cmFsaWRoYXJhbiA8bWFuaWthbmRhbi5tQG1pY3JvY2hpcC5j
b20+Cgo+IG52bWVtOiBjb3JlOiB0YWtlIGEgcmVmZXJlbmNlIG9uIGRldi5vZl9ub2RlIGluIG52
bWVtX3JlZ2lzdGVyKCkKPgo+IG52bWVtX3JlZ2lzdGVyKCkgc3RvcmVzIGNvbmZpZy0+b2Zfbm9k
ZSAob3IgY29uZmlnLT5kZXYtPm9mX25vZGUpCj4gaW50byBudm1lbS0+ZGV2Lm9mX25vZGUgd2l0
aG91dCB0YWtpbmcgaXRzIG93biByZWZlcmVuY2UuIENhbGxlcnMKPiB0aGF0IGdldCB0aGUgbm9k
ZSB2aWEgb2ZfZ2V0X2NvbXBhdGlibGVfY2hpbGQoKSBldGMuIGFuZCBkcm9wIHRoZWlyCj4gcmVm
ZXJlbmNlIHJpZ2h0IGFmdGVyIHJlZ2lzdGVyaW5nIGxlYXZlIG52bWVtLT5kZXYub2Zfbm9kZSBi
YWNrZWQgYnkKPiBubyByZWZlcmVuY2UgYXQgYWxsLgo+Cj4gVGFrZSBhbiBvZl9ub2RlX2dldCgp
IHdoZW4gYXNzaWduaW5nIG52bWVtLT5kZXYub2Zfbm9kZSBhbmQgcmVsZWFzZQo+IGl0IGluIG52
bWVtX3JlbGVhc2UoKS4gRXhpc3RpbmcgY2FsbGVycyB0aGF0IGhvbGQgdGhlaXIgb3duIGdldC9w
dXQKPiBwYWlyIGFyb3VuZCB0aGUgcmVnaXN0cmF0aW9uIGNhbGwgbmVlZCBubyBjaGFuZ2VzLCBz
aW5jZSBnZXQvcHV0IG9uCj4gYSBkZXZpY2Vfbm9kZSBpcyBwZXItaG9sZGVyIGFuZCBpbmRlcGVu
ZGVudCBvZiBjb3JlIG5vdyBhbHNvIGhvbGRpbmcKPiBvbmUuCj4KPiBSZXZpZXdlZC1ieTogTWlx
dWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiBSZXZpZXdlZC1ieTogTWlj
aGFlbCBXYWxsZSA8bXdhbGxlQGtlcm5lbC5vcmc+Cj4gU3VnZ2VzdGVkLWJ5OiBNaWNoYWVsIFdh
bGxlIDxtd2FsbGVAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBNYW5pa2FuZGFuIE11cmFs
aWRoYXJhbiA8bWFuaWthbmRhbi5tQG1pY3JvY2hpcC5jb20+CgpbU2V2ZXJpdHk6IExvd10KVGhp
cyBmaXhlcyBhIG1pc3NpbmcgZGV2aWNlX25vZGUgcmVmZXJlbmNlIGluIG52bWVtX3JlZ2lzdGVy
KCkuICBTaG91bGQKdGhlIGNvbW1pdCBtZXNzYWdlIGluY2x1ZGUgYSBGaXhlcyB0YWcgZm9yIHRo
ZSBjb21taXQgdGhhdCBpbnRyb2R1Y2VkCmNvbmZpZy0+b2Zfbm9kZSBoYW5kbGluZzoKCiAgRml4
ZXM6IDEzMzNhNjc3OTUwMSAoIm52bWVtOiBjb3JlOiBhbGxvdyBzcGVjaWZ5aW5nIG9mX25vZGUi
KQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNl
dC9jb3Zlci4xNzk0MzkxNjYwLmdpdC5tYW5pa2FuZGFuLm1AbWljcm9jaGlwLmNvbT9wYXJ0PTMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
