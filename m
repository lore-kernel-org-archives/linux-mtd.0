Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74122CD98E7
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Oct 2023 02:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OFsbM3BIknzqaNlLuInkpKBo7Db6OZ0sllbvRbk6kGE=; b=yJ2G8fJQ3yi8JD
	J6LvSX4CQN7Anb0uHUbaFQCOzySQQKPUmOnVOVxzMF84FL/Rp0T7r55qfAnJCYvD9HQ4P0LVOUcX4
	ogb+6NS5Dsp1r2EvITsSxEFPRPbfjPg4BRq9yahM+5Mq+DQAQY4uVxXo1TANlfnnKVJMS5aekCr2W
	HJ1C+ehe6zjt8LI0LaRUhERYlABEGgF73fbnJ7wrYzk1uDSGWluRWHBxEs69qN3dYUg7OzQWhZzLM
	OSrbhx/Kg+lH4/1aKjZd9f1ATM7Ro9DkxJV6Mmg5Kvqtutw0h2aqOWwmtVoUgPsQUIfsFRoRQ3Ur5
	Rhu0ZkOp2pXjLXtdiP7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqP1t-00Eanq-39;
	Wed, 11 Oct 2023 02:32:57 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqP1q-00Eamy-1e
	for linux-mtd@lists.infradead.org;
	Wed, 11 Oct 2023 02:32:57 +0000
Received: from dggpemm500009.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4S4xZD1CKBzrTDX;
	Wed, 11 Oct 2023 10:30:12 +0800 (CST)
Received: from [10.174.178.209] (10.174.178.209) by
 dggpemm500009.china.huawei.com (7.185.36.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 11 Oct 2023 10:32:45 +0800
Message-ID: <9f96baf1-962e-d595-0e4f-797315cd0348@huawei.com>
Date: Wed, 11 Oct 2023 10:32:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH RFC] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yi.zhang@huawei.com>, <yangerkun@huawei.com>
References: <20231010142925.545238-1-wangzhaolong1@huawei.com>
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
In-Reply-To: <20231010142925.545238-1-wangzhaolong1@huawei.com>
X-Originating-IP: [10.174.178.209]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_193254_892793_97A078F1 
X-CRM114-Status: GOOD (  20.08  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


> This patch assumes that the gluebi module is not designed to work with
> the ftl module. In this case, the patch only needs to prevent the ftl
> notifier operation.
> 
> Add some correctness check for gluebi->desc in gluebi_read/write/erase(),
> If the pointer is invalid, the -EINVAL is returned.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217992 [1]
> Signed-off-by: ZhaoLong Wang <wangzhaolong1@huawei.com>
> ---
>   drivers/mtd/ubi/gluebi.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/mtd/ubi/gluebi.c b/drivers/mtd/ubi/gluebi.c
> index 1b980d15d9fb..189ecc0eacd1 100644
> --- a/drivers/mtd/ubi/gluebi.c
> +++ b/drivers/mtd/ubi/gluebi.c
> @@ -157,6 +157,9 @@ static int gluebi_read(struct mtd_info *mtd, loff_t from, size_t len,
>   	struct gluebi_device *gluebi;
>   
>   	gluebi = container_of(mtd, struct gluebi_device, mtd);
> +	if (IS_ERR_OR_NULL(gluebi->desc))
> +		return -EINVAL;
> +
>   	lnum = div_u64_rem(from, mtd->erasesize, &offs);
>   	bytes_left = len;
>   	while (bytes_left) {
> @@ -197,6 +200,9 @@ static int gluebi_write(struct mtd_info *mtd, loff_t to, size_t len,
>   	struct gluebi_device *gluebi;
>   
>   	gluebi = container_of(mtd, struct gluebi_device, mtd);
> +	if (IS_ERR_OR_NULL(gluebi->desc))
> +		return -EINVAL;
> +
>   	lnum = div_u64_rem(to, mtd->erasesize, &offs);
>   
>   	if (len % mtd->writesize || offs % mtd->writesize)
> @@ -242,6 +248,8 @@ static int gluebi_erase(struct mtd_info *mtd, struct erase_info *instr)
>   	lnum = mtd_div_by_eb(instr->addr, mtd);
>   	count = mtd_div_by_eb(instr->len, mtd);
>   	gluebi = container_of(mtd, struct gluebi_device, mtd);
> +	if (IS_ERR_OR_NULL(gluebi->desc))
> +		return -EINVAL;
>   
>   	for (i = 0; i < count - 1; i++) {
>   		err = ubi_leb_unmap(gluebi->desc, lnum + i);


This modification attempts another solution. Always check the validity
of gluebi->desc. If the gluebi->desc pointer is invalid, try to get MTD
device.


diff --git a/drivers/mtd/ubi/gluebi.c b/drivers/mtd/ubi/gluebi.c
index 1b980d15d9fb..f1a74ccf1718 100644
--- a/drivers/mtd/ubi/gluebi.c
+++ b/drivers/mtd/ubi/gluebi.c
@@ -154,9 +154,19 @@ static int gluebi_read(struct mtd_info *mtd, loff_t 
from, size_t len,
  		       size_t *retlen, unsigned char *buf)
  {
  	int err = 0, lnum, offs, bytes_left;
-	struct gluebi_device *gluebi;
+	struct gluebi_device *gluebi = container_of(mtd, struct gluebi_device,
+						    mtd);
+	int not_get = IS_ERR_OR_NULL(gluebi->desc);
+
+	if (not_get) {
+		err = __get_mtd_device(mtd);
+		if (err) {
+			err_msg("cannot get MTD device %d, UBI device %d, volume %d, error %d",
+				mtd->index, gluebi->ubi_num, gluebi->vol_id, err);
+			return err;
+		}
+	}

-	gluebi = container_of(mtd, struct gluebi_device, mtd);
  	lnum = div_u64_rem(from, mtd->erasesize, &offs);
  	bytes_left = len;
  	while (bytes_left) {
@@ -176,6 +186,9 @@ static int gluebi_read(struct mtd_info *mtd, loff_t 
from, size_t len,
  	}

  	*retlen = len - bytes_left;
+
+	if (not_get)
+		__put_mtd_device(mtd);
  	return err;
  }

@@ -194,9 +207,19 @@ static int gluebi_write(struct mtd_info *mtd, 
loff_t to, size_t len,
  			size_t *retlen, const u_char *buf)
  {
  	int err = 0, lnum, offs, bytes_left;
-	struct gluebi_device *gluebi;
+	struct gluebi_device *gluebi = container_of(mtd, struct gluebi_device,
+						    mtd);
+	int not_get = IS_ERR_OR_NULL(gluebi->desc);
+
+	if (not_get) {
+		err = __get_mtd_device(mtd);
+		if (err) {
+			err_msg("cannot get MTD device %d, UBI device %d, volume %d, error %d",
+				mtd->index, gluebi->ubi_num, gluebi->vol_id, err);
+			return err;
+		}
+	}

-	gluebi = container_of(mtd, struct gluebi_device, mtd);
  	lnum = div_u64_rem(to, mtd->erasesize, &offs);

  	if (len % mtd->writesize || offs % mtd->writesize)
@@ -220,6 +243,9 @@ static int gluebi_write(struct mtd_info *mtd, loff_t 
to, size_t len,
  	}

  	*retlen = len - bytes_left;
+
+	if (not_get)
+		__put_mtd_device(mtd);
  	return err;
  }

@@ -234,14 +260,24 @@ static int gluebi_write(struct mtd_info *mtd, 
loff_t to, size_t len,
  static int gluebi_erase(struct mtd_info *mtd, struct erase_info *instr)
  {
  	int err, i, lnum, count;
-	struct gluebi_device *gluebi;
+	struct gluebi_device *gluebi = container_of(mtd, struct gluebi_device,
+						    mtd);
+	int not_get = IS_ERR_OR_NULL(gluebi->desc);
+
+	if (not_get) {
+		err = __get_mtd_device(mtd);
+		if (err) {
+			err_msg("cannot get MTD device %d, UBI device %d, volume %d, error %d",
+				mtd->index, gluebi->ubi_num, gluebi->vol_id, err);
+			return err;
+		}
+	}

  	if (mtd_mod_by_ws(instr->addr, mtd) || mtd_mod_by_ws(instr->len, mtd))
  		return -EINVAL;

  	lnum = mtd_div_by_eb(instr->addr, mtd);
  	count = mtd_div_by_eb(instr->len, mtd);
-	gluebi = container_of(mtd, struct gluebi_device, mtd);

  	for (i = 0; i < count - 1; i++) {
  		err = ubi_leb_unmap(gluebi->desc, lnum + i);
@@ -259,10 +295,14 @@ static int gluebi_erase(struct mtd_info *mtd, 
struct erase_info *instr)
  	if (err)
  		goto out_err;

+	if (not_get)
+		__put_mtd_device(mtd);
  	return 0;

  out_err:
  	instr->fail_addr = (long long)lnum * mtd->erasesize;
+	if (not_get)
+		__put_mtd_device(mtd);
  	return err;
  }

-- 
2.31.1



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
