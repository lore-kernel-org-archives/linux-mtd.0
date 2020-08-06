Return-Path: <SRS0=9pp2=BQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000FDC433E0
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Aug 2020 20:17:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2AE42177B
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Aug 2020 20:17:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nCw2GeI6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h35Sp8BE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2AE42177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MrjtW2vzfAnfkyML/0ITUIBwUI9Ixcsn3fqgsBftNec=; b=nCw2GeI6lsO9ao+cyzpuDZKz5
	W24tFE0FeGIhbpBZrhftwpaQHIfRy9pRMsz0kYM5S9DoxYepqYAP/17k8f5PKG/6tQAfuUiHvOmGw
	n2EVrJfq1v1VKT3OBSqCxx/WKiSGp/tV7aL0CDgDHhsgEpCsi1Nw/zrQNo5qrB5JZusUoJccWYlmS
	5uNJD5RjShdAikrcvlhWVrmpkM6Hu5ZSmWDN/hbOSxc+Km6a8uU7zytIal3BQw+TOndyS68smGlBy
	peXqq6UvRhy3js9vhc9jjQVq64PBvYzS+cxYEK2hO2z74LkkGpkgh0jN3BhzSXVrjYgtmPITF1WgC
	rn2P2W+4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3mJ1-00065S-Ez; Thu, 06 Aug 2020 20:16:03 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3mIz-00064R-55
 for linux-mtd@lists.infradead.org; Thu, 06 Aug 2020 20:16:01 +0000
Received: by mail-qk1-x742.google.com with SMTP id 2so42071095qkf.10
 for <linux-mtd@lists.infradead.org>; Thu, 06 Aug 2020 13:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z5BaX90LdW8Ugx54ddA3KoziTH/PsAA8tFDwiMrbnR8=;
 b=h35Sp8BEgVxDlpWym/cQDqC4zseWQpiWdcfic5rVu1+3HpzGdKAeQGbagPrCRlkBKx
 7BMR5dsAGTbm/KvFxdORSZ4SwErxkTluAWtQIVmJmv1vPKSWOw2zKya/kpKjJGw1bfis
 oq/GYvo44pMAk3bLZT7xeexIRN5NYpjMf32iiSgGOUJ4Jz40CAVQmSTWWwTFWf0c1GQJ
 MZlwfp4WKJ0iWSTN4ua7uIngbzICK/dUIxzZN6y3Q4FuadADXkBP+K8AcbENRmGNdSdY
 neh4s3xk1Fs7HJeLqHFMOMdvS2D3/bS9KTtc5xiaBcK9aDYpHCG+6ngpGQ0d/0FDBmgd
 iiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z5BaX90LdW8Ugx54ddA3KoziTH/PsAA8tFDwiMrbnR8=;
 b=bvsI0CEU0WH6m2m1kQNavLE/ickcfqjRZSMtk0YyJx2Nqd+EH+0IKmI3FyfNjgAK+G
 3Mm/MSYIv8WHG6hAMUZDfiUUBAbYLprQuNF0j5gQ581p5m1VT4tGRJwv/+ujRwuOKqd8
 aOqazaLnmMOFULy646SiCpP3ATvHW1MBJtZgSzypFWwQnB9tPI9IGlume/jN8ibmd5oR
 SIwXP8eHHe2Bkf6iyBI0tLl7c3LKpvws8Xky+/6QZ0lVKPxZ6F6oj1R0uuEsyes4op2R
 2xUY6GaIfoohbwpfef8X5kZd8d1R7YgHN4PhqiHqs69vK2dcZhW1YT+A2/e404jHAQkV
 qTbA==
X-Gm-Message-State: AOAM533SLbmqrrST9r7GmDtTJcplnxXEx7866WSawOjONHEibN9HVmhJ
 zgK0DcSeqNhueIqKlXIEUCxkCJGUDT2S7yLwzFA=
X-Google-Smtp-Source: ABdhPJwSfeFtVLjjuWu43jt9dVPk/qZN6CoHRswsFXANDqtxyDrzZufWflt9mHDnqAa1Yh69p4Nz07aZufBWpHGp3/A=
X-Received: by 2002:a37:a44:: with SMTP id 65mr10479172qkk.370.1596744957954; 
 Thu, 06 Aug 2020 13:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200601091231.3794350-1-chengzhihao1@huawei.com>
 <CAFLxGvwLSvYsQ+OPi85VS8aQ2uge_JqQRD2C8h=XMORvCej3Sw@mail.gmail.com>
 <211afcd0-d5b3-5ac0-1fd1-dc789634a858@huawei.com>
 <CAFLxGvwRDfB4mqxJhOLwWvoZ3yzpVY-kuAiovYLf8T7WwJqaTg@mail.gmail.com>
 <9caa4860-975c-70bb-c8b9-737d1db9ead4@huawei.com>
 <CAFLxGvycs7DNu5o5QY1WwTPfS6cTTykTh-91n9TQZ7yP_ADr4A@mail.gmail.com>
 <2086f822-e67a-43e4-76d8-5339eaccd3ac@huawei.com>
In-Reply-To: <2086f822-e67a-43e4-76d8-5339eaccd3ac@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 6 Aug 2020 22:15:46 +0200
Message-ID: <CAFLxGvzwoC1GcjJOfwpc8V5LD79=8XiJaNV2HjOm8EdQcCbp+w@mail.gmail.com>
Subject: Re: [PATCH] ubi: check kthread_should_stop() after the setting of
 task state
To: Zhihao Cheng <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_161601_229932_7CB50141 
X-CRM114-Status: GOOD (  14.23  )
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

On Wed, Aug 5, 2020 at 4:23 AM Zhihao Cheng <chengzhihao1@huawei.com> wrote:
> Er, I can't get the point. I can list two possible situations, did I
> miss other situations?

Yes. You keep ignoring the case I brought up.

Let's start from scratch, maybe I miss something.
So I'm sorry for being persistent.

The ubi thread can be reduced to a loop like this one:
1. for (;;) {
2.      if (kthread_should_stop())
3.              break;
4.
5.      if ( /* no work pending*/ ){
6.              set_current_state(TASK_INTERRUPTIBLE);
7.              schedule();
8.              continue;
9.      }
10.
11.     do_work();
12. }

syzcaller found a case where stopping the thread did not work.
If another task tries to stop the thread while no work is pending and
the program counter in the thread
is between lines 5 and 6, the kthread_stop() instruction has no effect.
It has no effect because the thread sets the thread state to
interruptible sleep and then schedules away.

This is a common anti-pattern in the Linux kernel, sadly.

Do you agree with me so far or do you think syzcaller found a different issue?

Your patch changes the loop as follows:
1. for (;;) {
2.      if (kthread_should_stop())
3.              break;
4.
5.      if ( /* no work pending*/ ){
6.              set_current_state(TASK_INTERRUPTIBLE);
7.
8.              if (kthread_should_stop()) {
9.                      set_current_state(TASK_RUNNING);
10.                     break;
11.             }
12.
13.             schedule();
14.             continue;
15.     }
16.
17.     do_work();
18. }

That way there is a higher chance that the thread sees the stop flag
and gracefully terminates, I fully agree on that.
But it does not completely solve the problem.
If kthread_stop() happens while the program counter of the ubi thread
is at line 12, the stop flag is still missed
and we end up in interruptible sleep just like before.

So, to solve the problem entirely I suggest changing schedule() to
schedule_timeout() and let the thread wake up
periodically.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
