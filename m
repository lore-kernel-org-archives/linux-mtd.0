Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015E2C2BBCA
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2024 09:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u6+960NKB4WL+W5eBIBceulI1yxNOsWI5ll0JIgimro=; b=o+wYv29tBw9ahB
	dSolLPHxzIN4XXQc2g1LR0Ayo8B9VNrdF3X4PQCg2rCtJkILwMoKI6ITH/JZpNOCBiunKsFqlOMOm
	Ly0cfOylVQ1dgPPRlmuH84CJ9qC0SUKA3he59H1R37ffq7lDgLlu+EXL1FkHsGm2YeCDoP7eF7v2I
	j0nCfbW1kobm4NE1yS+abQlLHRB4KrGhWEEFxcWiuh8yqIltHKskOU3iF9CZcodKohUtdconUFxbb
	KJ45OrqZSV8DvumM070Z7Y1A8B8dAkshWUbNS4QidAVBc+BAzLpbtkgrOZAJz0y9MUxvFLxUhh/bR
	HKrErs5flEFSpBtTuYqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM2X4-00000002HXN-0AZk;
	Tue, 25 Jun 2024 09:32:10 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM2X0-00000002HVk-25oB
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jun 2024 09:32:08 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id E887DA0E06;
	Tue, 25 Jun 2024 11:31:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=jqOG5ysnLZOZ6WX79LN01rD+JfmYfnoYRxkCIH5M/Aw=; b=
	AlBPowAz5+JtwBhJZkFUllPXZpNCxGsgMFykypOPf7cEE2Mz9vni49vGSg+9dte3
	RUx3V/zabtxDXga67j6pmamPvvmcVeAsTR1GBVk5Vufq5IDWnohYAhtLqGisXVBP
	wAb5QqrEfMna8bhKOwL6c2xnudd2LxkRhLgJtaNsvS+U2nZd4MZvhYMknegLxCqt
	0g7D3Qki3f8s/j2YQcr/Ygl4KV/HTwN6VqEd++UQnjQKuMgHZ+kWGXzTz6YgNJLb
	n5kmcwbA8U9HsT2G//3tu+rBPmX3ydsu0SFd1YiwYksoRsOgesgmMkDgPdPQ/E2b
	GKi2no4IglckNUdjAl1OaATwRWT3eImHlzg8j38PW0/prmZ681Clx670radVnzPC
	ErxK26oMJ/UQ7Kyq8guVYaNCH35bbeEkkZ/8Hyq8UDE7/bN7XrDAhgEzleatbebY
	mFxKkea+Vu/dnxpH6wAU2UfDmUaNBlxDVOhMoU/yzk8Uicltv3Ccmdsb9pLGfaxi
	3PyVED9U1WdeZJxyNSdqs9qK2xUzFrNExuiMKFiVPJjT8D0HP8TnZOGgYvjyp86W
	S84OTOLNL14stO7iL+O0l/Y/qKX6NafkOZcoMC9AGdlEL9tffEy24dtR9Qvu7ltI
	lbEohxSMbNqOHDQ0h3L5OdoqMmyVXd3C63c1w45o59s=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] mtd: cmdlinepart: Replace `dbg()` macro with `pr_debug()`
Date: Tue, 25 Jun 2024 11:31:47 +0200
Message-ID: <20240625093148.3579660-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1719307913;VERSION=7972;MC=1585764846;ID=1416094;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29916D3B546C7167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_023207_018139_BE1BFAD3 
X-CRM114-Status: UNSURE (   8.97  )
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

VGhpcyBtYWNybyB3YXMgbGVmdCBvdmVyIGZyb20gdGhlIGRhd24gb2YgR2l0IGhpc3RvcnkuCkZv
ciBzb21lIHJlYXNvbiBpdCB3YXMgZGVmaW5lZCBpbiBzdWNoIGEgd2F5IHRoYXQKeW91IG5lZWRl
ZCBkb3VibGUgYnJhY2tldHMgYXJvdW5kIGl0LiBSZXBsYWNlIGl0IHdpdGgKdGhlIG5vdy1zdGFu
ZGFyZCBgcHJfZGVidWcoKWAuCgpTaWduZWQtb2ZmLWJ5OiBDc8Oza8OhcywgQmVuY2UgPGNzb2th
cy5iZW5jZUBwcm9sYW4uaHU+Ci0tLQogZHJpdmVycy9tdGQvcGFyc2Vycy9jbWRsaW5lcGFydC5j
IHwgMTggKysrKystLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9wYXJzZXJzL2NtZGxp
bmVwYXJ0LmMgYi9kcml2ZXJzL210ZC9wYXJzZXJzL2NtZGxpbmVwYXJ0LmMKaW5kZXggYjM0ODU2
ZGVmODE2Li41MDRlNWZhMmI0NWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL3BhcnNlcnMvY21k
bGluZXBhcnQuYworKysgYi9kcml2ZXJzL210ZC9wYXJzZXJzL2NtZGxpbmVwYXJ0LmMKQEAgLTQ0
LDE0ICs0NCw2IEBACiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVkZSA8bGludXgv
ZXJyLmg+CiAKLS8qIGRlYnVnIG1hY3JvICovCi0jaWYgMAotI2RlZmluZSBkYmcoeCkgZG8geyBw
cmludGsoIkRFQlVHLUNNRExJTkUtUEFSVDogIik7IHByaW50ayB4OyB9IHdoaWxlKDApCi0jZWxz
ZQotI2RlZmluZSBkYmcoeCkKLSNlbmRpZgotCi0KIC8qIHNwZWNpYWwgc2l6ZSByZWZlcnJpbmcg
dG8gYWxsIHRoZSByZW1haW5pbmcgc3BhY2UgaW4gYSBwYXJ0aXRpb24gKi8KICNkZWZpbmUgU0la
RV9SRU1BSU5JTkcgVUxMT05HX01BWAogI2RlZmluZSBPRkZTRVRfQ09OVElOVU9VUyBVTExPTkdf
TUFYCkBAIC0xOTksOSArMTkxLDkgQEAgc3RhdGljIHN0cnVjdCBtdGRfcGFydGl0aW9uICogbmV3
cGFydChjaGFyICpzLAogCXBhcnRzW3RoaXNfcGFydF0ubmFtZSA9IGV4dHJhX21lbTsKIAlleHRy
YV9tZW0gKz0gbmFtZV9sZW4gKyAxOwogCi0JZGJnKCgicGFydGl0aW9uICVkOiBuYW1lIDwlcz4s
IG9mZnNldCAlbGx4LCBzaXplICVsbHgsIG1hc2sgZmxhZ3MgJXhcbiIsCisJcHJfZGVidWcoInBh
cnRpdGlvbiAlZDogbmFtZSA8JXM+LCBvZmZzZXQgJWxseCwgc2l6ZSAlbGx4LCBtYXNrIGZsYWdz
ICV4XG4iLAogCSAgICAgdGhpc19wYXJ0LCBwYXJ0c1t0aGlzX3BhcnRdLm5hbWUsIHBhcnRzW3Ro
aXNfcGFydF0ub2Zmc2V0LAotCSAgICAgcGFydHNbdGhpc19wYXJ0XS5zaXplLCBwYXJ0c1t0aGlz
X3BhcnRdLm1hc2tfZmxhZ3MpKTsKKwkgICAgIHBhcnRzW3RoaXNfcGFydF0uc2l6ZSwgcGFydHNb
dGhpc19wYXJ0XS5tYXNrX2ZsYWdzKTsKIAogCS8qIHJldHVybiAodXBkYXRlZCkgcG9pbnRlciB0
byBleHRyYV9tZW0gbWVtb3J5ICovCiAJaWYgKGV4dHJhX21lbV9wdHIpCkBAIC0yNjcsNyArMjU5
LDcgQEAgc3RhdGljIGludCBtdGRwYXJ0X3NldHVwX3JlYWwoY2hhciAqcykKIAkJfQogCQltdGRf
aWRfbGVuID0gcCAtIG10ZF9pZDsKIAotCQlkYmcoKCJwYXJzaW5nIDwlcz5cbiIsIHArMSkpOwor
CQlwcl9kZWJ1ZygicGFyc2luZyA8JXM+XG4iLCBwKzEpOwogCiAJCS8qCiAJCSAqIHBhcnNlIG9u
ZSBtdGQuIGhhdmUgaXQgcmVzZXJ2ZSBtZW1vcnkgZm9yIHRoZQpAQCAtMzA0LDggKzI5Niw4IEBA
IHN0YXRpYyBpbnQgbXRkcGFydF9zZXR1cF9yZWFsKGNoYXIgKnMpCiAJCXRoaXNfbXRkLT5uZXh0
ID0gcGFydGl0aW9uczsKIAkJcGFydGl0aW9ucyA9IHRoaXNfbXRkOwogCi0JCWRiZygoIm10ZGlk
PTwlcz4gbnVtX3BhcnRzPTwlZD5cbiIsCi0JCSAgICAgdGhpc19tdGQtPm10ZF9pZCwgdGhpc19t
dGQtPm51bV9wYXJ0cykpOworCQlwcl9kZWJ1ZygibXRkaWQ9PCVzPiBudW1fcGFydHM9PCVkPlxu
IiwKKwkJICAgICB0aGlzX210ZC0+bXRkX2lkLCB0aGlzX210ZC0+bnVtX3BhcnRzKTsKIAogCiAJ
CS8qIEVPUyAtIHdlJ3JlIGRvbmUgKi8KLS0gCjIuMzQuMQoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
