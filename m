Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED38606A333
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2026 09:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yuGCyTPe;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=astralinux.ru header.i=@astralinux.ru header.a=rsa-sha256 header.s=mail header.b=UYznJyHn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=x7rYQruWRTUf19AXXMtKM8RZ9xVkQhP2xUI+sFWk+3E=; b=yuGCyTPeMpan/zLkE8NBNF1OJP
	iuEo0O/q3wLyDbCjhc+IJa8c2zO8Un28AnNNeqjJpp/0UlcXqx0n/KJjLqTG1FJuq++Z6kplj2FDD
	U90ZJwkHO2cdJPsKpteqQLww28p3vKThWHG9WN9yKF/Hi+KgqUTsf3WG51A2/5UnI02VccGpRg9o9
	zAvX0g1OFfyFeC0i5RwQxtIcARWGdJP+JYCP6Uf+CahNkmdKrMiZkWDaReSMmO98VRzRENSLGOk6b
	ThnxdxvtWChDgX3VWaFxQEIh+KHt26qHHyBzaWvzcQdrzht8BfHJzBGXkze+fvE1t+UkVkEj2XMm9
	DPDhpHqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoig-0000000G5ko-2RQO;
	Mon, 02 Nov 2026 09:52:50 +0000
Received: from mail-gw01.astralinux.ru ([37.230.196.243])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoie-0000000G5hq-0qbG
	for linux-mtd@lists.infradead.org;
	Mon, 02 Nov 2026 09:52:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=astralinux.ru;
	s=mail; t=1793613158;
	bh=Nob264xXleauE6t2oflw9XoRF0JlXcR5+ar1pZlg5BE=;
	h=From:To:Cc:Subject:Date:From;
	b=UYznJyHn/zFvt2KtUaAUPEQC1+ySyA9x6wTP3UYa+PSY/Xm/k+s9lkD6Ha5r7stv5
	 f2MpK8SAx3JZouGY6TEeABhUA2+LGjnbwMGljpOkB8W0SoXseAYYmywswJXbOcYE1F
	 da03Kk98PpSLkpd1cBk3EQ6os5KJEci3BPbiEINcvVRkBWrO/Ys2Jzmr7RUfIoMols
	 lUTCUc4/AjdwW6zNUYZoG6dJL/46TZe2IZd1vZFgN2rNXvq677wlqjeL2Ir2xQNYzu
	 0Ud+KeGf9vVwi6SSTbx2w6CHHakVW6Xv5Z0NO6HxnVrc3CHPpGUkzpj9RW9aTAg1tn
	 YtF7Rx/GXnSTA==
Received: from gca-sc-a-srv-ksmg01.astralinux.ru (localhost [127.0.0.1])
	by mail-gw01.astralinux.ru (Postfix) with ESMTP id 0BBB4250C8;
	Mon,  2 Nov 2026 12:52:38 +0300 (MSK)
Received: from new-mail.astralinux.ru (unknown [10.205.207.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail-gw01.astralinux.ru (Postfix) with ESMTPS;
	Mon,  2 Nov 2026 12:52:32 +0300 (MSK)
Received: from DESKTOP-D46TNHI (unknown [10.198.31.164])
	by new-mail.astralinux.ru (Postfix) with ESMTPA id 4jJ6Sb3Xfyz2s2s;
	Mon, 02 Nov 2026 12:52:31 +0300 (MSK)
From: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>,
	Sasha Levin <sashal@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 5.10] mtd: core: call _get_device() with the master MTD
Date: Mon,  2 Nov 2026 12:52:12 +0300
Message-ID: <20261102095213.104-1-mdmitrichenko@astralinux.ru>
X-Mailer: git-send-email 2.54.0.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: mdmitrichenko@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 133 0.3.133 d508d579b02cdb6df47808421a9b9e12fc9fb75b, {diag_burst_silent}, {date_rfc_vio_soft_silent}, {Tracking_from_domain_doesnt_match_to}, astralinux.ru:7.1.1;new-mail.astralinux.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 207172 [Nov 02 2026]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.27
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854, bases: 2026/11/02 08:04:00 #28779785
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_015248_769917_19CB301F 
X-CRM114-Status: GOOD (  11.82  )
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

From: Karl Mehltretter <kmehltretter@gmail.com>

commit 12b31d1acd20b3185bb5f0748db0cf6874c8e9d1 upstream.

__get_mtd_device() calls the master's _get_device() callback with mtd,
which may be a partition. __put_mtd_device() passes the master.

This breaks gluebi partitions because gluebi_get_device() uses
container_of() and therefore requires the master MTD. Pass the master
to _get_device(), matching _put_device().

Fixes: 46b5889cc2c5 ("mtd: implement proper partition handling")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
[ mdmitrichenko: Keep the existing try_module_get()/module_put() error
  path. 5.10 predates commit 79c4a5625021 ("mtd: call external _get and
  _put in right order"). ]
Signed-off-by: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>
---
Backport fix for CVE-2026-98833

 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index b2d88ff90e93..d960d4ed2e5b 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -990,7 +990,7 @@ int __get_mtd_device(struct mtd_info *mtd)
 		return -ENODEV;
 
 	if (master->_get_device) {
-		err = master->_get_device(mtd);
+		err = master->_get_device(master);
 
 		if (err) {
 			module_put(master->owner);
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
