Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA1BC021AA
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2025 14:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jc5Lc3+gGDVji7mIbAx40v86JEybFKwiWVEA2FL0gz8=; b=AWw4uOBiFAJ8vA
	Y9UT5+/Hk2w5lVn3OmPDU1BxocXNeIUc7lLOGdLR3R9i/bQqk9jyUIdh3vNZ7HF3a4degvpo6QLKY
	43DK+pPDVoxV5bwUMbtIMJU/qpljR7srcfffq1iQUG9olYYb64H3lyYioWB7Zrn8mZ5LqsqzXIGLr
	R3Qt1akifz1omAX5zOhN8vziWiDP/17ddjHJ1Zy2dZzMO2h/6OpbNh+m477B40sKX6of51UWSYCf1
	Djp2tuFiYw0i8EKnBqVGvuipM+lFAOKxcSvVsYNBdom20J0TCUmUvLM9cdNGFpT8LGrBIeCOEj7TQ
	JwYmPcgJ3LdSzt+IM0rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2LO-00000004uKS-3q2V;
	Mon, 17 Feb 2025 14:43:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk24f-00000004qam-2sRn
	for linux-mtd@lists.infradead.org;
	Mon, 17 Feb 2025 14:26:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 963D55C540D;
	Mon, 17 Feb 2025 14:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69AAFC4CED1;
	Mon, 17 Feb 2025 14:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739802376;
	bh=wG2h5mjfR5WdWRZw4GIiXxfSjU+mXOMLNv/0VoXTxQE=;
	h=From:To:Cc:Subject:Date:From;
	b=l52fTFraHiKy9zsRZs4CEefezKD1AQKwxLUV5vFkH6/95TQWx7jFCHEqKNppI8eno
	 c18LaDdPF8I6jb7p3NfZmBl97c/Cg+M8aIwm2xGDxEr3Oc5VfbI9w/U3Tef7SZdsu4
	 FJk1OSTTVphxy7UGzKMa8uW7cS5BWtLywF6Nev11hRTvJ/Mog3IgrxOKlHSEInOfan
	 6XIeYKDe1QRNtP2n8ukkjGyE6AcwUtGwWHQPCwgi+4/G/j3zj1lnwn/rjRBeRkpZjY
	 oc7xtsfn0ydAC3CE7XVo9f0Glfjbn1TrCwaFJlWRzBTPBR5NlDl1jKNkvt5O+9vlEo
	 PxaGcYPP2DTlA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	linux-mtd@lists.infradead.org
Subject: [GIT PULL] mtd: spi-nor: fixes for v6.14-rc4
Date: Mon, 17 Feb 2025 14:26:14 +0000
Message-ID: <mafs08qq4myux.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_062617_777210_B924FEC4 
X-CRM114-Status: GOOD (  10.24  )
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

Hi Miquel,

We have a regression with SST flash writes. This pull request contains
the fix.

Regards,
Pratyush Yadav

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/fixes-for-6.14-rc4

for you to fetch changes up to 539bd20352832b9244238a055eb169ccf1c41ff6:

  mtd: spi-nor: sst: Fix SST write failure (2025-02-17 14:07:09 +0000)

----------------------------------------------------------------
Fix writes on SST flashes

Commit 18bcb4aa54ea ("mtd: spi-nor: sst: Factor out common write
operation to `sst_nor_write_data()`") introduced a bug where only one
byte of data is written, regardless of the number of bytes requested.
This causes the driver to use the incorrect write size for flashes using
the SST byte programming, and to spit out a warning.

----------------------------------------------------------------
Amit Kumar Mahapatra (1):
      mtd: spi-nor: sst: Fix SST write failure

 drivers/mtd/spi-nor/sst.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
