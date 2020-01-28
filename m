Return-Path: <SRS0=h4jW=3R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38E0C2D0DB
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 17:28:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F712214AF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jan 2020 17:28:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n7/rQ+ID"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F712214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Co5OWhv4gQYyLWPLXPFU65BTOdDd6/qvwGrafNuW70=; b=n7/rQ+ID0IGQRC
	UFp97Yb09sMN3NlfzvSCk5zwgaJy0zD/Vgnghl05blOu2b7+JAs8rJ4lwTiFN/YxkhKdw35WXb2kW
	xG7SmidlQUR61ISYNrtbkFHqzXmTCWxfPODe/fHGQZiaYAFzsWyc0x49MkCrvYiaNQ+/pJfETe7Ro
	aqkNH1Q8WUytAW/2ahrgFJjNTKxN+caob+sG8d8l7oDvsfd05Q5WGn+drDUYoAmBkcXU/JQkapH7G
	w4pcH+gt5mRmD3SNWV2c8kElXbjXy0JLO+OBZZjbLTiq80eawhdfChzkmMnl3RIa5Rbj2bIKaDdKE
	lSA/p9yKTwV14Ia9GZuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwUfE-0001nZ-To; Tue, 28 Jan 2020 17:28:36 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwUeD-0000iW-AH
 for linux-mtd@lists.infradead.org; Tue, 28 Jan 2020 17:27:35 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 542B81815230D;
 Tue, 28 Jan 2020 18:27:30 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Rno1Xkt29Iff; Tue, 28 Jan 2020 18:27:28 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id iO8tQmZ8aKCF; Tue, 28 Jan 2020 18:27:28 +0100 (CET)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/8] mtd-utils: Fix potential negative arguments passed to
 close(2)
Date: Tue, 28 Jan 2020 18:27:09 +0100
Message-Id: <20200128172715.19545-3-david.oberhollenzer@sigma-star.at>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200128172715.19545-1-david.oberhollenzer@sigma-star.at>
References: <20200128172715.19545-1-david.oberhollenzer@sigma-star.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200128_092733_497971_B76D8CA5 
X-CRM114-Status: GOOD (  12.19  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Many tools open a file descriptor, close it a the end and have some
form of error path in between that jumps to the end.

In some cases, if opening the file fails the error path is taken and
the utility ends up closing one or more invalid file descriptors. It's
technically not a real issue but something that pretty much any static
analysis tool barks at.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 nand-utils/nanddump.c                  | 3 ++-
 nand-utils/nandwrite.c                 | 3 ++-
 nor-utils/rfddump.c                    | 2 +-
 tests/fs-tests/stress/atoms/fwrite00.c | 4 +++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/nand-utils/nanddump.c b/nand-utils/nanddump.c
index 841ed67..62699e0 100644
--- a/nand-utils/nanddump.c
+++ b/nand-utils/nanddump.c
@@ -549,7 +549,8 @@ int main(int argc, char * const argv[])
 
 closeall:
 	close(fd);
-	close(ofd);
+	if (ofd > 0 && ofd != STDOUT_FILENO)
+		close(ofd);
 	free(oobbuf);
 	free(readbuf);
 	exit(EXIT_FAILURE);
diff --git a/nand-utils/nandwrite.c b/nand-utils/nandwrite.c
index 8f21593..e8a210c 100644
--- a/nand-utils/nandwrite.c
+++ b/nand-utils/nandwrite.c
@@ -605,7 +605,8 @@ int main(int argc, char * const argv[])
 	failed = false;
 
 closeall:
-	close(ifd);
+	if (ifd > 0 && ifd != STDIN_FILENO)
+		close(ifd);
 	libmtd_close(mtd_desc);
 	free(filebuf);
 	close(fd);
diff --git a/nor-utils/rfddump.c b/nor-utils/rfddump.c
index 4ad2f91..01ab4c2 100644
--- a/nor-utils/rfddump.c
+++ b/nor-utils/rfddump.c
@@ -324,7 +324,7 @@ int main(int argc, char *argv[])
 	return 0;
 
 err:
-	if (out_fd)
+	if (out_fd > 0)
 		close(out_fd);
 
 	close(fd);
diff --git a/tests/fs-tests/stress/atoms/fwrite00.c b/tests/fs-tests/stress/atoms/fwrite00.c
index 3406bba..877c63c 100644
--- a/tests/fs-tests/stress/atoms/fwrite00.c
+++ b/tests/fs-tests/stress/atoms/fwrite00.c
@@ -138,7 +138,9 @@ static void filestress00(void)
 			deleted = 1;
 		}
 	}
-	CHECK(close(fd) != -1);
+	if (fd > 0) {
+		CHECK(close(fd) != -1);
+	}
 	/* Sleep */
 	if (tests_sleep_parameter > 0) {
 		unsigned us = tests_sleep_parameter * 1000;
-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
