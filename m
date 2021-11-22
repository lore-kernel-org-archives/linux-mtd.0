Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F5EC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 13:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V5XCimW2qmOmNYz9B1pSqcSOD2r0mg515Ac83vkMk/c=; b=zWeXGnLhqEDoFU
	9HvQrBqpZ8KA9nJ5DaK7lbrDFU2lWs7fpHMDiA6N0I2SXpd4jrfOW9R9JRdL7DeT7rmWKjfcswO4p
	3JC/HUd61N1E3Ozlh8RsMboC7+XxbcNl+va29FjtMHYBjGQIi1Zg4paCBa5eV7WSwLTn91zJf/Sw6
	tgFP6E6M0yEDPF0ImxZsH+9L6/F3NrlcHWuTRereaktSbUSqK7TnHikY5E4m1QeaVvkYlYnNGI5Rz
	6QxXqjrYGtqEZsP8a1cGonCY6DmYDxR1GNs/3QaflO9bUEtV+7aR5WKvsxwld+5MYOBaZsdN4Iyzc
	jpf5eJ/sBwM72kIPasYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp9GX-00GcuJ-Ju; Mon, 22 Nov 2021 13:21:49 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp9GU-00GcsX-OM
 for linux-mtd@lists.infradead.org; Mon, 22 Nov 2021 13:21:48 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:e4da:38c:79e9:48bf])
 by laurent.telenet-ops.be with bizsmtp
 id MRMg2600V4yPVd601RMgip; Mon, 22 Nov 2021 14:21:41 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mp9GO-00EJ8H-B7; Mon, 22 Nov 2021 14:21:40 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mp9GN-00GMM7-Tu; Mon, 22 Nov 2021 14:21:39 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] mtd: rawnand: mpc5121: Remove unused variable in
 ads5121_select_chip()
Date: Mon, 22 Nov 2021 14:21:38 +0100
Message-Id: <20211122132138.3899138-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_052146_972793_1E08C1AC 
X-CRM114-Status: UNSURE (   9.32  )
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

ZHJpdmVycy9tdGQvbmFuZC9yYXcvbXBjNTEyMV9uZmMuYzogSW4gZnVuY3Rpb24g4oCYYWRzNTEy
MV9zZWxlY3RfY2hpcOKAmToKZHJpdmVycy9tdGQvbmFuZC9yYXcvbXBjNTEyMV9uZmMuYzoyOTQ6
MTk6IHdhcm5pbmc6IHVudXNlZCB2YXJpYWJsZSDigJhtdGTigJkgWy1XdW51c2VkLXZhcmlhYmxl
XQogIDI5NCB8ICBzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKG5hbmQpOwogICAg
ICB8ICAgICAgICAgICAgICAgICAgIF5+fgoKRml4ZXM6IDc1OGI1NmY1OGI2NmJlYmMgKCJtdGQ6
IHJhd25hbmQ6IFBhc3MgYSBuYW5kX2NoaXAgb2JqZWN0IHRvIGNoaXAtPnNlbGVjdF9jaGlwKCki
KQpTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3Jn
PgotLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L21wYzUxMjFfbmZjLmMgfCAxIC0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
bXBjNTEyMV9uZmMuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21wYzUxMjFfbmZjLmMKaW5kZXgg
Y2IyOTNjNTBhY2I4NzZmZS4uNWI5MjcxYjljMzI2NTViNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvbXBjNTEyMV9uZmMuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tcGM1
MTIxX25mYy5jCkBAIC0yOTEsNyArMjkxLDYgQEAgc3RhdGljIGludCBhZHM1MTIxX2NoaXBzZWxl
Y3RfaW5pdChzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKIC8qIENvbnRyb2wgY2hpcHMgc2VsZWN0IHNp
Z25hbCBvbiBBRFM1MTIxIGJvYXJkICovCiBzdGF0aWMgdm9pZCBhZHM1MTIxX3NlbGVjdF9jaGlw
KHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsIGludCBjaGlwKQogewotCXN0cnVjdCBtdGRfaW5mbyAq
bXRkID0gbmFuZF90b19tdGQobmFuZCk7CiAJc3RydWN0IG1wYzUxMjFfbmZjX3BydiAqcHJ2ID0g
bmFuZF9nZXRfY29udHJvbGxlcl9kYXRhKG5hbmQpOwogCXU4IHY7CiAKLS0gCjIuMjUuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
