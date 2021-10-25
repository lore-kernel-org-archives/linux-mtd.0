Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC17C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 03:29:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FF646105A
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 03:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FF646105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+2Re70OLrgNg4VccrIE2OL/hwdGR6BJDUjNBw337ag4=; b=QvKU1ZmEg0jd32
	ebEIAZK/oUwLVxjYc6khxI2v3iVfd2FtSFO1Ksp2bstpA81ynCWWac6JWxYPLCIg8d/LuJnulWszp
	3sVLGvDTusgmn+Drvj8IhxUGzlg9JNaE91bohAV+p9d/2tQc1CiY5dXwtu96osc4jU545qXp+L0Gu
	pO9LCCif3GLhn5EZvLwjC3f62zbEy3ltG1mSCgZ0quVG6n9+RjhG9eGb4LOD+nqME22ltuXYMy/DZ
	gM+WeBNrHrHAjkJwMK7bGF7unSZOE7tC0Y+4EjJSECoj2Wvels1Gveda17ps+QYi2I3jsAYpp88qF
	0friVWQh3PagX/1ITf5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meqfG-00F7ys-Sw; Mon, 25 Oct 2021 03:28:46 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meqf1-00F7sF-Gy
 for linux-mtd@lists.infradead.org; Mon, 25 Oct 2021 03:28:33 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Hd0jf1R0qzZcQx;
 Mon, 25 Oct 2021 11:26:30 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Mon, 25 Oct 2021 11:28:22 +0800
Received: from huawei.com (10.175.127.227) by dggema761-chm.china.huawei.com
 (10.1.198.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.15; Mon, 25
 Oct 2021 11:28:22 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
 <Artem.Bityutskiy@nokia.com>, <ext-adrian.hunter@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>
Subject: [PATCH 00/11] Some bugfixs for ubifs/ubi
Date: Mon, 25 Oct 2021 11:41:05 +0800
Message-ID: <20211025034116.3544321-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_202831_869266_09D21512 
X-CRM114-Status: UNSURE (   4.97  )
X-CRM114-Notice: Please train this message.
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


Zhihao Cheng (11):
  ubifs: rename_whiteout: Fix double free for whiteout_ui->data
  ubifs: Fix deadlock in concurrent rename whiteout and inode writeback
  ubifs: Fix wrong number of inodes locked by ui_mutex in ubifs_inode
    comment
  ubifs: Add missing iput if do_tmpfile() failed in rename whiteout
  ubifs: Rename whiteout atomically
  ubifs: Fix 'ui->dirty' race between do_tmpfile() and writeback work
  ubifs: Rectify space amount budget for mkdir/tmpfile operations
  ubifs: setflags: Don't make a budget for 'ui->data_len'
  ubifs: Fix read out-of-bounds in ubifs_wbuf_write_nolock()
  ubi: fastmap: Return error code if memory allocation fails in
    add_aeb()
  ubi: fastmap: Add all fastmap pebs into 'ai->fastmap' when
    fm->used_blocks>=2

 drivers/mtd/ubi/fastmap.c |  69 ++++++-----
 fs/ubifs/dir.c            | 235 +++++++++++++++++++++++---------------
 fs/ubifs/io.c             |  34 +++++-
 fs/ubifs/ioctl.c          |   4 +-
 fs/ubifs/journal.c        |  53 +++++++--
 fs/ubifs/ubifs.h          |   2 +-
 6 files changed, 254 insertions(+), 143 deletions(-)

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
