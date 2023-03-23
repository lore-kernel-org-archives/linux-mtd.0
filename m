Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705A8C6FD1C
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Mar 2023 01:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URpGGo6MdyZ2NWnVUqmDhrCxsLqIRGtnH1HnSUWkw1c=; b=x8acoLb523tqNgj/5zRyaTPx+G
	DLmo4DpU6hOYbHlzA+2Z+G0oV9Y2+7Jwi9XkNLnfI4shqETG1VT5dmKNI3t/vG1ZTr8FMcwNtqVx5
	/E524fXMl/RHpMz5BZceFdfS+Pj3o1EoH06Qwk5ao5VZV6DbAOlDGvRLsb/vixo0oDsyg9CidgoSO
	GHEAC+nR/CEFp3XbzOlQ/HEaH5xGlDxFVkOg4FtOMw9lwE4GnbOBOE0xa4lcqSO7R30YeVKUjhvEr
	Y7bwodXdXKtzwoB2RVgukAlTZDePc/fPqWEXPRHnd1dL5hoCKyxC7sv2znVjrJ+9COSmZitv8NOdJ
	HV4gK8ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf9Rs-000PvV-1M;
	Thu, 23 Mar 2023 01:09:00 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf9Ro-000Ptn-2o
	for linux-mtd@lists.infradead.org;
	Thu, 23 Mar 2023 01:08:58 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4PhnK30GlTz9vMh;
	Thu, 23 Mar 2023 09:08:23 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 09:08:44 +0800
Subject: Re: [PATCH v3 05/10] ubifs: convert to kobject_del_and_put()
To: Yangtao Li <frank.li@vivo.com>, Richard Weinberger <richard@nod.at>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230322165905.55389-1-frank.li@vivo.com>
 <20230322165905.55389-4-frank.li@vivo.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <c3c19fcb-07b7-415a-95ed-eba31702badf@huawei.com>
Date: Thu, 23 Mar 2023 09:08:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230322165905.55389-4-frank.li@vivo.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_180857_093573_D78E6D20 
X-CRM114-Status: GOOD (  10.95  )
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

> Use kobject_del_and_put() to simplify code.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/ubifs/sysfs.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
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


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
