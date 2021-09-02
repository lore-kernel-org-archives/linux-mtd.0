Return-Path: <SRS0=etPf=NY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF089C8302B
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 17:42:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1318610FF
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 17:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1318610FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WxRlmI+ptbcPBHvYyCiCB7pqhOKMJG1mMHSIm7ZF36c=; b=25VXvH9OqP7L1i
	UC52j3XSSwbFSFmKV3oCexaIjbE3p3S8q8gEOiN1CNqDtGVe3MCcDXMaQlKJ2Ave50NQGODnoKAeN
	V9FOqjOkurEP7OJTgzz3pOpluqmn7sLmlmTOjzDqC1JQHD25hWclnwnIVCZdcC9POOXt1HO9/N9vL
	Leh2mRNhxtzg2OkpOUJbM7Bk8GXUtNsxSbSz4XEKmK7LQUvTCGDek5vwfiUyOutXmPMskP5wnmuRj
	Pfe1D5sUZLYAHtwa9g4yBRq12BX2r0idlTuxDZjdoU+WbssKgwmgmlZtU08kwoWWE971S3ILSxtue
	ipVZye+wUNBR6KZ2vOrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLqiL-00A9Or-Fm; Thu, 02 Sep 2021 17:41:25 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mLqi1-00A9FA-My; Thu, 02 Sep 2021 17:41:05 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, gregkh@linuxfoundation.org, chaitanya.kulkarni@wdc.com,
 atulgopinathan@gmail.com, hare@suse.de, maximlevitsky@gmail.com,
 oakad@yahoo.com, ulf.hansson@linaro.org, colin.king@canonical.com,
 shubhankarvk@gmail.com, baijiaju1990@gmail.com, trix@redhat.com,
 dongsheng.yang@easystack.cn, ceph-devel@vger.kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, borntraeger@de.ibm.com, oberpar@linux.ibm.com,
 tj@kernel.org
Cc: linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH 0/9] block: 5th batch of add_disk() error handling conversions
Date: Thu,  2 Sep 2021 10:40:56 -0700
Message-Id: <20210902174105.2418771-1-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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

This is the 5th of 7 set of driver conversion over to use the new
add_disk() error handling. Please let me know if you spot
any issues. This set deals with miscellaneous block drivers.

This patch set is based on axboe/master, you can find the
full set of changes on my 20210901-for-axboe-add-disk-error-handling
branch [0].

It would seem there are going to be a total of 7 sets of patches. The
next one will be the wonderful and exciting world of floppy drivers.
The last is the required changes to add a __must_check for the return
value for the caller.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/log/?h=20210901-for-axboe-add-disk-error-handling

Luis Chamberlain (9):
  cdrom/gdrom: add error handling support for add_disk()
  ms_block: add error handling support for add_disk()
  mspro_block: add error handling support for add_disk()
  rbd: add add_disk() error handling
  mtd: add add_disk() error handling
  s390/block/dasd_genhd: add error handling support for add_disk()
  s390/block/dcssblk: add error handling support for add_disk()
  s390/block/scm_blk: add error handling support for add_disk()
  s390/block/xpram: add error handling support for add_disk()

 drivers/block/rbd.c                 | 6 +++++-
 drivers/cdrom/gdrom.c               | 7 ++++++-
 drivers/memstick/core/ms_block.c    | 6 +++++-
 drivers/memstick/core/mspro_block.c | 6 +++++-
 drivers/mtd/mtd_blkdevs.c           | 6 +++++-
 drivers/s390/block/dasd_genhd.c     | 8 ++++++--
 drivers/s390/block/dcssblk.c        | 4 +++-
 drivers/s390/block/scm_blk.c        | 7 ++++++-
 drivers/s390/block/xpram.c          | 4 +++-
 9 files changed, 44 insertions(+), 10 deletions(-)

-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
