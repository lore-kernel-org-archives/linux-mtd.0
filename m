Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E881FF8861
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2026 11:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j1MpEGvnUfPcTAJhgmR5/sCxtlYkbY5/KU5ngVBFAgY=; b=ZubHJs8Vakn7Z8
	UA/oPoRm+fU4qNmeFtfqoplL9XZyL2L38hFPZW1J386PxyGl9Pr3q8ZXgSiHlURnNaYdbmO5qa5Y6
	7f7eP+jyCT5J3HKYi23RvKN0GmiQu3zmjkjHcwyFelcuAXsZKdNP2t3dixXUivGHyNfOpMkrchfSS
	f2aJe8Ga+l58YGNwtduF1F7zI++pG7ohzCSJ7CQYmcn635JkyVNIeX9/osaeqSvilviAtTUsVlEs8
	QntgPUw869OxzPu2fMYijq1/MmVUrIBx078wkUn0QUS0EWCEuidT5MyG2+GwFFCJ+YCIlWrRsuZhs
	JMokY1ar4UuHFxPbv+Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHK4k-0000000GnH6-0G86;
	Mon, 27 Apr 2026 11:24:30 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHK4h-0000000GnGD-3mPM
	for linux-mtd@lists.infradead.org;
	Mon, 27 Apr 2026 11:24:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=k9+9Xcyc6Vw4VjuwsHzY/CazhicUbx2QqBvYrGBkzgQ=; b=OQTfxdCsbU891ED9n4igbB2uh/
	J279dwosYlStPKrVIMhaZUH6YE8A+uLHOqY8hG/q5WAwNLOMlJ7uu1tZg64BQLJ2EwjxTsx1JvXWK
	l7K43Ck2Wn+qe43GoPPAIMVVc02U8sf0enf9yhsOYNZh/VbBCwnuBii04y2/FAfOm9pvZEzk+Xj8x
	Jnw2IOWzMhi9S04sM7DUglVBQicwn1HjpksOUgAIqoc8s6qSt7xrC0JDxCd46CLos7iSD9z/Sz4M5
	jimLNbDVRDIntgjTAIq+vsinx7dJOo4xodyFgFh6V75DRCg4Sb+3Yv0VDgkWfoVHBunV7YdMWv5fJ
	eBmM31Xg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <bage@debian.org>)
	id 1wHK4e-005RoO-0U;
	Mon, 27 Apr 2026 11:24:24 +0000
From: Bastian Germann <bage@debian.org>
To: linux-mtd@lists.infradead.org
Cc: Bastian Germann <bage@debian.org>
Subject: [PATCH] lib: libmtd: fix sign extension of ioctl request in mtd_xlock
Date: Mon, 27 Apr 2026 13:24:16 +0200
Message-ID: <20260427112422.132746-1-bage@debian.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Debian-User: bage
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_042427_983489_D2BA7DC0 
X-CRM114-Status: GOOD (  10.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The req parameter of mtd_xlock() was declared as int.  On 64-bit
big-endian architectures such as ppc64el, _IOW()-derived ioctl numbers
have bit 31 set (because _IOC_WRITE=4 is placed at bit 29).  Storing
such a value in a signed int and then passing it to ioctl(), whose
second argument is unsigned long, causes implicit sign extension:
0x80084d05 becomes 0xffffffff80084d05, which does not match the
expected constant and fails the cmocka check_expected() assertion in
the unit tests for mtd_lock and mtd_unlock.

Fix by declaring req as unsigned long, matching the type used by the
ioctl() syscall interface.

Fixes: test_mtd_lock / test_mtd_unlock failures on ppc64el
Signed-off-by: Bastian Germann <bage@debian.org>
---
 lib/libmtd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index f588e09..96a2167 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -902,7 +902,7 @@ static int mtd_valid_erase_block(const struct mtd_dev_info *mtd, int eb)
 }
 
 static int mtd_xlock(const struct mtd_dev_info *mtd, int fd, int eb,
-		     int blocks, int req, const char *sreq)
+		     int blocks, unsigned long req, const char *sreq)
 {
 	int ret;
 	struct erase_info_user ei;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
