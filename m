Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736C3C43334
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jul 2022 18:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PXiSrAlQgO5J6wcCAwnONH7Z39lrA9A64VdLX8hN9/M=; b=MWunZRQcZjEB2E
	KCW3l4boCHzfG+t0cZNtC5Q4dSvG5jeQu8QEeU4+WeBUolOPu9rnwb8KNElZbB9YeLrWz6arzU9YP
	goaRtetWbWBKuSPe+F/2NUSbVYimhLxP8y0hUWDbspNTo5BpO+Zc4/PUAoLF6rdhxQUKrx5jVKpqV
	hMWwzF+Irksr80F9vRAkMl4A/6Vm3XAUPaz1r12jSxPC4ZQUyDSL5GHlE34haHSzacB8Fh03coqZq
	4dV77Hen9S7p+GMSGKFt4TXW3qy4D0FvSmXO665a4TzVT7ei0gCNH/sMYkXCGW/HfKbNfu37QtWU8
	t/U6R5ocry8E5e7IMBrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFgEc-008QF8-5y; Sun, 24 Jul 2022 18:21:46 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFgEZ-008Q0z-Va
	for linux-mtd@lists.infradead.org; Sun, 24 Jul 2022 18:21:45 +0000
Received: by mail-ed1-x52e.google.com with SMTP id c12so4087871ede.3
        for <linux-mtd@lists.infradead.org>; Sun, 24 Jul 2022 11:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NmXCnVFdufDjdmGQv/rvtn4m8BrWQme2Su1t/56URPU=;
        b=girW7NESLFLL25IYBHi8zI6x7ZyTTkm4ZYrZCH2DOuzjv2KXV0NQQdddfFYcljg8v8
         l62u9DMjggOlWJi4s1e6q1qmgsN1b8naTUiUEq5xZhrUrhtR/4xDzbbXSNvgtZ4BBgXm
         CgM4eSW0SGBiz34ee5OyfqV6GOoCrkgqXJv/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NmXCnVFdufDjdmGQv/rvtn4m8BrWQme2Su1t/56URPU=;
        b=mZ5JjxxNHtBCfeuoBPTYF8aPRm7fcDT7nPzUHPeUEtgRUxrF/JegoBXde1mHI2WZNR
         IVa2pVFGCzWNxk4m9FfN2x4bZDauLpU4omO9MOmcejYA/BVgobfrLpeqZBh2mBBYltl7
         Biuh/s7WOZmivdbYHkMHy+L4Lksz2HeBQH2arWErRqJwfx7ScU2dED7I3/foFcslolJ8
         50Y3GxEnCHFrHD3aZ4FI1VNZjXZpyaAXmv8JTkKmqoEzpEjhy4S2SUa3yAU5NMNyx14J
         qjRAgLfkfs2HU7lEL2r0BC1WtX7vS6bnEb2PalKDFLh96rRodwrPygAUvmKt+SPimYlv
         drgw==
X-Gm-Message-State: AJIora++zGskCNtLOfggMMa/GuZcoH+uTdvI/PlBihF3762o3yNjax4n
	B/T6YreAcRwVoBpbQlWUzXRwbMTkODpJelcb
X-Google-Smtp-Source: AGRyM1uFNMFFruCpCjQ5qiuPhGNd4ukDZ6zWbXBMhWe4t2MyYJFzy7+joPA2L8RLniZ+HOF3UEDY5g==
X-Received: by 2002:a05:6402:48:b0:43a:caa8:756b with SMTP id f8-20020a056402004800b0043acaa8756bmr9675093edu.112.1658686897556;
        Sun, 24 Jul 2022 11:21:37 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id sa15-20020a1709076d0f00b0072b32de7794sm4393241ejc.70.2022.07.24.11.21.36
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Jul 2022 11:21:36 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id b26so13127790wrc.2
        for <linux-mtd@lists.infradead.org>; Sun, 24 Jul 2022 11:21:36 -0700 (PDT)
X-Received: by 2002:adf:dd91:0:b0:21e:4e97:c146 with SMTP id
 x17-20020adfdd91000000b0021e4e97c146mr5607771wrl.281.1658686896484; Sun, 24
 Jul 2022 11:21:36 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000040624a05e2a6f2db@google.com> <18701775-c174-96ce-31ce-478d8783b575@I-love.SAKURA.ne.jp>
 <62da6803.1c69fb81.2a10f.9bf1@mx.google.com> <a02e58da-5d30-d138-83d4-5545aba1f035@I-love.SAKURA.ne.jp>
In-Reply-To: <a02e58da-5d30-d138-83d4-5545aba1f035@I-love.SAKURA.ne.jp>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 24 Jul 2022 11:21:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wju718tshE9a7QGpiA5WzkT_3OxrXQTE_eM9YzFOOWjBg@mail.gmail.com>
Message-ID: <CAHk-=wju718tshE9a7QGpiA5WzkT_3OxrXQTE_eM9YzFOOWjBg@mail.gmail.com>
Subject: Re: [syzbot] linux-next boot error: general protection fault in add_mtd_device
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, Dmitry Vyukov <dvyukov@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_112144_057264_FE5573E7 
X-CRM114-Status: GOOD (  10.87  )
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

On Sat, Jul 23, 2022 at 6:34 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> Linus, can we have macros like valid_kernel_ptr() ? Macros like
> valid_kernel_ptr(), valid_kernel_ptr_or_null(), valid_kernel_ptr_or_err() can
> serve for documentation purpose without runtime cost for non-debug builds.

No. We have IS_ERR_OR_NULL(), but validating a kernel pointer in
general is pretty much impossible.

You can try to just dereference it - and it's even fairly efficient if
the exception case is supposed to be very rare.

But even that is not really "safe", in that it can cause IO accesses
etc.  Plus it fundamentally cannot catch the likely case - the pointer
"works", but it's simply stale and doesn't point to the right data.

And honestly, even if the pointer doesn't actually "work" as a
pointer, you are actually much better off taking the exception at that
point, and getting an oops, and just FIXING THE BUG instead.

Having some model where "this pointer fails, so I'll just do something
else" is completely and utterly wrong.

It's bad for debugging, and it's impossible for any real use.

So the whole notion of "is this pointer safe" is garbage.

The only way to make sure a pointer is safe is to just make sure it's
initialized properly. Once you start using random pointers, all bets
are off, and no amount of "let's verify this" will ever help at all.
It will only hurt.

           Linus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
