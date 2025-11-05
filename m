Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0791CCFA17
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Nov 2025 07:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ddDwAs5DfSbj/baM/BqkfvXZ9b/xC9CrK+2EIzTfGEA=; b=dmZr4XXMQBwElb
	6gVoFZkryUisx/5p/c14YpaBLImIrqyeso+U5Bivh7YNZ3dLqAoXJwebKK+RlGQYsQ3rNAy604TLE
	wHqoCYmJNJL7A6WuR4RKNfzoOWXnRY1e4vOOtMrIpHEB6BUD2Ic8UAf+ecpXUi1DkHwXit3WflIqr
	1kLFDhaZXmyjofyYB7dMm7Vte6xFdiMMpSQwirnol71+disyfApEF/l1gJn+V06q1xhJUdvoI57PY
	4zge9aTfib5rM/NqViB+WIwxFBhnDISsN33ZjvwuPTbqZH19ECEKFqqo2bboNeF8HQuCIMU21LRmp
	s59uRIb0nWC/qGU+PoaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYGM-0000000DEDI-3Qpy;
	Wed, 05 Nov 2025 07:49:02 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYGK-0000000DEC5-3T4J
	for linux-mtd@lists.infradead.org;
	Wed, 05 Nov 2025 07:49:01 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-33b5a3e8ae2so529150a91.1
        for <linux-mtd@lists.infradead.org>; Tue, 04 Nov 2025 23:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762328940; x=1762933740; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=67ZeKLSOELkdf7hZ3ElB6t0tmcMRx6X+ahqbBDAQsHI=;
        b=HT1kA1KmlkrwMcz5noFY2ZuQ2Kqu/E95W7rbs2SPQa0qH6jSnY8uNxi/goMbSxOGpV
         0T9zk/7UIjo+7du9oje/nZVDFYAlkxtJPwfCsQ1Tqo87dxWi8jz5n/ME5ZSvIi9J7OBz
         8py8pq5Rti6bt1DfrR79AgM9pE3NmDcZwtrk86oQe+mbmUFMhS9UntYI8iJwJF85NgqK
         /mbKhjNjRr20xbxFV96Epur++qbIMPIvq6YZeJN3QI5zF8btdPj0fANH6m+ygLQYhutS
         /nK0CM6PNLperdBfKFDlfVIM3ZpjHS/9T39fcqCGHgOuJl/OqFOUWfcpeZz+sld3peqr
         PQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762328940; x=1762933740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67ZeKLSOELkdf7hZ3ElB6t0tmcMRx6X+ahqbBDAQsHI=;
        b=bZxBuIKxXsaeIsBD4ugLGgGEPQJ6rkRJYoLib1mxZB4S7hRtXmhJiLxSOolkIA4vkW
         sZ9kNTR6NZr9/pytYsP1H7WaeIaRGH6fNzfk2SEx6BthhF3AMXFY7My6BrS0RdbwnKGd
         PoRFnO5I3FyoQi2mRCaSTyNSocqF2vS1IH+AzeiOVwaIINKHptkD5Q5GLmC69ZS2aaRd
         2Z4pCLgwX9Q0wrsdhoyVVVG2hxAOJjuK9FW3QbyAd2nM+LShV8zpWdcauKfRc2l11vQj
         Gp0Ls5vzx1rqVjv/PQxSa1xp0x9BxOJaGeKerg1fUBAHMDaTYtSQQW02yGPFxdLQOzR0
         BnJA==
X-Gm-Message-State: AOJu0YzNU7/k9As3uA4v46T1FO97VY9QWcg+ntWFr+s/e0ownd9A5xmT
	SqPToqKtHVWZFjB1H1CaHNtxrY7FaHfyQGi90QU06YTaBEGZMjE1HTVN
X-Gm-Gg: ASbGncuXnVgJ0ZLwCGujVTD5on4e62lwuoYeYc/bc9cYXB0GblBTVTgWo3FHZ0JoiJV
	tYb1wd4cdFrKxda3aG1A1/tnaEtLabMBUJsO/Z7Jvf9pjo8hkEK5Uk7nfR3zW979bLl0RUTN/xG
	t8tzK3HdNyqxL5D7u1gb3sA9NsoFDz/XJC9jXZo0tACo2tqQ0q5Ej5QFfqJIuCtgNxLu44aU3Km
	cADMosGSTAwbD3rBzElXoMUGWj5N92fabUY7j5GdHx0ksNsrWBS3YTAEe/MgwByxrJ4i2+rdSZ0
	lq6JbaecSNX8JbTbQFtNvLrqNTTSc3u+uWW+BaUPjQeC3ga+PpCP+8cH5ylQn3vS4nBe/r+lq5D
	brkrKNcUEveknl3LrdbqFnbkPb4uqQxusGjyZzqxikoIWC/8eWP5mLuYQKLVFTT7XGn7RtxOMtq
	YIn/K+iTI6ALmCBvuyq/ulWN6LArWye5VzpReaejS8wpLT3ZWcCD/ErfAwMZpuXkeZ3Yu5
X-Google-Smtp-Source: AGHT+IGiAjmimpFxip7tKyRV/j/iBgiRLLtxcZ9CmJII710Vk29R8WF2Yb7ekv3p05OB8NoLOiQPmA==
X-Received: by 2002:a17:902:d48c:b0:24b:270e:56d4 with SMTP id d9443c01a7336-2962ad0fba0mr31189105ad.4.1762328939942;
        Tue, 04 Nov 2025 23:48:59 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a5d74csm52174625ad.76.2025.11.04.23.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 23:48:59 -0800 (PST)
From: Takahiro Kuwano <tkuw584924@gmail.com>
X-Google-Original-From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Date: Wed, 05 Nov 2025 16:48:00 +0900
Subject: [PATCH v2 3/3] mtd: spi-nor: spansion: SMPT fixups for S25FS-S
MIME-Version: 1.0
Message-Id: <20251105-s25fs-s-smpt-fixup-v2-3-c0fbd0f05ce7@infineon.com>
References: <20251105-s25fs-s-smpt-fixup-v2-0-c0fbd0f05ce7@infineon.com>
In-Reply-To: <20251105-s25fs-s-smpt-fixup-v2-0-c0fbd0f05ce7@infineon.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, tkuw584924@gmail.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762328922; l=3384;
 i=Takahiro.Kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=BmyA0IWr4hyGD3vWpVmVZJSRjcmviFzh7aQHkcg3mN0=;
 b=cCCLczuqHGsz4VITljQmiPangRInHsMQ5kOIX+SUpSeApzYq1bXAEQFpcUMLeg3Y2GHhDg3mI
 32T/H45ZKvtAZevI1d8HFsm2H+S9LZ21HzIr6+ufxoiVXPJDusRY3zD
X-Developer-Key: i=Takahiro.Kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_234900_933064_3CD4D58E 
X-CRM114-Status: GOOD (  17.29  )
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

S25FS-S family supports SMPT that helps to detect sector layout settings
in configuration registers, but some of parameters in the table are
wrong or undetermined so the fixups below are required.

Read Any Register op is used to read configuration registers that
related to sector map. The op requires 8 cycles latency by default.
Implement smpt_read_dummy() to set correct dummy cycles.

Map ID is structured by combination of CR3NV[3], CR1NV[2], and CR3NV[1].
However, in S25FS512S, CR3NV[1] is RFU and always 0, while map IDs
defined in the table assume it is always 1. Implement smpt_map_id() to
fix map ID for S25FS512S. Other densities in S25FS-S family (256Mb and
128Mb) don't need this fix as CR3NV[1] in those chips is configurable
and map IDs are correctly defined in SMPT.

Co-developed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org> # S25FS512S
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index a0296c871634678be509cb30d26e18debff3066d..8498c7003d888bf96bd402694f7774bb2558706c 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -785,8 +785,46 @@ s25fs_s_nor_post_bfpt_fixups(struct spi_nor *nor,
 	return 0;
 }
 
+static void s25fs_s_nor_smpt_read_dummy(const struct spi_nor *nor,
+					u8 *read_dummy)
+{
+	/*
+	 * The configuration detection dwords in S25FS-S SMPT has 65h as
+	 * command instruction and 'variable' as configuration detection command
+	 * latency. Set 8 dummy cycles as it is factory default for 65h (read
+	 * any register) op.
+	 */
+	*read_dummy = 8;
+}
+
+static void s25fs_s_nor_smpt_map_id_dummy(const struct spi_nor *nor, u8 *map_id)
+{
+	/*
+	 * The S25FS512S chip supports:
+	 *   - Hybrid sector option which has physical set of eight 4-KB sectors
+	 *     and one 224-KB sector at the top or bottom of address space with
+	 *     all remaining sectors of 256-KB
+	 *   - Uniform sector option which has uniform 256-KB sectors
+	 *
+	 * On the other hand, the datasheet rev.O Table 71 on page 153 JEDEC
+	 * Sector Map Parameter Dword-6 Config. Detect-3 does use CR3NV[1] to
+	 * discern 64-KB(CR3NV[1]=0) and 256-KB(CR3NV[1]=1) uniform sectors
+	 * device configuration. And in section 7.5.5.1 Configuration Register 3
+	 * Non-volatile (CR3NV) page 61, the CR3NV[1] is RFU Reserved for Future
+	 * Use and set to 0, which means 64-KB uniform. Since the device does
+	 * not support 64-KB uniform sectors in any configuration, parsing SMPT
+	 * table cannot find a valid sector map entry and fails. Fix this up by
+	 * setting SMPT by overwriting the CR3NV[1] value to 1, as the table
+	 * expects.
+	 */
+	if (nor->params->size == SZ_64M)
+		*map_id |= BIT(0);
+}
+
 static const struct spi_nor_fixups s25fs_s_nor_fixups = {
 	.post_bfpt = s25fs_s_nor_post_bfpt_fixups,
+	.smpt_read_dummy = s25fs_s_nor_smpt_read_dummy,
+	.smpt_map_id = s25fs_s_nor_smpt_map_id_dummy,
 };
 
 static const struct flash_info spansion_nor_parts[] = {

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
