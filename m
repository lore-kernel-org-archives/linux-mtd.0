Return-Path: <SRS0=zMDb=SA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 112B8C4360F
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 07:30:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE06B2183F
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 07:30:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G6Q1MTfo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="xCGJM6Wr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE06B2183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=hklHw/DxP6qX5Z5pMCaelZj99ZAXwEUecCHwGEj1TqU=; b=G6Q
	1MTfojBjRgG8OHXp7+0WTqm3kzqG9GpaQbUw9UG53sfFyOXOeQpXPDJbVnG4knc878F4TbL4+UGPJ
	h7AUriQ8UCf95oMGS4B7R/FzrBae9gkOQTAc0iBGjR/SE3b3MeExoRXreaZVQcOqdPFbDd8doiKnF
	zbT7KNU9zlIt6QJs89oaM+WrITpUjVghO1Zr6X6QG29IwDYjoQyffGjfTHS+GciFiwdgzpes1IRxJ
	fZ81QAYAQRYJ5dUTDOnhp6ftxtnIP7a+/Yq9YfzadgFs6+OWHIlr0DERB7BY5OQLsXcNt3XOhcCiI
	Vd2kCDHRewZQETVm2P+aSqQQyf+Ulqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9lxo-0006T6-Lt; Fri, 29 Mar 2019 07:30:08 +0000
Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9lwa-0004S7-VY
 for linux-mtd@lists.infradead.org; Fri, 29 Mar 2019 07:28:55 +0000
Received: from grover.tkatk1.zaq.ne.jp (zaqdadce369.zaq.ne.jp
 [218.220.227.105]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id x2T7SQa7002537;
 Fri, 29 Mar 2019 16:28:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x2T7SQa7002537
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1553844507;
 bh=ukTnO9IMqmEzjeKRCA0eRgyV1YFCQFAKScpWn4HMm/k=;
 h=From:To:Cc:Subject:Date:From;
 b=xCGJM6Wrmn+S0Cnc7l33nKlJjUsg9VnSH9IT/+Pwn7e/ghnuD2V8GtVONOxlggu0/
 N2OBL0tZZQnqqt37tSCJOiqvq1nLMorQ7uj8tUPEYnYv6+3t3wtmKAallcb7pjHTh/
 rLNPBsIsDO4EsN6k4NdhYxArz5AuQalNpDL7GSTMgWtUto8pGon/ATDGtFaReDGY5e
 mmNJ4sLJ9Nzl8gq1533YGdffQYz7oXQz0x0krlh/EJekDC32mNBVTrN2T01uHZLY/h
 7F/E9WEknpX4tqi438e4Mw0jk5bgLLvQZY3PM6N2CNkk+gTsDmQHQ1S4UFUHyF/Jvv
 8a/C8bK8aMYHw==
X-Nifty-SrcIP: [218.220.227.105]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 0/9] mtd: rawnand: denali: exec_op(),
 controller/chip separation, and cleanups
Date: Fri, 29 Mar 2019 16:28:12 +0900
Message-Id: <1553844501-7119-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_002853_345171_1FE6EDE3 
X-CRM114-Status: UNSURE (   9.05  )
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

Major changes in v4:
  - Add denali_exec_out() and denali_exec_in()
    in order to make denali_exec_instr() readable

  - Make .read_page_raw() and .write_page_raw() even simpler
    by giving up the performance

Major changes in v3:
  - Drop "mtd: rawnand: denali: use more precise timeout for NAND_OP_WAITRDT_INSTR"
    entirely according to the review comments in v2

  - Add comments to helpers in 2/9

Masahiro Yamada (9):
  mtd: rawnand: denali: use nand_chip pointer more for internal
    functions
  mtd: rawnand: denali: refactor raw page accessors
  mtd: rawnand: denali: remove unneeded casts in denali_{read,write}_pio
  mtd: rawnand: denali: switch over to ->exec_op() from legacy hooks
  mtd: rawnand: denali: use bool type instead of int where appropriate
  mtd: rawnand: denali_pci: rename goto labels
  mtd: rawnand: denali: decouple controller and NAND chips
  mtd: rawnand: denali: remove DENALI_NR_BANKS macro
  mtd: rawnand: denali: clean up coding style

 .../devicetree/bindings/mtd/denali-nand.txt        |   40 +-
 drivers/mtd/nand/raw/denali.c                      | 1146 ++++++++++----------
 drivers/mtd/nand/raw/denali.h                      |  117 +-
 drivers/mtd/nand/raw/denali_dt.c                   |   98 +-
 drivers/mtd/nand/raw/denali_pci.c                  |   38 +-
 5 files changed, 823 insertions(+), 616 deletions(-)

-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
