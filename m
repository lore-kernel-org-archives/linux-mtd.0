Date: Sun, 9 Feb 2014 00:37:58 +0100
From: Willy Tarreau <w@1wt.eu>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
Message-ID: <20140208233758.GH22376@1wt.eu>
References: <1391027881-8354-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1391027881-8354-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <CAFLxGvyPUTg+4SLAyN8UYGr8DmjdyjUmQOP++t_JVRM5Usd1yQ@mail.gmail.com>
 <20140208225149.GA22376@1wt.eu> <52F6B602.3030905@nod.at>
 <20140208230159.GC22376@1wt.eu> <52F6BA07.60707@nod.at>
 <20140208231501.GG22376@1wt.eu> <52F6BCCD.5070302@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52F6BCCD.5070302@nod.at>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
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

On Sun, Feb 09, 2014 at 12:25:01AM +0100, Richard Weinberger wrote:
> Am 09.02.2014 00:15, schrieb Willy Tarreau:
> > On Sun, Feb 09, 2014 at 12:13:11AM +0100, Richard Weinberger wrote:
> >> Am 09.02.2014 00:01, schrieb Willy Tarreau:
> >>> On Sat, Feb 08, 2014 at 11:56:02PM +0100, Richard Weinberger wrote:
> >>>> Am 08.02.2014 23:51, schrieb Willy Tarreau:
> >>>>> On Sat, Feb 08, 2014 at 10:37:19PM +0100, Richard Weinberger wrote:
> >>>>>>> +config MTD_UBI_BLOCK_WRITE_SUPPORT
> >>>>>>> +       bool "Enable write support (DANGEROUS)"
> >>>>>>> +       default n
> >>>>>>> +       depends on MTD_UBI_BLOCK
> >>>>>>> +       select MTD_UBI_BLOCK_CACHED
> >>>>>>> +       help
> >>>>>>> +          This is a *very* dangerous feature. Using a regular block-oriented
> >>>>>>> +          filesystem might impact heavily on a flash device wear.
> >>>>>>> +          Use with extreme caution.
> >>>>>>> +
> >>>>>>> +          If in doubt, say "N".
> >>>>>>
> >>>>>> I really vote for dropping write support at all.
> >>>>>
> >>>>> Why ? When you put a read-only filesystem there such as squashfs, the
> >>>>> only writes you'll have will be updates, and write support will be the
> >>>>> only way to update the filesystem. So removing write support seriously
> >>>>> impacts the usefulness of the feature itself.
> >>>>
> >>>> So almost everyone has to enable MTD_UBI_BLOCK_WRITE_SUPPORT?
> >>>> I thought there is another way to fill the volume with data...
> >>>
> >>> I personally don't see the use of disabling write support on anything
> >>> unless the code is broken. Better emit a warning upon first write to
> >>> mention that there is limited or no wear leveling. But preventing all
> >>> reasonable users from using a useful feature just to save a few ignorant
> >>> from shooting themselves in the foot is non-sense in my opinion.
> >>
> >> As Piergiorgio wrote, one can use ubiupdatevol to update his squashfs.
> >> There is simply no use case for MTD_UBI_BLOCK_WRITE_SUPPORT.
> > 
> > I gave an example with ext2 for the config. It's a bit excessive to
> > quickly declare "there is simply no use case for $put_your_option_here",
> > it just means that *you* don't have this use case, which I perfectly
> > respect.
> 
> The mail with your ext2 use case arrived afterward I've sent that mail.

No problem.

> So you are using ext2 as config filesystem because you're facing issues with ubifs?

No, I've been using ext2 on x86-based hardware and compact flash for
something like 10 years with a great success (easy to mount, easy to
fix, easy to save, easy to occasionally add a backup copy or an extra
data file, etc). I contemplated ubifs on NAND devices as an alternative
when starting to play with ARM-based devices, and lost the reliability
and ability to fix. Switching back to the proven ext2 completely solved
the issues in the end. Ubifs is nice when you need a real read/write FS,
but most small devices do not need wear leveling or any of such nice
features. When you just write 1-10 times a year, other solutions are
fine enough. Using mtdblock directly is not reliable because of bad
blocks which come from time to time. If your FS happens to be located
on one of them, you're screwed. UBI solves such issues and ubiblock
provides a nice interface for this. I even thought about putting the
kernel on top of UBI so that it better resists NAND issues, but some
versions of u-boot do not seem to update it correctly.

In fact, my feeling is that ubiblock provides the same flexibility
with MTD as you have on new devices with eMMC. You have no wear
levelling, and so what ? You never know if your eMMC does it well
either. I even had a series of compactflash which died after a small
number of writes in the past, so that has existed and will always.

Also, all these low-level features on top of MTD are used by people
who try to build systems and who are expected to understand a little
bit some of the limits of the solutions they use. It's not the basic
joe user who will install ext4 on top of ubiblock on his NAND by
himself.

This I think it's a bad idea to artificially remove some features
if they're not broken.

Regards,
Willy
