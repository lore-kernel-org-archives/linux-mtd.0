Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD72E606A322
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Oct 2026 09:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h8ArCQVh;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Jm7MsM9d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=jt/SscFUvrOtXIFQxvEhmxd1cmsMUL6sg8ScABXxWFw=; b=h8ArCQVhEPB0fqqPipIkbVd/8O
	5urnBGet96bZEzFSgaCju+Ugpa9quSIZaREVjRuzW3Kx0+Djha8Poy2Kphzg4xreJ2N/SzI/jutyL
	Yo56h41QhtQYtTo0G8XlVCQGIf3vlXhxNi8ouHSk0SeeDhfTaE7KinQlBEgxn8Xf24oj1N3QzMTfU
	kGtZCqIWwiZXDXjia47FWfyUx51/Ye/GDCYffde37bHlFbXEqHJYOkbeOr1SD+zLqz/tq+CPkzFzV
	Ow8nFqpu+/l6m5INcpABP/LoGd8Lakl/x1L0SaOaEZBafxeJv/SVA+Y+UkWQQMfssoG24jjBQEPoq
	2uLEyYQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBWC-0000000G0cB-0CEh;
	Fri, 23 Oct 2026 09:24:56 +0000
Received: from out203-205-221-245.mail.qq.com ([203.205.221.245])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBW7-0000000G0ao-01cc
	for linux-mtd@lists.infradead.org;
	Fri, 23 Oct 2026 09:24:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792747488; bh=BL7WTqlyAuABxLMGFYeqZBZi8m9RhMdcDsbXwZkbTyo=;
	h=From:To:Cc:Subject:Date;
	b=Jm7MsM9dJ1Z2eZA8HSAoHklHX7dJJuhWbzeL9UxBLM/FWa02VvpKgE8ASlN6pzFMG
	 JzM3vLrjXAKne1lTu+5AR56le/qQoT8bliNaFsJnPf37PWTcJor9JWDnMQZ1G2vRT4
	 38md9xLY9otB1rGX/BlQcYFpPfXF5ekxJzE9bCb0=
Received: from shuai-VMware-Virtual-Platform.. ([218.28.192.28])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 62E256FD; Fri, 23 Oct 2026 17:24:46 +0800
X-QQ-mid: xmsmtpt1792747486tffp7h4dp
Message-ID: <tencent_25C57E270CDC01A4CB5894E4EF9B80708509@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnLcB4XdZEN2saK1lBHpYhsukBkey5CE/1hbH/SkgAQPijYkX+omo
	 znx4IFyVogVUimtgm8rw37JbX8ii1DODcz8JRs3vgT1SU6Xdan5SE3lFj/XHzqiLQonBCUYoI54Z
	 WwMj2VzOEnamAeKtHL0IFnRMljKpNOHDY0AsVsHGzOzenD+YI9o/7t4xGIxfmaKDZ1Tn6y/rXGY8
	 03WHL31bv6Ccpk0n70D17xvo7MmAVmRer2o6xJkIj4DrHyDbQ4qNeUMuuxMl/S9/AZstN1KN3Y+S
	 OGETsCtoL2eja2s1vFwFnEDK6DptQ8JHc5Vt+iydY1+QoVLQGxWOA4ku1/LqCxAww7wEdm3o0l7V
	 XWcjLTRdErVbqGZvXnqLSQpWbsKngElz3n7xB0oqj9ytzCmelOrlO97OOU9vKTUFc48/qqR2t2KR
	 8lWNYQiTH1at7bmhWPOBGUHzriGMHM/wOS0bvNKDWlTz1QLi55YxHuN/dJm+VD8+YKVNOm2C5Cam
	 lMTQbJpWGXmTBhLeOvwWQm2TwfQW9qh5Kd9/6rBR6jCNKcYLZjoHEYuZM5OCl8ggT24uqmuIi/Kh
	 pAcpujwriM+YL1BFtNms77hPAIFpawrbziuL9LZ1U8tn50rLqW1zQcPKQZNnn2dY8jYnKFA+2Xve
	 yWkUOAYWB3RrKv3wmmL3pO5ob7Qke+LOPK+Vxtot1LQhR6jVWYkkH4dnXADwsjiukWsWcScvwzFu
	 zvn7ljb+NFOzhCMpiafSWedsAPGaNo/KlzjGADYm/4YXPcppTyvSYAivZCrUnuFfd0QB1Hu/DT6Z
	 g8xRq75Y/HdpD7jrlKPr9Te2sjMu3pAXAuNhrKC2v7i/XPyvea9CjY3KFBjyR+KIbL6DQ2WVRfdZ
	 wUhSgigl7ch+SWzxTIYAksqOKRZDr0YWck/68LS/WhSYPFcm8OPSO4KtBBEVF0XcBWWR3vi9NiuL
	 OFpZqwi17cR3E+S4lD02AdERYaX9PISm4biJOQGBaqvzIVmET3WBa9l3D4ZkCUDoBvh5teBtGChc
	 9e8jZJpxRVT/Bs3T6z76wXsEt7DhlGk5iclEBJBDGHJJiSRw5L
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Shuai Liu <847807867@qq.com>
To: linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org,
	mwalle@kernel.org,
	takahiro.kuwano@infineon.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: swp: remove unnecessary else after return
Date: Fri, 23 Oct 2026 17:24:45 +0800
X-OQ-MSGID: <20261023092445.3969055-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_022451_357168_AEBD4D16 
X-CRM114-Status: UNSURE (   8.88  )
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

Drop the else branch following an if that always returns, and move
the trailing comment onto the fall-through path. Cosmetic only, no
functional change; silences a checkpatch WARNING.

Signed-off-by: Shuai Liu <847807867@qq.com>
---
 drivers/mtd/spi-nor/swp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 235070b21..3b8176b9d 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -135,9 +135,9 @@ static bool spi_nor_check_lock_status_sr(struct spi_nor *nor, loff_t ofs,
 	if (locked)
 		/* Requested range is a sub-range of locked range */
 		return (offs_max <= lock_offs_max) && (ofs >= lock_offs);
-	else
-		/* Requested range does not overlap with locked range */
-		return (ofs >= lock_offs_max) || (offs_max <= lock_offs);
+
+	/* Requested range does not overlap with locked range */
+	return (ofs >= lock_offs_max) || (offs_max <= lock_offs);
 }
 
 bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, const u8 *sr)
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
