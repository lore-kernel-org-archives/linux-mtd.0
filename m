Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173CCC7618A
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Mar 2023 02:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzIzhqR6OFMXvfnpi4IMRfwXOYp0rVk008JFGSM1Qzw=; b=KtU8X2HIrytNf0MTZ806VyEjlh
	JfpUZ9x8feSOx5oFwbAf44P+Mn4geOmxnQ4AWgz0on2aOAUv0Jr3h/5bILb5GP5iV+7I25t41a5IF
	Ke96DgcNllgXV6FFTm0Fef9Q6pykneuzQvF5Jy406FnNSHDYDzm9PmS8pYb7DP3f1g/7jc/mejv0y
	5oXeFRsjeFhQZpI5Ji5UqMAweKhGOwmM/mXI+ji1mfqD9c0SjwqbhNH6D6RWmbILq4hPenW/+YlT/
	1xIcdsibFz5lzPCQooIo44X6BXeYQ+Y6Gytd0C/dVdsQJxsG7xqn7+/wF/bTQNRkRpTziR0cqrFHi
	K1jXIZ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe5gn-007x1Z-0N;
	Mon, 20 Mar 2023 02:56:01 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pe5gj-007x0k-2P
	for linux-mtd@lists.infradead.org;
	Mon, 20 Mar 2023 02:55:59 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PfzqL3qpzzrTsP;
	Mon, 20 Mar 2023 10:54:54 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 10:55:52 +0800
Subject: Re: [PATCH v2, RESEND 05/10] ubifs: convert to kobject_del_and_put()
To: Yangtao Li <frank.li@vivo.com>, Richard Weinberger <richard@nod.at>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20230319092641.41917-1-frank.li@vivo.com>
 <20230319092641.41917-5-frank.li@vivo.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <9d8258af-4f27-7897-26f9-32dd8ca9b20c@huawei.com>
Date: Mon, 20 Mar 2023 10:55:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230319092641.41917-5-frank.li@vivo.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_195557_951013_003AA801 
X-CRM114-Status: GOOD (  14.12  )
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

Hi Yangtao,
> Use kobject_del_and_put() to simplify code.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/ubifs/sysfs.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/ubifs/sysfs.c b/fs/ubifs/sysfs.c
> index 1c958148bb87..9571718e61a9 100644
> --- a/fs/ubifs/sysfs.c
> +++ b/fs/ubifs/sysfs.c
> @@ -130,8 +130,7 @@ int ubifs_sysfs_register(struct ubifs_info *c)
>   
>   void ubifs_sysfs_unregister(struct ubifs_info *c)
>   {
> -	kobject_del(&c->kobj);
> -	kobject_put(&c->kobj);
> +	kobject_del_and_put(&c->kobj);
>   	wait_for_completion(&c->kobj_unregister);
>   
>   	kfree(c->stats);
> 

Maybe you can send the entire patchset to linux-mtd next time, I can 
only see patch 5 from the maillist. After confirming from other 
website(https://www.spinics.net/lists/kernel/msg4727274.html) I see you 
instroduced the implementation of kobject_del_and_put().

I have no objections if other modules can accept the kobject_del_and_put().

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
