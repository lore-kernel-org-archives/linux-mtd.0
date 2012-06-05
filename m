Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sc0Fe-0002yM-MK
 for linux-mtd@lists.infradead.org; Tue, 05 Jun 2012 20:21:15 +0000
Received: by werc12 with SMTP id c12so4671514wer.36
 for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2012 13:21:12 -0700 (PDT)
Date: Tue, 5 Jun 2012 23:20:49 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: ubi: fastmap: v7: ubi_update_fastmap failure
Message-ID: <20120605232049.1e4f5184@halley>
In-Reply-To: <4FCE0E81.9000705@nod.at>
References: <20120605164142.02d9e235@pixies.home.jungo.com>
 <4FCE0E81.9000705@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de,
 linux-mtd@lists.infradead.org, tim.bird@am.sony.com, adrian.hunter@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, 05 Jun 2012 15:49:53 +0200 Richard Weinberger <richard@nod.at> wrote:
> Am 05.06.2012 15:41, schrieb Shmulik Ladkani:
> > Hi Richard,
> > 
> > I got the below UBI error when working with fastmap v7 (linux-ubi.git,
> > branch fastmap, HEAD at bd8313d).
> > 
> > Had no time to investigate (could be fixed by your v7+ patches); please
> > take a look if you can.
> > 
> > Setup:
> > - Beagle with SLC NAND.
> > - ubi.mtd=4 root=ubi0:beagleboard-rootfs rootfstype=ubifs
> > - A single volume on the ubi0 device (the ubifs rootfs).
> > 
> > The board booted several times succesfully with fastmap-v7.
> > Then I got the error below, when ubifs was mounted (note UBI attach was
> > successful).
> > 
> > Switched to non-fastmap kernel, board booted successfully (with ubifs
> > mounted succesfully).
> > 
> > Regards,
> > Shmulik
> > 
> > [    3.222808] UBIFS: recovery needed
> > [    3.281646] UBI error: __ubi_wl_get_peb: no free eraseblocks
> > [    3.287750] UBI error: ubi_wl_get_fm_peb: no free eraseblocks
> > [    3.294952] UBI error: ubi_update_fastmap: Erase counter overflow!
> 
> Please use v7+.
> It looks like you need:
> [PATCH 01/23] UBI: Fastmap: Fix EC overflow calculation

Thanks, will retest.

BTW, a UBIFS question.
Any idea why UBIFS failed to mount eventually?

As you can see, both UBI and UBIFS switched themselves to RO mode. Okay.
However eventually, the mount failed.

Regards,
Shmulik
