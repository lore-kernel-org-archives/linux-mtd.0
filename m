Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0F7E7718D
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Dec 2024 20:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hhaAVIibb9y+bP7zPg5Y2BUHhgK5YkwPkq5eF/ukNZ0=; b=g3xjMmg91dOdOt
	3fBsSGeN/66yKeZTM6Y93iEpSHWLu6ryKNPHb/sDc4AYWQ1yERWRv+TO2Ykjbdu9ZEsyFbe0Oo130
	WPZS3u1T/Moh6gla7/jm6l8zxQWZ5pvvcjZXJaSz2OhUCJemTUM0z7o5J2kumia7pHutjTS6j6OfK
	C70oLS+ncu/JWYVOeQsdllNmT3lWlYEUHkHwaIzhobhGO7+Sumufu+xTiiCKWlpLKaE0LxAHJAt6n
	xXsxeQ1+OcE/p8tO3XnLEY9/0zVji9skoBJpZyTqte9p9nyBn7pJmT/BI5ugtiB5l/zinqgyqf9VP
	E8uMt1aSAFm1dmzUoWwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPSMy-00000008nXt-3Fnv;
	Sun, 22 Dec 2024 20:16:08 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPSMt-00000008nWc-3PRJ
	for linux-mtd@lists.infradead.org;
	Sun, 22 Dec 2024 20:16:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734898557;
	bh=sV2dAgXG1UmFsR97Dpvx/evkTywnSxm2+4SY45GAZD4=;
	h=From:Date:Subject:To:Cc:From;
	b=ZND1VkQm8UEGnD3BcUtYyGBt7FZoi8U5H/XbI57noh97GayMNl4W32fJNSUdTIq38
	 RFoPrreoRbmnEkOYGX4yL5zQSNYCzXnlBetVT+5paUI/MLs+i+Hm33ez6E1udBkzTo
	 sd0S0Z3W5u0ksPvYj5T/NsbEk7KH9PMa9xOPQcEI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 22 Dec 2024 21:15:55 +0100
Subject: [PATCH] mtd: spi-nor: sysfs: constify 'struct bin_attribute'
MIME-Version: 1.0
Message-Id: <20241222-sysfs-const-bin_attr-mtd-v1-1-ee13140a4e9b@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAHpzaGcC/x3MQQqEMAxA0atI1gba6EavMohUm2oW1qEpooh3t
 7h8i/9vUE7CCn11Q+JDVPZYYOsK5tXFhVF8MZCh1hIR6qVBcd6jZpwkji7nhFv2GBpjO+MpUOu
 g5P/EQc5v/Rue5wWN0bliagAAAA==
X-Change-ID: 20241222-sysfs-const-bin_attr-mtd-f30190d2f24a
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734898556; l=1907;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=sV2dAgXG1UmFsR97Dpvx/evkTywnSxm2+4SY45GAZD4=;
 b=NeBYVYMxdhp/PGM3CVSoOGt4KFfQ7d8zsAJRXmS2FSRFhaAZQhpkHbRfTvX/lVEso8p7SfjGO
 p5bA387wgfFBU7c/jm3jfvYb6LF7PRamtqnrVd26/b8vh0/Nj1yvLWw
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_121604_032190_A46EEF86 
X-CRM114-Status: UNSURE (   8.70  )
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

VGhlIHN5c2ZzIGNvcmUgbm93IGFsbG93cyBpbnN0YW5jZXMgb2YgJ3N0cnVjdCBiaW5fYXR0cmli
dXRlJyB0byBiZQptb3ZlZCBpbnRvIHJlYWQtb25seSBtZW1vcnkuIE1ha2UgdXNlIG9mIHRoYXQg
dG8gcHJvdGVjdCB0aGVtIGFnYWluc3QKYWNjaWRlbnRhbCBvciBtYWxpY2lvdXMgbW9kaWZpY2F0
aW9ucy4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDxsaW51eEB3ZWlzc3NjaHVo
Lm5ldD4KLS0tCiBkcml2ZXJzL210ZC9zcGktbm9yL3N5c2ZzLmMgfCA4ICsrKystLS0tCiAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3lzZnMuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3lzZnMu
YwppbmRleCA1ZTllYjI2ODA3M2QxOGUwYTQ2MDg5MDAwZjE4YTMyMDBiNGJmMTNkLi40ZjEyZmY3
NTVkZjA2Y2VlMDQxMjVlZmQ1MDM2MjQ1YzUxYjQ5YWY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL210
ZC9zcGktbm9yL3N5c2ZzLmMKKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zeXNmcy5jCkBAIC01
MCw3ICs1MCw3IEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpzcGlfbm9yX3N5c2ZzX2VudHJp
ZXNbXSA9IHsKIH07CiAKIHN0YXRpYyBzc2l6ZV90IHNmZHBfcmVhZChzdHJ1Y3QgZmlsZSAqZmls
cCwgc3RydWN0IGtvYmplY3QgKmtvYmosCi0JCQkgc3RydWN0IGJpbl9hdHRyaWJ1dGUgKmJpbl9h
dHRyLCBjaGFyICpidWYsCisJCQkgY29uc3Qgc3RydWN0IGJpbl9hdHRyaWJ1dGUgKmJpbl9hdHRy
LCBjaGFyICpidWYsCiAJCQkgbG9mZl90IG9mZiwgc2l6ZV90IGNvdW50KQogewogCXN0cnVjdCBz
cGlfZGV2aWNlICpzcGkgPSB0b19zcGlfZGV2aWNlKGtvYmpfdG9fZGV2KGtvYmopKTsKQEAgLTYy
LDkgKzYyLDkgQEAgc3RhdGljIHNzaXplX3Qgc2ZkcF9yZWFkKHN0cnVjdCBmaWxlICpmaWxwLCBz
dHJ1Y3Qga29iamVjdCAqa29iaiwKIAlyZXR1cm4gbWVtb3J5X3JlYWRfZnJvbV9idWZmZXIoYnVm
LCBjb3VudCwgJm9mZiwgbm9yLT5zZmRwLT5kd29yZHMsCiAJCQkJICAgICAgIHNmZHBfc2l6ZSk7
CiB9Ci1zdGF0aWMgQklOX0FUVFJfUk8oc2ZkcCwgMCk7CitzdGF0aWMgY29uc3QgQklOX0FUVFJf
Uk8oc2ZkcCwgMCk7CiAKLXN0YXRpYyBzdHJ1Y3QgYmluX2F0dHJpYnV0ZSAqc3BpX25vcl9zeXNm
c19iaW5fZW50cmllc1tdID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBiaW5fYXR0cmlidXRlICpj
b25zdCBzcGlfbm9yX3N5c2ZzX2Jpbl9lbnRyaWVzW10gPSB7CiAJJmJpbl9hdHRyX3NmZHAsCiAJ
TlVMTAogfTsKQEAgLTEwNCw3ICsxMDQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGF0dHJpYnV0
ZV9ncm91cCBzcGlfbm9yX3N5c2ZzX2dyb3VwID0gewogCS5pc192aXNpYmxlCT0gc3BpX25vcl9z
eXNmc19pc192aXNpYmxlLAogCS5pc19iaW5fdmlzaWJsZQk9IHNwaV9ub3Jfc3lzZnNfaXNfYmlu
X3Zpc2libGUsCiAJLmF0dHJzCQk9IHNwaV9ub3Jfc3lzZnNfZW50cmllcywKLQkuYmluX2F0dHJz
CT0gc3BpX25vcl9zeXNmc19iaW5fZW50cmllcywKKwkuYmluX2F0dHJzX25ldwk9IHNwaV9ub3Jf
c3lzZnNfYmluX2VudHJpZXMsCiB9OwogCiBjb25zdCBzdHJ1Y3QgYXR0cmlidXRlX2dyb3VwICpz
cGlfbm9yX3N5c2ZzX2dyb3Vwc1tdID0gewoKLS0tCmJhc2UtY29tbWl0OiBiY2RlOTVjZTMyYjY2
NjQ3OGQ2NzM3MjE5Y2FhNGY4MDA1YThmMjAxCmNoYW5nZS1pZDogMjAyNDEyMjItc3lzZnMtY29u
c3QtYmluX2F0dHItbXRkLWYzMDE5MGQyZjI0YQoKQmVzdCByZWdhcmRzLAotLSAKVGhvbWFzIFdl
acOfc2NodWggPGxpbnV4QHdlaXNzc2NodWgubmV0PgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
