Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1710C43458
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 15:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLgsYTKMkfyFkEkT3v2225WgX0d7JtY9jYvoj9e17fU=; b=NJ9NYcKu6+T0eq
	gTnB4QAzXcZFx5pc1MdAcoB69Jv9AtZER9BYcCdfAHaJ031CpVoUVjJR8kaN4/EXcVLmnfkHs6gf1
	Q5bIV4PF6K1iPtChHDgxXorayhxVNAPHnpz9rKaYcrLGKAT8CPoAIQd5f4ZCrWX9QIo02Lv7moJei
	QRANPwRGLA+Gbz0nKYwEZyBYGzT/QTAURHn8Pybm5fb45ZGNYp11dTEouicSEtHPCFnQTLc6Y2nIf
	JUpPW+91qLXWelOkuvDLhPUPa2J0c6WakroGUpB8aZLEuujVvyvX11DaKNsvn+AnjssugxbEwtMLx
	nJDR5Sk9oTN9LEA5XWfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg2bS-00000008YAq-2Hse;
	Sat, 04 Jul 2026 15:48:26 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg2bQ-00000008YAV-2S7E
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 15:48:26 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493b779003fso7337755e9.3
        for <linux-mtd@lists.infradead.org>; Sat, 04 Jul 2026 08:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783180102; x=1783784902; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VYulFp3SO5/MbqdqSCJYzK/afw2ecrlo9KeAU+Q8Zjg=;
        b=dCyNDtvMJNObsCoqQNts6h8jsss65556MgPxpwmFAElMD5mUaEmbc601f2OYK45GYO
         yYasBtNJf718GcxPFhQLlHQWrRYjPIbR603Qm66MPbet0sHofpqaWtwiyULNbIbZqvbB
         lCqR38GZE9TPF9+74wOijzU1b7wPBxmUMXzU1E0gYifjJKZr71p8ws7RUCRYKahRaK+5
         9sG6kJD43ox3vM4fEaM3pSBGPoF8DBCWZ2mx9DONU11FZNOkg1fJMDFPO2a/wuws9r2P
         1CDZcGEOw1ToC2oUGciSFT0rEW6n2XNNI5uY+wd7X8OyxT6g10N1K5dT3y7TBxten6ma
         kNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783180102; x=1783784902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYulFp3SO5/MbqdqSCJYzK/afw2ecrlo9KeAU+Q8Zjg=;
        b=pLGx9arUvSZMwgyCaFjKduPmUTlh0iH3sMM11xQsy/TdXb/8mDc3AqZdNYECTBj+SM
         Ee235FTf67VpyViuQrMdXO0Om4qkDM76+SanEv3QOBSmr1vBdpp4vsEcuF+Er/2I6Q9R
         qwTRd1hONNtwNkiZR49MozRK4hZeO5ofCnM35HhLrG9geq2XFUc39zKyhg9MFKwCdJLP
         a4EMNlvysWVFJku0eJjGMwkiDQTCulrZis4sbX2NUqX6dLU10J9Nsw2RKlXi9psBY66R
         ROR9t/Hf1k9l7g6xUC5oUTPKcDdPY3eBtesMYNDY5WrdoxUeBc3AtAvbdX1it8BIxYW0
         /0nA==
X-Forwarded-Encrypted: i=1; AFNElJ+rx1Oj206RMBN6G9dJ5+YWYm0PWH9A9yGjSr4mzdm5NeSYFvlv+WoNjPZuLJ0Nh1Pu1lOrzkZ8IRI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxCHNf9YNd4qD5VJIg8Ai+g4ZLOm5lXhFTX8kAUhhlLop5bER7f
	sh4Kh1nJsBkvooxuHALSF6+N49/xH1ZqJNHPDuiu6xVzHrB2lYz2dHk=
X-Gm-Gg: AfdE7cnVoQUcw+DD1ziK+ygV+0mTGqq6n/s4sAMgXpE5BtRsW7Doan9gy6hUO8B4c1V
	bZUA3D9hj0tx9fqC60JFOsHB/Kh2GtGsY8BWlJWKu2eAOLsruK0of+9BoeWwUrQJnmhI2qGX/+Y
	oMvmGzTSm8cAJCSw0XutcZLncRd870bSWx3hpqtRUEr00FkAPKxXtBXB1wiuiLB1bpXLQjsCfAN
	gnCyerllhzeEZrjEDvEr9Z7eJUmnYccZoQLTT5OK8no78ZrnB3+5vZ25JE/6frVYi5V8GYr5LkZ
	SlM/UvSdeiS7XlKb2gi0slUBU+qxhutUAiVk130GviKWpSuSx4vTF0Q2zbGu76Z+bcEyA4CnN9a
	K5NYjZQCWin+Dc3xV0a/GW/4Jw7xWvToQu1KwIXAwjcfH/cnPY0q4fVOHAUgqYgQ97oXBNsqr8n
	eoyT2PHNe858fBpPHCgjuOuPhifLi1Um1e+TTKB4ZWK2wDb0b4AWqtQXh2UpexKFGkWw==
X-Received: by 2002:a05:600c:4e8a:b0:493:a960:a0bf with SMTP id 5b1f17b1804b1-493d11f3296mr44682275e9.21.1783180101792;
        Sat, 04 Jul 2026 08:48:21 -0700 (PDT)
Received: from lithos ([2a02:810d:4a94:b300:ccc7:6431:13a2:5d53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63172fesm381717435e9.0.2026.07.04.08.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 08:48:21 -0700 (PDT)
Date: Sat, 4 Jul 2026 17:48:16 +0200
From: Florian Fuchs <fuchsfl@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Adrian McMenamin <adrianmcmenamin@gmail.com>,
	linux-kernel@vger.kernel.org, Dmitry Torokhov <dtor@mail.ru>,
	linux-input@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH 18/26] sh: maple: introduce callback_mutex in maple_device
Message-ID: <akkrQJfxSCvUptC4@lithos>
References: <20260703-b4-maple-cleanup-v1-0-41e424964da5@gmail.com>
 <20260703-b4-maple-cleanup-v1-18-41e424964da5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260703-b4-maple-cleanup-v1-18-41e424964da5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_084824_643753_70F6A69F 
X-CRM114-Status: GOOD (  22.45  )
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

Hi Dmitry,

On 03 Jul 22:57, Dmitry Torokhov wrote:
> The Maple bus core invokes client callbacks asynchronously from a
> workqueue (maple_dma_handler). If a device is removed (or closed) while
> a callback is in flight, it can lead to UAF bugs if the driver's private
> data is freed.
> 
> Introduce callback_mutex in struct maple_device to synchronize
> callback registration/modification and callback invocation.
> 
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/sh/maple/maple.c | 9 +++++++--
>  include/linux/maple.h    | 2 ++
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/sh/maple/maple.c b/drivers/sh/maple/maple.c
> index c0715e3ace6f..7c82b7a8a280 100644
> --- a/drivers/sh/maple/maple.c
> +++ b/drivers/sh/maple/maple.c
> @@ -121,6 +121,7 @@ void maple_getcond_callback(struct maple_device *dev,
>  			void (*callback) (struct mapleq *mq),
>  			unsigned long interval, unsigned long function)
>  {
> +	guard(mutex)(&dev->callback_mutex);
>  	dev->callback = callback;
>  	dev->interval = interval;
>  	dev->function = cpu_to_be32(function);
> @@ -230,11 +231,13 @@ static struct maple_device *maple_alloc_dev(int port, int unit)
>  	mdev->dev.bus = &maple_bus_type;
>  	mdev->dev.parent = &maple_bus;
>  	init_waitqueue_head(&mdev->maple_wait);
> +	mutex_init(&mdev->callback_mutex);
>  	return mdev;
>  }
>  
>  static void maple_free_dev(struct maple_device *mdev)
>  {
> +	mutex_destroy(&mdev->callback_mutex);
>  	kmem_cache_free(maple_queue_cache, mdev->mq->recvbuf);
>  	kfree(mdev->mq);
>  	kfree(mdev);
> @@ -655,8 +658,10 @@ static void maple_dma_handler(struct work_struct *work)
>  				break;
>  
>  			case MAPLE_RESPONSE_DATATRF:
> -				if (mdev->callback)
> -					mdev->callback(mq);
> +				scoped_guard(mutex, &mdev->callback_mutex) {
> +					if (mdev->callback)
> +						mdev->callback(mq);
> +				}
>  				atomic_set(&mdev->busy, 0);
>  				wake_up(&mdev->maple_wait);
>  				break;
> diff --git a/include/linux/maple.h b/include/linux/maple.h
> index 641cf3330409..48ed7558b8ab 100644
> --- a/include/linux/maple.h
> +++ b/include/linux/maple.h
> @@ -3,6 +3,7 @@
>  #define __LINUX_MAPLE_H
>  
>  #include <linux/device.h>
> +#include <linux/mutex.h>
>  #include <mach/maple.h>
>  
>  /* Maple Bus command and response codes */
> @@ -75,6 +76,7 @@ struct maple_device {
>  	char product_licence[64];
>  	atomic_t busy;
>  	wait_queue_head_t maple_wait;
> +	struct mutex callback_mutex;
>  	struct device dev;
>  };
>  
> 
> -- 
> 2.55.0.rc0.799.gd6f94ed593-goog
> 

Thank you so much for your efforts. I can confirm sashikos finding in my
test (that I saw later), that this patch hangs the bus if a VMU memcard
is inserted. So that the peripherals don't work anymore after insertion
of the memcard. With a last log like:
Dreamcast_visual_memory 3:01.E: VMU at (3, 1) is busy

Regards
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
