Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEAFC27C65
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e5F5zHWid2pGKETvg90IxMvZYHAODgkLR5XcLhjTnmY=; b=cD1h+iuAcHO+H7
	iU4FG3JKr9hi5zrjI1h1/tltiKOH7fVMqnhy6sZUp3S+RegYBo8QPU1zgO6gSXfA/8sJuuZd0OlSn
	0OSFOxxpE+mTWhyX2p0YlFLstNo9IhX4oz2+Hqzk12td5BQ1PGY8ThVvub0yjcX7hFVHe0VJvrpXp
	Jc/Kgz6Hx69qEEnkM9VxAB7b4kzbBB1YpDgh0cMmRCfCVIWvcPJ2IcPh7xOui7HXXstR8RgsPgiB/
	+Dm1VOXnQ3OzjwhqvcKGF6jfDFSI4/nbaue5eMRHHbTSPiXCaieRw4iOwdxIw/9wv08aW/eHhxc0s
	eQn9kIvzmEy8TAh//U+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRGp-0000000CKGl-3TDK;
	Fri, 07 Jun 2024 04:32:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRDE-0000000CHSc-2VHE
	for linux-mtd@bombadil.infradead.org;
	Fri, 07 Jun 2024 04:28:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=BnHW9xIap4LG0vuyyIXRn8lARFDd05cV8Sw/lNJLtAE=; b=jU+YjVbR0HFRUjSbLU1MA7AozU
	pBp7sQaN6l5h8qZPpw/P/q1nob94XTpSPqRVFb2f05Ag/whFCAh3rzxEg3zVU1mauKlWNIG2EWl5/
	SorpOcOqG3MdpWN0vN/vTc+YPD9puDHYuzwNrTxzAD6qVhDVIMtS7AA5oNhZ/gmqCqgGYqxfnRAb5
	9Z6xQmmcyaq4tbnajRXCRrFRmdD4w2AjkqE7guTZ5XS767NJITp9OsVKVEznoQRr8KXAEU0QSIajv
	EjvFoFBw9EQQnJyLgHcn7VcX5Pw7SimNm7AVhks6OlvAAPgdTapiG1bpaATRaZ9AwUzJYZnubNzpf
	gFWhZ3yA==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRDB-00000004UBH-10ur
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:28:23 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VwSkP5qSzzwSCp;
	Fri,  7 Jun 2024 12:23:41 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id B33D0180085;
	Fri,  7 Jun 2024 12:27:40 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:25 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 079/110] fsck.ubifs: Consolidate log
Date: Fri, 7 Jun 2024 12:25:44 +0800
Message-ID: <20240607042615.2069840-80-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_052821_590781_6133DE38 
X-CRM114-Status: GOOD (  11.49  )
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

This is the 4/18 step of fsck. Consolidate log to ensure enough space
in log area. There could be following possible errors:
 1. corrupted scanning data in log area: danger mode with rebuild_fs and
    normal mode with 'yes' answer will turn to rebuild filesystem, other
    modes will exit.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/fsck.ubifs/fsck.ubifs.c |  1 +
 ubifs-utils/fsck.ubifs/load_fs.c    | 26 ++++++++++++++++++++++++++
 ubifs-utils/libubifs/log.c          |  1 +
 3 files changed, 28 insertions(+)

diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.c b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
index 4d5296d7..9d69a4fd 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.c
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.c
@@ -433,6 +433,7 @@ int main(int argc, char *argv[])
 	 * Step 1: Read master & init lpt
 	 * Step 2: Replay journal
 	 * Step 3: Handle orphan nodes
+	 * Step 4: Consolidate log
 	 */
 	err = ubifs_load_filesystem(c);
 	if (err) {
diff --git a/ubifs-utils/fsck.ubifs/load_fs.c b/ubifs-utils/fsck.ubifs/load_fs.c
index f376383c..42b1afaa 100644
--- a/ubifs-utils/fsck.ubifs/load_fs.c
+++ b/ubifs-utils/fsck.ubifs/load_fs.c
@@ -199,6 +199,32 @@ int ubifs_load_filesystem(struct ubifs_info *c)
 		goto out_orphans;
 	}
 
+	if (!c->ro_mount) {
+		int lnum;
+
+		/* Check for enough log space */
+		lnum = c->lhead_lnum + 1;
+		if (lnum >= UBIFS_LOG_LNUM + c->log_lebs)
+			lnum = UBIFS_LOG_LNUM;
+		if (lnum == c->ltail_lnum) {
+			log_out(c, "Consolidate log");
+			err = ubifs_consolidate_log(c);
+			if (err) {
+				unsigned int reason = get_failure_reason_callback(c);
+
+				clear_failure_reason_callback(c);
+				if (reason & FR_DATA_CORRUPTED) {
+					if (fix_problem(c, LOG_CORRUPTED, NULL))
+						FSCK(c)->try_rebuild = true;
+				} else {
+					ubifs_assert(c, reason == 0);
+					exit_code |= FSCK_ERROR;
+				}
+				goto out_orphans;
+			}
+		}
+	}
+
 	c->mounting = 0;
 
 	return 0;
diff --git a/ubifs-utils/libubifs/log.c b/ubifs-utils/libubifs/log.c
index 0d459261..c3dfd98e 100644
--- a/ubifs-utils/libubifs/log.c
+++ b/ubifs-utils/libubifs/log.c
@@ -711,6 +711,7 @@ int ubifs_consolidate_log(struct ubifs_info *c)
 	destroy_done_tree(&done_tree);
 	vfree(buf);
 	if (write_lnum == c->lhead_lnum) {
+		set_failure_reason_callback(c, FR_DATA_CORRUPTED);
 		ubifs_err(c, "log is too full");
 		return -EINVAL;
 	}
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
