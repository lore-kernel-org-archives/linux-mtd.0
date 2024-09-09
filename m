Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E84ECE57A
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 11:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PL1RCd5gbnz25O5oVLx74Z8yh5qqQhclwQWIqS63OC0=; b=R/Tgk3+c0vSjyT
	5BuZqa5y6KovndVv81FtwuMATpanBdFLvHrOGdjeINikncqWD1BZsmWT+qdqMthX4FUwjp4jQFJCL
	gnzp1sgUKyEiTy0K40UFNnDXXV2XvfuqiaT613MqbMvoCDMGXTiXjEPK3HPDC1bTKNNjA+KrxewqI
	rEx574KVci104ToeVFYPToj2h4usnslE28lpCEMLGlTxTDGSTEGnvPr6qL+9P7lQWzlmW0kPFTTm6
	ZZ5MZb0qQ4nJv96cOXy4L+WyN4fdaqStKewqu7s7238n7HVKmPF0EZxXVhFYUHpn3gxOv6njQpBzA
	1BI7Nczmlb49hGwZJ4gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snco7-00000001ixj-2bxL;
	Mon, 09 Sep 2024 11:43:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snclM-00000001iXg-2vXU
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 11:41:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A7965C1088;
	Mon,  9 Sep 2024 11:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF98C4CEC5;
	Mon,  9 Sep 2024 11:40:53 +0000 (UTC)
Message-ID: <63c1a3b4-9427-446c-9a68-ae022b7b96ae@xs4all.nl>
Date: Mon, 9 Sep 2024 13:40:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 05/19] media: vivid: Include <linux/prandom.h>
 in vivid-vid-cap.c
To: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org,
 linux-crypto@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fscrypt@vger.kernel.org,
 linux-scsi@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240909075641.258968-1-ubizjak@gmail.com>
 <20240909075641.258968-6-ubizjak@gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240909075641.258968-6-ubizjak@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_044056_811863_89D232E5 
X-CRM114-Status: GOOD (  11.95  )
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

On 09/09/2024 09:53, Uros Bizjak wrote:
> Substitute the inclusion of <linux/random.h> header with
> <linux/prandom.h> to allow the removal of legacy inclusion
> of <linux/prandom.h> from <linux/random.h>.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> Cc: Hans Verkuil <hverkuil@xs4all.nl>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> ---
>  drivers/media/test-drivers/vivid/vivid-vid-cap.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
> index 69620e0a35a0..184460eb356e 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
> @@ -10,6 +10,7 @@
>  #include <linux/sched.h>
>  #include <linux/vmalloc.h>
>  #include <linux/videodev2.h>
> +#include <linux/prandom.h>
>  #include <linux/v4l2-dv-timings.h>
>  #include <media/v4l2-common.h>
>  #include <media/v4l2-event.h>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
