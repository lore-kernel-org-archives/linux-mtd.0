Return-Path: <SRS0=dr6A=FL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01938C4361B
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 07:08:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F2D4229C6
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 07:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F2D4229C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o6d+E95PcqmYSBuID5mgi5e3Hqx2I7dRqhvzTtmGFQU=; b=bAsY0zBhAzS16r1I/+xyc59qp
	2OpGchqjzVIeb9caUcv4iAOgzMWSFjYbJhM+JP4W/SnqaaTUO2kJO6QmjjoPXjcmi4s1b5zyiSPQT
	rDkKdd0SfZ7rF+AKcq1WhhgdF0ZsfZtFdZX/OP/MlFdi/6OfGMnRr8RdIJhmTv+Ju6zkW3BjuUpUM
	a7vrY7lUgvYXi1sWHO0mXKqRkLYmLxXwpNmmlTL6MVC2Ph8+wc9JnYnR028vpATzjT86ojhsQzidZ
	EjONOy/t/aenIfbDMhwuoUzbpGzlGgaYqf02IMpE0p2QU/ehFzMJsZfrEB60Mp+eir5oHkWhjuGo9
	ZTcoc/Hgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmAcQ-0002a1-Qk; Mon, 07 Dec 2020 07:07:34 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmAcN-0002Z8-LC
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2020 07:07:33 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CqDrY1NgPz79bf;
 Mon,  7 Dec 2020 15:06:53 +0800 (CST)
Received: from DESKTOP-8N3QUD5.china.huawei.com (10.67.101.227) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Mon, 7 Dec 2020 15:07:17 +0800
From: Guohua Zhong <zhongguohua1@huawei.com>
To: <richard.weinberger@gmail.com>
Subject: Re: Re: [PATCH v2] phram: Allow the user to set the erase page size.
Date: Mon, 7 Dec 2020 15:07:15 +0800
Message-ID: <20201207070715.15016-1-zhongguohua1@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <CAFLxGvxSycd=6WE4=XnrXxuF2Bc6A6ULA8GfkT8QvgcX=2Gk8g@mail.gmail.com>
References: <CAFLxGvxSycd=6WE4=XnrXxuF2Bc6A6ULA8GfkT8QvgcX=2Gk8g@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.101.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_020731_973218_5DE39DEF 
X-CRM114-Status: GOOD (  15.52  )
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
Cc: zhongguohua1@huawei.com, wangle6@huawei.com, young.liuyang@huawei.com,
 vigneshr@ti.com, patrick@baymotion.com, joern@lazybastard.org,
 linux-kernel@vger.kernel.org, richard@nod.at, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, nixiaoming@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Dec 7, 2020 at 14:56 AM Guohua Zhong <zhongguohua1@huawei.com> wrote:
>
>> Permit the user to specify the erase page size as a parameter.
>> This solves two problems:
>
>> - phram can access images made by mkfs.jffs2.  mkfs.jffs2 won't
>> create images with erase sizes less than 8KiB; many architectures
>> define PAGE_SIZE as 4KiB.
>
>> - Allows more effective use of small capacity devices.  JFFS2
>> needs somewhere between 2 and 5 empty pages for garbage collection;
>> and for an NVRAM part with only 32KiB of space, a smaller erase page
>> allows much better utilization in applications where garbage collection
>> is important.
>
>> Signed-off-by: Patrick O'Grady <patrick@baymotion.com>
>> Reviewed-by: Joern Engel <joern@logfs.org>
>> Link: https://lore.kernel.org/lkml/CAJ7m5OqYv_=JB9NhHsqBsa8YU0DFRoP7C+W10PY22wonAGJK=A@mail.gmail.com/
>> [Guohua Zhong: fix token array index out of bounds and update patch for kernel master branch]
>> Signed-off-by: Guohua Zhong <zhongguohua1@huawei.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>
> Looks good to me, except the authorship.
> If I understand correctly, you took this old patch and resend it.
> Please make sure that the "From:"-Line contains the original author.
> You can fix this up using git commit --amend --author=.
> The git format-patch will create a correct patch.

Sorry, I am not clear this rule before. But I found the same issue independently. It looks good 
after changging the erase size for phram driver. Then when I try to send the patch, I found that 
Patrick O'Grady has already send a patch which has not been merged as the link below
https://lore.kernel.org/lkml/CAJ7m5OqYv_=JB9NhHsqBsa8YU0DFRoP7C+W10PY22wonAGJK=A@mail.gmail.com/

So I resend a patch with some change and fix for mainline kernel with the old patch link of Patrick O'Grady.

If I need to change the authorship, I will resend this patch for V3 with authorship of Patrick O'Grady.

-- 
Thanks,
//guohua

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
