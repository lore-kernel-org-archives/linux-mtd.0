Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65201CA600D
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Oct 2026 18:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DCiMwd4tGNCxnoYkCGetmawQ9yIy3cn/ms3wfPU4iMU=; b=A8of/pXvsTJtxg
	GTkexOQUjDIyJQd8zJ7B3JLe1Syq95XH1V4u5ywbqwu9FV6DsGTzh/PsbTKk2gZLCRb7V2yTPb36C
	mzApQoVnj1CLJI3TSA+pK4fyAtd3gDLFWPhXLFYG4gm0goFsIP99iC8NItIhXVME+YGjvU0Y3zkee
	tE8OzR2dQjB8CRsBhxr028ow5UasNa0cFjC1jOMeR/aNcR/s8AvRRScrpL9EQIhmgofuPJH+HEFaE
	Dndwp2JSF08ivmJ7BGnP1b3lzE7SrDXVFWGIYFihGtwGy9xFa6AZaC8zSRdN4Pz/mXQw79lj7HJ/Z
	QVNaJL7TkSycqSr9eNtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEswg-00000004s75-3rAH;
	Thu, 08 Oct 2026 18:34:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEswf-00000004s6x-1axI
	for linux-mtd@lists.infradead.org;
	Thu, 08 Oct 2026 18:34:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D34BD40315;
	Thu,  8 Oct 2026 18:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40AB11F000FF;
	Thu,  8 Oct 2026 18:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791484460;
	bh=MDUs9CCOTYQKi4Eoui479ft8V8PVNTf33myUL0Knxxk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VEvTuXRFJbKXsdv51vxBwVb0nprNMat/salfxgcr7toLVUb9Od0ASyvpDvL45aHJ+
	 3rCMbJp6/l57wb6kF8KCrM4KsiIfXxmB+YrlsHcBuEw6aUmLXSQdIe0b4U534tcMSI
	 xeGv0X2M91DLoia2EbymifHf3zCPrjtDaxu33sQoGL5UsoOEVtdx0TZ8MtqY7yGV0I
	 dmqi2qqP0r7OUWJZ6ZHUQmHhGgP6yzPu8SdY1sfm9TJiasx/yrnix7zKVh+pDgLedB
	 K48Y/HawxCwjRkkCxXPF1gl12nPyZjuAxMrGmOwDxGTCMRSZQSL11dSGu4HTMU8OpA
	 YyoW430POzRnQ==
Message-ID: <sashiko-outbox-164461@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: rawnand: tegra: fix OF node leak in
 tegra_nand_chips_init()
To: "Thierry Reding" <thierry.reding@kernel.org>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Haotian
 Zhang" <vulab@iscas.ac.cn>, "Richard Weinberger" <richard@nod.at>, "Stefan
 Agner" <stefan@agner.ch>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Lucas
 Stach" <dev@lynxeye.de>, "Jonathan Hunter" <jonathanh@nvidia.com>, "Dmitry
 Osipenko" <digetx@gmail.com>, "Boris Brezillon" <bbrezillon@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261008182442.2770036-1-vulab@iscas.ac.cn>
References: <20261008182442.2770036-1-vulab@iscas.ac.cn>
Date: Thu, 08 Oct 2026 18:34:19 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogcmF3bmFuZDog
dGVncmE6IFVBRiBkdWUgdG8gcHJlbWF0dXJlIG9mX25vZGVfcHV0KCkgYmVmb3JlIHJlZ2lzdHJh
dGlvbgotLQoKY29tbWl0IDFjZjM2NTRmNmIzMTcyNjIzNDhjYmFkMWJiZjQ2MTI4Mjg0MDA1OGUK
QXV0aG9yOiBIYW90aWFuIFpoYW5nIDx2dWxhYkBpc2Nhcy5hYy5jbj4KCm10ZDogcmF3bmFuZDog
dGVncmE6IGZpeCBPRiBub2RlIGxlYWsgaW4gdGVncmFfbmFuZF9jaGlwc19pbml0KCkKClRoaXMg
Y29tbWl0IGF0dGVtcHRzIHRvIGZpeCBhIGRldmljZSBub2RlIGxlYWsgYnkgcmVsZWFzaW5nIG5w
X25hbmQgcmlnaHQKYWZ0ZXIgY2FsbGluZyBuYW5kX3NldF9mbGFzaF9ub2RlKCkuCgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy90ZWdyYV9uYW5kLmMgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy90ZWdyYV9uYW5kLmMKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy90ZWdyYV9u
YW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy90ZWdyYV9uYW5kLmMKWyAuLi4gXQo+
IEBAIC0xMTE5LDYgKzExMjIsNyBAQCBzdGF0aWMgaW50IHRlZ3JhX25hbmRfY2hpcHNfaW5pdChz
dHJ1Y3QgZGV2aWNlICpkZXYsCj4gIAltdGQtPm93bmVyID0gVEhJU19NT0RVTEU7Cj4gIAo+ICAJ
bmFuZF9zZXRfZmxhc2hfbm9kZShjaGlwLCBucF9uYW5kKTsKPiArCW9mX25vZGVfcHV0KG5wX25h
bmQpOwoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMgaW50cm9kdWNlIGEgdXNlLWFmdGVyLWZy
ZWUgcmlzayBmb3IgdGhlIGRldmljZSBub2RlPwoKVGhlIG5hbmRfc2V0X2ZsYXNoX25vZGUoKSBo
ZWxwZXIgc3RvcmVzIHRoZSBwb2ludGVyIGluIG10ZC0+ZGV2Lm9mX25vZGUKYnV0IGRvZXMgbm90
IGluY3JlbWVudCBpdHMgcmVmZXJlbmNlIGNvdW50LiBCeSBkcm9wcGluZyB0aGUgcmVmZXJlbmNl
IGhlcmUsCmNvdWxkIHRoZSBub2RlIGJlIGZyZWVkIGJlZm9yZSBzdWJzZXF1ZW50IGFjY2Vzc2Vz
PwoKTGF0ZXIgaW4gdGhpcyBmdW5jdGlvbiwgbmFuZF9zY2FuKCkgZGVyZWZlcmVuY2VzIHRoaXMg
Zmxhc2ggbm9kZSB0byByZWFkIApwcm9wZXJ0aWVzOgoKZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFu
ZF9iYXNlLmM6b2ZfZ2V0X25hbmRfYnVzX3dpZHRoKCkgewogICAgc3RydWN0IGRldmljZV9ub2Rl
ICpkbiA9IG5hbmRfZ2V0X2ZsYXNoX25vZGUoY2hpcCk7CiAgICAuLi4KICAgIHJldCA9IG9mX3By
b3BlcnR5X3JlYWRfdTMyKGRuLCAibmFuZC1idXMtd2lkdGgiLCAmdmFsKTsKICAgIC4uLgp9CgpG
dXJ0aGVybW9yZSwgbXRkX2RldmljZV9yZWdpc3RlcigpIHdpbGwgYWxzbyBhY2Nlc3MgdGhlIG5v
ZGUgdG8gaW5jcmVtZW50Cml0cyByZWZjb3VudDoKCmRyaXZlcnMvbXRkL210ZGNvcmUuYzphZGRf
bXRkX2RldmljZSgpIHsKICAgIC4uLgogICAgbXRkX2NoZWNrX29mX25vZGUobXRkKTsKICAgIG9m
X25vZGVfZ2V0KG10ZF9nZXRfb2Zfbm9kZShtdGQpKTsKICAgIC4uLgp9CgpJZiBkeW5hbWljIERU
IHVubG9hZGluZyBkcm9wcyB0aGUgZmluYWwgcmVmZXJlbmNlIGJlZm9yZQptdGRfZGV2aWNlX3Jl
Z2lzdGVyKCkgY29tcGxldGVzLCBpdCBhcHBlYXJzIHRoZXNlIGxhdGVyIGNhbGxzIG1pZ2h0IGFj
Y2VzcwpmcmVlZCBtZW1vcnkuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNo
aWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDA4MTgyNDQyLjI3NzAwMzYtMS12dWxhYkBpc2Nhcy5h
Yy5jbj9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
