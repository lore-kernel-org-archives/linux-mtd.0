Date: Sun, 9 Feb 2014 00:01:59 +0100
From: Willy Tarreau <w@1wt.eu>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
Message-ID: <20140208230159.GC22376@1wt.eu>
References: <1391027881-8354-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1391027881-8354-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <CAFLxGvyPUTg+4SLAyN8UYGr8DmjdyjUmQOP++t_JVRM5Usd1yQ@mail.gmail.com>
 <20140208225149.GA22376@1wt.eu> <52F6B602.3030905@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52F6B602.3030905@nod.at>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Tim Bird <tim.bird@am.sony.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Feb 08, 2014 at 11:56:02PM +0100, Richard Weinberger wrote:
> Am 08.02.2014 23:51, schrieb Willy Tarreau:
> > On Sat, Feb 08, 2014 at 10:37:19PM +0100, Richard Weinberger wrote:
> >>> +config MTD_UBI_BLOCK_WRITE_SUPPORT
> >>> +       bool "Enable write support (DANGEROUS)"
> >>> +       default n
> >>> +       depends on MTD_UBI_BLOCK
> >>> +       select MTD_UBI_BLOCK_CACHED
> >>> +       help
> >>> +          This is a *very* dangerous feature. Using a regular block-oriented
> >>> +          filesystem might impact heavily on a flash device wear.
> >>> +          Use with extreme caution.
> >>> +
> >>> +          If in doubt, say "N".
> >>
> >> I really vote for dropping write support at all.
> > 
> > Why ? When you put a read-only filesystem there such as squashfs, the
> > only writes you'll have will be updates, and write support will be the
> > only way to update the filesystem. So removing write support seriously
> > impacts the usefulness of the feature itself.
> 
> So almost everyone has to enable MTD_UBI_BLOCK_WRITE_SUPPORT?
> I thought there is another way to fill the volume with data...

I personally don't see the use of disabling write support on anything
unless the code is broken. Better emit a warning upon first write to
mention that there is limited or no wear leveling. But preventing all
reasonable users from using a useful feature just to save a few ignorant
from shooting themselves in the foot is non-sense in my opinion.

Why not disable write support to ubifs as well then, so that we're
sure that the most demanding ones will never wear their NANDs ? And
why not disable mtdblock so that nobody can mount them as ext2 ? If
people can already do bad things more easily without this code,
there is no reason to remove the feature.

Regards,
Willy
