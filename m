Received: from wa-out-1112.google.com ([209.85.146.178])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jj95E-0001ME-J2
	for linux-mtd@lists.infradead.org; Tue, 08 Apr 2008 08:21:41 +0000
Received: by wa-out-1112.google.com with SMTP id v33so1461901wah.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 08 Apr 2008 01:21:34 -0700 (PDT)
Message-ID: <b647ffbd0804080121l2bb1863fmb8ef85ec7d42b118@mail.gmail.com>
Date: Tue, 8 Apr 2008 10:21:34 +0200
From: "Dmitry Adamushko" <dmitry.adamushko@gmail.com>
To: "Andrew Morton" <akpm@linux-foundation.org>
Subject: Re: [PATCH] mtd/chips: add missing set_current_state() to cfi_{amdstd,
	staa}_sync()
In-Reply-To: <20080407161555.3dd540f9.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1207251503.6300.9.camel@earth>
	<20080407161555.3dd540f9.akpm@linux-foundation.org>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/04/2008, Andrew Morton <akpm@linux-foundation.org> wrote:
> On Thu, 03 Apr 2008 21:38:23 +0200
>  Dmitry Adamushko <dmitry.adamushko@gmail.com> wrote:
>
>  > From: Dmitry Adamushko <dmitry.adamushko@gmail.com>
>  > Subject: [mtd/chips] add missing set_current_state() to cfi_{amdstd,staa}_sync()
>  >
>  > cfi_amdstd_sync() and cfi_staa_sync() call schedule() without changing
>  > task's state appropriately.
>  >
>  > In case of e.g. chip->state == FL_ERASING, cfi_*_sync() will be busy-looping
>  > either redundantly for a fixed interval of time (for SCHED_NORMAL tasks) or
>  > possibly endlessly (for RT tasks and UP).
>  >
>  > Signed-off-by: Dmitry Adamushko <dmitry.adamushko@gmail.com>
>  >
>  > ---
>  >
>  > diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
>  > index d072e87..458d477 100644
>  > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
>  > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
>  > @@ -1763,6 +1763,7 @@ static void cfi_amdstd_sync (struct mtd_info *mtd)
>  >
>  >               default:
>  >                       /* Not an idle state */
>  > +                     set_current_state(TASK_UNINTERRUPTIBLE);
>  >                       add_wait_queue(&chip->wq, &wait);
>  >
>  >                       spin_unlock(chip->mutex);
>  > diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
>  > index b344ff8..492e2ab 100644
>  > --- a/drivers/mtd/chips/cfi_cmdset_0020.c
>  > +++ b/drivers/mtd/chips/cfi_cmdset_0020.c
>  > @@ -1015,6 +1015,7 @@ static void cfi_staa_sync (struct mtd_info *mtd)
>  >
>  >               default:
>  >                       /* Not an idle state */
>  > +                     set_current_state(TASK_UNINTERRUPTIBLE);
>  >                       add_wait_queue(&chip->wq, &wait);
>  >
>  >                       spin_unlock_bh(chip->mutex);
>
>
> The change certainly looks correct.  Has it been runtime tested?

It has been tested with an oldish 2.6.8.1 where the problem initially
occured. It was a RT task that happened to close an mtd fd (and
resulting in ->sync() being called) and ran in the middle of the
->erase op... resulting in a "nice" endless loop.

The versions of cfi_{amdstd,staa}_sync() in the mainline look not that
much different from the respective versions in 2.6.8.1.

I guess, it went unnoticed for so long time due to :

(1) apps. don't often directly open/close() fd for mtd partitions;
(2) a race against ->erase() (or smth else) is rare;
(3) if (1) is not true, then an app. is still unlikely to be RT (in
which case, a task just loops until its timeslice is gone).


>
>  Thanks.
>

-- 
Best regards,
Dmitry Adamushko
