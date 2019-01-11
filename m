Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghwPN-0008Ov-Ii
 for linux-mtd@lists.infradead.org; Fri, 11 Jan 2019 12:59:35 +0000
From: Richard Weinberger <richard@nod.at>
To: Shibin George <george.shibin1993@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: gluebi vs. ubi-volume mapping
Date: Fri, 11 Jan 2019 13:59:31 +0100
Message-ID: <6975898.auTVdOOYFa@blindfold>
In-Reply-To: <CAGu8XfShQkmshMMgP24ee_Csf6rcdEoG4p2o1kLhAW8JL+CX-w@mail.gmail.com>
References: <CAGu8XfRpjW9hv918BOoh6jEA1rZ9v-Dngra7cjMi3KegyXOvSQ@mail.gmail.com>
 <1835331.mx3o4XuZP5@blindfold>
 <CAGu8XfShQkmshMMgP24ee_Csf6rcdEoG4p2o1kLhAW8JL+CX-w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Freitag, 11. Januar 2019, 13:54:22 CET schrieb Shibin George:
> On Fri, Jan 11, 2019 at 6:14 PM Richard Weinberger <richard@nod.at> wrote:
> >
> > > ubiblock, being read-only, didn't satisfy my requirement.
> > > The device I am working on needs to have block-level software upgrade
> > > capability.
> > > So gluebi was the best solution that I could find that can run block-based
> > > filesystem.
> >
> > Usually you don't want such a deep stacking on an embedded system.
> > But you are aware of ubiupdatevol?
> 
> Yes, ubiupdatevol was one of the candidates. However, I needed the capability
> to upgrade software incrementally instead of packing the entire ubifs image
> (This is because I can't afford to reserve storage for large software-upgrade
> packages).
> I had posted this query about ubiupdatevol @
> https://stackoverflow.com/questions/50699945/apply-incremental-patches-on-ubifs-volume
> and finally had to discard ubifs for my purpose for the same reason.
> That and the fact the current software-upgrade solution that I have works well
> with block-based filesystems.

I have no idea what this has to do with squashfs.

Instead of updating the squashfs via mtdblock->glubi->ubivolume->ubi,
just use ubiupdatevol to update the ubivolume.

Thanks,
//richard
