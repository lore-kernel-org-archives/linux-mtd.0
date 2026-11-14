Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C22606A887
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Nov 2026 12:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mZ/lHRtT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f69SiW3T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/sG2I8ISkP2Tf6hZhNkXMA73wxfjv1jzFy0jlRLjDB4=; b=mZ/lHRtTa4aJw4Hq3xscg0mPvl
	ZbK9li4oIax9g6MAOqCUXB6UrLGjXmoB9JU4Gsluied5GjcRhGwUIpbV/cfHscezTMZcyFEorzd86
	yroexd8o8g7oCS5uKnlIJOJYY1NLNNSo8VighzDG7TfPs/bmLheWAqKNcapHGHDGO0Q92DzbsC2SP
	dh+LMhp7CZnbQ57rXEtruQNWl88sRPw/7qCfsg2BOzWdqQt/UhIYtqUWl6tT8WO/yAULJV6Jr5MrT
	YiiyjSkplGMpH7eypE1S0glubQq7PPCbz1mpccxXAehWvyy39ndvcz5YIci2iTS6vq/oUviHbXfAl
	B2KfShSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCTu-0000000Fz1F-1uy0;
	Sat, 14 Nov 2026 12:03:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCTt-0000000Fz00-1QPS
	for linux-mtd@lists.infradead.org;
	Sat, 14 Nov 2026 12:03:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B9FA761E34;
	Sat, 14 Nov 2026 12:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEAFA1F000C5;
	Sat, 14 Nov 2026 12:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794657820;
	bh=i/KYa3UJ+vAFbs7NcbhfOHJmaPLTvaBxJddS/GfOWco=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f69SiW3T4Q7A6/VsOz19IJcDTbc2284jaDxgfyilDNG1Mci6VQQ0XsUIBzmCI2qyW
	 jBaCIXM0+pGMbZU6+HsTbwcuLPsb2hzKKEbMRuKK4DOQw/dU5Ns9uMCz52Jnzj9tF5
	 AXH/9yDypM1F5LtJdPmEAkLH4UA7aJwzK9MLeRyuesvkSJjk6XuJlznUHMW2Vc4Awm
	 BtcYalXD+cdcCtN0E28SgqskmS21t/xSbEIhlpoLv2451rm/ZPCa/BhesuHFKDJLNb
	 sT27WrI12rYRWzsaabg7n85XlDTqlHu6y6vW8o/+iQEOAYtkvM/L4JnWcrRwRiTkYU
	 9J1nIjwgbU3lA==
Message-ID: <sashiko-outbox-214470@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 19/33] ntfs: don't set SB_RDONLY after filesystem
 errors
To: "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.com>
Cc: "Al Viro" <viro@zeniv.linux.org.uk>, linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, "Hyunchul
 Lee" <hyc.lee@gmail.com>, dsterba@suse.cz, tytso@mit.edu, "Mark Fasheh" <mark@fasheh.com>, "Joel
 Becker" <jlbec@evilplan.org>, "Joseph Qi" <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261113-work-fs-sb_rdonly-v3-19-0be92bb73709@kernel.org>
References: <20261113-work-fs-sb_rdonly-v3-0-0be92bb73709@kernel.org>
 <20261113-work-fs-sb_rdonly-v3-19-0be92bb73709@kernel.org>
Date: Sat, 14 Nov 2026 12:03:39 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbnRmczogdW5sb2NrZWQg
c2ItPnNfZmxhZ3MgUk1XIGluIG50ZnNfaGFuZGxlX2Vycm9yKCkgdmlhCiAgcHJlY2FsY193b3Jr
Ci0tCgpjb21taXQgNDFmNTM2NmI1Nzk5ZGM5YmFiYjUzN2Q1ODVmNzdmZjkwNjM4MzFlMQpBdXRo
b3I6IENocmlzdGlhbiBCcmF1bmVyIDxicmF1bmVyQGtlcm5lbC5vcmc+CgpudGZzOiBkb24ndCBz
ZXQgU0JfUkRPTkxZIGFmdGVyIGZpbGVzeXN0ZW0gZXJyb3JzCgpUaGlzIGNvbW1pdCByZXBsYWNl
cyBzZXR0aW5nIFNCX1JET05MWSBvbiBydW50aW1lIGZpbGVzeXN0ZW0gZXJyb3JzIHVuZGVyCmVy
cm9ycz1yZW1vdW50LXJvIHdpdGggYW4gTlZfRW1lcmdlbmN5Uk8gdm9sdW1lIGZsYWcgYW5kIGFu
IGFzeW5jaHJvbm91cwp3b3JrIGl0ZW0gdG8gcGVyc2lzdCB0aGUgdm9sdW1lIGRpcnR5IGJpdC4K
Cj4gZGlmZiAtLWdpdCBhL2ZzL250ZnMvc3VwZXIuYyBiL2ZzL250ZnMvc3VwZXIuYwo+IGluZGV4
IDcxZjBhZWE0NmJmOGYuLjkxMjkwNjg4ZDI4OTggMTAwNjQ0Cj4gLS0tIGEvZnMvbnRmcy9zdXBl
ci5jCj4gKysrIGIvZnMvbnRmcy9zdXBlci5jClsgLi4uIF0KPiBAQCAtNDM0LDcgKzQzNiwyMSBA
QCB2b2lkIG50ZnNfaGFuZGxlX2Vycm9yKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IpCj4gIAkJcmV0
dXJuOwo+ICAKPiAgCWlmICh2b2wtPm9uX2Vycm9ycyA9PSBPTl9FUlJPUlNfUkVNT1VOVF9STykg
ewo+IC0JCXNiLT5zX2ZsYWdzIHw9IFNCX1JET05MWTsKPiArCQlpZiAoIShzYi0+c19mbGFncyAm
IFNCX0JPUk4pKSB7Cj4gKwkJCS8qIEJlZm9yZSBTQl9CT1JOIHRoZSBtb3VudGVyIGhvbGRzIHNf
dW1vdW50LiAqLwo+ICsJCQlzYi0+c19mbGFncyB8PSBTQl9SRE9OTFk7Cj4gKwkJfSBlbHNlIHsK
CltTZXZlcml0eTogTWVkaXVtXQpDYW4gcHJlY2FsY19mcmVlX2NsdXN0ZXJzKCkgcmVhY2ggdGhp
cyBicmFuY2ggb24gYSBrd29ya2VyIHRocmVhZCBiZWZvcmUKU0JfQk9STiBpcyBzZXQsIHJhY2lu
ZyBvbiBzYi0+c19mbGFncyB3aXRob3V0IGhvbGRpbmcgc191bW91bnQ/CgpudGZzX2ZpbGxfc3Vw
ZXIoKSBxdWV1ZXMgdm9sLT5wcmVjYWxjX3dvcmsgYmVmb3JlIHJldHVybmluZyB0bwpnZXRfdHJl
ZV9iZGV2X2ZsYWdzKCkgYW5kIHZmc19nZXRfdHJlZSgpOgoKQ1BVMCAobW91bnRlcikgICAgICAg
ICAgICAgICAgICAgIENQVTEgKGt3b3JrZXIpCnZmc19nZXRfdHJlZSgpCiAgZ2V0X3RyZWVfYmRl
dl9mbGFncygpCiAgICBudGZzX2ZpbGxfc3VwZXIoKQogICAgICBxdWV1ZV93b3JrKC4uLiwgJnZv
bC0+cHJlY2FsY193b3JrKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJlY2Fs
Y19mcmVlX2NsdXN0ZXJzKCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2V0
X25yX2ZyZWVfY2x1c3RlcnMoKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC4uLgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbnRmc19lcnJvcigp
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG50ZnNfaGFuZGxlX2Vy
cm9yKCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiAhKHNi
LT5zX2ZsYWdzICYgU0JfQk9STikgKi8KICBzdXBlcl93YWtlKHNiLCBTQl9CT1JOKSAgICAgICAg
ICAgICAgICAgICBzYi0+c19mbGFncyB8PSBTQl9SRE9OTFk7CiAgICBzbXBfc3RvcmVfcmVsZWFz
ZSgmc2ItPnNfZmxhZ3MsICAgICAgICAgICA8LS0gdW5sb2NrZWQgUk1XIHJhY2UKICAgICAgICAg
ICAgICAgICAgICAgIHNiLT5zX2ZsYWdzIHwgU0JfQk9STik7CgpEdXJpbmcgbW91bnQsIGxvYWRf
c3lzdGVtX2ZpbGVzKCkgZG9lcyBub3QgcG9wdWxhdGUgdGhlIHJ1bmxpc3QgZm9yCiRCaXRtYXAs
IHNvIGdldF9ucl9mcmVlX2NsdXN0ZXJzKCkgZGVjb21wcmVzc2VzICRCaXRtYXAncyBtYXBwaW5n
IHBhaXJzIG9uCnRoZSB3b3JrcXVldWUgYW5kIGNhbGxzIG50ZnNfZXJyb3IoKSBpZiByZWFkaW5n
IG9yIGRlY29tcHJlc3NpbmcgZmFpbHMuCgpCZWNhdXNlIG5laXRoZXIgc2lkZSB1cGRhdGVzIHNi
LT5zX2ZsYWdzIGF0b21pY2FsbHkgYW5kIHRoZSBrd29ya2VyIGRvZXMKbm90IGhvbGQgc191bW91
bnQsIHRoZSBSTVcgaW4gbnRmc19oYW5kbGVfZXJyb3IoKSBjYW4gb3ZlcndyaXRlIFNCX0JPUk4K
KGxlYXZpbmcgbGF0ZXIgc3VwZXJfbG9jaygpIGNhbGxlcnMgaHVuZyB3YWl0aW5nIGZvciBTQl9C
T1JOKSBvciBsb3NlClNCX1JET05MWS4gIFRha2luZyB0aGUgIVNCX0JPUk4gYnJhbmNoIGZyb20g
dGhlIHdvcmtxdWV1ZSBhbHNvIHNraXBzCk5Wb2xTZXRFcnJvcnModm9sKSBhbmQgTlZfRW1lcmdl
bmN5Uk8sIGFsbG93aW5nIGEgc3Vic2VxdWVudCByZW1vdW50LHJ3IGluCm50ZnNfcmVjb25maWd1
cmUoKSB0byBzdWNjZWVkIGRlc3BpdGUgdGhlIGVycm9yLgoKLS0gClNhc2hpa28gQUkgcmV2aWV3
IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTExMy13b3JrLWZzLXNiX3Jk
b25seS12My0wLTBiZTkyYmI3MzcwOUBrZXJuZWwub3JnP3BhcnQ9MTkKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
