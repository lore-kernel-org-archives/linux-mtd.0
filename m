Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067A4C76196
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Apr 2023 03:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7vv2W8w9ti1RkxiOYBYqrazelgmgGUe8ARqZL4tnUE=; b=iEKQ+M+rLfxVaF1MFw3vnldp4F
	KFE08uiTE5kWkTE1mUF2CRA0hjO1IF0ytHjIwOm528YrOyHOvDzdKFGYk2bG+PMEzaFaEvqDMS5uF
	t28aFBFBIQKfs2yx0EAyv/9FODZbYyRZNxE9YOBO1inMj6XuN/ZK0m72+4cMFvV7ffzwFzoQMwdlq
	mS51CW91gLYzHaystnrlkQo7RYCPjSPopP+WSUH5NV8l3Vep37xFvD3lFAOYBdVdTc/UPutQlmPfs
	umzSY9btz2rn773rhw6MO3DBd7CRn+IXggSaGw28KRUzcGUrPYnS+/RXH/DMKWB9xNFDOLfJd4GWa
	BKkPk9aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjBIQ-00E4va-0F;
	Mon, 03 Apr 2023 03:55:54 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjBIM-00E4ua-27
	for linux-mtd@lists.infradead.org;
	Mon, 03 Apr 2023 03:55:52 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PqcS86C1SzKvvf;
	Mon,  3 Apr 2023 11:53:12 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 3 Apr 2023 11:55:39 +0800
Subject: Re: Two bug fix commit fixes in the ubi_resize_volume() were fixed by
 a patch in the mailing list
To: ZhaoLong Wang <wangzhaolong1@huawei.com>, <linux-mtd@lists.infradead.org>,
	Richard Weinberger <richard@nod.at>, "guoxuenan@huawei.com >> Guo Xuenan"
	<guoxuenan@huawei.com>
References: <20230403020402.2261218-1-wangzhaolong1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f55c0db7-ef93-86ae-c4f9-476515358787@huawei.com>
Date: Mon, 3 Apr 2023 11:55:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230403020402.2261218-1-wangzhaolong1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_205550_891657_08D5BF94 
X-CRM114-Status: GOOD (  14.02  )
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

Hi,
> Hi
> 
>      Mainline fix commit 1e591ea072df ("ubi: Fix unreferenced object reported by kmemleak in ubi_resize_volume()")
> 
> and 9af31d6ec1a4 ("ubi: Fix use-after-free when volume resizing failed")  involve fixing memory security issues, which
> 
> were fixed by a patch [1] ("ubi: fix slab-out-of-bounds in ubi_eba_get_ldesc+0xfb/0x130") that was on the mailing list
> 
> in 2022. In addition to fixing the race issue, I think this fix keeping old_eba_tbl might be a better solution to the UAF
> 
> problem.
> 
> 
>      I'd like to know why patch[1] didn't get into the mainline.
> 
> [1] http://patchwork.ozlabs.org/project/linux-mtd/patch/20220124024056.1996763-1-guoxuenan@huawei.com/

I find there were three problems in ubi_resize_volume():

1. Memleak  - fixed by 1e591ea072df ("ubi: Fix unreferenced object 
reported by kmemleak in ubi_resize_volume()")
2. UAF in error handling path  - fixed by 9af31d6ec1a4 ("ubi: Fix 
use-after-free when volume resizing failed")
3. UAF in concurrent shring volume and writing 
fastmap(vol->reserved_pebs iteration)  - fixed by [1]
4. Potentional data lost in failed shrinking(failed after unmapping 
lebs)  - mentioned in [1], which is not a big problem, we can add some 
comments to explain it.
5. Too many lebs used if expanding volume failed after [1] applied:
If we update vol->reserved_pebs together with vol->eba_tbl, then other 
writing process could take lnum bigger than old vol->reserved_pebs. 
There will be zombie logical pebs(lnum greater than vol->reserved_pebs, 
could not be accessed or reclaimed) if resizing failed.
Maybe we should fix that by holding 'leb_write_lock' while expanding volume?
6. In error handling path 'out_acc', UBI should recover 'ubi->rsvd_pebs'
and 'ubi->avail_pebs' in 'pebs > 0' case, otherwise UBI will display 
wrong available peb count.

Richard, How do you think?

[1] 
http://patchwork.ozlabs.org/project/linux-mtd/patch/20220124024056.1996763-1-guoxuenan@huawei.com/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
