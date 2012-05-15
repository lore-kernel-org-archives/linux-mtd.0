Received: from [78.46.68.141] (helo=eristoteles.iwoars.net)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUGMm-00052b-2U
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 11:56:37 +0000
Date: Tue, 15 May 2012 13:56:34 +0200 (CEST)
From: Joel Reardon <joel@clambassador.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: determining if a block erasure failed
In-Reply-To: <1337082053.2528.182.camel@sauron.fi.intel.com>
Message-ID: <alpine.DEB.2.00.1205151349580.18866@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1205150944550.17750@eristoteles.iwoars.net>
 <1337082053.2528.182.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ah yes, if wl_wrk is freed in schedule_erase, theres no way to pass it
back that way.

The reason is that, if erasing a block of keys fails, then those keys may
remain on the flash device for eternity. While a rare occurance, it may be
nice to have ubifs perform GC on all main LEBs storing the data nodes that
can no longer be deleted through key erasure / reencrypt the valid data
nodes.

Cheers,
Joel Reardon
On Tue, 15 May 2012, Artem Bityutskiy wrote:

> On Tue, 2012-05-15 at 09:53 +0200, Joel Reardon wrote:
> > I want the caller of erase_worker() to be aware if the erase block became
> > bad. Here is the relevant code at the end of erase_worker():
> >
> > /* at this time, the erase has failed. err == -EIO */
> >         ubi_msg("mark PEB %d as bad", pnum);
> >         err = ubi_io_mark_bad(ubi, pnum);
> >         if (err)
> >                 goto out_ro;
> >
> > /* does other stuff, not touching err */
> >
> > /* err == 0 here, because of above goto */
> >         return err;
> >
> > out_ro:
> >         ubi_ro_mode(ubi);
> >         return err;
> >
> >
> > So, if this function should return zero when the erase block fails, then I
> > will add a "result" field to ubi_work that will store the result of the
> > work function. But I figured I'd check first if the return err that always
> > returns 0 is not an oversight and this function should return -EIO if it
> > fails.
>
> Why do you need the results?
>
> --
> Best Regards,
> Artem Bityutskiy
>
