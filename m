Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE2EC46CD2
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Dec 2023 01:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4NJVB70iii4/MbSA9fOprnCbek1YiAoj+SDLNjCrflo=; b=Z1jmflhQgT3des
	g+n3aCSaxRC6zAIwClhLgzQ2P8aJcxjft15cMTrB4JsnMVJPRaAR83UwBuqaoW5GklOfLO6TXMBKo
	hMdl6cWXf6KLR1hR0w8x3AkW8LDOvFhU+DlXfJD7MpWgNciIRVpiFZqlk0BccpG4o9ZLiO4v/IWsb
	OvAv0ewYSDLllFgo7zENmSNTRxkPM1mhFpEde9Tz5Yv8pivT+k44uCmlaz/7WPcPZg4NYxL190jyK
	88ovTWpYjpLgyg193xnl3JBO2ZwjKhWv5Ls+2JKiZQX38PHFLXV0xROQZ/h3xztoYrfdjJcFWNArS
	mUwcXdMlN6nzBL8EVp4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfHW-00Fo39-26;
	Thu, 28 Dec 2023 01:33:54 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfHQ-00Fnzp-0E
	for linux-mtd@lists.infradead.org;
	Thu, 28 Dec 2023 01:33:52 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4T0rcL0L0Lz1Q6th;
	Thu, 28 Dec 2023 09:33:06 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id CF09B18001F;
	Thu, 28 Dec 2023 09:33:32 +0800 (CST)
Received: from huawei.com (10.175.127.227) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 28 Dec
 2023 09:33:32 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <david.oberhollenzer@sigma-star.at>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <s.hauer@pengutronix.de>,
	<Tudor.Ambarus@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils 00/11] tests: Add new testcases for ubifs_repair
Date: Thu, 28 Dec 2023 09:36:28 +0800
Message-ID: <20231228013639.2827205-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_173348_492702_25408E2E 
X-CRM114-Status: UNSURE (   7.37  )
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

This patchset add new testcases for UBIFS repair.
Detailed testcases are explained in tests/ubifs_repair-tests/README.txt.

After testing(fs/ubifs/repair.c):
Kernel code coverage: 90%
kernel function coverage: 100%

Zhihao Cheng (11):
  tests: Add common libs for ubifs_repair test
  tests: ubifs_repair: Add authentication refusing test
  tests: ubifs_repair: Add cycle mount+repair test
  tests: ubifs_repair: Add powercut+repair+mount test
  tests: ubifs_repair: Add corrupt+repair+fault_inject test
  tests: ubifs_repair: Add cycle_powercut+repair test
  tests: ubifs_repair: Add random_corrupt+repair test
  tests: ubifs_repair: Add corrupted images
  tests: ubifs_repair: Add bad images repairing test
  tests: ubifs_repair: Add run_all script
  tests: ubifs_repair: Add README

 .gitignore                                         |   9 +
 Makefile.am                                        |   2 +
 configure.ac                                       |  11 +-
 tests/ubifs_repair-tests/Makemodule.am             |  52 +++
 tests/ubifs_repair-tests/README.txt                | 233 ++++++++++++++
 tests/ubifs_repair-tests/images/dentry_key.gz      | Bin 0 -> 5377 bytes
 tests/ubifs_repair-tests/images/dentry_nlen.gz     | Bin 0 -> 5386 bytes
 tests/ubifs_repair-tests/images/dentry_type.gz     | Bin 0 -> 5384 bytes
 tests/ubifs_repair-tests/images/dir_lost.gz        | Bin 0 -> 5381 bytes
 tests/ubifs_repair-tests/images/good.gz            | Bin 0 -> 5251 bytes
 tests/ubifs_repair-tests/images/inode_data.gz      | Bin 0 -> 5297 bytes
 tests/ubifs_repair-tests/images/inode_mode.gz      | Bin 0 -> 5383 bytes
 tests/ubifs_repair-tests/images/inode_nlink.gz     | Bin 0 -> 5383 bytes
 tests/ubifs_repair-tests/images/inode_size.gz      | Bin 0 -> 5384 bytes
 tests/ubifs_repair-tests/images/inode_xcnt.gz      | Bin 0 -> 5388 bytes
 tests/ubifs_repair-tests/images/log.gz             | Bin 0 -> 5232 bytes
 tests/ubifs_repair-tests/images/lpt_dirty.gz       | Bin 0 -> 5360 bytes
 tests/ubifs_repair-tests/images/lpt_flags.gz       | Bin 0 -> 5361 bytes
 tests/ubifs_repair-tests/images/lpt_free.gz        | Bin 0 -> 5350 bytes
 tests/ubifs_repair-tests/images/lpt_pos.gz         | Bin 0 -> 5374 bytes
 .../images/master_highest_inum.gz                  | Bin 0 -> 5034 bytes
 tests/ubifs_repair-tests/images/master_lpt.gz      | Bin 0 -> 5035 bytes
 tests/ubifs_repair-tests/images/master_tnc.gz      | Bin 0 -> 5024 bytes
 .../ubifs_repair-tests/images/master_total_dead.gz | Bin 0 -> 5033 bytes
 .../images/master_total_dirty.gz                   | Bin 0 -> 5032 bytes
 .../ubifs_repair-tests/images/master_total_free.gz | Bin 0 -> 5030 bytes
 tests/ubifs_repair-tests/images/root_dir.gz        | Bin 0 -> 1298 bytes
 tests/ubifs_repair-tests/images/sb_fanout.gz       | Bin 0 -> 5322 bytes
 tests/ubifs_repair-tests/images/sb_fmt_version.gz  | Bin 0 -> 5326 bytes
 tests/ubifs_repair-tests/images/sb_leb_size.gz     | Bin 0 -> 5324 bytes
 tests/ubifs_repair-tests/images/sb_log_lebs.gz     | Bin 0 -> 5323 bytes
 tests/ubifs_repair-tests/images/sb_min_io_size.gz  | Bin 0 -> 5328 bytes
 .../images/soft_link_data_len.gz                   | Bin 0 -> 5389 bytes
 tests/ubifs_repair-tests/images/tnc_lv0_key.gz     | Bin 0 -> 5414 bytes
 tests/ubifs_repair-tests/images/tnc_lv0_len.gz     | Bin 0 -> 5420 bytes
 tests/ubifs_repair-tests/images/tnc_lv0_pos.gz     | Bin 0 -> 5404 bytes
 tests/ubifs_repair-tests/images/tnc_noleaf_key.gz  | Bin 0 -> 5430 bytes
 tests/ubifs_repair-tests/images/tnc_noleaf_len.gz  | Bin 0 -> 5437 bytes
 tests/ubifs_repair-tests/images/tnc_noleaf_pos.gz  | Bin 0 -> 5418 bytes
 tests/ubifs_repair-tests/images/xentry_key.gz      | Bin 0 -> 5378 bytes
 tests/ubifs_repair-tests/images/xentry_nlen.gz     | Bin 0 -> 5386 bytes
 tests/ubifs_repair-tests/images/xentry_type.gz     | Bin 0 -> 5386 bytes
 tests/ubifs_repair-tests/images/xinode_flags.gz    | Bin 0 -> 5384 bytes
 tests/ubifs_repair-tests/images/xinode_key.gz      | Bin 0 -> 5383 bytes
 tests/ubifs_repair-tests/images/xinode_mode.gz     | Bin 0 -> 5386 bytes
 tests/ubifs_repair-tests/lib/common.sh.in          | 347 +++++++++++++++++++++
 .../tests/authentication_refuse.sh.in              |  69 ++++
 .../cycle_corrupted_repair_fault_inject.sh.in      | 233 ++++++++++++++
 .../tests/cycle_mount_repair_check.sh.in           | 177 +++++++++++
 .../tests/cycle_powercut_mount_repair.sh.in        | 132 ++++++++
 .../tests/powercut_repair_mount.sh.in              | 138 ++++++++
 .../tests/random_corrupted_repair.sh.in            | 205 ++++++++++++
 .../tests/repair_bad_image.sh.in                   | 274 ++++++++++++++++
 .../ubifs_repair-tests/ubifs_repair_run_all.sh.in  |  59 ++++
 54 files changed, 1940 insertions(+), 1 deletion(-)
 create mode 100644 tests/ubifs_repair-tests/Makemodule.am
 create mode 100644 tests/ubifs_repair-tests/README.txt
 create mode 100644 tests/ubifs_repair-tests/images/dentry_key.gz
 create mode 100644 tests/ubifs_repair-tests/images/dentry_nlen.gz
 create mode 100644 tests/ubifs_repair-tests/images/dentry_type.gz
 create mode 100644 tests/ubifs_repair-tests/images/dir_lost.gz
 create mode 100644 tests/ubifs_repair-tests/images/good.gz
 create mode 100644 tests/ubifs_repair-tests/images/inode_data.gz
 create mode 100644 tests/ubifs_repair-tests/images/inode_mode.gz
 create mode 100644 tests/ubifs_repair-tests/images/inode_nlink.gz
 create mode 100644 tests/ubifs_repair-tests/images/inode_size.gz
 create mode 100644 tests/ubifs_repair-tests/images/inode_xcnt.gz
 create mode 100644 tests/ubifs_repair-tests/images/log.gz
 create mode 100644 tests/ubifs_repair-tests/images/lpt_dirty.gz
 create mode 100644 tests/ubifs_repair-tests/images/lpt_flags.gz
 create mode 100644 tests/ubifs_repair-tests/images/lpt_free.gz
 create mode 100644 tests/ubifs_repair-tests/images/lpt_pos.gz
 create mode 100644 tests/ubifs_repair-tests/images/master_highest_inum.gz
 create mode 100644 tests/ubifs_repair-tests/images/master_lpt.gz
 create mode 100644 tests/ubifs_repair-tests/images/master_tnc.gz
 create mode 100644 tests/ubifs_repair-tests/images/master_total_dead.gz
 create mode 100644 tests/ubifs_repair-tests/images/master_total_dirty.gz
 create mode 100644 tests/ubifs_repair-tests/images/master_total_free.gz
 create mode 100644 tests/ubifs_repair-tests/images/root_dir.gz
 create mode 100644 tests/ubifs_repair-tests/images/sb_fanout.gz
 create mode 100644 tests/ubifs_repair-tests/images/sb_fmt_version.gz
 create mode 100644 tests/ubifs_repair-tests/images/sb_leb_size.gz
 create mode 100644 tests/ubifs_repair-tests/images/sb_log_lebs.gz
 create mode 100644 tests/ubifs_repair-tests/images/sb_min_io_size.gz
 create mode 100644 tests/ubifs_repair-tests/images/soft_link_data_len.gz
 create mode 100644 tests/ubifs_repair-tests/images/tnc_lv0_key.gz
 create mode 100644 tests/ubifs_repair-tests/images/tnc_lv0_len.gz
 create mode 100644 tests/ubifs_repair-tests/images/tnc_lv0_pos.gz
 create mode 100644 tests/ubifs_repair-tests/images/tnc_noleaf_key.gz
 create mode 100644 tests/ubifs_repair-tests/images/tnc_noleaf_len.gz
 create mode 100644 tests/ubifs_repair-tests/images/tnc_noleaf_pos.gz
 create mode 100644 tests/ubifs_repair-tests/images/xentry_key.gz
 create mode 100644 tests/ubifs_repair-tests/images/xentry_nlen.gz
 create mode 100644 tests/ubifs_repair-tests/images/xentry_type.gz
 create mode 100644 tests/ubifs_repair-tests/images/xinode_flags.gz
 create mode 100644 tests/ubifs_repair-tests/images/xinode_key.gz
 create mode 100644 tests/ubifs_repair-tests/images/xinode_mode.gz
 create mode 100755 tests/ubifs_repair-tests/lib/common.sh.in
 create mode 100755 tests/ubifs_repair-tests/tests/authentication_refuse.sh.in
 create mode 100755 tests/ubifs_repair-tests/tests/cycle_corrupted_repair_fault_inject.sh.in
 create mode 100755 tests/ubifs_repair-tests/tests/cycle_mount_repair_check.sh.in
 create mode 100755 tests/ubifs_repair-tests/tests/cycle_powercut_mount_repair.sh.in
 create mode 100755 tests/ubifs_repair-tests/tests/powercut_repair_mount.sh.in
 create mode 100755 tests/ubifs_repair-tests/tests/random_corrupted_repair.sh.in
 create mode 100755 tests/ubifs_repair-tests/tests/repair_bad_image.sh.in
 create mode 100755 tests/ubifs_repair-tests/ubifs_repair_run_all.sh.in

-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
