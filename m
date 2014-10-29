Received: from mail-la0-x22e.google.com ([2a00:1450:4010:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjcwC-0003Ue-Nz
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 23:46:01 +0000
Received: by mail-la0-f46.google.com with SMTP id hs14so3474171lab.19
 for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2014 16:45:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20141028222511.GB23619@ld-irv-0074>
References: <1414020181-8855-1-git-send-email-andrea.adami@gmail.com>
 <20141028222511.GB23619@ld-irv-0074>
Date: Thu, 30 Oct 2014 00:45:36 +0100
Message-ID: <CAAQYJAsvCVb0o8bKELc+j8Ces6mUJfbGtiAgqs3gP_8S3dF3uw@mail.gmail.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0001.c: fix resume for LH28F640BF chips
From: Andrea Adami <andrea.adami@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Cc: linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,

thanks for the review.

On Tue, Oct 28, 2014 at 11:25 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
>
> On Thu, Oct 23, 2014 at 01:23:01AM +0200, Andrea Adami wrote:
> > After '#echo mem > /sys/power/state' some devices can not be properly resumed
> > because apparently the MTD Partition Configuration Register has been reset
> > to default thus the rootfs cannot be mounted cleanly on resume.
> > An example of this can be found in the SA-1100 Developer's Manual at 9.5.3.3
> > where the second step of the Sleep Shutdown Sequence is described:
> > "An internal reset is applied to the SA-1100. All units are reset...".
> >
> > As workaround we refresh the PCR value as done initially on chip setup.
> >
> > This behavior and the fix are confirmed by our tests done on 2 different Zaurus
> > collie units with kernel 3.17.
> >
> > Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>
> Who's the author? I have a 'From' header (which becomes the patch
> author) of Andrea, but the sign-off is Dmitry. If you add a
> 'From: xxx <yyy@zzz.tld>' line to the beginning of the email, that can
> clarify the author, even when the author is not emailing.
>
> git-send-email will also handle that for you, if the original git commit
> has the proper author.

The author is Dmitry who first noticed the failure on resume and
suggested the fix.
I just verified the PCR was reset [1] and added the comments before
sending it upstream.

>
> > ---
> >  drivers/mtd/chips/cfi_cmdset_0001.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> > index a7543ba..59e2355 100644
> > --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> > +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> > @@ -2590,6 +2590,8 @@ static void cfi_intelext_resume(struct mtd_info *mtd)
> >
> >               /* Go to known state. Chip may have been power cycled */
> >               if (chip->state == FL_PM_SUSPENDED) {
> > +                     /* Refresh LH28F640BF Partition Config. Register */
> > +                     fixup_LH28F640BF(mtd);
>
> OK, that looks fine.
>
> But while we're at it, it seems like any chip which has a boot-time
> fixup hook in cfi_fixup_table[] should be run at resume time, since
> those chips may have lost power too. For instance, it looks like
> fixup_unlock_powerup_lock() would need rerun.
>
> I'm not sure if we should do a more invasive patch like that without any
> testing, though.
>
> >                       map_write(map, CMD(0xFF), cfi->chips[i].start);
> >                       chip->oldstate = chip->state = FL_READY;
> >                       wake_up(&chip->wq);
>
> Brian

For chips supporting 'Instant Lock' the unlock is done few lines later
by cfi_intelext_restore_locks(mtd)

If you don't see more issues I'd resend the patch adding the initial From:.

Thanks

Andrea


[1]
root@collie:~# echo mem > /sys/power/state
PM: Syncing filesystems ... done.
Freezing user space processes ... (elapsed 0.002 seconds) done.
Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
Suspending console(s) (use no_console_suspend to debug)
sd 0:0:0:0: [sda] Stopping disk
PM: suspend of devices complete after 836.004 msecs
PM: late suspend of devices complete after 5.305 msecs
PM: noirq suspend of devices complete after 4.625 msecs
PM: noirq resume of devices complete after 726.661 msecs
PM: early resume of devices complete after 4.004 msecs
sd 0:0:0:0: [sda] Starting disk
Partition Configuration Register was:400   <--------------------this
Reset Partition Config. Register: 1 Partition of 4 planes
cfi_cmdset_0001: Simultaneous Operations disabled
ata1.00: configured for PIO0
PM: resume of devices complete after 276.926 msecs
Restarting tasks ... done.
root@collie:~#

* HEX BIN NR PARTITIONS
* 400 = 100 2   3 planes + 1 plane (boot default)
*
* 000 = 000 1   1 partition of 4 planes, no Dual Work
* 200 = 010 2   2 partitions of 2 planes
* 700 = 111 4   4 partitions of 1 plane
