Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDCEC433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 27 Nov 2021 15:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=78HGEyUrWlNDhrS91GTqvkvrdq0byQwoyO+1ubLmYxw=; b=R7fDNOB0909/Ss
	VIPU4LP5Wm7FaNoKheLX7wVFyR8HN9Tk3hINSJZlF6hhKSDt+zB1RZ3P8gaQKbL0WaBSORcSoxbBl
	oc+hbcTO83juofmAdQXBqoclXZkGbs+o4Ukkp+DwikPwqSOEoP+rIY+Iw5tW67RAX8z29i9AVYFCD
	HHkSiO8t6ruXAIrfsjSfG7opkFOTWzuINvUMFEwoxvLVNmNJt5w3snW7cZDtBMVDH/VE7ijjRG3cH
	eWs2fvd7meTcVYzOjAu3VHf8hsVz9352JRXddkEjW9u0c/DPk5b0QIlxx1tUkMoa0jNsZs7q5CcKE
	kBcit5SSzJYaxGfVIxVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqzk7-00DvmC-AP; Sat, 27 Nov 2021 15:35:59 +0000
Received: from gofer.mess.org ([2a02:8011:d000:212::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqzk4-00Dvkm-IE
 for linux-mtd@lists.infradead.org; Sat, 27 Nov 2021 15:35:58 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 49AADC63BA; Sat, 27 Nov 2021 15:35:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
 t=1638027350; bh=nx0CDeyB7uvGkZ36Ws4odlIhB+uHlV61LweulhaibyQ=;
 h=Date:From:To:Cc:Subject:From;
 b=ELLlpkblGAiGv+tp4YOMO+EogyEycsVzvwWGRwLryG2XLR7ypTqqy6HHQZLaEE+yg
 v2CsarcBZNoDqxrMN4X+86NfwdJFfOGLNxT+Pw3lh/H/QsU+S0e7S5V5JfVXAA2nNH
 aN9OTpN1dOHo5/4W6y79UoxAoUFblkds3w3nBIt2JG6LVkkaNrVDov81SFATN/8zV0
 0IJ+WGyyJW0hC9jPpTPM08TVWnsNaNxcIsvYnISQ6du66yNeWxdLkdr1+XjspcbzKg
 Tbpiv0PNybbl6jCUOzrt3qyXI4g0FGfxQ+KTmOrKtG6T2/ZjMQPassfPInrsN7hcXy
 FQzGomsTOwgKg==
Date: Sat, 27 Nov 2021 15:35:50 +0000
From: Sean Young <sean@mess.org>
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH] Allow rfddump and rfdformat to work on a test mtdram
Message-ID: <20211127153550.GA23039@gofer.mess.org>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211127_073556_937035_0C5865A6 
X-CRM114-Status: GOOD (  10.88  )
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

rfd can be used with mtdram since commit e03a81213a9c ("mtd: rfd_ftl: allow
use of MTD_RAM for testing purposes"), which is in kernel v5.15.

Signed-off-by: Sean Young <sean@mess.org>
---
 nor-utils/rfddump.c   | 2 +-
 nor-utils/rfdformat.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/nor-utils/rfddump.c b/nor-utils/rfddump.c
index 01ab4c2..c85c067 100644
--- a/nor-utils/rfddump.c
+++ b/nor-utils/rfddump.c
@@ -200,7 +200,7 @@ int main(int argc, char *argv[])
 			return 1;
 		}
 
-		if (mtd_info.type != MTD_NORFLASH) {
+		if (mtd_info.type != MTD_NORFLASH && mtd_info.type != MTD_RAM) {
 			fprintf(stderr, "%s: wrong type\n", rfd.mtd_filename);
 			close(fd);
 			return 2;
diff --git a/nor-utils/rfdformat.c b/nor-utils/rfdformat.c
index 0a3d9fb..160c081 100644
--- a/nor-utils/rfdformat.c
+++ b/nor-utils/rfdformat.c
@@ -108,7 +108,7 @@ int main(int argc, char *argv[])
 		return 1;
 	}
 
-	if (mtd_info.type != MTD_NORFLASH) {
+	if (mtd_info.type != MTD_NORFLASH && mtd_info.type != MTD_RAM) {
 		fprintf(stderr, "%s: not NOR flash\n", mtd_filename);
 		close(fd);
 		return 2;
-- 
2.33.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
