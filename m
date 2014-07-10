Received: from mail-ig0-x234.google.com ([2607:f8b0:4001:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X5Hpm-0005Oz-8Q
 for linux-mtd@lists.infradead.org; Thu, 10 Jul 2014 17:08:38 +0000
Received: by mail-ig0-f180.google.com with SMTP id l13so34913iga.1
 for <linux-mtd@lists.infradead.org>; Thu, 10 Jul 2014 10:08:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAAK6Zt3273ZtojeESH_sNPoP1G7d_JQJKbCbhWHqj08y1kT98g@mail.gmail.com>
References: <CAAK6Zt3273ZtojeESH_sNPoP1G7d_JQJKbCbhWHqj08y1kT98g@mail.gmail.com>
Date: Thu, 10 Jul 2014 10:08:16 -0700
Message-ID: <CAAK6Zt3xTHZBuD2aBpKWZ+BjwC3fw_1SuyVjW9CNOK9KQG7jPQ@mail.gmail.com>
Subject: Re: Synchronization of per-partition ecc_stats
From: Daniel Ehrenberg <dehrenberg@google.com>
To: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 jekhor@gmail.com, David.Woodhouse@intel.com
Content-Type: text/plain; charset=UTF-8
Cc: Gwendal Grignou <gwendal@chromium.org>, olofj@chromium.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian, Yahuen, David,

I am wondering about how MTD deals with synchronization of
per-partition statistics. The code in question was introduced by
d8877f191e35718ba11a4d46950131e74c40566c "[MTD] mtdpart: Make
ecc_stats more realistic." I previously sent this email to the MTD
list as a whole but I'm also curious for your feedback in particular.

Thanks,
Daniel Ehrenberg

On Tue, Jul 8, 2014 at 2:26 PM, Daniel Ehrenberg <dehrenberg@google.com> wrote:
> Hi MTD group,
>
> I'm working on a patch to add some more counters to MTD for monitoring
> write and erase errors. I was looking at the way ECC stats are
> recorded, in particular how each partition gets its ecc_stats.failures
> counter.
>
> Globally, for NAND, this counter is synchronized by
> nand_get_device/nand_release_device. For individual partitions, it
> looks like ecc_stats.failures is calculated by looking at how the
> global stat changes across an operation sent down to the lower layer.
> Here's the main place it happens:
>
> static int part_read(struct mtd_info *mtd, loff_t from, size_t len,
>                 size_t *retlen, u_char *buf)
> {
>         struct mtd_part *part = PART(mtd);
>         struct mtd_ecc_stats stats;
>         int res;
>
>         stats = part->master->ecc_stats;
>         res = part->master->_read(part->master, from + part->offset, len,
>                                   retlen, buf);
>         if (unlikely(mtd_is_eccerr(res)))
>                 mtd->ecc_stats.failed +=
>                         part->master->ecc_stats.failed - stats.failed;
>         else
>                 mtd->ecc_stats.corrected +=
>                         part->master->ecc_stats.corrected - stats.corrected;
>         return res;
> }
>
> I'm having trouble seeing how the MTD code prevents a race: it seems
> to me that if a read to either the same or different partition occurs
> and also changes master->ecc_stats, the stats could be double counted.
> Is there any synchronization mechanism that I'm missing?
>
> Thanks,
> Daniel Ehrenberg
