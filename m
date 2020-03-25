Return-Path: <SRS0=FPAn=5K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3F1C18E5B
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 08:58:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 132BB20740
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 08:58:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IjAQZ1w3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 132BB20740
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cqQeNkdCU/r0lGbjStiO1jjdJrSdR8981JFs76aZRYQ=; b=IjAQZ1w3u1SbLYgYJV477O75oI
	byLUPauNJjgHjX8jeNhfW8L/45dKSz0q6WGsMh5r5Nac5X8KpJucs3OFYsRx4bOY0GPfzfq0yJrEo
	XDjtuRfNWw3wlNi9IjZjjvnAft+js/SHmllw9Clpal7uDuqLgRQylyw4TPI7o2D4Pdy6eoqu5so0a
	IXRkx7Z5w4PpB1oka/YVSVxLOHBtayu3UAESaRHYkEoPkGgmBc2lMfK0u9rBu94TiZchnxPn/TQyN
	+6dTXy71ykW9rQnk4rvEIVkCuov854lwsTZATdh25+hx0o3dSgBQPpIIDJK6Df/74hXSxzi2zie+Q
	CyF6tXXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH1rX-000292-5g; Wed, 25 Mar 2020 08:58:11 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH1p9-0008K6-0S
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2020 08:55:45 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07439015|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0260262-0.000154574-0.973819;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03306; MF=liaoweixiong@allwinnertech.com; NM=1;
 PH=DS; RN=17; RT=17; SR=0; TI=SMTPD_---.H50xpyL_1585126516; 
Received: from
 PC-liaoweixiong.allwinnertech.com(mailfrom:liaoweixiong@allwinnertech.com
 fp:SMTPD_---.H50xpyL_1585126516)
 by smtp.aliyun-inc.com(10.147.42.241);
 Wed, 25 Mar 2020 16:55:34 +0800
From: WeiXiong Liao <liaoweixiong@allwinnertech.com>
To: Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v3 09/11] pstore/blk: a way to get user configure about pstore
 front-ends.
Date: Wed, 25 Mar 2020 16:55:04 +0800
Message-Id: <1585126506-18635-10-git-send-email-liaoweixiong@allwinnertech.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1585126506-18635-1-git-send-email-liaoweixiong@allwinnertech.com>
References: <1585126506-18635-1-git-send-email-liaoweixiong@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_015543_352765_2F817366 
X-CRM114-Status: GOOD (  10.11  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: WeiXiong Liao <liaoweixiong@allwinnertech.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

It's one of a series of patches to adapt to MTD device.

It's different to block driver, MTD driver should check zone size
and get identifier to MTD device. To make it, psblk_usr_info() is
created.

Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
---
 fs/pstore/pstore_blk.c     | 37 ++++++++++++++++++++++++++++++-------
 include/linux/pstore_blk.h | 10 ++++++++++
 2 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/fs/pstore/pstore_blk.c b/fs/pstore/pstore_blk.c
index d6949146135b..061609b66d8a 100644
--- a/fs/pstore/pstore_blk.c
+++ b/fs/pstore/pstore_blk.c
@@ -84,6 +84,17 @@
 	sector_t start_sect;
 } g_bdev_info;
 
+#define check_size(name, alignsize) ({				\
+	long _##name_ = (name);					\
+	_##name_ = _##name_ <= 0 ? 0 : (_##name_ * 1024);	\
+	if (_##name_ & ((alignsize) - 1)) {			\
+		pr_info(#name " must align to %d\n",		\
+				(alignsize));			\
+		_##name_ = ALIGN(name, (alignsize));		\
+	}							\
+	_##name_;						\
+})
+
 /**
  * struct psblk_device - back-end pstore/blk driver structure.
  *
@@ -138,13 +149,11 @@ static int psblk_register_do(struct psblk_device *dev)
 	if (!dev->flags)
 		dev->flags = UINT_MAX;
 #define verify_size(name, alignsize, enable) {				\
-		long _##name_ = (enable) ? (name) : 0;			\
-		_##name_ = _##name_ <= 0 ? 0 : (_##name_ * 1024);	\
-		if (_##name_ & ((alignsize) - 1)) {			\
-			pr_info(#name " must align to %d\n",		\
-					(alignsize));			\
-			_##name_ = ALIGN(name, (alignsize));		\
-		}							\
+		long _##name_;						\
+		if (enable)						\
+			_##name_ = check_size(name, alignsize);		\
+		else							\
+			_##name_ = 0;					\
 		name = _##name_ / 1024;					\
 		psz_info->name = _##name_;				\
 	}
@@ -464,6 +473,20 @@ int psblk_blkdev_info(dev_t *devt, sector_t *nr_sects, sector_t *start_sect)
 }
 EXPORT_SYMBOL_GPL(psblk_blkdev_info);
 
+/* get information of pstore/blk */
+int psblk_usr_info(struct psblk_info *info)
+{
+	strncpy(info->device, blkdev, 80);
+	info->dump_oops = dump_oops <= 0 ? 0 : 1;
+	info->oops_size = check_size(oops_size, 4096);
+	info->pmsg_size = check_size(pmsg_size, 4096);
+	info->ftrace_size = check_size(ftrace_size, 4096);
+	info->console_size = check_size(console_size, 4096);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(psblk_usr_info);
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("WeiXiong Liao <liaoweixiong@allwinnertech.com>");
 MODULE_DESCRIPTION("Block device Oops/Panic logger");
diff --git a/include/linux/pstore_blk.h b/include/linux/pstore_blk.h
index 828b0763d477..d2ea1733b51a 100644
--- a/include/linux/pstore_blk.h
+++ b/include/linux/pstore_blk.h
@@ -27,4 +27,14 @@ int  psblk_register_blkdev(unsigned int major, unsigned int flags,
 void psblk_unregister_blkdev(unsigned int major);
 int  psblk_blkdev_info(dev_t *devt, sector_t *nr_sects, sector_t *start_sect);
 
+struct psblk_info {
+	int dump_oops;
+	char device[80];
+	unsigned long oops_size;
+	unsigned long pmsg_size;
+	unsigned long console_size;
+	unsigned long ftrace_size;
+};
+int psblk_usr_info(struct psblk_info *info);
+
 #endif
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
