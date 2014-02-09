Date: Sun, 9 Feb 2014 08:51:57 +0100
From: Willy Tarreau <w@1wt.eu>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
Message-ID: <20140209075157.GJ22376@1wt.eu>
References: <1391027881-8354-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <CAFLxGvyPUTg+4SLAyN8UYGr8DmjdyjUmQOP++t_JVRM5Usd1yQ@mail.gmail.com>
 <20140208225149.GA22376@1wt.eu> <52F6B602.3030905@nod.at>
 <20140208230159.GC22376@1wt.eu> <52F6BA07.60707@nod.at>
 <20140208231501.GG22376@1wt.eu> <52F6BCCD.5070302@nod.at>
 <20140208233758.GH22376@1wt.eu> <52F6C916.2030506@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52F6C916.2030506@nod.at>
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

On Sun, Feb 09, 2014 at 01:17:26AM +0100, Richard Weinberger wrote:
> > Also, all these low-level features on top of MTD are used by people
> > who try to build systems and who are expected to understand a little
> > bit some of the limits of the solutions they use. It's not the basic
> > joe user who will install ext4 on top of ubiblock on his NAND by
> > himself.
> 
> My experience has shown the opposite. ;-)

When these happen, it's most likely because they copy-paste a howto
from a blog, so anyway they'll blindly follow whatever appears on the
blog including patching their kernel or forcing whatever option :-)

> > This I think it's a bad idea to artificially remove some features
> > if they're not broken.
> 
> Your arguments have convinced me, let's keep it and hope the best.

OK thanks!
Willy
