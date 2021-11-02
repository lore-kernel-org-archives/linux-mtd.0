Return-Path: <SRS0=5hwZ=PV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC44C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Nov 2021 22:03:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9EC760EDF
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Nov 2021 22:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9EC760EDF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EmE3y+TTX92T0CmC9FunaCYJuzOOx3d+yoc+I08Zqmg=; b=bUH1bN2/McET0S
	h8uJmo7m7QM7Un5mA+APxICWG9oNGjFvagzmhKnwKC1SviwHJbhV3IlFJDo+OGw5uaQma9QEj8Hn7
	LzRQnuhE+wNkXww4Ue++Dq4wSc6jMX6RDu+27iVSARkIWYwGhysUf6WXAFSxdV3z89KRHa88EUFsw
	sw1Df21HVM4rAxg6eStw+4CdxnPAvaVAFvDu2UNGhGHIgD2qwki2IpHoGmSUSDhdz3x5qW7UNGus/
	fft/nB4/SxwFEVZoB2GBltHU5+dmvKZ4fZssYhZlD6n6/Wpn9Q/M0wD4hDb6atQ4FLVqHhaY816SV
	UWAGfDcdiAQ4HiLhiXfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi1rP-0036bN-1m; Tue, 02 Nov 2021 22:02:27 +0000
Received: from ms.lwn.net ([45.79.88.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi1rL-0036a2-Uy
 for linux-mtd@lists.infradead.org; Tue, 02 Nov 2021 22:02:25 +0000
Received: from meer.lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
 by ms.lwn.net (Postfix) with ESMTPA id F043C5ECA;
 Tue,  2 Nov 2021 22:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F043C5ECA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1635890540; bh=8pBr2TGHVgYTbZKGOPAv1jDSquEjlbn/oydrgdQgtK4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nr0bdIskuK2HW2Q8Cb+ryhQcfnecfgS2qIFFG8t0Lhb4/CSC/nJlM8fnEwozR90P2
 5nOaoPg9FVzojETa+vWez9nZbujYQxyPkAhzSFlvjuKcbKoPjiG8wzHU1EmCEc1Sfc
 9JczoYVn2KvbWysLKCLNBNxD91n4NoaLQKww/wYonip59A5O1GxKrPkfDXNK+QnXr4
 aKLnlu83RGYIJMsMt68uSr8uJPGnskpBfqA6i60F+hu/N5x8BSFRLrnoOwqU43ndNi
 zExnf+GC+77gu8NOVRM4x+uSr13jEwDyGYORVoURdtmZIQBWs5Pci8EtOX5o4C+4Gr
 uD7NThWjP8imQ==
From: Jonathan Corbet <corbet@lwn.net>
To: linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Boris Brezillon <bbrezillon@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH 6/9] mtd: remove unused header file
 <linux/mtd/latch-addr-flash.h>
Date: Tue,  2 Nov 2021 16:02:00 -0600
Message-Id: <20211102220203.940290-7-corbet@lwn.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102220203.940290-1-corbet@lwn.net>
References: <20211102220203.940290-1-corbet@lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_150224_026588_D0CB82F9 
X-CRM114-Status: GOOD (  12.52  )
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

Q29tbWl0IGQyNGRiZDc1NDFmZiAoIm10ZDogbWFwczogR2V0IHJpZCBvZiB0aGUgbGF0Y2gtYWRk
ci1mbGFzaCBkcml2ZXIiKQpyZW1vdmVkIHRoZSBsYXN0IHVzZXIgb2YgPGxpbnV4L210ZC9sYXRj
aC1hZGRyLWZsYXNoLmg+IGJ1dCBsZWZ0IHRoZSBoZWFkZXIKZmlsZSBiZWhpbmQuICBOb3RoaW5n
IHVzZXMgdGhpcyBmaWxlLCBkZWxldGUgaXQgbm93LgoKQ2M6IEJvcmlzIEJyZXppbGxvbiA8YmJy
ZXppbGxvbkBrZXJuZWwub3JnPgpDYzogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290
bGluLmNvbT4KQ2M6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+CkNjOiBWaWdu
ZXNoIFJhZ2hhdmVuZHJhIDx2aWduZXNockB0aS5jb20+CkNjOiBsaW51eC1tdGRAbGlzdHMuaW5m
cmFkZWFkLm9yZwpTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0
PgotLS0KIGluY2x1ZGUvbGludXgvbXRkL2xhdGNoLWFkZHItZmxhc2guaCB8IDI5IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyOSBkZWxldGlvbnMoLSkKIGRl
bGV0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L210ZC9sYXRjaC1hZGRyLWZsYXNoLmgKCmRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L210ZC9sYXRjaC1hZGRyLWZsYXNoLmggYi9pbmNsdWRl
L2xpbnV4L210ZC9sYXRjaC1hZGRyLWZsYXNoLmgKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IGU5NGI4ZTEyODA3NC4uMDAwMDAwMDAwMDAwCi0tLSBhL2luY2x1ZGUvbGludXgvbXRkL2xh
dGNoLWFkZHItZmxhc2guaAorKysgL2Rldi9udWxsCkBAIC0xLDI5ICswLDAgQEAKLS8qCi0gKiBJ
bnRlcmZhY2UgZm9yIE5PUiBmbGFzaCBkcml2ZXIgd2hvc2UgaGlnaCBhZGRyZXNzIGxpbmVzIGFy
ZSBsYXRjaGVkCi0gKgotICogQ29weXJpZ2h0IMKpIDIwMDggTW9udGFWaXN0YSBTb2Z0d2FyZSwg
SW5jLiA8c291cmNlQG12aXN0YS5jb20+Ci0gKgotICogVGhpcyBmaWxlIGlzIGxpY2Vuc2VkIHVu
ZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKLSAqIHZlcnNp
b24gMi4gVGhpcyBwcm9ncmFtIGlzIGxpY2Vuc2VkICJhcyBpcyIgd2l0aG91dCBhbnkgd2FycmFu
dHkgb2YgYW55Ci0gKiBraW5kLCB3aGV0aGVyIGV4cHJlc3Mgb3IgaW1wbGllZC4KLSAqLwotI2lm
bmRlZiBfX0xBVENIX0FERFJfRkxBU0hfXwotI2RlZmluZSBfX0xBVENIX0FERFJfRkxBU0hfXwot
Ci1zdHJ1Y3QgbWFwX2luZm87Ci1zdHJ1Y3QgbXRkX3BhcnRpdGlvbjsKLQotc3RydWN0IGxhdGNo
X2FkZHJfZmxhc2hfZGF0YSB7Ci0JdW5zaWduZWQgaW50CQl3aWR0aDsKLQl1bnNpZ25lZCBpbnQJ
CXNpemU7Ci0KLQlpbnQJCQkoKmluaXQpKHZvaWQgKmRhdGEsIGludCBjcyk7Ci0Jdm9pZAkJCSgq
ZG9uZSkodm9pZCAqZGF0YSk7Ci0Jdm9pZAkJCSgqc2V0X3dpbmRvdykodW5zaWduZWQgbG9uZyBv
ZmZzZXQsIHZvaWQgKmRhdGEpOwotCXZvaWQJCQkqZGF0YTsKLQotCXVuc2lnbmVkIGludAkJbnJf
cGFydHM7Ci0Jc3RydWN0IG10ZF9wYXJ0aXRpb24JKnBhcnRzOwotfTsKLQotI2VuZGlmCi0tIAoy
LjMxLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
