Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F084C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Dec 2022 15:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJ+8bpqOKjoOeaLyC/3+2pOqJQ90mR/7KebUMdy3/WU=; b=jETmsnt4ud8op1
	cMCTCvWB6cZksv2yUzaUKHta/HGbwD8MaErYCRaGDZ9V2nSOaugNF6VDJkzKw20lKAKFO2OsPcanr
	N4lWg7DV65eeVvy1IYTqQ/HOTHDjYED8Qf+7N2/97RJ71EX3YAtbuKwTmoZjc5dv3LIePrNBxQj/p
	SPHP+UHk7Tpp3o3lJJw6VppEUKxeqNccEIxeR7bMt7lrCVhMrrvwj73c69hXlg724X7zgzGa9tL2W
	UsnrHaGE+JIAYAwhF6PEJc32MC7MXQsJPuwIDeu1TQOiutk0gR2TELPwaA5PATLktD2npS8svru+s
	BNi5D/adjIFJKgxDHSqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5TUR-0004xr-7M; Wed, 14 Dec 2022 15:16:11 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5TUK-0004oB-P7
	for linux-mtd@lists.infradead.org; Wed, 14 Dec 2022 15:16:09 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-417b63464c6so311787b3.8
        for <linux-mtd@lists.infradead.org>; Wed, 14 Dec 2022 07:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i8/7ompYoprPv6p5gopqt1zlXtmepYGFLCWXe2gsqzg=;
        b=BUfL3YrZ28K+1n6E2SQ9fOqgRKi2RgeotU3ckXNn8xFWPTs42cuoGfphfjNQOV0pgx
         7/jp35I3w0HRIOFVcsghYPgMBrhr8AMNN8/bTKnJa17Hz49AiqnR3KxJME/VVIigK+sS
         o/Lm4IOiEo8w6nxX4t2A4IzKZLODEjcrKKDsdmGKLI1atzrsu3mpNZREk5A83gxmOZAt
         L+k/IzYKvXs7B7hnKP1erYHIobJ4iQu87BD3pnHQtG8fBQOI4ExEQ0QtE/CElufFbNCA
         yV0c98uSdPhEqukbLuFuzz8L6ZLLU8J5/FlBKjiGFYDWzKiB3XFMXdMwK39OTfRDW0AO
         GSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8/7ompYoprPv6p5gopqt1zlXtmepYGFLCWXe2gsqzg=;
        b=yjghq+PHzMD619gCfxHB0qZWu9MfXedJEpNRToecNDvuok+3KJ6C0vWorTKwFmRZs3
         u/TwpFznyJQJUGbGE0VPryyNukhvdCQHtY/NrKaTuI4Gmh+pPmIjWLgK0yQ+S4LRn4wV
         EcVL3ZVUQl0rMttG6/0UrL6J4imOd1m3OY8Mq2WwJwMdjYveSo1s90VCS03o1nGLTlFQ
         1f7hgy9VvkTetaydhIeNw/thfXapAZZDWLLxE+0J7AIOLgvO+pyN3MfiE2wT5W1LQaUk
         GJtUEFLJC2S4qknZz61RiDs8ic0i2rxYqyVKeMG9JOpQmQzFDOisivzGm3b37QBDFJlb
         hzlw==
X-Gm-Message-State: ANoB5pml+qEHj0RfnKOruQLj3L0b6Wz6DV7hBa4qTrQ8bh1UOL4QxR8k
	lj1FPVLs8lqbR+7cGD1FRaYZnn4SzvU14+1slFd0aw==
X-Google-Smtp-Source: AA0mqf6N7NofCRVaBdlZmzX/2IFdQaSJdENS2yaazN5Bc4VEowcispQ6llOh6euNJwrBHENhxHLAYZsrXmLpw9L8cy4=
X-Received: by 2002:a81:1e44:0:b0:370:7a9a:564 with SMTP id
 e65-20020a811e44000000b003707a9a0564mr27785992ywe.278.1671030961275; Wed, 14
 Dec 2022 07:16:01 -0800 (PST)
MIME-Version: 1.0
References: <cover.1670778651.git.david.keisarschm@mail.huji.ac.il>
 <b3caaa5ac5fca4b729bf1ecd0d01968c09e6d083.1670778652.git.david.keisarschm@mail.huji.ac.il>
 <Y5c8KLzJFz/XZMiM@zx2c4.com> <20221214123358.GA1062210@linux.intel.com>
In-Reply-To: <20221214123358.GA1062210@linux.intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 14 Dec 2022 16:15:49 +0100
Message-ID: <CANn89iJtK4m1cWvCwp=L_rEOEBa+B1kLZJAw0D9_cYPQcAj+Mw@mail.gmail.com>
Subject: Re: [PATCH 1/5] Renaming weak prng invocations - prandom_bytes_state, prandom_u32_state
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, david.keisarschm@mail.huji.ac.il, 
	Vignesh Raghavendra <vigneshr@ti.com>, Peter Zijlstra <peterz@infradead.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org, 
	Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org, 
	Stanislav Fomichev <sdf@google.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Christoph Lameter <cl@linux.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Richard Weinberger <richard@nod.at>, x86@kernel.org, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, ilay.bahat1@gmail.com, Ingo Molnar <mingo@redhat.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Jiri Pirko <jiri@nvidia.com>, 
	David Rientjes <rientjes@google.com>, Yonghong Song <yhs@fb.com>, Paolo Abeni <pabeni@redhat.com>, 
	intel-gfx@lists.freedesktop.org, Petr Mladek <pmladek@suse.com>, 
	Jiri Olsa <jolsa@kernel.org>, Hao Luo <haoluo@google.com>, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, KP Singh <kpsingh@kernel.org>, 
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Hannes Reinecke <hare@suse.de>, Andy Lutomirski <luto@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-scsi@vger.kernel.org, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, linux-mm@kvack.org, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pekka Enberg <penberg@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, aksecurity@gmail.com, 
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	"David S. Miller" <davem@davemloft.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_071604_838011_C4DCE79F 
X-CRM114-Status: GOOD (  14.74  )
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

On Wed, Dec 14, 2022 at 1:34 PM Stanislaw Gruszka
<stanislaw.gruszka@linux.intel.com> wrote:
>
> On Mon, Dec 12, 2022 at 03:35:20PM +0100, Jason A. Donenfeld wrote:
> > Please CC me on future revisions.
> >
> > As of 6.2, the prandom namespace is *only* for predictable randomness.
> > There's no need to rename anything. So nack on this patch 1/5.
>
> It is not obvious (for casual developers like me) that p in prandom
> stands for predictable. Some renaming would be useful IMHO.

Renaming makes backports more complicated, because stable teams will
have to 'undo' name changes.
Stable teams are already overwhelmed by the amount of backports, and
silly merge conflicts.

Take another example :

u64 timecounter_read(struct timecounter *tc)

You would think this function would read the timecounter, right ?

Well, it _updates_ many fields from @tc, so a 'better name' would also
be useful.

linux kernel is not for casual readers.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
