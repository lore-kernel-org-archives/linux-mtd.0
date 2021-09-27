Return-Path: <SRS0=BNsP=OR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13256C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 22:34:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C70576103B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 22:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C70576103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+85FCkrEbpBE7XbC1Yoe0wXL88dTTJbYhAeYnVDWoBI=; b=XMqi0df7dD6xws
	6/ploKRwJLWriWSJquBjjlXWI7wZ573x1o6SMTXiPF+Qd8+4NfHtfN2WBhzPXTnCHYmNM0zBHOc15
	85YPnMLJFacp0Ql1Ebcq49XVlqU5z+PeufQ73QKJvlKiayKk1cahCVVmktm5XmozTh3KNB24COMol
	LhKfgHhWpPzhhQxuLd6NG9xeDekj8FMBBdkECrnQsIyjgtkfMbt4CasRg/VuBtUvDS7u2AAavJd1z
	jf0SeANuCo44BXfDQV83LQMvcgkLiiKtWkHYXNNiksL8iSnpuWD7MTFFfsBcy0J7iOHL3evcvkVjt
	iDnQu2DJbram3KoeXCxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUzBv-004gSN-Oy; Mon, 27 Sep 2021 22:33:43 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mUyhl-004Utg-Hp; Mon, 27 Sep 2021 22:02:33 +0000
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
Subject: [PATCH v2 0/6] block: 5th batch of add_disk() error handling
 conversions
Date: Mon, 27 Sep 2021 15:02:26 -0700
Message-Id: <20210927220232.1071926-1-mcgrof@kernel.org>
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

This is the 5th series of driver conversions for add_disk() error
handling. This set along with the entire 7th set of patches can be
found on my 20210927-for-axboe-add-disk-error-handling branch [0].

On this v2 series the following changes have been made
since the first iteration of this patchset:

  - rebased onto linux-next tag 20210927
  - ms_block: dropped this patch as its already merged on linux-next
  - mspro_block: dropped this patch as its already merged on linux-next
  - dropped the s390/block/xpram patch as that driver is now removed
  - s390/block/dcssblk: dropped my patch in favor of Gerald Schaefer's
  - added respective reviewed-by/acked-by tags

[0] https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/log/?h=20210927-for-axboe-add-disk-error-handling

Gerald Schaefer (1):
  s390/block/dcssblk: add error handling support for add_disk()

Luis Chamberlain (5):
  cdrom/gdrom: add error handling support for add_disk()
  rbd: add add_disk() error handling
  mtd: add add_disk() error handling
  s390/block/dasd_genhd: add error handling support for add_disk()
  s390/block/scm_blk: add error handling support for add_disk()

 drivers/block/rbd.c             |  6 +++++-
 drivers/cdrom/gdrom.c           |  7 ++++++-
 drivers/mtd/mtd_blkdevs.c       |  6 +++++-
 drivers/s390/block/dasd_genhd.c | 10 ++++++++--
 drivers/s390/block/dcssblk.c    |  8 +++++++-
 drivers/s390/block/scm_blk.c    |  7 ++++++-
 6 files changed, 37 insertions(+), 7 deletions(-)

-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
