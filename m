Return-Path: <SRS0=GAYx=BO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8657C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2020 21:57:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B233C207FC
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2020 21:57:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XlOFB7gD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsfTh8Ki"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B233C207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dd4nEfmUXMYPwEfLbd6ctTd/d8ZoGgZ7kEJ4SBQ+bXs=; b=XlOFB7gDx5T7apZp4l63kyyT5
	Z8rRm1IihZAhEQFLHVq8UDhTCAdGrLzfsnAXh9z9WXlDboR7cu5sRnp84uqNqEbOIOhr8IeCyvWjt
	/Zdvk0qeMoFbW5tuTbo9V8dBviIiLQuudY8p1oL5lkcdox9TuWcCZAQOtMQijmSY4ZPbFcysj/JPZ
	mEvdIzXYnB/cWM2wGef4R3UdI5OXzZ8s3ZYlPPIbTqEidJkdENacuKr4bxNS6poVUlkGUShAECNsH
	oCkKjYDM6NgKmgrsfJufhuMiXxSpnjkDlNCwnYLF3FD8oitb3tmBOxJQeOvWhUoX5MvDyRCZc3KWZ
	yvPSbE+6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k34v6-0003kg-11; Tue, 04 Aug 2020 21:56:28 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k34v4-0003kI-2q
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2020 21:56:26 +0000
Received: by mail-qt1-x842.google.com with SMTP id x12so23702788qtp.1
 for <linux-mtd@lists.infradead.org>; Tue, 04 Aug 2020 14:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UccPpGQ4uKB6WoZTJl1MuCD8hOajsEsC2QDYvhe7OlI=;
 b=RsfTh8KikBVqMMDscItiDVRzYzoyVI57OTTnIWzu8W2gMV2GTU7IFKjy65O4wutBgV
 xvCN/mshX97he/qdqN0r+aelpgxZmMzVa6faS+xe3OSsiv8Dph55Zzz0WpEazdM31ZgI
 i2J39gbosT7a1R3NfV630dSc4+sy+kmAI2Bj/jcMwi/Xx5KjBNUK4EAlnw4ToTHR3djN
 NSRF6a3NHZCsHyGifrlUhxJtoUAaKOeQ9/enFzrkY4pah1bNPNcGu3G4Vbt5CXFCUFWD
 jdiG1rYBJgrI9TzlS5VnB9bkvg8VNpgDCIPm/XqNU/ovg9tRF6J6ot1Dj1JaulfVjZke
 pdwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UccPpGQ4uKB6WoZTJl1MuCD8hOajsEsC2QDYvhe7OlI=;
 b=kK/w1c+LRRNx8onU+AUYK09UHoHUzxopmc5Uy6u/SoZuvbAK2VeBMgV1InZpE8viXZ
 jjyVddtWrsVHOoOx5aFqM5KT/LFphv7MCU2sGWZULEYhoCuW+77lRsFkrezOYUGDfI+k
 4709ef3ox/8+oprLHpimjpESUYFW+I0gXbIj9ntxG843k97TMveHWBtbXGvAxjwhJcVy
 aHJzizw38GGPxne4U1NbuWrZ7zvNCyDnxKKBZ6qus7CE8eSJEYbhtoe+As5rjv0toy8P
 BQdRsSAHZoc4RBSzp+dAmwq4kL2WZbD5a+yMTS3x+i/ZC7iAQEOvaLffefL5BXZv3NPn
 ybUA==
X-Gm-Message-State: AOAM533MnWovAtWN0dZkUeHkBfnpWTbExo0arznUlUjT10re44Li3c+M
 DNfJTguNmdd571MlOMNtYqFpfdxgpg3WrIXU1qI=
X-Google-Smtp-Source: ABdhPJx2MqaXC6314A1gSPMasWpsFVff5bIebJciZadSY5fZ1AG7ilqKRqlUiQPkNcU6k97spzJ9jL5jjULnOV/rMAI=
X-Received: by 2002:ac8:67da:: with SMTP id r26mr180090qtp.332.1596578184361; 
 Tue, 04 Aug 2020 14:56:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200601091231.3794350-1-chengzhihao1@huawei.com>
 <CAFLxGvwLSvYsQ+OPi85VS8aQ2uge_JqQRD2C8h=XMORvCej3Sw@mail.gmail.com>
 <211afcd0-d5b3-5ac0-1fd1-dc789634a858@huawei.com>
 <CAFLxGvwRDfB4mqxJhOLwWvoZ3yzpVY-kuAiovYLf8T7WwJqaTg@mail.gmail.com>
 <9caa4860-975c-70bb-c8b9-737d1db9ead4@huawei.com>
In-Reply-To: <9caa4860-975c-70bb-c8b9-737d1db9ead4@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 4 Aug 2020 23:56:13 +0200
Message-ID: <CAFLxGvycs7DNu5o5QY1WwTPfS6cTTykTh-91n9TQZ7yP_ADr4A@mail.gmail.com>
Subject: Re: [PATCH] ubi: check kthread_should_stop() after the setting of
 task state
To: Zhihao Cheng <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_175626_151811_6EB59D85 
X-CRM114-Status: GOOD (  16.01  )
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

On Tue, Aug 4, 2020 at 4:58 AM Zhihao Cheng <chengzhihao1@huawei.com> wrote:
> Oh, you're thinking about influence by schedule(), I get it. But I think
> it still works. Because the ubi_thread is still on runqueue, it will be
> scheduled to execute later anyway.

It will not get woken. This is the problem.

>
> op                                                    state of
> ubi_thread           on runqueue
> set_current_state(TASK_INTERRUPTIBLE) TASK_INTERRUPTIBLE              Yes
> if (kthread_should_stop()) // not satisfy
> TASK_INTERRUPTIBLE              Yes
> kthread_stop:
>    wake_up_process
>      ttwu_queue
>        ttwu_do_activate
>          ttwu_do_wakeup TASK_RUNNING                       Yes
> schedule
>    __schedule(false)
>
>   // prev->state is TASK_RUNNING, so we cannot move it from runqueue by
> deactivate_task(). So just pick next task to execute, ubi_thread is
> still on runqueue and will be scheduled to execute later.

It will be in state TASK_RUNNING only if your check is reached.

If kthread_stop() is called *before* your code:
+                       if (kthread_should_stop()) {
+                               set_current_state(TASK_RUNNING);
+                               break;
+                       }

...everything is fine.
But there is still a race window between your if
(kthread_should_stop()) and schedule() in the next line.
So if kthread_stop() is called right *after* the if and *before*
schedule(), the task state is still TASK_INTERRUPTIBLE
--> schedule() will not return unless the task is explicitly woken,
which does not happen.

Before your patch, the race window was much larger, I fully agree, but
your patch does not cure the problem
it just makes it harder to hit.

And using mdelay() to verify such a thing is also tricky because
mdelay() will influence the task state.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
