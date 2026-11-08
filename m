Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBC1606A326
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 00:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pdExMTMI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=Q4saO6ox
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gjyC2cRzuD1gExX2n0yF//Mg/ozoYG7hall23mEQ3vI=; b=pdExMTMIOgMw/mSbCvknTqH6+Q
	AEAbaHYIHxxIgOds9UyEOZhbQUR0V4N0FO2LnUNzyOB7nfdxs5IToPCU/lFfrHcgZJKNui0LNvKJi
	oXvtZ50vhHtTZd6td7i9MRLfk2BhQDbkSRcP/p5ZpweEoJHD6AA63L7r2pUw6tMDJtm4sSnMiHWpF
	tKNaJqnb22npjJlJ2ZhrKtUsLSkaJS43JROCXp3uDpb2RPkYUj2WfVauhXZ+OtFXwDQPtlj9MHPCO
	3aahTl4KxF2crOtWQ3XJGuq/M7jU2JeEkAsTeYyfyn5/6i4XM1vT7kc5TeAecN7u5WnCQBeLxBh18
	B9WWAeeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPr2h-0000000FYg2-0BXB;
	Sun, 08 Nov 2026 00:45:55 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPr2d-0000000FYfI-3gFY
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 00:45:53 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-37198ed3727so627804eec.0
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 16:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1794098749; x=1794703549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gDHxHqr/ibomT/hnh0MWIWapUMs27ULmVZLfvv9myQQ=;
        b=Q4saO6ox7y4x+tTuijMpTTiODPZKydcIy0GNyEqN3pBeOo3IWdq9dtg9WfsLkspyXw
         ll4KHcaWO5g4rOfSk5q1au8M4QvsPtbmg0Y1DnE2AxD5Li/EEThRpbdDQUf+myMm8aOT
         zhXWceeG8Wou1XkMTqMzFtERbkE/C8eNu9615fj34yqiLZCA+D4B1I+81QfE+KrzCxJu
         +8H37lG9bwq236S4LVfEmDOhpYE3gtDAvAP1Ncrarsmp0FL53tf9Tqkm6mMje6LTj1jB
         UZtYRlvdHt/1hMDNzQzCxcS5ucCwmQ2AgexutMEzeJL7+M+fdRnQfJfPQkXES9a6RyhZ
         upqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794098749; x=1794703549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDHxHqr/ibomT/hnh0MWIWapUMs27ULmVZLfvv9myQQ=;
        b=EA9GFcEuf0nYhk08pnEiSsIG0BclIDXqKlKJcnUh7G0Mndz3NvQdSB2Suwt/SVaP5W
         vyiY03mSsgEkVxC0lPPi8xiCTctDgdtIz63OsDaFB0kMocFm109XSR498o8/gU+VlhqO
         fCFRhnklocoL1rniUC1OQnnBZdB+0q/DOFlhAM4ttF1M1bNbVINNJs/kZFpShh3aab3Q
         yBVfgbiluDs2rdsHbQIWYLjC1fYEQE22KqDicseyG0meUs7A2h0NqSBAS6NgU8tSrwAI
         Mggwx6/ki5V+ArLS4M9WYlW+BfhwkyL8+Sdw4PfCHz7LotCIgCkJQHiAZaPOxam2y+tU
         uU9A==
X-Gm-Message-State: APuU4Z/XtHFbmzDRXInbXS0XWR9wuoq+CMQiKnqhRFdqX0Pz/EsfGuxd
	sBdEBnVOeBPE4McO1Y4+c+LHVx1OZfyvAfUhPxOuWbWgAL2Mo1h7dz6Y6oARLsAIYA==
X-Gm-Gg: AYBFou1ATOpX9uMTqnYStdqgy5QIX8uDyE6iFQxhm5L+7rP5feZLUjSMiwNCOr9lB79
	89BIv1Lf/yyUzwdGINuyOigA3IEGYMxXx2JqB+mIHv0FLosVaB1htkGei3zmoKuLdTUkOv3urza
	pG0VdqlGRbUZM4pVmHGvHMqFFmZsXj2cvmMAYXILLN5yBeSHqCYpsfzGBWAMrahIH7SP/ZjHVBL
	kjBdiuKa5CVk5nSIEdWADHCEOfsu4zMbXs2IRsTLRjQnHZr0/u9dlyVurOx+jGuiABZx4DuRyPP
	JPYbzfiTaRb1Ph+MtIUDDlmbzwly3AMFoqZ1b7UcWd84dnlXfmRz422UpCVO/iwE/hbrTuLOOPp
	3Tv7EHl6cFJIEHTBIa/GEo0WpyXPKRbHCoyFH+GSaKh51lSCdMGVAHpwCm7r/17Eje7m21zA6Xf
	B5UmhX3CFPs59ky8fhUpZCWeG77RKF9+Fwu3Iyu+BjNPztOU4FHCjiu0f/MfHSIgL/OQWMuTA/S
	FJ4Dt2SH/jfgPINEy0RLWcqeCHm30I80ZqsEFCUKYdyAMxwHAB+OScKu0HEs2I0+WK3pe1RvuMF
	hz/B6FqYBzOb0Wj4BhBVjotAI5fsblFgbbbk3dxvD08fepvxPt0vql5VElkvgKe/
X-Received: by 2002:a05:7022:408b:b0:1a3:cbd7:1269 with SMTP id a92af1059eb24-1b39fedb95cmr206919c88.23.1794098749215;
        Sat, 07 Nov 2026 16:45:49 -0800 (PST)
Received: from mparker-home-xcrbr.sjc.aristanetworks.com ([74.123.28.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375604109sm2115225c88.10.2026.11.07.16.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 16:45:48 -0800 (PST)
From: Matthew Parker <mparker@arista.com>
To: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Matthew Parker <mparker@arista.com>,
	Adam Calabrigo <adamc@arista.com>
Subject: [PATCH] mtd: spi-nor: issi: Add support for ISSI IS25LP512MG
Date: Sun,  8 Nov 2026 00:45:16 +0000
Message-ID: <20261108004516.896887-1-mparker@arista.com>
X-Mailer: git-send-email 2.51.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_164552_232946_08AE9025 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

Add support for the ISSI IS25LP512MG 512Mbit (64 MiB) SPI NOR flash.

The device provides JESD216B SFDP tables which accurately describe
fast-read modes and erase geometry. Flash read, write, and erase
operations across the full 64 MiB array have been verified on hardware.

Cc: stable@vger.kernel.org # v6.1+
Co-developed-by: Adam Calabrigo <adamc@arista.com>
Signed-off-by: Adam Calabrigo <adamc@arista.com>
Signed-off-by: Matthew Parker <mparker@arista.com>
---
 drivers/mtd/spi-nor/issi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 2f057d731df2..977dc5ba8028 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -101,6 +101,12 @@ static const struct flash_info issi_nor_parts[] = {
 	}, {
 		.id = SNOR_ID(0x9d, 0x60, 0x19),
 		.name = "is25lp256",
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x20),
+		.name = "is25lp512mg",
+		.size = SZ_64M,
+		.flags = SPI_NOR_QUAD_PP,
+		.parse_sfdp = true,
 	}, {
 		.id = SNOR_ID(0x9d, 0x70, 0x16),
 		.name = "is25wp032",
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
