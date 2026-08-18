Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CCBC5DF7D
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Aug 2026 11:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Hj5niq18K0S8Y6ag6cjxDDnOw85/80F76dgoCF2ZpVs=; b=I/jSghQC9q9niF
	w8R4Z3N7RZylTq+bmoWNvYPpA8t0AC7SWiILi1YeRlam188IO5wV0DUnWG5E+kLOj3Duspc4SRJmf
	AOFVEGakPZBBJMPicz0f2zkD49vp54zAVJN98/XQaTQ2Ey3C8dM245YQfBxOfaFxMATAtDZQrQ5Qk
	IB7DPaoD1RKlreeW7b9fEWKlNKg2+yNBW7/+GFJTtbvzkvJl6SlrKow9D4qRsc5YggNrSLgw5h8Dd
	6dURRcZol30rCW8Mms7FktGHTq3BzlSEsjOWki0Uz8KdTwT0Voi1EWyr0tK9woK/UVd+CFpn7CYGM
	CWJd2T7MDRJpa1DIu8jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwICu-00000007rj0-0fSa;
	Tue, 18 Aug 2026 11:42:16 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwICr-00000007riO-1P5G
	for linux-mtd@lists.infradead.org;
	Tue, 18 Aug 2026 11:42:14 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4954d29264cso22749275e9.2
        for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2026 04:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787053331; x=1787658131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fpOCTRUPBCSHF1oBT87WmDv+DZlXUVAuN1PJVFdEcnk=;
        b=qlFXKKHsdXwMYo+9rixj4iRIGT6AGtrjkb2DKg+tJJsPibd3oDNQwGBFM+vLAOGUcf
         P4cov4HDA1nM3+a/yXD1gO6y8ImlqnxRbtOyOh+0m5a1wit9pMBbBiMLy4wDsP2B0OM1
         To+fnECHw7WUkl78WJKe8ntyri+ofekUwiuQAjhfzTQJ3zq8FckV8LjX7GlyqYsLJLBg
         ZzEDuwKIaN60ROfrdixdmOgk9jXQIYDVr3iJl2jih4uRoujId+f2xsE+RD4FY+31J9zI
         Rvdxj3MW4vstv/pznBE7zCosVPiZbwnu25UvzpADh+ErEmtzTN9fGpi7fyOrLgEKMnD1
         bxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787053331; x=1787658131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fpOCTRUPBCSHF1oBT87WmDv+DZlXUVAuN1PJVFdEcnk=;
        b=ChF7WzJ1pOEaZFYDgsGffZAkduDlGOAqe2AYQx/GH9MXJdkCLz++OqPJ7SoU9Tft+p
         YLy7GQ/tcvlgb1AeSXaGDV+BghwqmHudoRbiYGHkP7TExA5SDiCfUCef+uPsCaNu/PyS
         qMzRwCTcOoA4uEMWFlZNJo82ZkFnACoF1rzXcgzaBVctdWrH0BOOgVrfuxh/i404vcub
         5mYRTr1ODDy8/aifr7PaCFa+qSLFmQtva1IpGRjr3FwUBWybLdJnDWradp584xCXGA+E
         fU1bDeOs+v64MyxdLRtLYDAsUMQoa1oDJHdZCuFPQua1AyeRn/T7FTQAjP53FaRCJOlo
         JyEA==
X-Forwarded-Encrypted: i=1; AHgh+RrEuIXEdB/WCCJX5HfMwEpJ0B+r8ICuaCACBYYK3RwOE4qN7hRgPEgcir43EIIg+qR8ygPB+JwY6QM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwEsMnk2gfX96+LiLjsAHB51B6dCuzVRkcq27vKU6EsHNrPXLoj
	G162TROv5dqqFfeCtKSwS/eWjP1V/mS1MzNu2uQfJxkezVgoTpSZtio3
X-Gm-Gg: AR+sD12lgySzaaDJrGXqF8FEX1HAgaVXyxvBrfnULZJfZ0w6A8nwhTD0spJTBwbSpi4
	P46SPXBLAlcfZva1fMj5CMW3jeSSSXDpQDf9owrkhKDLB00RpsycFkdxtx9DgVYWjKlu7ndQCG/
	OoeioRykVt79QeVKLEAVV52ditfBt4ugojY/5CFpKGDMK0fO7pZZnmZcCRwut3c2Fbxh7/yX1Kv
	OmH4hMiGNbhOebYzqSpNHhlB3lU7ZFbzG9UZ0kr6TgU1VoTc3kdIrbynzN5eFkyrqzE3yDL253o
	5QwSKTorgoyBdX7agyMfY4SnQCPA1jjl++L3CjxVwOUi8Gbno+V1pSADNbN1ZCUUthZmKtVOxyC
	FCanufR7PIkqTv2Shw/cV89nwNZpR3y+8/Y/NHBhrVn1Yf3V3rd/FJowd+PalQH6K0HEvxVBY7j
	4BbXdwMhBJIuYWPchObOhqG4ozzZG1TM8Pii3cgC1DOUiH/3kG3ntwjJ1BDLuKQhURMA==
X-Received: by 2002:a05:600c:46cf:b0:499:8807:345f with SMTP id 5b1f17b1804b1-4999fb8a0f0mr110873035e9.13.1787053330565;
        Tue, 18 Aug 2026 04:42:10 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4998780397esm28680785e9.3.2026.08.18.04.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 04:42:09 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Stefan Agner <stefan@agner.ch>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Edward Karpicz <webmaster@toradex.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] mtd: rawnand: vf610_nfc: two fixes for chips with large OOB and for erased pages
Date: Tue, 18 Aug 2026 13:42:06 +0200
Message-ID: <20260818114208.2780311-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_044213_392692_331A71F7 
X-CRM114-Status: GOOD (  21.45  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Two independent fixes for the Vybrid NAND flash controller, both found
while bringing a Colibri VF61 up on mainline and both verified on
hardware.

Patch 1 is a regression. The driver clamps mtd->oobsize to the 64 bytes
its ECC layout uses, but since commit a7ab085d7c16 ("mtd: rawnand:
Initialize the nand_device object") nand_scan_tail() restores the value
from the memory organization right after ->attach_chip(), so the clamp
is silently lost. On a chip with more than 64 bytes of OOB every
ECC-protected read then fails and the board does not boot. Clamping the
memory organization as well is what the rest of the tree does when a
driver has to change the OOB size (nand_samsung.c, nand_onfi.c,
nand_jedec.c and denali.c all write memorg->oobsize); mpc5121_nfc.c
touches mtd->oobsize directly but does so before nand_scan(), so it is
not affected.

Doing this in ->attach_chip() is deliberate: the chip really does have
112 spare bytes, it is this controller that can only use 64, and
->attach_chip() is where a controller adapts to the detected chip. The
patch also touches the memory organization because nanddev_init(), which
runs later in nand_scan_tail(), re-derives mtd->{erasesize, writesize,
writebufsize, oobsize, size} from it, so an adjustment made only in mtd
does not survive. If you would rather have the core preserve what
->attach_chip() set up, or a dedicated way for a driver to declare that
it uses fewer OOB bytes than the chip provides, I am happy to respin; I
went with the minimal form because this is a regression fix that should
be backportable.

Patch 2 makes the erased-page check look at the flash instead of at the
controller buffer. When the ECC engine fails to decode a page it leaves
a bogus single-bit "correction" in that buffer, which the check counts
as a real bitflip; on the 60-byte ECC mode every erased page is
reported with one corrected bitflip, which renders the MTD statistics
useless for flash health monitoring.

Testing, all booting from NAND on an Iris carrier with Linux 6.18.44 and
U-Boot 2026.07:

  0010 Colibri VF50 128MB V1.2A     Macronix MX30LF1G08AA, 64-byte OOB
  0013 Colibri VF50 128MB IT V1.2B  Macronix MX30LF1G18AC, 64-byte OOB
  0012 Colibri VF61 256MB IT V1.2B  Macronix MX30LF4G28AC, 112-byte OOB

Without patch 1 the VF61 cannot attach UBI at all. With the series all
three boot, mtd oobsize stays 64, the bad block table written by an
older kernel reads back without ECC errors and the corrected-bitflip
counter stays at zero over a full-partition nanddump. The clamp only
triggers on the VF61 chip, so both patches are a no-op on the two VF50
revisions, which is what I wanted to confirm before sending them.

The credit for spotting both problems goes to Edward Karpicz, who
reported them on the Toradex community forum.

Mehmet Fide (2):
  mtd: rawnand: vf610_nfc: fix reads on chips with more than 64 bytes of
    OOB
  mtd: rawnand: vf610_nfc: fix false bitflips on reads of erased pages

 drivers/mtd/nand/raw/vf610_nfc.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)


base-commit: 15a3cbce32994141252bb4ecfe3ff3a5d22d0b4f
-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
