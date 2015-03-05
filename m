Received: from mail-qa0-x22f.google.com ([2607:f8b0:400d:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTKw5-0000cD-Pz
 for linux-mtd@lists.infradead.org; Thu, 05 Mar 2015 01:50:50 +0000
Received: by mail-qa0-f47.google.com with SMTP id v10so36958336qac.6
 for <linux-mtd@lists.infradead.org>; Wed, 04 Mar 2015 17:50:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20150304192310.GN18140@ld-irv-0074>
References: <1423609138-19321-1-git-send-email-dehrenberg@chromium.org>
 <20150304192310.GN18140@ld-irv-0074>
Date: Wed, 4 Mar 2015 17:50:25 -0800
Message-ID: <CAAK6Zt0e3+KG+GDUA=c=wuc54NB7e4Jt=WQY+V0o0MKtuXeWmQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mtdpart: Allow adding a partition of a partition
From: Daniel Ehrenberg <dehrenberg@google.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Gwendal Grignou <gwendal@chromium.org>, richard.weinberger@gmail.com,
 Nam Nguyen <namnguyen@chromium.org>, Grant Grundler <grundler@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@imgtec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 4, 2015 at 11:23 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> One of the problems here is the semantics. Do we really want to do this
> offset computation when using the partition instead of the master? That
> means if the original partitioning does not cover the early part of the
> master MTD, then that piece is lost forever. e.g.,
>
>  master, size 0x1000000, with a single partition
>  /dev/mtd0, 1st partition 0x20000 - 0x40000
>
> Then, ioctl(BLKPG, /dev/mtd0) can never create any partitions before
> 0x20000. But it CAN create partitions after 0x4000! We'd have to support
> negative offsets for this to work consistently. (Now that I mention it,
> does MTD's BLKPG even do sanity checking on the arguments? I think it
> might actually accept negative offsets...).
>
> Also, it's a bit odd that you can use one partition to delete either
> another partition, or itself. e.g.,
>
>         flash_part del /dev/mtd1 0  # deletes mtd0
>         flash_part del /dev/mtd1 1  # deletes mtd1
>
> This might be acceptable, if awkward. But the first problem looks like
> it needs more thought.
>
> Brian

OK, how would you feel if I just added some stronger bounds checking
for add? I'm not sure what to do about the delete case.

For my use case, I have one partition set up as mtd0 which spans over
the whole device. I'll always be using this as my master. It'd suit my
purposes if we restricted these special add and removes to that sort
of case, but I generalized it like this because I thought it would be
cleaner. I'm open to more suggestions. It'd also work for me to make
some sort of option (kernel commandline param?) to give a number to
the master device and just refer to that directly (I haven't really
thought this option through).

Dan
