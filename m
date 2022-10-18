Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46A4C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5c91qWF33n5irTyBxgxTE2lOpFJnBpiol0a4WnxmpxQ=; b=PTUmuq+YMiHA2G
	rejzKiZFT6LlOPqN78oVW45Bo2aIff+YMwJXobI/Y4aNYWgw0aPSqAGSvYctS9gByC0HyjaNNjU++
	19KdbDj0YrTambKAbk+YqWDNFHesgCNa+M0n7nhekAksG5rPnx6iw0k5P3VGXVi0tjfB5OCbBZNzv
	3lt5Tkn1sCL4FoCCTVRK4sqZ9zW4rYC065S4lM+kXSkiIpNi9hOjdVyYnVZpTMM9Awm1jnW4tu3IT
	DAiBjT2KLWYY+uabjqzhnyQd/glddjvSEFzddLknygn1tKeBJ4rJMqJBojoA1sKwUF9NSJBjXLx76
	0MryjR4S8o74tb/L66Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okivH-0051gh-US; Tue, 18 Oct 2022 09:30:07 +0000
Received: from esa2.hc353-39.eu.iphmx.com ([207.54.65.204])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okivF-0051g5-G4
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=sequans.com; i=@sequans.com; l=4715; q=dns/txt;
  s=corp; t=1666085405; x=1697621405;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ocxheExQzSj9Lb1er9UjNFP8Swj1uHOAMZTuq3lAYKo=;
  b=mUqwzMCqqvQr1TAkd5T5qWXZoRFJjOcZe8yLy0GzsMcGk8KTpNXo4jIT
   7tNh0dWSNtJeFwKteks5uGDw9jwiscFyPXHXaoYbuJR3zdFPwi4HAiA39
   I2zXV5M6WNyR1PPUJatEhw95b1attEuqM/Hs6BHUT/tRhD8Q6ASpeo5Ca
   A=;
X-IPAS-Result: =?us-ascii?q?A2FLAQBEcU5jl5bSIB9agliDLoFYA5VinR6BfAsBAQEBA?=
 =?us-ascii?q?QEBAQEJOQkEBQSEfoRvJzUIDgECBAEBAQEDAgMBAQEBAQEDAQEBBQEBAQEBA?=
 =?us-ascii?q?QYCAQEBAQIQAQEBAQEBAQE2BRA1hS85DYI1InyBCAEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEWAg1SaSsLAUaBSAmCfQGDIBOgDAGMGTOBAYNQAYRNgWAGgT2KfYV5g?=
 =?us-ascii?q?UlEglGCLIsBBJIPiRIDCQMHBUlAAwsYDRYzGAMUAwUhBwMZDyMNDQQdDAMDB?=
 =?us-ascii?q?SUDAgIbBwICAwIGEwUCAjUYNAgECAQrJA8FAgcvBQQvAh4EBQYRCAIWAgYEB?=
 =?us-ascii?q?AQEFQIQCAIIJhcHEzMZAQVZDgkhHCgNBQYTAyBvBQc7DygvaSscGweBDCooF?=
 =?us-ascii?q?QMEBAMCBhMDIgINKTEUBCkTDy0HI3EJAgMiagMDBCgsAwkhHwclJDwHWDoFA?=
 =?us-ascii?q?wIQIjwGAwkDAiJZdTASFAUDDRclCAU3GgQIPAIFBlISAgoRAxIPLUgPSj45F?=
 =?us-ascii?q?gYnRQE2Dw4aA5tVghgBMF0sIDCBRCk9wgODaotClGZMg3aSfjmRYpcZi1KBb?=
 =?us-ascii?q?5RKgRiEITCBQCMBghRNI4M3URkPjjmIbYVMcwIBOAIGCwEBAwmKQgEB?=
IronPort-PHdr: A9a23:9o2OIhyrpQybQBfXCzLyzVBlVkEcU1XcAAcZ59Idhq5Udez7ptK+Z
 heZvqQ0xwaVFazgqNt8w9LMtK7hXWFSqb2gi1slNKJ2ahkelM8NlBYhCsPWQWfyLfrtcjBoV
 J8aDAwt8H60K1VaF9jjbFPOvHKy8SQSGhLiPgZpO+j5AIHfg9q52uyo9ZDeZxhEiDWgbb59M
 R67sRjfus4KjIV4N60/0AHJonxGe+RXwWNnO1eelAvi68mz4ZBu7T1et+ou+MBcX6r6eb84T
 aFDAzQ9L281/szrugLdQgaJ+3ART38ZkhtMAwjC8RH6QpL8uTb0u+ZhxCWXO9D9QLYpUjqg8
 qhrUgflhicZOTMn7W/ZhM9+gqVUrxyuvBFz343ZbZuJOPdkYq/RYdUXTndBUMZLUCxBB5uxY
 IQVAOoFI+lYqZX9p1oIrRCjAAesA/nvxSFOhnDt2a060vghGhzB0Qw+HNIOt27Uo8vzNKgJV
 eC1zbXIwC7Yb/xIwDf99ZLHchY6of2WQb1wds/RxFApGgjYgVqetZbrMCmJ1uQRrWeb9exgW
 PquhmMjpQ98ojihytsih4TUm44YyFPJ+Cp7zYs3O9G1VlB3bMK5HZdNtyyUOZV6T8whTmxmp
 Ss3y6ALtJy6cSULzpks2hDRa/uCc4eS4xLjUv6cITRmi3J/frKwmRKy/VKnyu3mWcm51ktBo
 CldktTUuH0Bygbf58aZRvdn4EutxCqD2xrO5uxEPUw5k7fQJYQ7zb4qjJUTtFzOHirxmErrk
 qCbbl4k+u206+T/ZbXmu4OcO5d0ig7gNqQundSyAOU5MggLRGeb4/6z2Kf4/ULnWbVKk+c5k
 q/CsJzAOcsboau5DxdU0oYl9Rm/Ey+r3doFkXUdIl9JZgiLg5b0N13SOvz0EPeyj0i0nDdu3
 f/GP7nhApvXLnjElbfsZah9601byAop099f4YlbCrUAIPLvQULxr8LXDgYkMwOuxebnE89x2
 Z8ZWWKKGqOZNrjdvkeS5u0zO+mMeJMVuDHlJvUq//Lul2M2mUcBfam12psacGq3Hu5gI0qEe
 nfjmM0BEWEXsQUlVuDllUONXSZJZ3muR6I8+i07CIW+AIfGR4CtmaGB0zm/HpFMfGBJEFCNE
 XHyeIWAQPoDcyWSIsh9kjwAVLihTZUt2g2ptA//07ZnNPbb+jUEtZL/09h4/+nTlRA09TxpA
 MWRymSNT31pkW4TQz823bt/oVBmyluZ0Kh4hfJYFcZJ6PxUTAg1L4PTw/Z9C9DoVQLNZs2JR
 0q+QtW6HTExSco8wt8QbEpnFNSijxbD3yW2DL8VibOLAoc586PA33fvPcpy13HG1Kw7g1Y6R
 MscfVGh06p+8RXDQovVn22dlr22buId2iDX/WuOxGbIu1tXAyBqVqCQY3kba03KrNKxxUTYQ
 rmkDbU7el9fysmYJ61Abtz1pU5LXerqPs+YaGW0zTTjTS2Uz6+BOdK5M14W2z/QXRBsrg==
IronPort-Data: A9a23:PcmNwqkGhrTXqeE0I0lBk/jo5gxjJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOX2mGOK6Lamfye9x2bdy08RtQuJ6By4RrTws5pC42Fi4T+ZvOCP2nd3v9bniYRiHhoOOLz
 O1OMYmQcphkJpP4jk3wWlQ0hSAkjclkYJKiULacUsxWbVA4E3hJZSpLwrJ/2Mgw6TSAK1vlk
 cvopMHCM0OS1TdxM2YFg4qOsxoqt/np0N8ilgVWictj4RmPyhH5MLpFffvrdiOhEtENdgKHb
 7+rII+RrzuxEygFV4vNfobTKiUiXrPUNA6SvXtaM4DKbs9q/3FaPg4TbZLwWG8P49m7t4kZJ
 OZl7PRcfTwU0pjkwYzxZTEGTHgmbf0YpNcrFlDm2SCb5xWun3LEmaU+VBle0Ycwo46bCkkXn
 RAUAG9XNkjra0tbD9tXR8E17vnPIvUHM6sYk1Vd1xbdM8wpH8rkEqzyw4Zh+wo/05Um8fb2P
 6L1aBJ9bRHKeRQJIVoOFZs4h6GjgXyXnz9w8wvT/vBxuTGLilUsiNABM/KMEjCObdtWmVyVo
 GjC/njRGRwDKdWZ0nyO9XfEaurnwXmrBt5IS9VU8NZLpFTMy2kUUyRRXAWcuajh0k+ecIl2f
 hl8Fi0G9/JrrhfDosPGdxSipnKstwQaV9AWH+BSwASM07fZ50CDD3kCRzppYtshqMs3Q3oh0
 Vrht9foAyF/9biJRVqZ96yItnWzPyYPJGMPbCNCShEKi/HyrccjjxTARdZuFoanktCzEjb1h
 TuMxBXSnJ0BjMsBzaz95l3enjuqvd7CSQtdChjrsnyN6SpdWZSCY7KS5gaByqdJFKDAd368s
 y1R8ySB19ziHa1hhQTUHrtTROz5t6fbWNHPqQI/TsVxq1xB71b5J90Ju1mSMW8zaq45lSnVj
 Fj7lzk5CHV7FWGlYKlrbp+wD6zGJoCxSI29Dpg4gvLlhJx8MQOKuQ90bEib0gjQfKkQfUIXY
 MbznT6EVypyNEie5GPeqx0h+bEq3Dsi4mjYWIr2yR+quZLHOiDLEexcbADeNrxghE9hnOkz2
 4gGXydt40sGONASngGImWLuBQ9SfCNmXcyeRzJ/L7PceVEO9J4d5w/5m+l4IdcNc1V9nODV7
 36gV1QQ1Ff7iHbALG23hoNLNtvSsWJEhStjZ0QEZA/ws1B6ONbH0UvqX8ZuFVXR3Lc4lqAco
 jhsU5joP8mjvRycpm5GM8Ct9dc4HPlp7CrXVxeYjPEEV8YIb2T0FhXMJ2MDKAFm4vKLiPYD
IronPort-HdrOrdr: A9a23:0ixA8KFeL6LDvmZJpLqFwZLXdLJyesId70hD6qkvc202TiXIrb
 HMoB1E73/JYW4qKQkdcKO7SdK9qBLnhNlICOwqVotKMzOW41dAQLsSsbcKhgeQShEXGIZmpP
 Bdm4YXMqyiMbDj5vyKtDVR+b4bsYy6GdmT9LXjJhRWPHdXgsNbnl9E412gYx1LrWB9bPJSef
 byiKs3wkvFRZ1UVLXDOpBiZZmYmzTlruO6XfdsPW951OD6t0LP1FeMKWn+4v5xaUIQ/Z4StU
 DhrirC342G99Cc8CK07R6L071m3PPF9/14PeSpzvIpAgjRt2+TFcJccozHmApwjPCk6V4snt
 WJiQwnJd5P53TYeXzwiQfx2iH7uQxeo0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L5WSErJBaZCmw1xgVpuK4HS2CpHDE7UbKotRjwEC3lrFuJoO5mLZvsX+91q1wXR4SprpXUN
 WGR/usnsq+OWnqEkwx+FMfieCEbzALBRGBTVEFusuJlxZrvF0R9Tpa+OUv2k4a8pQzUp9F4P
 mBFJ9JuvVhcu86BJgNRtvoZ6OMeyjwqNb3QSevCEWiG6cdN33XrZnrpL0z+eGxYZQNiIA/gZ
 LbTTpjxBsPkm/VeL6zNadwg2LwaXT4WS6oxtBV5pB/tLG5TL33MTebQFRrl8e7uf0QDsDSRv
 72YfttcojeBHqrHZwM0xz1WpFUJ3VbWMoJuswjU1bLps7QMIXluuHSbf6WLrvwFjQvXH/5Hx
 I4LUzODdQF6lruVm7zgRDXVX+ockvj/YhoGKyf5OQXwJhlDPw9juHUsyXJ2iimE0w9jkVtRj
 oDHFrOqNLFmVWL
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.95,193,1661810400"; 
   d="scan'208";a="4286427"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
X-Virus-Scanned: amavisd-new at sequans.com
From: Valentin Korenblit <vkorenblit@sequans.com>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	arnd@arndb.de,
	ye.xingchen@zte.com.cn,
	Valentin Korenblit <vkorenblit@sequans.com>
Subject: [PATCH v5] mtd: rawnand: cadence: support 64-bit slave dma interface
Date: Tue, 18 Oct 2022 11:30:00 +0200
Message-Id: <20221018093000.12072-1-vkorenblit@sequans.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_023005_842964_1489EBCC 
X-CRM114-Status: GOOD (  16.00  )
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

32-bit accesses on 64-bit sdma trigger sdma_err in intr_status register.

Check dma capabilities before reading/writing from/to sdma interface.

Link: https://lore.kernel.org/all/b7e5ebb4-0de8-4958-9bc4-fe06ec4c3635@www.fastmail.com/t/

Signed-off-by: Valentin Korenblit <vkorenblit@sequans.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>

---

Changes v1 -> v2:
	- Replaced ioread64_rep by cadence_nand_readsq (suggested by Arnd)
	- Replaced iowrite64_rep by cadence_nand_writesq (suggested by Arnd)
	- Do not try to access 64-bit sdma if __raw_readq/__raw_writeq are not defined

Changes v2 -> v3:
	- Use readsq/writesq on 64-bit architectures (Arnd)
	- Detect issue on init instead of 1st transfer

Changes v3 -> v4:
	- Updated link and reviewed tag (Arnd)

Changes v4 -> v5:
	- Link updated
---
 .../mtd/nand/raw/cadence-nand-controller.c    | 70 +++++++++++++++----
 1 file changed, 58 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 9dac3ca69d57..7661a5cf1883 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -1184,6 +1184,14 @@ static int cadence_nand_hw_init(struct cdns_nand_ctrl *cdns_ctrl)
 	if (cadence_nand_read_bch_caps(cdns_ctrl))
 		return -EIO;
 
+#ifndef CONFIG_64BIT
+	if (cdns_ctrl->caps2.data_dma_width == 8) {
+		dev_err(cdns_ctrl->dev,
+			"cannot access 64-bit dma on !64-bit architectures");
+		return -EIO;
+	}
+#endif
+
 	/*
 	 * Set IO width access to 8.
 	 * It is because during SW device discovering width access
@@ -1882,17 +1890,36 @@ static int cadence_nand_read_buf(struct cdns_nand_ctrl *cdns_ctrl,
 		return status;
 
 	if (!cdns_ctrl->caps1->has_dma) {
-		int len_in_words = len >> 2;
+		u8 data_dma_width = cdns_ctrl->caps2.data_dma_width;
+
+		int len_in_words = (data_dma_width == 4) ? len >> 2 : len >> 3;
 
 		/* read alingment data */
-		ioread32_rep(cdns_ctrl->io.virt, buf, len_in_words);
+		if (data_dma_width == 4)
+			ioread32_rep(cdns_ctrl->io.virt, buf, len_in_words);
+#ifdef CONFIG_64BIT
+		else
+			readsq(cdns_ctrl->io.virt, buf, len_in_words);
+#endif
+
 		if (sdma_size > len) {
+			int read_bytes = (data_dma_width == 4) ?
+				len_in_words << 2 : len_in_words << 3;
+
 			/* read rest data from slave DMA interface if any */
-			ioread32_rep(cdns_ctrl->io.virt, cdns_ctrl->buf,
-				     sdma_size / 4 - len_in_words);
+			if (data_dma_width == 4)
+				ioread32_rep(cdns_ctrl->io.virt,
+					     cdns_ctrl->buf,
+					     sdma_size / 4 - len_in_words);
+#ifdef CONFIG_64BIT
+			else
+				readsq(cdns_ctrl->io.virt, cdns_ctrl->buf,
+				       sdma_size / 8 - len_in_words);
+#endif
+
 			/* copy rest of data */
-			memcpy(buf + (len_in_words << 2), cdns_ctrl->buf,
-			       len - (len_in_words << 2));
+			memcpy(buf + read_bytes, cdns_ctrl->buf,
+			       len - read_bytes);
 		}
 		return 0;
 	}
@@ -1936,16 +1963,35 @@ static int cadence_nand_write_buf(struct cdns_nand_ctrl *cdns_ctrl,
 		return status;
 
 	if (!cdns_ctrl->caps1->has_dma) {
-		int len_in_words = len >> 2;
+		u8 data_dma_width = cdns_ctrl->caps2.data_dma_width;
+
+		int len_in_words = (data_dma_width == 4) ? len >> 2 : len >> 3;
+
+		if (data_dma_width == 4)
+			iowrite32_rep(cdns_ctrl->io.virt, buf, len_in_words);
+#ifdef CONFIG_64BIT
+		else
+			writesq(cdns_ctrl->io.virt, buf, len_in_words);
+#endif
 
-		iowrite32_rep(cdns_ctrl->io.virt, buf, len_in_words);
 		if (sdma_size > len) {
+			int written_bytes = (data_dma_width == 4) ?
+				len_in_words << 2 : len_in_words << 3;
+
 			/* copy rest of data */
-			memcpy(cdns_ctrl->buf, buf + (len_in_words << 2),
-			       len - (len_in_words << 2));
+			memcpy(cdns_ctrl->buf, buf + written_bytes,
+			       len - written_bytes);
+
 			/* write all expected by nand controller data */
-			iowrite32_rep(cdns_ctrl->io.virt, cdns_ctrl->buf,
-				      sdma_size / 4 - len_in_words);
+			if (data_dma_width == 4)
+				iowrite32_rep(cdns_ctrl->io.virt,
+					      cdns_ctrl->buf,
+					      sdma_size / 4 - len_in_words);
+#ifdef CONFIG_64BIT
+			else
+				writesq(cdns_ctrl->io.virt, cdns_ctrl->buf,
+					sdma_size / 8 - len_in_words);
+#endif
 		}
 
 		return 0;
-- 
2.20.1

-- IMPORTANT NOTICE:



The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium.



Thank you.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
