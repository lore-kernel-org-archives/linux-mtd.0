Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC23C282C5
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 07:43:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F07BF20854
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 07:43:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VRIixjqI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="B5mtwSVL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F07BF20854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=caSBzXSoQO4JT36s1LCFqB0aALYjJY5xYiL56inMl7o=; b=VRI
	ixjqIiNC3jk3ha2psKaF8Ws5kIpADKYwCOsDsNTaykM9TNXDDQ4QhIRno7dpZeB+0QNWu0Rcf5nb9
	YUagN9Om9HAog182+P3Xp9WDRrBh43O206sCr2kJMzl8BGPLaYgeaFXThokptJCqB/VqfaaW2Lff4
	m3LLATV491hNsCu363IZAjN3sU/+01q1jukLu71OO1B593tmAbTXqJYaOg33pYiV46Gr974cELESf
	NVwSOJPm2tkxEa1FgM7nsV8BGTSPJ/caFTU2zZFfQ3YhjxGyY0e8NkNWK4Dq8ywDaMULtTaWlEuJO
	HcStCRhNzltVhgN6iKaOih6D22MkQ8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glqil-0001Fd-SD; Tue, 22 Jan 2019 07:43:43 +0000
Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glqig-00018s-9P
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 07:43:42 +0000
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id x0M7h55U025355;
 Tue, 22 Jan 2019 16:43:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x0M7h55U025355
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1548142986;
 bh=/EAQzAfgjQMPjJopeHVd+BRs6kFnnDKEQM2Nkxq5rFc=;
 h=From:To:Cc:Subject:Date:From;
 b=B5mtwSVLLFEemzEsPQyIL2J4v+p+jam/DCKTQ4+t65wj9hFw3wf8CYFMeDfWBoDHU
 WQqc/HLApvjvrdsCB2cPlsZUu1t6kraXGN+YCr/AfD885qA/N/E3YWhiDa352RUc8W
 OfoVkFfvS5R17bbFpIlFX4GFVoQyHzXaYwgPFXSO6IuCwShch7QDhbE46Ahi5LvqOv
 YP0mXHLsIOXCIWwr92k1yfloT/p3aTa8IlVlfwveELhxIwm2Dtbphq+Vd7dda8Y47C
 j9ECGjU7b7kyGvkhv0+x+74lt9aaH1XACav8iqIp01QfseLH4NUQXudY83vjj1Cvq6
 3VbVbU3UUZU8w==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/2] mtd: nand: use unnamed union field
Date: Tue, 22 Jan 2019 16:42:53 +0900
Message-Id: <1548142975-14219-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_234339_553602_AF66A433 
X-CRM114-Status: UNSURE (   8.05  )
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
Cc: Lucas Stach <dev@lynxeye.de>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Linus Walleij <linus.walleij@linaro.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-kernel@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The new exec_op() scheme takes advantage of union
in order to store instruction private data, which is mutually
exclusive.

I felt a bit annoyed with the long accessors.
At least, we can omit "ctx." by making the union anonymous.

I converted nand_op_instr and nand_op_parser_pattern_elem.

I still see more instances, e.g.

  struct nand_op_data_instr {
          unsigned int len;
          union {
                  void *in;
                  const void *out;
          } buf;
          bool force_8bit;
  };

We could convert this into:

  struct nand_op_data_instr {
          unsigned int len;
          union {
                  void *ibuf;
                  const void *obuf;
          };
          bool force_8bit;
  };

Or, if we want to match the struct to NAND_OP_*_INSTR,
we can split it into two structures.

  struct nand_op_data_in_instr {
          unsigned int len;
          void *buf;
          bool force_8bit;
  };

  struct nand_op_data_out_instr {
          unsigned int len;
          const void *buf;
          bool force_8bit;
  };

Anyway, let's see if people are positive about
this shortning.



Masahiro Yamada (2):
  mtd: rawnand: use unnamed union in struct nand_op_instr
  mtd: rawnand: use unnamed union in struct nand_op_parser_pattern_elem

 drivers/mtd/nand/raw/ams-delta.c    | 18 +++++------
 drivers/mtd/nand/raw/fsmc_nand.c    | 41 +++++++++++-------------
 drivers/mtd/nand/raw/marvell_nand.c | 16 +++++-----
 drivers/mtd/nand/raw/nand_base.c    | 64 ++++++++++++++++++-------------------
 drivers/mtd/nand/raw/tegra_nand.c   | 10 +++---
 drivers/mtd/nand/raw/vf610_nfc.c    | 14 ++++----
 include/linux/mtd/rawnand.h         | 36 ++++++++++-----------
 7 files changed, 97 insertions(+), 102 deletions(-)

-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
