Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F1060A262D
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 17:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4fsKxVRH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kUlCpMqJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+zENyGeR6+3AOw6AOdXPMcCo/92dHSACAVo80H9R3PQ=; b=4fsKxVRHR2oq+P7scXBT+LBHeG
	grSAT68JM4o8D/3BxE1y4p6Zt4GyKtuVKZQQHPuan3AjWWvqyqKp8hqW1MVUgFp+FPbsGAO/akT7J
	wVtPsaAL3Z0XJEBXiWBL2Y4mV54zGeGRCVxhivE2iFuNrpIn11LPzfhwon3kNYegJAKKe+HSisy0t
	XNJMMXZKGU8ASaEM+y9xP7DYwvKUactR/liHA+5/NczzUET5qt2fvKDjVxjm+TDHFSiGYpax+eDOm
	p2GJ+OTdvVVACjAsfOUa984IsNzSctrG59+YWzRQjQvQ/Hu4NasAV1Fpk1uwowQJN63wxkz0eSbUM
	hJI5uurQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqfk-0000000CHG6-2mQ9;
	Fri, 30 Oct 2026 17:45:48 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqfg-0000000CH9W-109r
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 17:45:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BF85F1A13D3;
	Fri, 30 Oct 2026 17:45:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8DEAC603C2;
	Fri, 30 Oct 2026 17:45:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53E25103290EE;
	Fri, 30 Oct 2026 18:45:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793382341; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DG1JBpUTlS5f9aH9Dpc7zAZ04nyBnibfgVsDZjMZhts=;
	b=kUlCpMqJbRMJyytmrj9Rmzguv+uDzCEN2CyuzEF82ckxwDGoleN01QDbEVvxnrRyrMo7Zi
	Xwou1m12byVsxA7JBtTZyYP2sTqm+R1kUC1R1fVlFlJtjaCI6fomQdetlDIvjSXaklrDEZ
	n/CCNFqMFkHNkJKN5SudiXpT3FUkGEkIinV09040f8VsmEqkvZYtta7mCaNXCUXgUGfVWR
	05pizApk/SB/0OwT6w9caZwOkI7ezSnWvSLp8ere7qIgXnwoUPLrPkH215lgWcEUcR2lNu
	TWB5lWxD3Rz7Adl1EOPPeE4XJK41CtOuGErm9T6++LlHaAbzoXmJ/zPHf/ciPQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 30 Oct 2026 18:45:30 +0100
Subject: [PATCH 06/13] mtd: spinand: winbond: Add 1S_1S_1S continuous read
 variant
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261030-winbond-master-w25nxxlvw-v1-6-91f67407dc8b@bootlin.com>
References: <20261030-winbond-master-w25nxxlvw-v1-0-91f67407dc8b@bootlin.com>
In-Reply-To: <20261030-winbond-master-w25nxxlvw-v1-0-91f67407dc8b@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Daisuke Mizobuchi <mizo@atmark-techno.com>, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_104544_460981_9B66B1A8 
X-CRM114-Status: GOOD (  10.92  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The speed jump is not amazing, yet the feature exists and brings a few %
of extra speed.

$ flash_speed /dev/mtd0 -C
...
page read speed is 966 KiB/s
testing multiple pages read speed
2 page read speed is 977 KiB/s
3 page read speed is 984 KiB/s
4 page read speed is 984 KiB/s
5 page read speed is 987 KiB/s
6 page read speed is 991 KiB/s
7 page read speed is 992 KiB/s
8 page read speed is 988 KiB/s
9 page read speed is 992 KiB/s
10 page read speed is 991 KiB/s
11 page read speed is 995 KiB/s
12 page read speed is 991 KiB/s
13 page read speed is 995 KiB/s
14 page read speed is 995 KiB/s
15 page read speed is 995 KiB/s
16 page read speed is 996 KiB/s
32 page read speed is 992 KiB/s
64 page read speed is 996 KiB/s
...

Data integrity can be checked with the new mtd-utils tool:

$ nandcontreadtest /dev/mtd0
testing 2 blocks from 0 to 1 (2 good), seed 37
success: verified 524288 bytes read in 517.787 ms (988.82 KiB/s)

Link: https://lore.kernel.org/linux-mtd/20261030144108.2211604-1-miquel.raynal@bootlin.com
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 8bf2d4e08bec..72f041b87bda 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -39,6 +39,13 @@
  * always at least provide the column. Keep using address cycles, but
  * reduce the number of dummy cycles accordingly.
  */
+#define WINBOND_CONT_READ_FROM_CACHE_1S_1S_1S_OP(ndummy, buf, len, freq) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),				\
+		   SPI_MEM_OP_ADDR(1, 0, 1),				\
+		   SPI_MEM_OP_DUMMY(ndummy - 1, 1),			\
+		   SPI_MEM_OP_DATA_IN(len, buf, 1),			\
+		   SPI_MEM_OP_MAX_FREQ(freq))
+
 #define WINBOND_CONT_READ_FROM_CACHE_FAST_1S_1S_1S_OP(ndummy, buf, len, freq) \
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x0b, 1),				\
 		   SPI_MEM_OP_ADDR(1, 0, 1),				\
@@ -216,7 +223,8 @@ static SPINAND_OP_VARIANTS(cont_read_cache_variants,
 		WINBOND_CONT_READ_FROM_CACHE_1S_1S_4S_OP(4, NULL, 0, 0),
 		WINBOND_CONT_READ_FROM_CACHE_1S_2S_2S_OP(4, NULL, 0, 0),
 		WINBOND_CONT_READ_FROM_CACHE_1S_1S_2S_OP(4, NULL, 0, 0),
-		WINBOND_CONT_READ_FROM_CACHE_FAST_1S_1S_1S_OP(4, NULL, 0, 0));
+		WINBOND_CONT_READ_FROM_CACHE_FAST_1S_1S_1S_OP(4, NULL, 0, 0),
+		WINBOND_CONT_READ_FROM_CACHE_1S_1S_1S_OP(3, NULL, 0, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_variants,
 		SPINAND_PROG_LOAD_1S_1S_4S_OP(true, 0, NULL, 0),

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
