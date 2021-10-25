Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25092C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 09:29:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E022860EFF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 09:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E022860EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FMYc8v5dyjbiVJL/RVOJu+78+ReqciL8uJxEndyMmgQ=; b=GC1s7m9eO375pl
	+NmJYc5Ws91z9YnV4Zmrd9wsQr/IrscQ/zHAC653JXkBlGM+tZLcV3BbFRzKklSI3MAgEWQyVZ1jM
	lcK9mxlEXv7wLkkOvXPz8Hff5xEUKwz8L5km7SBrdYBf3sO7gmgYPiO8Wzu8NKYAjRlmJhNYtGwza
	9kme8+Dl19NGsD4xup06CpJ1G+tGHxqibCWVW/PZVfnC09PKPRrBMWakGVsHTibfVUJUGiKNOQ2Si
	jUc/qFXcb49A5zO6qpFWqbxJDQrhNrqVkc2te4+d7GpZ/KBgqlxQBBaIL+8qqfaI+zbg9GFMFRTaH
	+CiArBIVtxbQ971HCLVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mewHH-00FvYI-85; Mon, 25 Oct 2021 09:28:23 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mewH1-00FvUN-Lj
 for linux-mtd@lists.infradead.org; Mon, 25 Oct 2021 09:28:09 +0000
Received: from zen.. (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id F1DF0CC792;
 Mon, 25 Oct 2021 09:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1635154076; bh=tSBMD275WXCEMSU2orDsuQBV3IoPAOXeW1te0qIiFJM=;
 h=From:To:Cc:Subject:Date;
 b=fa+sTdsHhuW7MLwLs5MBPAhj43D+f+vNpYvqzmHDJtYK0OFfBU2NhUICeebtJqvwV
 Ewq0MT1AhlDRhUzHgTsPwDkTL8F4Ez/4ksG/9gNwrPOMvV1ZnvZ6FN7YOWytS9kjFP
 TfQtIuECdOtEe+V7hh18FHB2vG4CGc1LXi3hqvHHVtD/Qt/qAOfB9QafZLU+Ii9vGW
 HCz26KRORMamPjAtLhQczi3SILF5bKSAr8KMgsHY7fucMzTRQ0ajApzb9Wh3SiTaCZ
 ZTI+S0Idj6nyZUNBz9AQAfYlY9kqKs5+Hreix/vUiE/Wwj+URAE2DfSRB5vIdmkO11
 9P/Sp5cB9LnAQ==
From: Sean Nyekjaer <sean@geanix.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sean Nyekjaer <sean@geanix.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] mtd: core: protect access to mtd devices while in
 suspend
Date: Mon, 25 Oct 2021 11:27:48 +0200
Message-Id: <20211025092752.2824678-1-sean@geanix.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_022807_905908_19933454 
X-CRM114-Status: GOOD (  11.05  )
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

Boris Brezillon (1):
  mtd: rawnand: nand_bbt: hide suspend/resume hooks while scanning bbt

Sean Nyekjaer (3):
  mtd: mtdconcat: add suspend lock handling
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
