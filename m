Return-Path: <SRS0=a0wE=6H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A08C55186
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Apr 2020 08:39:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 468A420781
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Apr 2020 08:39:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ELj0aAMZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 468A420781
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Bk1eRoHcp8BPekf+12b7VxV/cRiT9w98/7KlUY0XDRY=; b=ELj
	0aAMZhlN0Vw+r58PlGNwZPJFOa1fihiFDNl9O325c2E1t5669TsueyflTFI3ipf1Rc9V2sQTnC57Y
	OYuXlsoxpRAIcD6+kjMKTDYKHKNjMcASLo9UADjRh4uUaJ7gG1eTMofYK9p9YX15KaID+HNp21Vo5
	8WgLGoncdlFpVgM9YXGsIZsBRsqKcWhWLQh8Iw4hlIQQOghKgtaGzwPt6DJoDbuvowJ/B+dbiBwI+
	hyNDFWAOmJ49wlthClxSoC2cCWAe6uJT/LMC/qR7PQlIZfZpf5ROZ8FgJ0vRrQ8V+BpndxnuFXlAN
	Pn9OZKjzzQaxz9suZjrqWpJQXdUaMNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRXO7-0007hs-9w; Thu, 23 Apr 2020 08:39:15 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRXO4-0007fF-B7
 for linux-mtd@lists.infradead.org; Thu, 23 Apr 2020 08:39:13 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG3.macronix.com with ESMTP id 03N8ck1n034673;
 Thu, 23 Apr 2020 16:38:46 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Subject: [PATCH v2 0/2] mtd: spi-nor: macronix: Add support for
 mx25l512/mx25u512
Date: Thu, 23 Apr 2020 16:38:41 +0800
Message-Id: <1587631123-25474-1-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
X-MAIL: TWHMLLG3.macronix.com 03N8ck1n034673
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200423_013912_660813_102052BA 
X-CRM114-Status: UNSURE (   3.34  )
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
Cc: juliensu@mxic.com.tw, Mason Yang <masonccyang@mxic.com.tw>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

mx25l51245g/mx25u51245g is a mass production for new design and
replace mx66l51235l/mx66u51235f(phase out).

Validated by read, erase, read back, write and read back
on Xilinx Zynq PicoZed FPGA board which included
Macronix SPI Host (driver/spi/spi-mxic.c).

change log:
v2:
Add which controller we tested the mx25l/u51245g.

Mason Yang (2):
  mtd: spi-nor: macronix: Add support for mx25l51245g
  mtd: spi-nor: macronix: Add support for mx25u51245g

 drivers/mtd/spi-nor/macronix.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
