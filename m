Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCgvY-0006Bc-27
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2014 02:48:58 +0000
Date: Sun, 9 Feb 2014 23:48:28 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Willy Tarreau <w@1wt.eu>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
Message-ID: <20140210024827.GB9643@localhost>
References: <CAFLxGvyPUTg+4SLAyN8UYGr8DmjdyjUmQOP++t_JVRM5Usd1yQ@mail.gmail.com>
 <20140208225149.GA22376@1wt.eu> <52F6B602.3030905@nod.at>
 <20140208230159.GC22376@1wt.eu> <52F6BA07.60707@nod.at>
 <20140208231501.GG22376@1wt.eu> <52F6BCCD.5070302@nod.at>
 <20140208233758.GH22376@1wt.eu> <52F6C916.2030506@nod.at>
 <20140209075157.GJ22376@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140209075157.GJ22376@1wt.eu>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
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

On Sun, Feb 09, 2014 at 08:51:57AM +0100, Willy Tarreau wrote:
[..]
> 
> > > This I think it's a bad idea to artificially remove some features
> > > if they're not broken.
> > 
> > Your arguments have convinced me, let's keep it and hope the best.
> 

Let me add that keeping the write support follows the whole "mechanism,
not policy" kernel motto, doesn't it?

Regarding users, well the option looks like this:

  [ ]     Enable write support (DANGEROUS)

I think any user would think twice before enabling it.

Regaring the maintainability: the implementation is *really* simple,
and won't add much complexity.

Let's not prevent someone from divising a wear level aware block filesystem
and using it on top of ubiblock. And perhaps f2fs already does a good job!
Keeping this support would allow someone to take the lead and get some real
numbers on that.

As I said, the implementation is so simple that it seems a pity to just
drop it.

BTW, v5 (this is v4 which I forgot to add to the subject) is already on the
oven, with the fixes pointed out by Richard.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
