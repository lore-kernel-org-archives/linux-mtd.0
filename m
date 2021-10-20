Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072A9C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 08:46:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6A7B61361
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 08:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6A7B61361
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WCesnqO+vuk293/68TiZxOENJo79Q83QaoZZpKpSmt0=; b=4KJWbokG5S7Six
	VTQ/2ECw9NKCxSMasdBx1m21NDImWn8VCU7W7cPqypQMGxre4w1gxNt/5/7+JhxwZFkBz4vpv9Cf8
	Z4NQ01ODPr7krr8jvfnrjt6TFGdu7BouSBg6Ufy43dcyU4EkBIlW56pIrHwRUQutlPGKTbfVgziLu
	fx4vDJOXU3wZfD+htX9tS4HVwMyTXnu/0PqLkuoYfNTz339DWXAk9K/N9MlfEFuMY1p+nkJc0TteW
	MIlRvdSYx9M6lBup+7TmtpPsgnT3EnjdrHuKgMwjWnDB4TkiWiBJrmhURKA2TB5Ddzos8pYY37sSK
	wQbJ5S31Z6ZI0c8D/4pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md7EI-003rZH-5V; Wed, 20 Oct 2021 08:45:46 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md7EE-003rXP-M1
 for linux-mtd@lists.infradead.org; Wed, 20 Oct 2021 08:45:44 +0000
Received: from zen.. (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id 12558C7EB5;
 Wed, 20 Oct 2021 08:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1634719538; bh=U2cnM+X/mc5mK5tveSmn1kn/3Fb65kAhrB7Tiv1YV1k=;
 h=From:To:Cc:Subject:Date;
 b=Yl9RMwcrINNd04z4ITkvJSWFHDBHrzMtju7SHnR80RDUStKsSz8F0/SH+AUdhBbQk
 hlrjbPMOEu+enFUJGo5dU2FUFIgfPusaFq28ybjhOv8AJnBSisUNoe3Oi/eysyOqsl
 QWfl3RRc+uoIl5lOvRAQBKC4Uv6jtneqNV/SqNNagQdXfpA8zyxkIIiFCbwGH/3c1T
 GlPPzDeOw0DNn5nymhv6xAFkI17XxuqTjY5bSnTxdl9y3g1TblRSkoTTBZYBgnz2+U
 N6d+l3bU8KUfuLEUbMAD516HMMa/4LFlmShTOyEKSWjRCgZ1wz2pEUOlEbW26Jauzt
 h6bZGqFaK5qSg==
From: Sean Nyekjaer <sean@geanix.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sean Nyekjaer <sean@geanix.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] mtd: core: protect access to mtd devices while in
 suspend
Date: Wed, 20 Oct 2021 10:45:30 +0200
Message-Id: <20211020084534.2472305-1-sean@geanix.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_014542_898618_21303E75 
X-CRM114-Status: GOOD (  10.76  )
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

Sean Nyekjaer (4):
  mtd: rawnand: nand_bbt: hide suspend/resume hooks while scanning bbt
  mtd: core: protect access to MTD devices while in suspend
  mtd: rawnand: remove suspended check
  mtd: mtdconcat: add suspend lock handling

 drivers/mtd/mtdconcat.c          |   7 +-
 drivers/mtd/mtdcore.c            | 131 +++++++++++++++++++++++++++----
 drivers/mtd/nand/raw/nand_base.c |  52 +++---------
 drivers/mtd/nand/raw/nand_bbt.c  |  28 ++++++-
 include/linux/mtd/mtd.h          |  81 +++++++++++++++----
 include/linux/mtd/rawnand.h      |   5 +-
 6 files changed, 227 insertions(+), 77 deletions(-)

-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
