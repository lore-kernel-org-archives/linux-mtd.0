Return-Path: <SRS0=fZpl=PO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7099C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Oct 2021 05:57:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6980F60E74
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Oct 2021 05:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6980F60E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S6k/GA63n8ZDiSN0lxeI1qsfoTAR5FrBdZerIFCG5zA=; b=TY+ZW66zqgAeVG
	cfTzyULpmjlxi94qPu1nr1DCAXOQExEAJaFYFC/HOX8dniHjpwdhxI2uUW5jbMau295DIOjFU/b2C
	GJ1YPlfmKcpclv3ySJpxe5J85zWQWMj7Cw9aDmVzo0t/Efp3Iw0d3hqg8ZfseyglD2SXFIG60b7Fb
	2X+coNAkuhq2puwCuL2rtXN33ifr35kpbfMr9jS/MO1IbpeFkWG3x+Za2D9z38Q1F5WJxe4UhC2s8
	ZGYbabMGtrdAZv1LhnQzDxbEISckwZQhZ8zxGzCGtL67aqUj/4krlHjD6oKl9vtG3I3KCHuyRCXV8
	DmEvF6Qg3o3LzjwRsorg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfFRt-000jNf-Qz; Tue, 26 Oct 2021 05:56:37 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfFRL-000jF5-9l
 for linux-mtd@lists.infradead.org; Tue, 26 Oct 2021 05:56:10 +0000
Received: from zen.. (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id 029B8D6C1D;
 Tue, 26 Oct 2021 05:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1635227759; bh=h0WfNzdXW1YTJlL4xfDpH76ZL8VMf+fPy+pRovMxQhk=;
 h=From:To:Cc:Subject:Date;
 b=b2e8MNt/MPgJgdQzZljubImA+DHkFNu/NzcESXXESwMw2S8tROeSehhsj3ALT0Vu+
 ueqlBBUehKnon+qtFd8pGadSx0v5Mvyaaq2EWVhWBiOA650cSNOzxyAYEJPT0/KSCe
 O7a8fL6wogSo6OmRIRb5tEOfLt8YSKqmNu10nrdiIRgvk8MFBr3VGDYjEmTWTUhi11
 TSnT00gEwbDp3D1S4X03j2GxjKALTIlkBlJ4y0fb1AKvTMJkaq+uG2nrWLjB90rEXD
 CWI/Qdan6sG7jwvvGBC/GW/NNsCFtJdn1K0Cm1AGNa3RJMIPUWujsswFDBYFF27FtN
 auPSQzhlQgtSA==
From: Sean Nyekjaer <sean@geanix.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sean Nyekjaer <sean@geanix.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] mtd: core: protect access to mtd devices while in
 suspend
Date: Tue, 26 Oct 2021 07:55:47 +0200
Message-Id: <20211026055551.3053598-1-sean@geanix.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_225604_002891_638ED773 
X-CRM114-Status: GOOD (  11.29  )
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

Follow-up on discussion in:
https://lkml.org/lkml/2021/10/4/41
https://lkml.org/lkml/2021/10/11/435

Changes since v3:
 - edited commit msg and author for mtdconcat patch

Changes since v2:
 - added signoff's to patch from Boris
 - removed accidential line break
 - kept tests consistent: master->master.suspended == 0 -> !master->master.suspended
 - added comments to mtdconcat patch
 - moved mtdconcat before ('mtd: core: protect access to MTD devices while in suspend')

Changes since v1:
 - removed __mtd_suspend/__mtd_resume functions as they are not used by
   mtdconcat anymore.
 - only master mtd_info is used for mtd_{start,end}_access(). Warn if we
   got mtd's.
 - added Boris patch for using uninitialized _suspend/_resume hooks when
   bbt scanning
 - mtdconcat uses device _suspend/_resume hooks
 - I don't really like the macro proposal from Boris
   mtd_no_suspend_void_call()/mtd_no_suspend_ret_call() I think they
   make the code complex to read and the macro's doesn't fit every
   where anyway...

Changes since from rfc v1/v2:
 - added access protection for all device access hooks in mtd_info.
 - added Suggested-by to [1/3] patch.
 - removed refereces to commit ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")
   from commit msg as commit 013e6292aaf5 ("mtd: rawnand: Simplify the locking") is 
   to be blamed.
 - tested on a kernel with LOCKDEP enabled.

Boris Brezillon (2):
  mtd: rawnand: nand_bbt: hide suspend/resume hooks while scanning bbt
  mtd: mtdconcat: don't use mtd_{suspend,resume}()

Sean Nyekjaer (2):
  mtd: core: protect access to MTD devices while in suspend
  mtd: rawnand: remove suspended check

 drivers/mtd/mtdconcat.c          |  15 +++-
 drivers/mtd/mtdcore.c            | 124 +++++++++++++++++++++++++++----
 drivers/mtd/nand/raw/nand_base.c |  52 ++++---------
 drivers/mtd/nand/raw/nand_bbt.c  |  28 ++++++-
 include/linux/mtd/mtd.h          |  81 ++++++++++++++++----
 include/linux/mtd/rawnand.h      |   5 +-
 6 files changed, 230 insertions(+), 75 deletions(-)

-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
