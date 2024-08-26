Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EE2C5321D
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 09:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5QHOWwwOI0mOmoIO0n25mnwz6dgnD6jMmCSz8DFg2rI=; b=IkeGrM3iwi0pw3
	dOHfgkRvUHWDF/PjcAuek+ws+ElqXPg3wcdty8EUWKMlDugWikHfRCuBnrNPBMp+wiKXCLgOwQd2+
	SrB2uZkDBfvpqgFwPeJjh/ijAn+ctoOnzR5h7PLYubpQlCW3X4VBZZ2zOjnACmVw2cidCcqmSjvBD
	r+1CaL5p87J5E49yV40x3qscuw81UgXtkwS1BvHoOVDsLXm9xkbsMPZZut7kLLaaF/axrhGHzo1Wt
	Yb6GKpy8KpYAtWygmi5x0t5SgmXLCPIAR6hDot1NUIN6QM5TXa7avCjuk3LgXNK6Q/7AOySyiJvvQ
	HzoRZOUpCUzzX5PcFZgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siVj3-00000006bpf-0va1;
	Mon, 26 Aug 2024 09:09:25 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siViy-00000006bnt-1QYy
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 09:09:22 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WslG71zpGzpVt0;
	Mon, 26 Aug 2024 17:08:31 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 0809E1800F2;
	Mon, 26 Aug 2024 17:09:17 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 26 Aug
 2024 17:09:16 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <lihongbo22@huawei.com>
Subject: [PATCH -next 2/2] ubifs: add support for FS_IOC_GETFSSYSFSPATH
Date: Mon, 26 Aug 2024 17:17:00 +0800
Message-ID: <20240826091700.2812779-3-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826091700.2812779-1-lihongbo22@huawei.com>
References: <20240826091700.2812779-1-lihongbo22@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500022.china.huawei.com (7.185.36.66)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_020921_247530_736420B3 
X-CRM114-Status: GOOD (  10.93  )
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

In commit ae8c51175730 ("fs: add FS_IOC_GETFSSYSFSPATH"), a
new fs ioctl was introduced to standardize exporting data from
sysfs across filesystems. The returned path will always be of the
form "$FSTYP/$SYSFS_IDENTIFIER", where the sysfs identifier may
be a UUID or a device name.

The ubifs is a file system based on char device, and the common
method to fill s_sysfs_name (super_set_sysfs_name_bdev) is
unavialable. So in order to support FS_IOC_GETFSSYSFSPATH ioctl,
we fill the s_sysfs_name with ubi_volume_info member which keeps
the format defined in macro UBIFS_DFS_DIR_NAME by using
super_set_sysfs_name_generic.

That's for ubifs, it will output "ubifs/<dev>".

```
$ ./ioctl_getfssysfs_path /mnt/ubifs/testfile
path: ubifs/ubi0_0

$ ls /sys/fs/ubifs/ubi0_0/
errors_crc  errors_magic  errors_node
```

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 fs/ubifs/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 291583005dd1..cb26b8b27ef6 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2249,6 +2249,8 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 	}
 
 	super_set_uuid(sb, c->uuid, sizeof(c->uuid));
+	super_set_sysfs_name_generic(sb, UBIFS_DFS_DIR_NAME,
+				     c->vi.ubi_num, c->vi.vol_id);
 
 	mutex_unlock(&c->umount_mutex);
 	return 0;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
