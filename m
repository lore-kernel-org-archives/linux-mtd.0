Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E95FC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jan 2022 21:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:To:From:Message-ID:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=xsUPfsnFNfh2lHYAXHS/K6ygO4NtVRIeDRgTnIjdfo8=; b=XZy
	Nop8teAohV5/S/K0iuFpnIkKlgfZTOcrsx9eI/p/lauQOVsVzN2uQeNm0eVIkd1LW2NqD1VDSVaMf
	Iv/EgmW9eJpetfBLKXfm1+risdLldeeC8c3/E9IKfgBARCGgfYbsJU7ByQJezOY+ulMlj5CT1nCC0
	O0xJ9s+E2fV0ng77FiUVPrs+B2NwEaZ9WQd9ntRLnkSUc+PrOfP3Wu0Ncx5Pt/ug8xv6La0oTgIF9
	San4KFU2W2GyOdWxTfwLCV/ckkgU594soMEDT1xUCj72itXatQXoPkK7+TPE/cy7Etrr0WxXJGA7a
	g+th9C9iY4bCV+1zCiq3ewiWAa7R1iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7krB-003oMp-75; Wed, 12 Jan 2022 21:08:33 +0000
Received: from mout.gmx.com ([74.208.4.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7kr6-003oMV-LT
 for linux-mtd@lists.infradead.org; Wed, 12 Jan 2022 21:08:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com;
 s=dbd5af2cbaf7; t=1642021707;
 bh=dW6H+pasXtkc3+1HJb+qsl6EMH5rekp35ErrzqtsmiU=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=3ITRdZXN5nTDcCi7gRuq7hXG+yCZC1bEg8KAGdw/HIY9MQ+pwA53sPA8XN4TAxBUy
 0UORKZur2N/S5DSJZZVBakZ+VJG4BgzAVoVlCsdpONJlSd2ETkYbLlF7c669RbcSGa
 1s8twq4sHYnIcA3I0CU9zoeNzh59ZEYR7IKpDYEk=
X-UI-Sender-Class: 214d933f-fd2f-45c7-a636-f5d79ae31a79
Received: from [70.187.180.83] ([70.187.180.83]) by web-mail.mail.com
 (3c-app-mailcom-lxa14.server.lan [10.76.45.15]) (via HTTP); Wed, 12 Jan
 2022 22:08:27 +0100
MIME-Version: 1.0
Message-ID: <trinity-0c92e0e4-dcf8-4753-a934-f2cc41b5e6de-1642021707668@3c-app-mailcom-lxa14>
From: david regan <dregan@mail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: brcmnand: Fixed incorrect sub-page ECC status
Date: Wed, 12 Jan 2022 22:08:27 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:fJLt5r/yCpWqTbrk3CD+uygpoI0x5ROqDxeVAmS3W2+gDbCdg3kBE1uJT6XWtdOlJAP/F
 ytFi25B3oe4xlfc6dc8FzPPLVMYMimnR+gWonHF2/TxDY5eb08/s+rtYZpJOnOoV0ggvHrIZRHcd
 aeURfm8nEF+xfbGHy1c6b7zJcYtDD2isZFHJ5th8/ZEC+1WwWjkpdIAMBd/j+Co2vxxAV1dtevum
 +a9ZoVZkdDVAMid7k+NTIZcgAeVz72LhZ4wzz1XNaRMkFXsU6PwOstdTO9+yGG0HoWOf0ZP9lGQm
 UA=
X-UI-Out-Filterresults: notjunk:1;V03:K0:QGaOlv7D4ww=:jvBDI0Zo7m6vIfyi5Jd8X8
 Fmy8OcbSlMOBKHMJwYcYHUC3vBfThFxcSJeSoiADj1kt7kxi41Qb6KwTzCC+AoOpxPKovUKHO
 HgODGNvxTexU03oqU7luI6KAnatMmDvgTu0uz+YoLcuOL5/1X42YKJYL25bn3H4d69feZnxSK
 rfNON2RsVF3G4Ub2Uu5GoycLWzi63XrdYX2819oyTfabs7iKkDQbRYqNwiBNR4vnC+c9BfBrf
 4xaS8d2c11uXOU4n9oILYcxFbjGKkbtiM1lB7MICRdeA2uW2VGd+C3oAzL75bB6mkK7SoRK01
 +jKuhisn2DLC3I3JJef3amWariBtxPo2BVTFqPoAK7vMa0sCYCHVj9e/HtGTdU29jgOocTuqo
 NpyIAqEwXtPMbWL2xwyzgqmkYz58C5Btyyju23KEJ3osGgE8wa+QC2VRZlhrbyBsoDr4dcuC2
 98Fb4dgpUgnczf8ddCddjddP3Pek2VFK8TZKAKpnBnJy2FuD3gkzdbmt3KD1O1AGH04JITAG+
 12vhaklMDDb3Bg22q2So0r+NrU9my+cVxc1Q2O+VU3aXe4SQwsIIu0P+YtWiDWlaCZX/h3TW+
 +EpYzNRJfD0eFiIEcgBAbazvg0YPK72Ook0DkPoJbADuRFnRCWIBTtbRkh1NkaUaDCHWy1jzK
 ImjFxJ4BN7bCUw2HdzZ4QYfRNPCKJT3t806tpiW2ikWAw0x03ZK4O2I+xqWyfGoYbUJJ6ljuV
 3aPJiDxWf1yhFiMR49+tVn+sqkHHsejmsowbjTRjTztT+e3gEsD+WZv3qGnX8FA/TCTC3dMyx
 HOOj0vO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_130828_864921_D5F8DAF3 
X-CRM114-Status: GOOD (  13.20  )
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

The brcmnand driver contains a bug in which if a page (example 2k byte)
is read from the parallel/ONFI NAND and within that page a subpage (512
byte) has correctable errors which is followed by a subpage with
uncorrectable errors, the page read will return the wrong status of
correctable (as opposed to the actual status of uncorrectable.)

The bug is in function brcmnand_read_by_pio where there is a check for
uncorrectable bits which will be preempted if a previous status for
correctable bits is detected.

The fix is to stop checking for bad bits only if we already have a bad
bits status.

Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")

Signed-off-by: david regan <dregan@mail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index f759297..aee78f5 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2106,7 +2106,7 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
                                        mtd->oobsize / trans,
                                        host->hwcfg.sector_size_1k);

-               if (!ret) {
+               if (ret != -EBADMSG) {
                        *err_addr = brcmnand_get_uncorrecc_addr(ctrl);

                        if (*err_addr)
--
1.8.3.1





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
