Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D617FC43387
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 12:54:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5B4620896
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 12:54:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B9Bcb9Hy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ig3Jn45q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5B4620896
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G5lrqsY2sZMKoqxAocc8nBcXwObY3f5vu6qi3R6Gce0=; b=B9Bcb9Hy42zfX1
	DBRSplYFTmnabrd+7kJYUrc86A+zEYhzoHjQwkRZvUcYjtwhtb2rdewFMwh+chG10zmrp8J3w+lFb
	L9c/ZpC+R7Ga7RXo2s0H3NrVSUgJpLewSw3JUQKOHUBTqkXU+zaOAtpjJ7rKxJzQht7EZSgQjfZDb
	Bc/hDoUznxyGbz1IcFXbvCIS1V4DcFoJzQjFMeaNi+KhyIOjG5iessPloJxKclPahGOzGFW4L1ht/
	5ZaV59B70ASooVuHw0h/+Vg0p7vT8ARD8+k6eSvh6RLoEYW7gFnB3Tb65RYpsT0HoBOPj+KQ8XRc0
	mA4e+G5hKiWc9Yq+HF+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkTfS-0004GT-88; Fri, 18 Jan 2019 12:54:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkTfK-00047q-GX
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 12:54:34 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 65120208E4;
 Fri, 18 Jan 2019 12:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547816069;
 bh=dKpb1VwfKpVdt6XVYpsKP+4GLojPFXwRwTFZaeGZXC8=;
 h=Date:From:To:Cc:Subject:From;
 b=ig3Jn45qUEIykhVNOqqg1TWSN6Bs77FXJcBjPPzp0IPMUeejhfk4AjcKtKVrW3I+/
 MmgCqz/99LdxUFB70BxyJaZ/aZte6Ld/ofVFL5+nPXoblyNcky6kVB0s788hMX4RON
 ZCljvgCS2YU8pcQPhl8TMG/PozKA/JNqSIWR2R8Q=
Date: Fri, 18 Jan 2019 13:54:20 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] mtd: Fixes for 5.0-rc3
Message-ID: <20190118135355.0072b66d@bbrezillon>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_045431_330815_2CCDD99E 
X-CRM114-Status: GOOD (  11.01  )
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
Cc: Marek Vasut <marex@denx.de>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Linus,

Here is the MTD fixes PR for 5.0-rc3.

Regards,

Boris

The following changes since commit 1c7fc5cbc33980acd13d668f1c8f0313d6ae9fd8:

  Linux 5.0-rc2 (2019-01-14 10:41:12 +1200)

are available in the Git repository at:

  git://git.infradead.org/linux-mtd.git tags/mtd/fixes-for-5.0-rc3

for you to fetch changes up to d311e0c27b8fcc27f707f8cac48cd8bdc4155224:

  mtd: rawnand: denali: get ->setup_data_interface() working again (2019-01-18 10:27:01 +0100)

----------------------------------------------------------------
Raw NAND changes:
- jz4740: fix a compilation warning
- fsmc: fix a regression introduced by ->select_chip() deprecation
- denali: fix a regression introduced by NAND_KEEP_TIMINGS addition

----------------------------------------------------------------
Linus Walleij (1):
      mtd: rawnand: fsmc: Keep bank enable bit set

Luc Van Oostenryck (1):
      mtd: nand: jz4740: fix '__iomem *' vs. '* __iomem'

Masahiro Yamada (1):
      mtd: rawnand: denali: get ->setup_data_interface() working again

 drivers/mtd/nand/raw/denali.c      |  2 +-
 drivers/mtd/nand/raw/fsmc_nand.c   | 21 ---------------------
 drivers/mtd/nand/raw/jz4740_nand.c |  2 +-
 3 files changed, 2 insertions(+), 23 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
