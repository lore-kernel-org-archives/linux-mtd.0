Received: from mail-ig0-x22a.google.com ([2607:f8b0:4001:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X6jYw-0000vg-O8
 for linux-mtd@lists.infradead.org; Mon, 14 Jul 2014 16:57:15 +0000
Received: by mail-ig0-f170.google.com with SMTP id h3so1897853igd.5
 for <linux-mtd@lists.infradead.org>; Mon, 14 Jul 2014 09:56:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE_QW1vs0+tiaDyEeejq20T7BjZDctg2z+DBziMTNe9Xtw@mail.gmail.com>
References: <CAAK6Zt3273ZtojeESH_sNPoP1G7d_JQJKbCbhWHqj08y1kT98g@mail.gmail.com>
 <CAAK6Zt3xTHZBuD2aBpKWZ+BjwC3fw_1SuyVjW9CNOK9KQG7jPQ@mail.gmail.com>
 <20140712004329.GK7537@ld-irv-0074>
 <CAN8TOE_QW1vs0+tiaDyEeejq20T7BjZDctg2z+DBziMTNe9Xtw@mail.gmail.com>
Date: Mon, 14 Jul 2014 09:56:52 -0700
Message-ID: <CAAK6Zt3pEvRb0CvzMsVwTNiMsv0WJtPC=xiPKtjuoLQ7RTkQWg@mail.gmail.com>
Subject: Re: Synchronization of per-partition ecc_stats
From: Daniel Ehrenberg <dehrenberg@google.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Slava Pestov <sviatoslavpestov@gmail.com>,
 Gwendal Grignou <gwendal@chromium.org>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Yauhen Kharuzhy <jekhor@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, olofj@chromium.org,
 kent.overstreet@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Slava Pestov, Kent Overstreet

Hi Brian,

On Fri, Jul 11, 2014 at 5:44 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> + Ezequiel for real!
>
> On Fri, Jul 11, 2014 at 5:43 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
>> + Ezequiel, who's been looking at ecc_stats
>>
>> Hi Daniel,
>>
>> On Thu, Jul 10, 2014 at 10:08:16AM -0700, Daniel Ehrenberg wrote:
>>> On Tue, Jul 8, 2014 at 2:26 PM, Daniel Ehrenberg <dehrenberg@google.com> wrote:
>>> > I'm working on a patch to add some more counters to MTD for monitoring
>>> > write and erase errors. I was looking at the way ECC stats are
>>> > recorded, in particular how each partition gets its ecc_stats.failures
>>> > counter.
>>> >
>>> > Globally, for NAND, this counter is synchronized by
>>> > nand_get_device/nand_release_device. For individual partitions, it
>>> > looks like ecc_stats.failures is calculated by looking at how the
>>> > global stat changes across an operation sent down to the lower layer.
>>> > Here's the main place it happens:
>>> >
>>> > static int part_read(struct mtd_info *mtd, loff_t from, size_t len,
>>> >                 size_t *retlen, u_char *buf)
>>> > {
>>> >         struct mtd_part *part = PART(mtd);
>>> >         struct mtd_ecc_stats stats;
>>> >         int res;
>>> >
>>> >         stats = part->master->ecc_stats;
>>> >         res = part->master->_read(part->master, from + part->offset, len,
>>> >                                   retlen, buf);
>>> >         if (unlikely(mtd_is_eccerr(res)))
>>> >                 mtd->ecc_stats.failed +=
>>> >                         part->master->ecc_stats.failed - stats.failed;
>>> >         else
>>> >                 mtd->ecc_stats.corrected +=
>>> >                         part->master->ecc_stats.corrected - stats.corrected;
>>> >         return res;
>>> > }
>>> >
>>> > I'm having trouble seeing how the MTD code prevents a race: it seems
>>> > to me that if a read to either the same or different partition occurs
>>> > and also changes master->ecc_stats, the stats could be double counted.
>>> > Is there any synchronization mechanism that I'm missing?
>>
>> Your analysis looks correct to me. The ecc_stats locking looks pretty
>> sloppy (practically non-existent).
>>
>> I think there is also potential for mild races with ioctl(ECCGETSTATS).
>> Since it is read-only, this simply means that we could have atomicity
>> issues (for instance, if we have a machine with non-atomic 32-bit memory
>> accesses). And now we'll have one more, with Ezequiel's patches to
>> expose ecc_stats in sysfs.
>>
>> FWIW, I noticed a related issue when dealing entirely with user-space
>> mtdchar access:
>>
>>   http://lists.infradead.org/pipermail/linux-mtd/2014-February/052062.html


That's too bad; I was hoping there was something that I was missing.

I see a couple possible fixes:
- If we're just fixing the in-kernel race, then we could move the
locking that's in the NAND layer up to the mtdcore level. I'm not sure
if this would break assumptions or add extra overhead for non-NAND
backends though. This doesn't address the mtdchar issue.
- For the kernel/userspace interface issue, it seems like the ideal
solution would be to return the error counts up with the operation
completion. One way to do this would be a new struct-based interface
which has fields for each of these types of error counts. I don't see
any existing ioctls which would address this. The new interface could
also be used internally within the kernel so that mtdpart would get
the error counts related to that operation, rather than having to
reference global counts. Maybe it could even be used within
nand_base.c so that global stats don't have to be referenced there
when determining what return value to give (within nand_base.c the
logic looks correct to me, OTOH). My dream would be that this new
interface could even be asynchronous, like bios (possibly using the
asynchronous ioctl support that the bcache guys, who I added to this
thread, are cooking up), and nand_base could be changed to allow MTD
to access multiple chips in parallel (or is there already support for
this?). What do you think of this idea, Brian?

Either of these would be a big change, so I think I'll just mail out
my original patch, race and all, and this proper fix may have to come
later.

>>
>> On a related note, I think 'master' vs. 'partition' ecc_stats are broken
>> in a few cases, where low-level "mark block bad" functions might be
>> called, updating master->ecc_stats.badblocks, but not
>> partition->ecc_stats.badblocks.
>>
>> Patches are welcome!
>>
>> Regards,
>> Brian

Oh, I did notice some differences between looking at ECCGETSTATS vs
going through all the blocks and asking whether they were bad, but I
assumed this had to do with that reserved block issue that Ezequiel
mentioned recently. I'll try to read the code to figure out what you
mean.

I'm curious, is there any way to access the 'master' stats through
sysfs or ioctls, or can you only access partition stats when MTD is
loaded with partitions?

Thanks,
Dan
