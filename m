Return-Path: <SRS0=aBH3=RZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E97AEC43381
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2019 13:26:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B33E62190A
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2019 13:26:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uruOsrfy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="EWkFbFJk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B33E62190A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nic.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=znDNOFz11iI1K0VG47p0KeS6Wu//7/4IuPeDWhFDX/I=; b=uruOsrfyRnLuSK
	HNM7tpwt4N4NHh9HL7jlXMwhi6/BxyZQZOwnJ7udWOdN7UVzuXCU5dO+sfy4DWRRF75wINFxBZ+wm
	Lcx10f8z0FVUZbQvyR1CK6SIoNhvSmrJFNLlZkSQF0819DPZTz2/rjRDGh/8KevcORYconBOV5WgJ
	oJ7bg/gqlV5br5WN9KW1gnIA+OsA+lkcjg8KU6PnEV2F3HlxeLAtCGOEqDDzFELwk23/2eT2HEeNA
	SlRSf9g4W8XN3zOzZxbD7IJOZYNwuzQ5b7uNPSv7MufDt6AhwVGbqS9fLzIn3ED0H7diQidIUmiR+
	fSicbNpdBHTURbBMEapA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7KBu-0007Fh-OS; Fri, 22 Mar 2019 13:26:34 +0000
Received: from mail.nic.cz ([217.31.204.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7KBk-00077f-Dg
 for linux-mtd@lists.infradead.org; Fri, 22 Mar 2019 13:26:26 +0000
Received: from dellmb.labs.office.nic.cz (unknown
 [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
 by mail.nic.cz (Postfix) with ESMTP id 9305663429;
 Fri, 22 Mar 2019 14:26:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
 t=1553261180; bh=T1ea1whGbuB64LqwaP4mycc52mPP3IFC/EL0RtbzEbA=;
 h=From:To:Date;
 b=EWkFbFJkfRhDsRm1tGXbEepbH7Xz1i02OSBxotRmhQOjsOq4LiDsyDHyylqs1CADd
 Iy5Daj+g1w6Qo+epaH6rhCudVim5dnhiFubX24e8r65Ph1gNfLVhqjsq80Zi7oWbRP
 0iOeZFF/3Zk3x4rta1oCJ0/TLGkdcMNqYsNtCKY8=
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v1 mtd/nand/next 2/3] mtd: rawnand: fsl_elbc: Implement RNDOUT
 command
Date: Fri, 22 Mar 2019 14:26:18 +0100
Message-Id: <20190322132619.10339-3-marek.behun@nic.cz>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190322132619.10339-1-marek.behun@nic.cz>
References: <20190322132619.10339-1-marek.behun@nic.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at mail
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_062624_772241_0F089DDC 
X-CRM114-Status: UNSURE (   7.01  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 Shreeya Patel <shreeya.patel23498@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhpcyBpcyBuZWVkZWQgZm9yIFNXIEVDQy4KClNpZ25lZC1vZmYtYnk6IE1hcmVrIEJlaMO6biA8
bWFyZWsuYmVodW5AbmljLmN6PgotLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2ZzbF9lbGJjX25h
bmQuYyB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZnNsX2VsYmNfbmFuZC5jIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvZnNsX2VsYmNfbmFuZC5jCmluZGV4IDliZmZiNjcyNDQ4YS4uZmI2MDkyODI5
ZDc4IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9mc2xfZWxiY19uYW5kLmMKKysr
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZnNsX2VsYmNfbmFuZC5jCkBAIC0zNTUsNiArMzU1LDE1
IEBAIHN0YXRpYyB2b2lkIGZzbF9lbGJjX2NtZGZ1bmMoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwg
dW5zaWduZWQgaW50IGNvbW1hbmQsCiAJCWZzbF9lbGJjX3J1bl9jb21tYW5kKG10ZCk7CiAJCXJl
dHVybjsKIAorCS8qIFJORE9VVCBtb3ZlcyB0aGUgcG9pbnRlciBpbnNpZGUgdGhlIHBhZ2UgKi8K
KwljYXNlIE5BTkRfQ01EX1JORE9VVDoKKwkJZGV2X2RiZyhwcml2LT5kZXYsCisJCQkiZnNsX2Vs
YmNfY21kZnVuYzogTkFORF9DTURfUk5ET1VULCBjb2x1bW46IDB4JXguXG4iLAorCQkJY29sdW1u
KTsKKworCQllbGJjX2ZjbV9jdHJsLT5pbmRleCA9IGNvbHVtbjsKKwkJcmV0dXJuOworCiAJLyog
UkVBRE9PQiByZWFkcyBvbmx5IHRoZSBPT0IgYmVjYXVzZSBubyBFQ0MgaXMgcGVyZm9ybWVkLiAq
LwogCWNhc2UgTkFORF9DTURfUkVBRE9PQjoKIAkJZGV2X3ZkYmcocHJpdi0+ZGV2LAotLSAKMi4x
OS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
