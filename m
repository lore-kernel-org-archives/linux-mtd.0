Return-Path: <SRS0=+O2D=RP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE642C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 08:46:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8916B21734
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 08:46:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VIJ8BMvH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="SqjhzdHE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8916B21734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=rDSpYhYkSJdxJa1TDWPk0vZuqsEnudI4leASwpFeDcU=; b=VIJ
	8BMvHkTcjsj76XThJnkQpLIiB7iCAZcbe9aJR8/RW4v4GchGyFjbNfth2S+bCkdYrOen2bxEYdkX6
	eyjOcy/9zrxBSDIcOyei7AqWeN7W3gff4TaBSI53vabe+iEl7xIC7uyyX6C/zQq7pCFVSO0KuQBE8
	fQH20/yzOZTSkp/I+gzvftPS1yPQnZ965MrHZZd2pNHnaf62Hnkd7nWgaHeXdnptkdgmSOy8w0O7u
	FYC9hXRwixBg2SyomCTfKCUgl1F145z2KYt9c2a5ynKfUsdE8XUT2AtQ+DJPRzjnfU3LxOp4i1EQ8
	RL8R4KTPz/CGFP6AuwL19d1fZ05d4Ww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3d3n-0001l2-S4; Tue, 12 Mar 2019 08:46:55 +0000
Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3d2h-00009M-GT
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2019 08:45:49 +0000
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-09.nifty.com with ESMTP id x2C8j6Za004092;
 Tue, 12 Mar 2019 17:45:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x2C8j6Za004092
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1552380308;
 bh=C9gZXtfmd5qJIYI6eWiFiUbhuKniUjG4z7pUr+Zd8L8=;
 h=From:To:Cc:Subject:Date:From;
 b=SqjhzdHEvESIJ4zgNhoCQyTKXNABVfIVIrwvcbiqeaOFQIs+onEwInRZXd+4Sq0vC
 u91GiExfxkUEYLBgTUNEYzkvuj7d9b4gxwAYAjBwD9TBJkbpQfflysgGgsUnxqcxx0
 JYyUw/G5jZ3xQfWaBk/r3O4OW7C7QFsNPOwF5HUra6uPjdHzOVnQwBvk5P3pNHL+57
 eh+i0rW7Wr2Qr/GZpl3/paLcYt+PzkD8L0mT9VxSEGzqehXRC1d70cVUe0cCBeFLUS
 EOzfoJ07Hz9UhinNzMwcXZn69xNpVNHm37B2VixdGHzvL/drZvoqth0LdXIxDrURlf
 H6d/Suw3NR7vA==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 0/9] mtd: rawnand: denali: exec_op(),
 controller/chip separation, and cleanups
Date: Tue, 12 Mar 2019 17:44:41 +0900
Message-Id: <1552380290-19951-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_014547_794643_DB41E81D 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


I took time for the Denali driver to catch up with the latest framework.

 - switch over to exec_op() and remove legacy hooks

 - separate controller/chips

 - various cleanups

Major changes in v3:
  - Drop "mtd: rawnand: denali: use more precise timeout for NAND_OP_WAITRDT_INSTR"
    entirely according to the review comments in v2

  - Add comments to helpers in 2/9



Masahiro Yamada (9):
  mtd: rawnand: denali: use nand_chip pointer more for internal
    functions
  mtd: rawnand: denali: refactor syndrome layout handling for raw access
  mtd: rawnand: denali: remove unneeded casts in denali_{read,write}_pio
  mtd: rawnand: denali: switch over to ->exec_op() from legacy hooks
  mtd: rawnand: denali: use bool type instead of int where appropriate
  mtd: rawnand: denali_pci: rename goto labels
  mtd: rawnand: denali: decouple controller and NAND chips
  mtd: rawnand: denali: remove DENALI_NR_BANKS macro
  mtd: rawnand: denali: clean up coding style

 .../devicetree/bindings/mtd/denali-nand.txt        |   39 +-
 drivers/mtd/nand/raw/denali.c                      | 1141 +++++++++++---------
 drivers/mtd/nand/raw/denali.h                      |  119 +-
 drivers/mtd/nand/raw/denali_dt.c                   |   98 +-
 drivers/mtd/nand/raw/denali_pci.c                  |   38 +-
 5 files changed, 852 insertions(+), 583 deletions(-)

-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
