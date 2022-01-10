Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98EEC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jan 2022 09:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZ2/Aa6PFuog9q3ZAM3eppPYcMMOlghtHYkbmulEUNE=; b=2NXB4N9t+1riA1EjjHa34yL2lL
	7JmsbKe8Wwt453UmulNaaCW6AUhpyV1g2ZSAbWiA4O33/Mmj4A+5bJgeTdBK3bAvq98ueWqZ7/qI1
	QaMVgUEa7v2yjIznSPsSK5m6B3+aY1O4Wfv+MqQ63tm2CIhdo3IYsP+0hB7WXZ1fXQc+ubz/b3+6z
	yPfaCcOQKpAsWv4Qzh4PB0ZR8fs4ES4YBa+3KGc6IYoIbu1qYMBZ/nhFWRDo746e/1QoOfKlu97wY
	PJKW6tIBVahWxIxt6dpPUGbt80hAWjl6G9hmNvwCFHkcj4UuyP7wEP5YQ7/vaeQnleWFk8UqlAR/a
	yWVTju9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6r9Y-00AUK8-Kd; Mon, 10 Jan 2022 09:39:48 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6r53-00ARNn-6N
 for linux-mtd@lists.infradead.org; Mon, 10 Jan 2022 09:35:13 +0000
Received: from kwepemi500009.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4JXT9G5s6Vz1FCWs;
 Mon, 10 Jan 2022 17:31:30 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi500009.china.huawei.com (7.221.188.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 10 Jan 2022 17:35:04 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 10 Jan 2022 17:35:03 +0800
Subject: Re: [PATCH v6 05/15] ubifs: Rename whiteout atomically
To: Richard Weinberger <richard@nod.at>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, mcoquelin stm32 <mcoquelin.stm32@gmail.com>, "kirill
 shutemov" <kirill.shutemov@linux.intel.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20211227032246.2886878-1-chengzhihao1@huawei.com>
 <20211227032246.2886878-6-chengzhihao1@huawei.com>
 <1985807262.244880.1641762859448.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <0477fadd-dfb5-c581-ee6a-ed6df9a966a3@huawei.com>
Date: Mon, 10 Jan 2022 17:35:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1985807262.244880.1641762859448.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_013509_479903_F2534951 
X-CRM114-Status: UNSURE (   9.88  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Richard
> 
> How do you make sure the the whiteout is never written to disk (by writeback) before ubifs_jnl_rename() linked
> it? That's the reason why other filesystems use the tmpfile mechanism for whiteouts too.
> 

The whiteout inode is clean after creation from create_whiteout(), and 
it can't be marked dirty until ubifs_jnl_rename() finished. So, I think 
there is no chance for whiteout being written on disk. Then, 
'ubifs_assert(c, !whiteout_ui->dirty)' never fails in ubifs_jnl_rename() 
during my local stress tests. You may add some delay executions after 
whiteout creation to make sure that whiteout won't be written back 
before ubifs_jnl_rename().

BTW, I considered plan B(Binding whiteout to a negative dentry), but we 
cannot get parent dir's entry in do_rename(), so I abandoned it.
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1334,7 +1335,8 @@ static int do_rename(struct inode *old_dir, struct 
dentry *old_dentry,
                         goto out_release;
                 }

-               err = do_tmpfile(old_dir, old_dentry, S_IFCHR | 
WHITEOUT_MODE, &whiteout);
+               // tmp_dentry = d_alloc(old_dir_dentry, &slash_name); 
// refer to vfs_tmpfile
+               err = do_tmpfile(old_dir, tmp_dentry, S_IFCHR | 
WHITEOUT_MODE, &whiteout);
                 if (err) {
                         kfree(dev);
                         goto out_release;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
