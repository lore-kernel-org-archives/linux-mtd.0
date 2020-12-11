Return-Path: <SRS0=argm=FP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C664C4361B
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Dec 2020 03:33:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AC6E23770
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Dec 2020 03:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AC6E23770
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+lk6j9vxzR2JzcQRa81xu17N8H+dmnn1MOD/IGTabTQ=; b=m9ZrquUBEHQ/TKUFGuBGbhd0i
	wRWqt9YeevsCNYeq8WxySb9RhLlndISzxPrs1FmGfZpfXtQBj7CDq5rWxSkM9pD25J6lU48YOlPxY
	y1xPde97zCuq8zE7xb0e5J3N2FGvYlq+Y/G+Tk/Kpw1OBsTHGSibM0erXo+Gt4sUL5DFUDRHLrD6I
	enrLeAi/j/4sX2AkBH28DX3JvAYqSaDP4YCIhkdo4VUjGJpjcmkx+02XIJJ3Rg+YYJLK+kVVuOxXN
	5DLhQGik2qWLg8fui/GDVc6SrERUngEzxRV7heoX0BATq3GXprKRw/tq+k0ymLFTBF/tm+cpZdmkm
	c/KhsZ6aA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knZ9y-0004oa-Kh; Fri, 11 Dec 2020 03:31:58 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knZ9w-0004lL-34
 for linux-mtd@lists.infradead.org; Fri, 11 Dec 2020 03:31:57 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Csbsm0rr7z7CYS;
 Fri, 11 Dec 2020 11:31:08 +0800 (CST)
Received: from DESKTOP-2DH7KI2.china.huawei.com (10.67.101.108) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Fri, 11 Dec 2020 11:31:39 +0800
From: Chengsong Ke <kechengsong@huawei.com>
To: <richard@nod.at>
Subject: Re: [PATCH v2] mtd:ubi: Remove useless code in bytes_str_to_int
Date: Fri, 11 Dec 2020 11:31:39 +0800
Message-ID: <20201211033139.15172-1-kechengsong@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20201103115645.684-1-kechengsong@huawei.com>
References: <20201103115645.684-1-kechengsong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.101.108]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_223156_438710_D0386AAD 
X-CRM114-Status: GOOD (  13.51  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 3, 2020 at 1:00 PM Chengsong Ke <kechengsong@huawei.com> wrote:
>
> From: Chengsong Ke <kechengsong@huawei.com>
>
> As a local variable, "endp" is neither refered nor returned after this 
> line "endp += 2", it looks like a useless code, suggest to remove it.
>
> Signed-off-by: Chengsong Ke <kechengsong@huawei.com>
> ---
>  drivers/mtd/ubi/build.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c index 
> e85b04e9716b..46a6dd75e533 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -1351,8 +1351,6 @@ static int bytes_str_to_int(const char *str)
>                 fallthrough;
>         case 'K':
>                 result *= 1024;
> -               if (endp[1] == 'i' && endp[2] == 'B')
> -                       endp += 2;

> Makes sense. But why did you send a v2?

> --
> Thanks,
> //richard

> I just send the v1 with the wrong module name 'ubifs'. 
> [PATCH] ubifs: Remove useless code in bytes_str_to_int
>  :-) 
> Thanks, 
> //Chengsong Ke
ping

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
