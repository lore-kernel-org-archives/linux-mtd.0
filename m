Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E67C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jun 2022 06:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZxC56HpXwRewiozylwt4FGUB1t9BcvRR7dWgfyU0Bw=; b=UYSxVK1lx2G+IIeODnzZn0eGLy
	1ChLJPpY0D3NfH6Dn2a6jWSAxCtZoVAP4EdHigmFW3Z5Y4WJQc/PtrKZp3gjyfWhsmOb9TXRRjv+k
	rOtjDzZmZ5QSMnQWuxP7oUJfaJDgWcUnIv9fIG2D/gFcKzTF5rQW0lrsS+UMFTOn9FOosRFRQL/Dr
	ROsB+SlEWyVY+bjMMJN8VviHa2gY/cTWAiMEXYEUMxIr9sJBUIPOXQVDUrzThYCZy/gWESQ2+7WPP
	O1GAIl3gdb9ZieAvaAONCksW8uleuY0mfmDAUEit+/K5WMuNn1KbQMGUjMXwNq63jm2CXaMLypAvw
	J4w7ZKhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nweSG-001lZo-Tn; Thu, 02 Jun 2022 06:37:12 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nweSC-001lXE-U1
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2022 06:37:10 +0000
Received: from kwepemi500007.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LDGTt2WN3zgYkH;
	Thu,  2 Jun 2022 14:35:14 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi500007.china.huawei.com (7.221.188.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 2 Jun 2022 14:36:55 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 2 Jun 2022 14:36:54 +0800
Subject: Re: [PATCH -next] ubifs: Fix some kernel-doc comments
To: Yang Li <yang.lee@linux.alibaba.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Abaci
 Robot" <abaci@linux.alibaba.com>
References: <20220602055233.26161-1-yang.lee@linux.alibaba.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <2890dd1a-76a9-2345-d955-84f9888de4bd@huawei.com>
Date: Thu, 2 Jun 2022 14:36:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20220602055233.26161-1-yang.lee@linux.alibaba.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_233709_183697_ECC89035 
X-CRM114-Status: GOOD (  10.12  )
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

Hi, maybe we should change them like this:

> diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
> index 75dab0ae3939..16857d4e9aa8 100644
> --- a/fs/ubifs/journal.c
> +++ b/fs/ubifs/journal.c
> @@ -1201,9 +1201,12 @@ int ubifs_jnl_xrename(struct ubifs_info *c, const struct inode *fst_dir,
>    * ubifs_jnl_rename - rename a directory entry.
>    * @c: UBIFS file-system description object
>    * @old_dir: parent inode of directory entry to rename
> - * @old_dentry: directory entry to rename
> + * @old_inode: parent inode to rename

old_inode: directory entry's inode to rename
> + * @old_nm: name of old inode to rename

old_nm: name of the old directory entry to rename
>    * @new_dir: parent inode of directory entry to rename
> - * @new_dentry: new directory entry (or directory entry to replace)
> + * @new_inode: new inode to rename

new_inode: new directory entry's inode (or directory entry's inode to 
replace)
> + * @new_nm: name of new inode to rename

new_name: name of the new directory entry to rename
> + * @whiteout: whiteout inode
>    * @sync: non-zero if the write-buffer has to be synchronized
>    *
>    * This function implements the re-name operation which may involve writing up
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
