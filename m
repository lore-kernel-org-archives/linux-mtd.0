Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DE2C79F82
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Sep 2026 01:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lq0VUStmyrKdM8ZtrIKMo4whbLqHJ63wmhhh8Yn7RZk=; b=IX4yxhsugMeDrZ
	O5yTOw2mjBi5hSEf+EfsF2Yk6cAiS7VWI7p9xmoeaJ4SjazVsFfvDF3uD5IWMebYvr7rZdGoExEGj
	uHudVGUdy0arkyutcZAGzjhACvAIZUcRvNYw0GNe/MHhKjH4UkRtDLGpqHVRLvYEbTn6fgz4bszgQ
	SiHOSvAGVJ6r4mj5uAvEqQT/EXxR8axw1Ngt/514ts6GRsXw6G3MMm5LMr0OeSFgjEJ7txRpL4eax
	lK8xwzZTGUZj09oddTtzGsXF41EJszcQs9YXxfzcZthCbPrye/AlLyrPsdrB0yPWeE9ECXkPKcL5/
	gR99JaZTpu0GKP9X3asQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2eql-00000003Ylz-3wrf;
	Sat, 05 Sep 2026 01:05:43 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2eqi-00000003YlD-3Bw9
	for linux-mtd@lists.infradead.org;
	Sat, 05 Sep 2026 01:05:42 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-46b037da544so858836fac.3
        for <linux-mtd@lists.infradead.org>; Fri, 04 Sep 2026 18:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788570339; x=1789175139; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+trEjFtLc9/1KfuFoq6WFVPGEpoZWjiCbNYrmRmER54=;
        b=CN/4lq/cQXnIRf4a6ygKKWOHZAR+TZm9Zm+C8qzLctepfnW+K6PY0vSZGsge6pxon8
         4SajBki8+H/w2MpBsV4j0Zk7zn7mrZA4oQbitwQBSHRi67Vw7HOOzb1S8Ey9XDhr+G2y
         QYSFwydOk95j4zc5ACyIzllhIGUmWWRpZZPyWnvjzHajiuxq57NRMpS5Gf4qAS0bmC5G
         msTj6gvcKIFIY2w5NKooBAT5wkVX2Hh7beQMu1aWEBU3gQZnSQF0wrpgT0kw0KP4txBv
         PJnCe4yyH2WUka7V0HRgbsEWK04QwekNwcXU6J9Wb/XC2Sg3F+pFDRzRLMIUYfnSV9wx
         KyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788570339; x=1789175139;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+trEjFtLc9/1KfuFoq6WFVPGEpoZWjiCbNYrmRmER54=;
        b=d9lFAdEKUkaYZI38gfMyrvOWIDl4OXG2oYM76kA9ruVWzh6THgANAs/c0E6nm6Nwf/
         MImKK3TTkSzds0OuzOcf0E2jnoteKZLu8RY5edpymTVpSk+f4kbVLtBSfjp56wfCCl49
         R/6hGplOaZa8V2GVL0pFTTZi4ai04vf/4dZrFCcMsrTEo2u5YsJvZMJbqu83RN8iwQOt
         +z7kqd7muwkJzI3mYaavsB0awImNKea6kW8YSerHEcU0POTQMDhq4U2Xnd5eHfp/RYye
         WJA8Ya55gzjSCfdQL2UxRiUEmvMxfdRYMe+tecdwp5iM5x9n5IKLprAgSlqbg5VGBaAi
         iDgg==
X-Gm-Message-State: AFuF++mJ49Gu2kUK1yiJ0iiN9GhJiSBT+BTG/EubZYWsvzV9MVIQnYo4
	EPd0Oz5of8x2cSdYxwu0bva6TdSXLlNFHgdSoa3KGS2nkKzB93YLxed+
X-Gm-Gg: AYBFou0dASNyGQjXnUxBYmd+nLf9zcisQKZrjL702t2TCX7KIczdNl3ssQ8bLNybp6J
	+tmnyw8wfak4ubXnao8593JpnoCG+i5KEy296L4UoFSmUZz5zb6W7Dr8v1rm5g6PTSzGLaU6hFp
	iJDjOKX2bcNjeISZuNHiXxBAHUPlcBFY6jJrBKt+wBfN+w8oq0pEgMsJV+/z1cybSKF6cfvnkNj
	Q72zNGVjUDAYZwHWC3fJuTNaXfKHQr5fbOZV4pauVGwQan2fYnjMUq2uiQTFF6meS7P0KiSxskv
	KcTGQOn23ZL8HtC2iW7JXFOPRNSAPg7Bz5KPJZM33FrHPAk/GM7MTeDaZye3x5UtoHdHmdWNmlS
	z8vWRI51hmZNpofJu0/ipASgj5T+hhDxpxbDt7heGukXtkr1mp17GahMDpTOjQTm96uS6nqzKVd
	SLE25f+LyvwN4vK6wToDmCjNXadJzKGaNijSLaSotl3p9XMA0BRuSs2s76gSsIJ6LtoooXOu3E/
	TLptyGh8j79aRLSSPd3JdiOGAdoxSnQRvFXX40tXhUnLFuUm/xH4f3W9KgtUMQo/E3G6QpW/GB9
	4qA3PNV4L0RFhr+mBU8Wlv4Ss84pm6bW5aTz1d4qtSvYomKeVKiGZQAgkNEktsod8U2nx6cAESK
	94vX1MzXAz29jWOGlB1I=
X-Received: by 2002:a05:6870:318c:b0:475:e235:8fe with SMTP id 586e51a60fabf-475e2350f4emr4299634fac.28.1788570339228;
        Fri, 04 Sep 2026 18:05:39 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-475544fc87asm3337849fac.10.2026.09.04.18.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 18:05:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 04 Sep 2026 19:05:37 -0600
Subject: [PATCH v3] mtd: rawnand: sunxi: reject ECC maximization on small
 pages
MIME-Version: 1.0
Message-Id: <20260904-submit-sunxi-nand-ecc-step-validation-v3-1-931cec317c10@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOTQqDMBSEryJZ95UY/7vqPYqLGF/1FU0kSYNFv
 HujPUFXwwfDN7Mxh5bQsVuyMYuBHBkdIbskTI1SDwjUR2aCi5I3PAf37mbyMfRKoKXuAZUC53G
 BICfqpY8G4FhUKa/rrsCKRddi8UnrufNofxxFL1T+kB+NkZw39nMeCeLo/bsZBKRQYtbJUnDe5
 PV9mCVNV2Vm1u77/gWdcmsl7AAAAA==
X-Change-ID: 20260904-submit-sunxi-nand-ecc-step-validation-0e571088b5e7
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_180540_833166_E0A33F0F 
X-CRM114-Status: GOOD (  13.62  )
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

When nand-ecc-maximize is set, the driver selects a 1024-byte ECC step
and divides the available OOB bytes by the resulting number of steps. A
NAND with a smaller page therefore produces zero steps and a division by
zero.

The older controllers also provide a 512-byte ECC block mode, but the
hardware documentation describes that as an ECC block size within NAND
pages whose supported sizes start at 1024 bytes. It does not document a
512-byte NAND page mode.

Reject pages smaller than 1024 bytes before deriving the step count. This
prevents the division by zero at the point where the incompatible
maximized geometry is selected without changing explicitly configured
512-byte ECC block handling.

Fixes: 4796d8655915 ("mtd: nand: sunxi: Support ECC maximization")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v3:
- reject ECC maximization on pages smaller than 1024 bytes instead of
  selecting the 512-byte ECC block mode
- leave explicitly configured 512-byte ECC block handling unchanged
- clarify that the hardware documentation describes 512 bytes as an ECC
  block size rather than a supported NAND page size
- Link to v2: https://patch.msgid.link/20260904-submit-sunxi-nand-ecc-step-validation-v2-1-6e3ba6200948@gmail.com

Changes in v2:
- fix ECC maximization at its source by selecting a 512-byte step for
  512-byte pages instead of validating the derived step count
- retain 1024-byte steps for larger pages and the existing capability checks
- rebase on the current MTD nand/next branch
- Link to v1: https://patch.msgid.link/20260811060651.227431-1-james.hilliard1@gmail.com
---
 drivers/mtd/nand/raw/sunxi_nand.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 83666dd6cb2a..c84f304fb749 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2084,6 +2084,9 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	if (nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH) {
 		int bytes = mtd->oobsize;
 
+		if (mtd->writesize < 1024)
+			return -EINVAL;
+
 		ecc->size = 1024;
 		nsectors = mtd->writesize / ecc->size;
 

---
base-commit: def559a215699aa2f2d8ef98f30156b9d562a154
change-id: 20260904-submit-sunxi-nand-ecc-step-validation-0e571088b5e7

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
