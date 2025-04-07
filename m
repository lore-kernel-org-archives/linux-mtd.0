Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3553DC3601E
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 02:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=23M56ppWCJmpmLFdjcZTrt8PA3kKpCelrtueOZl1mPM=; b=0/F8jeueYzux0C
	F7zKUuP9YHVZ7Zjk3ysOzBWkERYh76Qt7WgyAWWCNl3ks3XPMVaTfLP1fNlaJWUKjG/JKAC+YEuSQ
	Egw4TYfsx1C4h7ij6J6SokYrYSTeHXJt0BhzuvGFahb+TyDmvWkfvwTqD3SRN/utuJ/MEM5A7FydA
	VFMRsEQViR+pbAhXuUbV2zruzUkaoPyBMbti/zDxCSMcGtwV6hjqe/NuV7Vy6wA7SKR+PRiQh/ANj
	GXiEzTIhVwPwBB1M3zfsCL0SflJ3iwAzwwUsg0Y196OK5QrE+PE30/gOMBw1dkss2DiZBjE9RE3PI
	aOOkNXBS3fYTEEcToP0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1bvz-0000000GAel-1Vi2;
	Mon, 07 Apr 2025 02:09:59 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1bvv-0000000GAct-2eh2
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 02:09:58 +0000
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowAA3dQ3gM_NnLGnGBg--.8741S2;
	Mon, 07 Apr 2025 10:09:42 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] mtd: nand: Add error log for marvell_nfc_end_cmd()
Date: Mon,  7 Apr 2025 10:09:16 +0800
Message-ID: <20250407020917.1242-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
X-CM-TRANSID: zQCowAA3dQ3gM_NnLGnGBg--.8741S2
X-Coremail-Antispam: 1UD129KBjvJXoW7urWrZw1xWw1UtFW8AF4fXwb_yoW8AryDpw
	4rZFW5KF40ya1YyrnxJa1DuFy5t3Z3K348K3Wvva4j9r4xGF4jgrsFya40gF1UAayfAw1a
	qrZxKr9Y9Fn0yFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjfUYdgADUUUU
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRAFA2fytf-jFwAAs0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_190956_040949_685EE6EC 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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

The function marvell_nfc_hw_ecc_bch_read_chunk() calls the function
marvell_nfc_end_cmd(), but dose not check its return value. Since it
is incorrect to bail from the loop if the marvell_nfc_end_cmd() fails,
an error log is necessary to prevent silent failure.

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/mtd/nand/raw/marvell_nand.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 303b3016a070..1069a17dae9d 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -1351,16 +1351,20 @@ static void marvell_nfc_hw_ecc_bch_read_chunk(struct nand_chip *chip, int chunk,
 	 * Length is a multiple of 32 bytes, hence it is a multiple of 8 too.
 	 */
 	for (i = 0; i < data_len; i += FIFO_DEPTH * BCH_SEQ_READS) {
-		marvell_nfc_end_cmd(chip, NDSR_RDDREQ,
-				    "RDDREQ while draining FIFO (data)");
+		err = marvell_nfc_end_cmd(chip, NDSR_RDDREQ,
+					  "RDDREQ while draining FIFO (data)");
+		if (err)
+			dev_err(nfc->dev, "Fail to confirm the NDSR.RDDREQ");
 		marvell_nfc_xfer_data_in_pio(nfc, data,
 					     FIFO_DEPTH * BCH_SEQ_READS);
 		data += FIFO_DEPTH * BCH_SEQ_READS;
 	}
 
 	for (i = 0; i < spare_len; i += FIFO_DEPTH * BCH_SEQ_READS) {
-		marvell_nfc_end_cmd(chip, NDSR_RDDREQ,
-				    "RDDREQ while draining FIFO (OOB)");
+		err = marvell_nfc_end_cmd(chip, NDSR_RDDREQ,
+					  "RDDREQ while draining FIFO (OOB)");
+		if (err)
+			dev_err(nfc->dev, "Fail to confirm the NDSR.RDDREQ");
 		marvell_nfc_xfer_data_in_pio(nfc, spare,
 					     FIFO_DEPTH * BCH_SEQ_READS);
 		spare += FIFO_DEPTH * BCH_SEQ_READS;
-- 
2.42.0.windows.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
