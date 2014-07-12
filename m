Received: from mail-vc0-x22f.google.com ([2607:f8b0:400c:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X5lR7-00033T-LH
 for linux-mtd@lists.infradead.org; Sat, 12 Jul 2014 00:45:10 +0000
Received: by mail-vc0-f175.google.com with SMTP id hy4so3478072vcb.20
 for <linux-mtd@lists.infradead.org>; Fri, 11 Jul 2014 17:44:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140712004329.GK7537@ld-irv-0074>
References: <CAAK6Zt3273ZtojeESH_sNPoP1G7d_JQJKbCbhWHqj08y1kT98g@mail.gmail.com>
 <CAAK6Zt3xTHZBuD2aBpKWZ+BjwC3fw_1SuyVjW9CNOK9KQG7jPQ@mail.gmail.com>
 <20140712004329.GK7537@ld-irv-0074>
Date: Fri, 11 Jul 2014 17:44:47 -0700
Message-ID: <CAN8TOE_QW1vs0+tiaDyEeejq20T7BjZDctg2z+DBziMTNe9Xtw@mail.gmail.com>
Subject: Re: Synchronization of per-partition ecc_stats
From: Brian Norris <computersforpeace@gmail.com>
To: Daniel Ehrenberg <dehrenberg@google.com>
Content-Type: text/plain; charset=UTF-8
Cc: Gwendal Grignou <gwendal@chromium.org>,
 David Woodhouse <David.Woodhouse@intel.com>, jekhor@gmail.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, olofj@chromium.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Ezequiel for real!

On Fri, Jul 11, 2014 at 5:43 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> + Ezequiel, who's been looking at ecc_stats
>
> Hi Daniel,
>
> On Thu, Jul 10, 2014 at 10:08:16AM -0700, Daniel Ehrenberg wrote:
>> On Tue, Jul 8, 2014 at 2:26 PM, Daniel Ehrenberg <dehrenberg@google.com> wrote:
>> > I'm working on a patch to add some more counters to MTD for monitoring
>> > write and erase errors. I was looking at the way ECC stats are
>> > recorded, in particular how each partition gets its ecc_stats.failures
>> > counter.
>> >
>> > Globally, for NAND, this counter is synchronized by
>> > nand_get_device/nand_release_device. For individual partitions, it
>> > looks like ecc_stats.failures is calculated by looking at how the
>> > global stat changes across an operation sent down to the lower layer.
>> > Here's the main place it happens:
>> >
>> > static int part_read(struct mtd_info *mtd, loff_t from, size_t len,
>> >                 size_t *retlen, u_char *buf)
>> > {
>> >         struct mtd_part *part = PART(mtd);
>> >         struct mtd_ecc_stats stats;
>> >         int res;
>> >
>> >         stats = part->master->ecc_stats;
>> >         res = part->master->_read(part->master, from + part->offset, len,
>> >                                   retlen, buf);
>> >         if (unlikely(mtd_is_eccerr(res)))
>> >                 mtd->ecc_stats.failed +=
>> >                         part->master->ecc_stats.failed - stats.failed;
>> >         else
>> >                 mtd->ecc_stats.corrected +=
>> >                         part->master->ecc_stats.corrected - stats.corrected;
>> >         return res;
>> > }
>> >
>> > I'm having trouble seeing how the MTD code prevents a race: it seems
>> > to me that if a read to either the same or different partition occurs
>> > and also changes master->ecc_stats, the stats could be double counted.
>> > Is there any synchronization mechanism that I'm missing?
>
> Your analysis looks correct to me. The ecc_stats locking looks pretty
> sloppy (practically non-existent).
>
> I think there is also potential for mild races with ioctl(ECCGETSTATS).
> Since it is read-only, this simply means that we could have atomicity
> issues (for instance, if we have a machine with non-atomic 32-bit memory
> accesses). And now we'll have one more, with Ezequiel's patches to
> expose ecc_stats in sysfs.
>
> FWIW, I noticed a related issue when dealing entirely with user-space
> mtdchar access:
>
>   http://lists.infradead.org/pipermail/linux-mtd/2014-February/052062.html
>
> On a related note, I think 'master' vs. 'partition' ecc_stats are broken
> in a few cases, where low-level "mark block bad" functions might be
> called, updating master->ecc_stats.badblocks, but not
> partition->ecc_stats.badblocks.
>
> Patches are welcome!
>
> Regards,
> Brian
