Received: from mail-ee0-x22f.google.com ([2a00:1450:4013:c00::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCH38-0003An-Qj
 for linux-mtd@lists.infradead.org; Sat, 08 Feb 2014 23:11:11 +0000
Received: by mail-ee0-f47.google.com with SMTP id d49so2194851eek.20
 for <linux-mtd@lists.infradead.org>; Sat, 08 Feb 2014 15:10:40 -0800 (PST)
From: "Piergiorgio Beruto" <piergiorgio.beruto@gmail.com>
To: "'Willy Tarreau'" <w@1wt.eu>,
	"'Richard Weinberger'" <richard@nod.at>
References: <1391027881-8354-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1391027881-8354-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <CAFLxGvyPUTg+4SLAyN8UYGr8DmjdyjUmQOP++t_JVRM5Usd1yQ@mail.gmail.com>
 <20140208225149.GA22376@1wt.eu> <52F6B602.3030905@nod.at>
 <20140208230159.GC22376@1wt.eu>
In-Reply-To: <20140208230159.GC22376@1wt.eu>
Subject: RE: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
Date: Sun, 9 Feb 2014 00:10:36 +0100
Message-ID: <000201cf2522$fafbb770$f0f32650$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Cc: 'Thomas Petazzoni' <thomas.petazzoni@free-electrons.com>,
 'Mike Frysinger' <vapier@gentoo.org>, 'Artem Bityutskiy' <dedekind1@gmail.com>,
 'Michael Opdenacker' <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org, 'Tim Bird' <tim.bird@am.sony.com>,
 'Ezequiel Garcia' <ezequiel.garcia@free-electrons.com>,
 'Brian Norris' <computersforpeace@gmail.com>,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
just to better explain my previous mail, I actually agree with you that it's
generally a bad idea to cut off a feature just because you don't see good
use for yourself or because it's dangerous.
The real reason to remove the RW feature, in my opinion, might be for
reducing the amount of code you have to maintain over time.

Usually I try to understand the benefits vs effort when deciding about such
things.
In this case It seems to me that the effort is not that much but I fail to
see any real use of the RW feature for myself.

I suggest to listen to other people that used ubblk before making any
decision.

Regards,
Piergiorgio

-----Original Message-----
From: Willy Tarreau [mailto:w@1wt.eu] 
Sent: Sunday, February 9, 2014 12:02 AM
To: Richard Weinberger
Cc: Ezequiel Garcia; linux-mtd@lists.infradead.org; Thomas Petazzoni; Mike
Frysinger; Artem Bityutskiy; Michael Opdenacker; Tim Bird; Piergiorgio
Beruto; Brian Norris; David Woodhouse
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes

On Sat, Feb 08, 2014 at 11:56:02PM +0100, Richard Weinberger wrote:
> Am 08.02.2014 23:51, schrieb Willy Tarreau:
> > On Sat, Feb 08, 2014 at 10:37:19PM +0100, Richard Weinberger wrote:
> >>> +config MTD_UBI_BLOCK_WRITE_SUPPORT
> >>> +       bool "Enable write support (DANGEROUS)"
> >>> +       default n
> >>> +       depends on MTD_UBI_BLOCK
> >>> +       select MTD_UBI_BLOCK_CACHED
> >>> +       help
> >>> +          This is a *very* dangerous feature. Using a regular
block-oriented
> >>> +          filesystem might impact heavily on a flash device wear.
> >>> +          Use with extreme caution.
> >>> +
> >>> +          If in doubt, say "N".
> >>
> >> I really vote for dropping write support at all.
> > 
> > Why ? When you put a read-only filesystem there such as squashfs, 
> > the only writes you'll have will be updates, and write support will 
> > be the only way to update the filesystem. So removing write support 
> > seriously impacts the usefulness of the feature itself.
> 
> So almost everyone has to enable MTD_UBI_BLOCK_WRITE_SUPPORT?
> I thought there is another way to fill the volume with data...

I personally don't see the use of disabling write support on anything unless
the code is broken. Better emit a warning upon first write to mention that
there is limited or no wear leveling. But preventing all reasonable users
from using a useful feature just to save a few ignorant from shooting
themselves in the foot is non-sense in my opinion.

Why not disable write support to ubifs as well then, so that we're sure that
the most demanding ones will never wear their NANDs ? And why not disable
mtdblock so that nobody can mount them as ext2 ? If people can already do
bad things more easily without this code, there is no reason to remove the
feature.

Regards,
Willy
