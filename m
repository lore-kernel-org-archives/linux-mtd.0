Return-Path: <SRS0=iZys=BM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E84DC433E0
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Aug 2020 21:26:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EE1020722
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Aug 2020 21:26:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CmyrEBy0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5BNbEYw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EE1020722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2SB0ORtQEF/KStEso3HkNEpsPspVjn36cWq2gbKyC60=; b=CmyrEBy05qXvF0To8cWMGfhjc
	b8CSVbXPwFWgz10KF3T8qkIkpzyjEav3aqesP/hW4o1BW5hMLcqs0Z2OnIZHtnxPHNgQg10DXJKiG
	PIiubI15TLRKgNzmmbr49Uh20n2vJB0/DbqDeCShrmxGJQr18Ei/LytnBDpmP9KLD8YobyX9xHmc5
	1aszP82KkLHieBOKPJ+YSHNd0N0JNtC6JKI0sYb/vJrf1/bwFMz1XJ9Or+nLq/JgZ66p+F8Dy0Qsl
	dNMIXK3LC74ERemSrBaSgQnqRtF4J64O6YASVek1Hmdm63HnNsMoYD0oFyS03Z38zCUtGiYoALjDe
	zqi6fA7JQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2LU9-0003sD-G5; Sun, 02 Aug 2020 21:25:37 +0000
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2LU6-0003rr-Mb
 for linux-mtd@lists.infradead.org; Sun, 02 Aug 2020 21:25:35 +0000
Received: by mail-qv1-xf44.google.com with SMTP id dd12so11496402qvb.0
 for <linux-mtd@lists.infradead.org>; Sun, 02 Aug 2020 14:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+vPBcIAaDQT1fIr7QHvmC5z6P2qSBTffqgMpR1sAJ18=;
 b=H5BNbEYwlq1eaQkM03llB+jv8CkBc+J5Zgu7JNzbHTkmruj9rx4ybP++eTVD8DoAsN
 902r8DaB52xvylcxNmAUm22FWb/LRd2fxdc4Tu6JhF4/ZT9TeT9GXP6GWxO1M1QEgl3r
 kIFO71kTZ23lj3v8hlQmrwteLSbleHC/jNtXVcdAUVQYuvegY0HiwMZ43cErM2M2iWhV
 wk0h9mbN1hESKLNRsuMc40JUWR1z4pnQboCTZAeAgsAvPBD5ewobcDceLhTUXts9Yv0X
 xTjqzLpm0efT8C9qRM1T8wmCI384Q675QPcgK3w0C0iWkppUJco9aSGa5C6pDFhxvWW4
 jEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+vPBcIAaDQT1fIr7QHvmC5z6P2qSBTffqgMpR1sAJ18=;
 b=BOhu+mBlMZPetlUiVbNTyUQwuy1piLwhx8rb2ym/MP1F/g6fifl9XXv1yBG5vYpCPT
 l9pIVbiJdruPWMy7KGBjmvZKrzi/65dIaFPVky6RjaEa4j3Hp0okIuaa2p4cpZM3D+0M
 Zvk/y2vjyEXE1t+X+q2PIIuljXOya+A2d8OEWysPZQ09b0HZRJI1g89g6muFbeZ/260P
 9gOuWZLbmMKet5FZZW0+XIMjh1k67zjqa97DCQZQy8OlnDPGGxvy1WrwTe+B8hrwrxot
 RKgk2Wd3XLp/SpZgxpFy2JRoZsKp5SUmCSUbmxWEc7ns2KcOVFEe5gHbQSjvoWDkf5wb
 MkXA==
X-Gm-Message-State: AOAM5314Z76StVpb5J1vo3qGgv0e6W6WmVKpVPzb93Ia01xRJt6yOFN4
 bIOnz4DvqIx9dqQTj8MdmmD0emcv4wnRCzR5CHc=
X-Google-Smtp-Source: ABdhPJy/D57l4PxXsvtNghGpZYYWxtQzGKIP9nS2mWv50e3fWXnuy/WrDD7ylBIgT36e7fl/UU0Xpv5GyujUEEZZD90=
X-Received: by 2002:a0c:e9c7:: with SMTP id q7mr14265761qvo.195.1596403532995; 
 Sun, 02 Aug 2020 14:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200601091231.3794350-1-chengzhihao1@huawei.com>
In-Reply-To: <20200601091231.3794350-1-chengzhihao1@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 2 Aug 2020 23:25:21 +0200
Message-ID: <CAFLxGvwLSvYsQ+OPi85VS8aQ2uge_JqQRD2C8h=XMORvCej3Sw@mail.gmail.com>
Subject: Re: [PATCH] ubi: check kthread_should_stop() after the setting of
 task state
To: Zhihao Cheng <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_172534_900285_2422EBD7 
X-CRM114-Status: GOOD (  23.27  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, "zhangyi \(F\)" <yi.zhang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jun 1, 2020 at 11:13 AM Zhihao Cheng <chengzhihao1@huawei.com> wrote:
>
> A detach hung is possible when a race occurs between the detach process
> and the ubi background thread. The following sequences outline the race:
>
>   ubi thread: if (list_empty(&ubi->works)...
>
>   ubi detach: set_bit(KTHREAD_SHOULD_STOP, &kthread->flags)
>               => by kthread_stop()
>               wake_up_process()
>               => ubi thread is still running, so 0 is returned
>
>   ubi thread: set_current_state(TASK_INTERRUPTIBLE)
>               schedule()
>               => ubi thread will never be scheduled again
>
>   ubi detach: wait_for_completion()
>               => hung task!
>
> To fix that, we need to check kthread_should_stop() after we set the
> task state, so the ubi thread will either see the stop bit and exit or
> the task state is reset to runnable such that it isn't scheduled out
> indefinitely.
>
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
> Cc: <Stable@vger.kernel.org>
> Fixes: 801c135ce73d5df1ca ("UBI: Unsorted Block Images")
> Reported-by: syzbot+853639d0cb16c31c7a14@syzkaller.appspotmail.com
> ---
>  drivers/mtd/ubi/wl.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index 5146cce5fe32..a4d4343053d7 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -1628,6 +1628,19 @@ int ubi_thread(void *u)
>                     !ubi->thread_enabled || ubi_dbg_is_bgt_disabled(ubi)) {
>                         set_current_state(TASK_INTERRUPTIBLE);
>                         spin_unlock(&ubi->wl_lock);
> +
> +                       /*
> +                        * Check kthread_should_stop() after we set the task
> +                        * state to guarantee that we either see the stop bit
> +                        * and exit or the task state is reset to runnable such
> +                        * that it's not scheduled out indefinitely and detects
> +                        * the stop bit at kthread_should_stop().
> +                        */
> +                       if (kthread_should_stop()) {
> +                               set_current_state(TASK_RUNNING);
> +                               break;
> +                       }
> +

Hmm, I see the problem but I fear this patch does not cure the race completely.
It just lowers the chance to hit it.
What if KTHREAD_SHOULD_STOP is set right after you checked for it?

>                         schedule();
>                         continue;
>                 }


-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
