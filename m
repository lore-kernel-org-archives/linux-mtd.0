Date: Sat, 8 Feb 2014 23:51:49 +0100
From: Willy Tarreau <w@1wt.eu>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
Message-ID: <20140208225149.GA22376@1wt.eu>
References: <1391027881-8354-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1391027881-8354-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <CAFLxGvyPUTg+4SLAyN8UYGr8DmjdyjUmQOP++t_JVRM5Usd1yQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLxGvyPUTg+4SLAyN8UYGr8DmjdyjUmQOP++t_JVRM5Usd1yQ@mail.gmail.com>
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

On Sat, Feb 08, 2014 at 10:37:19PM +0100, Richard Weinberger wrote:
> > +config MTD_UBI_BLOCK_WRITE_SUPPORT
> > +       bool "Enable write support (DANGEROUS)"
> > +       default n
> > +       depends on MTD_UBI_BLOCK
> > +       select MTD_UBI_BLOCK_CACHED
> > +       help
> > +          This is a *very* dangerous feature. Using a regular block-oriented
> > +          filesystem might impact heavily on a flash device wear.
> > +          Use with extreme caution.
> > +
> > +          If in doubt, say "N".
> 
> I really vote for dropping write support at all.

Why ? When you put a read-only filesystem there such as squashfs, the
only writes you'll have will be updates, and write support will be the
only way to update the filesystem. So removing write support seriously
impacts the usefulness of the feature itself.

Willy
