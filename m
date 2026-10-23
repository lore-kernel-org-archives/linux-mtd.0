Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A96606A323
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Oct 2026 09:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XEJfkGWy;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Fj6L85/D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vHxYdYzqxHysCdcjOU6hQDRcZrYdG4Et+tLXUd93rJE=; b=XEJfkGWyst4d1LBix1jf3wunAE
	Ogs70PGwTNhPzOAUOGYCK5asSbl5WmjQyx7SGHbVWbfn9BdYl+cy5jqSFi+u4f+2Qe0wpazMnAeh0
	j3wuDdchCs7HNjT1Tclo/q/f98VMT0Fiol25wEpbcxQ1GBsyT3nQbdmTHh+qCzBu3SM9PxhW2UnLl
	DulQoeLvm2SPmxLeL22VO8LHh9ERHg2XhaThzTJFOWlm8JU+aVlpKopbIRiMC0uNkAw/XsGF8ips2
	89LTU9GlPvmlTClxvl8+DWzBdg2lgd4r8ugbIDErSTRNrMBrLpVbjOptiQoxFAI+QsZxP2p1OH+Nj
	2T3ZI0YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBWA-0000000G0bo-4241;
	Fri, 23 Oct 2026 09:24:54 +0000
Received: from out203-205-221-245.mail.qq.com ([203.205.221.245])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBW7-0000000G0an-011w
	for linux-mtd@lists.infradead.org;
	Fri, 23 Oct 2026 09:24:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792747486; bh=3f6imDR2vRKyLye/bDJFbSuE21+KoRdI2+Zivaf+5T0=;
	h=From:To:Cc:Subject:Date;
	b=Fj6L85/DqB0c2HilkcQviv6/uYkj3wdCPBdCnGOfCYFe6yz+rrfiLZH93kAQCNAv+
	 p/valHBxku08aeDpm/nFE38dCk3V4BxBUvE6hERm5kyBTKUzq9P7gvcmy9sKu4hcBL
	 qb9xEV2LhMct+t83w7wFmmOnMYS2bWtIi/ZOzXCE=
Received: from shuai-VMware-Virtual-Platform.. ([218.28.192.28])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 62C976F9; Fri, 23 Oct 2026 17:24:44 +0800
X-QQ-mid: xmsmtpt1792747484tqz3no2eq
Message-ID: <tencent_760494FBADB4184B967C5A93312EB198F506@qq.com>
X-QQ-XMAILINFO: MMq8nqC7jH0Be+Q4kCeE5YewTFo/Q+KySvYfoDEq585+InnVtKGJg+wBVHPKH8
	 VWgoEQ6I23ziCP+yiU8PpYY5p/xjX+n/1JNQ3mUbarjU+6ZHHDFnsD9VlChiL9axH4QkvBSyLskc
	 tOQ0CF+OcYwDI3/s5mqMFC7urtMMz9BAJZmrZ61hWdB8d6J4FPZEaMmPU8RFIHOQ3badhaijj/R/
	 xdBivTPjkW+D115wc9lDnPh9RM7c0qkKzxvjjXS5XaU85rqE9MemdAl1/jm0MesVqEoqLnQ2/Rrt
	 lfpoQp8JDR9++AuqSGqSlNJ0UnB9ngCkPr55EMbSu/eIihrsTx3xZt+mgJkKqmRA/ureRxQpCtgb
	 6fM2leAZLhdJwSd/4Y/QTLv1gAPyoTIz1vrmRp0HL2lsAccmszyOhEv/tB2Tj6P7ohPjLbe0UmcS
	 S8dal4BLcTXkWVoThFxRHaJJraAlOhet0JxmXX87XEMlt1CYM+csOPh3LauWWHm6tLNRPl3I7GVu
	 xyFmNIYwt1RQL4ymhEAwQoJJbkQx1jpGGzRg4lKhva9DIWPPnn7Xgc09gP2kiggS/AoZKDdnr/id
	 w8045s//BPkW0IXYH8b0HWKNFzGLQlyVelqN+m4fFQnLHuwQFJFf9WdRvFmclpR/ioK49MKSTpkA
	 6iaMAZX6fbjqGMHFy1CQhPAk+hzqH7yDkq2u/ue1HgtsXsIS/oln7AFqX3KMeGG0Sz1yjJWUIub9
	 L32rbyxABfVKKCJaP8OcunbF8H7M9U39Y73JV6YncUvzfqlFg0JLmbQqgTdsRCrC/tl8YH+X4GX3
	 WJJ9z0sBo+K8h4ToyoxmoykFyGQCwfDvEfgp8Z4Zn1TMq0OxyFzOckeui3uJHAOIK/YnOkcwMcD8
	 Yr/QBytkonztbFTD+agJ5KEER3RD+e3uRyuJ2mCHVBlB1RwPn2B7ebfiBMEgYtD51naT5fPrxhdT
	 aqlwYakYpz7p8Km9F3UirbMPa4doiXLXlZazpe8y0EhCdWwQKD9NNjvv1eMEotIRAm28chWhtWfg
	 cUqp4b3B/vb8UzcaaKYlOgBNfSk3QX+PwnvSjpck6BUQFEBwDK
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Shuai Liu <847807867@qq.com>
To: linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org,
	mwalle@kernel.org,
	takahiro.kuwano@infineon.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: fix missing space after comma in legacy flash names
Date: Fri, 23 Oct 2026 17:24:44 +0800
X-OQ-MSGID: <20261023092444.3969022-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_022451_357362_89C0EC0C 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the missing space between string literals in the legacy
flash_info entries. Cosmetic only, no functional change; silences
checkpatch ERRORs on these lines.

Signed-off-by: Shuai Liu <847807867@qq.com>
---
 drivers/mtd/spi-nor/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8bc117b46..31cba60bd 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3898,11 +3898,11 @@ static const struct spi_device_id spi_nor_dev_ids[] = {
 	 */
 	{"at25df321a"},	{"at25df641"},	{"at26df081a"},
 	{"mx25l4005a"},	{"mx25l1606e"},	{"mx25l6405d"},	{"mx25l12805d"},
-	{"mx25l25635e"},{"mx66l51235l"},
+	{"mx25l25635e"}, {"mx66l51235l"},
 	{"n25q064"},	{"n25q128a11"},	{"n25q128a13"},	{"n25q512a"},
 	{"s25fl256s1"},	{"s25fl512s"},	{"s25sl12801"},	{"s25fl008k"},
 	{"s25fl064k"},
-	{"sst25vf040b"},{"sst25vf016b"},{"sst25vf032b"},{"sst25wf040"},
+	{"sst25vf040b"}, {"sst25vf016b"}, {"sst25vf032b"}, {"sst25wf040"},
 	{"m25p40"},	{"m25p80"},	{"m25p16"},	{"m25p32"},
 	{"m25p64"},	{"m25p128"},
 	{"w25x80"},	{"w25x32"},	{"w25q32"},	{"w25q32dw"},
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
