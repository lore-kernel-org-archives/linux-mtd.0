Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E45C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 23:34:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15BCD61151
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 23:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15BCD61151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MJrsAtN2nhMFY2r18qUHxwsGBxl1mf3Q+nZMGfFC9B8=; b=DB7MoxqN1knGZA
	UFMJ9LkV4HEEzhrlNydGaskR9O+fOGu85QoSC5WNO/YQMSr50vCo+//7CYA4FKQpdsneqP0y7Y4TV
	bsbZRwmCcLAd9/lh65coUHuq2UY1CAZ4fhJQ7zBVhx14gCG9BAWkssAM0zbHf4vapc7pU1zGYR0pn
	sq5s9aWEaQQkjerVMpgcCOzDESe6b2PcSvi6vhRXCJhn9tvUj4Gd17WbPyFacGLiV8dEkqAJR6qbB
	qAKXjkwioLzjnlrdsGTDnzXcuaiLFS23hPYyG++dN3VS5Z/+tzFcUS8jot3XuiTl54nvr7NtdNWrK
	J+5k0qK/bxWV0yCgfboA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbWhq-0097Mz-Cu; Fri, 15 Oct 2021 23:33:42 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mbWej-0095ur-55; Fri, 15 Oct 2021 23:30:29 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, jejb@linux.ibm.com, martin.petersen@oracle.com,
 agk@redhat.com, snitzer@redhat.com, colyli@suse.de,
 kent.overstreet@gmail.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, roger.pau@citrix.com, geert@linux-m68k.org,
 ulf.hansson@linaro.org, tj@kernel.org, hare@suse.de, jdike@addtoit.com,
 richard@nod.at, anton.ivanov@cambridgegreys.com, johannes.berg@intel.com,
 krisman@collabora.com, chris.obbard@collabora.com, thehajime@gmail.com,
 zhuyifei1999@gmail.com, haris.iqbal@ionos.com, jinpu.wang@ionos.com,
 miquel.raynal@bootlin.com, vigneshr@ti.com, linux-mtd@lists.infradead.org
Cc: linux-scsi@vger.kernel.org, dm-devel@redhat.com,
 linux-bcache@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH 0/9] block: reviewed add_disk() error handling set
Date: Fri, 15 Oct 2021 16:30:19 -0700
Message-Id: <20211015233028.2167651-1-mcgrof@kernel.org>
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

Jens,

I had last split up patches into 7 groups, but at this point now
most changes are merged except a few more drivers. Instead of creating
a new patch set for each of the 7 groups I'm creating 3 new groups of
patches now:

  * This set, for which we already have an Acked-by or Reviewed-by tag,
    it would be nice to get clarification of driver maintainers want
    these to go through you or if a the maintainers want to pick these
    changes up themselves.

  * A second set will deal with patches which have no reviews done for
    them yet 

  * The last set deals with the __register_blkdev() change and the
    __must_check change which ensures we don't let in new drivers
    which don't deal with error handling.

If you're a maintainer of any of the below patches and wish for them to
go through Jens' tree directly now would be a good time to say so or
you can just pick the patch up yourself.

Luis Chamberlain (9):
  scsi/sd: add error handling support for add_disk()
  scsi/sr: add error handling support for add_disk()
  dm: add add_disk() error handling
  bcache: add error handling support for add_disk()
  xen-blkfront: add error handling support for add_disk()
  m68k/emu/nfblock: add error handling support for add_disk()
  um/drivers/ubd_kern: add error handling support for add_disk()
  rnbd: add error handling support for add_disk()
  mtd: add add_disk() error handling

 arch/m68k/emu/nfblock.c       |  9 +++++++--
 arch/um/drivers/ubd_kern.c    | 13 +++++++++----
 drivers/block/rnbd/rnbd-clt.c | 13 +++++++++----
 drivers/block/xen-blkfront.c  |  8 +++++++-
 drivers/md/bcache/super.c     | 17 ++++++++++++-----
 drivers/md/dm.c               |  4 +++-
 drivers/mtd/mtd_blkdevs.c     |  6 +++++-
 drivers/scsi/sd.c             |  8 +++++++-
 drivers/scsi/sr.c             |  7 ++++++-
 9 files changed, 65 insertions(+), 20 deletions(-)

-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
