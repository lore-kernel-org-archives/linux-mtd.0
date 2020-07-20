Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B2DC433E5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 13:15:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 164B620729
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 13:15:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aKaLLIJZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="AbJr8yCZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 164B620729
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8Ge05rmSVzGIWn1EeIL2qMLjFJFiX3/3IqXkDoUKbDU=; b=aKaLLIJZKtK1QeRPfgNWkDj5GU
	KY1Sk5pbO4zN4B5QnlCNQXpan2lZHOryP2/euE1n2XAfF3Pwi3/FAtaGzqLL/V1JdeEb6AXsukF7X
	LfFs0+NKxMgR3kSQfKR1thMGpOpbH1gTvU3rAWwqbVUTx6E26AdZh1JZV9XtmUn0Wn7YP8irZruZ0
	38PaCrGssK8Z7HGzCdYJCgNjkjeGVFYNz+X3KBI97ujjcBJmDsw45hw8zQJ2offHRgW4CYzPKWigj
	6Idj0G1TBJ/j9XNDaipa3ofVDhnAsRAS9BjBcmkmSbZ2uGCotEX4tIKi1OG4eSYxMXLD0vHXdeKgu
	qSkx+hEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxVcK-0006uf-74; Mon, 20 Jul 2020 13:14:04 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxVcH-0006st-Hk
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2020 13:14:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1595250841; x=1626786841;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VHnpudTiQaUnZwPito8Dvod78cIZrfQgQKOZ/cOCHyE=;
 b=AbJr8yCZPj4moAzqwF/ELtpqcZWCvNH4Ky+IQ+ql2O0ceKePeEHpCcJ8
 tq467a245Q6DIzzDR0As9FpD3HJMqIfNDG9Kke8gDhgo2I546ObYlIx1U
 H8RZInhcrcO3BO960V42uhMCD7qwm4bqdU5brWNKxbU+0cfI+LouQuAbG
 YFDAtIplsShXtYS/SqGPXcp703BVaOumwddd5hbIiytkHxix/b/DzcuTk
 a7/YKavg8t//gsfuZelcCkXFwwNr+Y2Q6V+TslxZ/0bQXMEMa7sppBFjm
 44M5DG3ZfymsUkMWjZk7+kuPPMGoBRCjXTdM076dEiYl9U8bSbJLGtCt5 Q==;
IronPort-SDR: 6e7Ki86E3zn4ekv+LxWkunmpCeaWmutsdCbPtMyaDHN8d/MCuPTW/ETFOLnHQMCCa2r+I0kuqA
 ntNqk8qSm9rror+e1izwVCircZujrh4kqI7vUMUVaIu+II30mpjuypiKlukkBz8lBv8UQ6U36S
 qDg6m3TVtB3mlJaKufS9IaaJQSOgeUjz2xaiIIFgFypDPDF0ctdLR3e3I7JSR2NQz+TQiaM+zw
 VGzHsHaUR97P8BfnBAe9W4fu9Cn3q9p591V+m/gMjMaMEA0UTr4GNaKT2zNv/9+gaXJbWE/n4s
 uz4=
X-IronPort-AV: E=Sophos;i="5.75,375,1589266800"; d="scan'208";a="82504216"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Jul 2020 06:14:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 20 Jul 2020 06:13:23 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 20 Jul 2020 06:13:19 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <boris.brezillon@collabora.com>
Subject: [PATCH v5 0/6] mtd: rawnand: atmel: Convert the driver to exec_op()
Date: Mon, 20 Jul 2020 16:13:50 +0300
Message-ID: <20200720131356.1579073-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_091401_786882_7F6DAEC1 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 linux-mtd@lists.infradead.org, nicolas.ferre@microchip.com, Tudor
 Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

v5 drops an unused var in atmel_smc_nand_exec_op().

v4 is just a rebase which fixes some small conflicts. There is still
a small perf degradation on the write path on sama5, but that can be
addressed separately. Below is Boris's cover letter from v3.

Cheers,
ta

Hello,

This v3 addresses a few problems reported by Tudor (one of the fix has
been sent separately [1]). There's still a perf regression on sama5
(200KB/s drop in the write path), but it seems to be related to a core
change (when switching to exec_op(), the page_prog_end() does a
read_status() which was not present in cmdfunc()) and the fact that
the NFC is bad at handling simple commands.

What's probably more worrisome is the difference between the NFC and
the !NFC case (not introduced by this series). I suspect it was to do
with HSMC specific timings, or maybe the NFC simply behaves poorly
compared to direct bus accesses. In any case, this issue is orthogonal
to the exec_op() conversion, and can, IMHO, be addressed separately.

Regards,

Boris

[1]https://patchwork.ozlabs.org/project/linux-mtd/patch/20200518155237.297549-1-boris.brezillon@collabora.com/

Boris Brezillon (6):
  mtd: rawnand: atmel: Enable the NFC controller at probe time
  mtd: rawnand: atmel: Drop redundant nand_read_page_op()
  mtd: rawnand: atmel: Use nand_{write,read}_data_op()
  mtd: rawnand: atmel: Use nand_prog_page_end_op()
  mtd: rawnand: atmel: Convert the driver to exec_op()
  mtd: rawnand: atmel: Get rid of the legacy interface implementation

 drivers/mtd/nand/raw/atmel/nand-controller.c | 410 +++++++++++--------
 1 file changed, 233 insertions(+), 177 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
