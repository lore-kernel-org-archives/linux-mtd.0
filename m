Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9277CC10F00
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 04:04:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5260020882
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 04:04:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TQ99e3Gb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="fYYEorSq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5260020882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=RXBGtJvC/iAoAbIcECE5zeMVt5Ld5kxBAAbhgutp32s=; b=TQ9
	9e3GbL6XGd/+C5jragjSrosq/NJMh+gqSXDFn9QgjiG1mf8tZ3WEFBR3kShYkXbodcF7RnhUvb8Xi
	nf8Pc5qm7mQBeAX8k+fAfI3+FS/NqCOvA0P+4NLu+rh0lxwlSQDUR29Fhln0po9K0Sy0M4zf91Z2+
	wne/8HQc5viglhvYiWaxGbFdTLW1jDhSPBeLwteEe5ncsIMYe7AP9VnYXwXt5wWDJ4Ge+BSKSQdlS
	pGvmkRL6jZE8TU4eRUxyGVzGbHMMq8UABEmEPnxXuPwANpADPcqnsds8R1I2HckMUSw2BQ/NMosRL
	dg33UPtXswIJDWID1Nlow5CaFbi1vnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBAfE-00015Z-1i; Tue, 02 Apr 2019 04:04:44 +0000
Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBAeI-0008Ej-Fj
 for linux-mtd@lists.infradead.org; Tue, 02 Apr 2019 04:03:48 +0000
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x3243HaT021871;
 Tue, 2 Apr 2019 13:03:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x3243HaT021871
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1554177798;
 bh=4H9MGJSlbEpklZkslmhL5zcfV22J63gvcxppEKv7zWs=;
 h=From:To:Cc:Subject:Date:From;
 b=fYYEorSqS40lPH3j1jj3ClqSRgsA9OyfZKj95ZO3KcAZ8dWEstgPhnQyoxsyXSk3E
 3ccSeiNGQL/OaMvN7NFbe80tBsh2YbDwgBUlhCVjQCowvo1LWgJdWa7TqcwLKYhFPU
 eqdMODwFxafwVKd2hXy3y3Du+NbAqdPE0oR8q/EUKv7g9APOIsolMsqamy5MbXgkcO
 Ebq/pj735Ghy49eprtOvT9jFGVBbixHMHv76QKI7D7C1wlzY8k53WS7LA23Z4PO/e8
 rxbMCTNUgfRv4Jr442yXdejzj/PCHB8PtInMPaeKvim+fGqKenO2vIY1K5N07IPBl/
 e/i8eHL/o+CqQ==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 0/9] mtd: rawnand: denali: exec_op(),
 controller/chip separation, and cleanups
Date: Tue,  2 Apr 2019 13:03:00 +0900
Message-Id: <1554177789-15414-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_210346_750423_0680BE70 
X-CRM114-Status: UNSURE (   9.85  )
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

Major changes in v5:

  - Passing both nand_chip and denali is redundant.
    Pass only nand_chip to local helpers.

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
  mtd: rawnand: denali: use more nand_chip pointers for internal
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
