Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87841EB1057
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=us1NhU3KTExKrS48j378K/dsbk3kL06hBerNthv7SkI=; b=QyzXbpf6jzqMWC
	ZPCIxJtpsim4+7P93dOusouBfcbmzrW64qqD3hPhwoTgGNiKr6vUrZMbbTYjeonEl9MVipXEMZE2K
	aBZmyHnc0qKvJyye9XGoAabAENlNN5vLGX/tA3AUjgYEv/zpLqjl/JA2fdYKuIeaE6Yfzk3lJs3Qh
	dRQ77IuISiUCIVDVvXsCG1Q75LkNRs2zn77KFunMAqBJa//5ohSlzCDPbO2upHwy8fL9pucgVu6P4
	0lC6rNhTMn0sQFSgT/MgpcHUTebytOh8WCz5rscksK/+T7JEgQhBggJ8vQYoZtnaNEd9ziUwJOR+5
	jCq1wEC5NuEojXGZywMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvhd-00000009MDU-2flw;
	Tue, 10 Mar 2026 11:56:45 +0000
Received: from mail.avm.de ([2001:bf0:244:244::94])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgb-00000009KWY-2C8E;
	Tue, 10 Mar 2026 11:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143727; bh=5jNhYM960jMlYUrL3T2we+u9wPA7QX8xb/YhMa8cGzI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=M5sopbNY66qmWa+2q+MLa+uKDQnYhARDVpHPBaPhnBAWxbQH6mILrzFzXoehD/OnN
	 XfkL39v7DGJAyVHbunl2dtyoz4/s+HQp68/tCQVMA+YzssNFiXbaAEz8Yvn1XdtigU
	 NmV3lEhKYunB5kPsVmat/OQepTdLQIWCI8jH5Ufw=
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006af-e21d-7f0000032729-7f000001ba7e-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:27 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:27 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:49:10 +0100
Subject: [PATCH 44/61] target: Prefer IS_ERR_OR_NULL over manual NULL check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-44-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
To: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
 bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, 
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mm@kvack.org, 
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org, 
 sched-ext@lists.linux.dev, target-devel@vger.kernel.org, 
 tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev, 
 Philipp Hahn <phahn-oss@avm.de>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=5jNhYM960jMlYUrL3T2we+u9wPA7QX8xb/YhMa8cGzI=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAZrwlPF0cTtka85RKXa/jq01klA6219EkbVF
 sAxzvkaF5OJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGawAKCRA0LQZT0ays
 26c3B/97YbFOVY+7aU+X20/OGHSJFO2zRY48bbypRSoZTJJvUVhT9k9LgthUke6q7t50KfcaKxO
 +ji7TT6hO8Cm4OsGah0c5lQCV8UQAJc4iRbI/bt93UQwIqQrpJeR9mDiRtZ63zuk53hAKMaouvF
 y6MARoN+FEiA3sHGmWk/DuFGtzf6I3rn5UIuUm1ckeIx7XgHZwxEQLChAjM+0RUA9PFCwYu/qm6
 9IpeMJ2V/nIZwaOJH7XMvW452VksCcG4pysYBM4gaKPDiw/aj9RS8erUS771tOWY6ZGy4Wx4+7y
 JX63QRv+rPmmYyTOxZi58eVjXbcoNvE3qP8qFHWJHKPRXuOf
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143727-8B66AF2F-B220D537/0/0
X-purgate-type: clean
X-purgate-size: 1613
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_045541_748962_620304CD 
X-CRM114-Status: UNSURE (   8.72  )
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

Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
check.

Change generated with coccinelle.

To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org
Cc: target-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 drivers/target/target_core_fabric_configfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/target/target_core_fabric_configfs.c b/drivers/target/target_core_fabric_configfs.c
index 331689b30f8540c8e78de3eae32c1f8cd4906213..20d57d766ada6ba24cbd2d44d0107cdff9483a68 100644
--- a/drivers/target/target_core_fabric_configfs.c
+++ b/drivers/target/target_core_fabric_configfs.c
@@ -479,7 +479,7 @@ static struct config_group *target_fabric_make_np(
 	}
 
 	se_tpg_np = tf->tf_ops->fabric_make_np(se_tpg, group, name);
-	if (!se_tpg_np || IS_ERR(se_tpg_np))
+	if (IS_ERR_OR_NULL(se_tpg_np))
 		return ERR_PTR(-EINVAL);
 
 	se_tpg_np->tpg_np_parent = se_tpg;
@@ -937,7 +937,7 @@ static struct config_group *target_fabric_make_tpg(
 	}
 
 	se_tpg = tf->tf_ops->fabric_make_tpg(wwn, name);
-	if (!se_tpg || IS_ERR(se_tpg))
+	if (IS_ERR_OR_NULL(se_tpg))
 		return ERR_PTR(-EINVAL);
 
 	config_group_init_type_name(&se_tpg->tpg_group, name,
@@ -1112,7 +1112,7 @@ static struct config_group *target_fabric_make_wwn(
 	}
 
 	wwn = tf->tf_ops->fabric_make_wwn(tf, group, name);
-	if (!wwn || IS_ERR(wwn))
+	if (IS_ERR_OR_NULL(wwn))
 		return ERR_PTR(-EINVAL);
 
 	wwn->cmd_compl_affinity = SE_COMPL_AFFINITY_CPUID;

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
