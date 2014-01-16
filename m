Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W3ht8-00079x-3C
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2014 08:01:19 +0000
Message-ID: <1389859251.26808.76.camel@sauron.fi.intel.com>
Subject: Re: UBIFS data integrity
From: Artem Bityutskiy <dedekind1@gmail.com>
To: rcrb rcrb <rcrbsw@gmail.com>
Date: Thu, 16 Jan 2014 10:00:51 +0200
In-Reply-To: <CAEwL26y2Sdz4Lu=0ru3J-GF5pa-AXcWeuFNHDmWZ9PyKx7if-A@mail.gmail.com>
References: <CAEwL26xsAe+x0NS5XQmp3wL_tyG_0fbXC6PfaPCtjFFFB+pOCA@mail.gmail.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FDD43AD@post.tritech.se>
 <CAEwL26y2Sdz4Lu=0ru3J-GF5pa-AXcWeuFNHDmWZ9PyKx7if-A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-01-15 at 19:31 +0100, rcrb rcrb wrote:
> On Tue, Jan 14, 2014 at 10:32 AM, Mats Kärrman <Mats.Karrman@tritech.se> wrote:
> > Hi,
> >
> > On Tuesday, January 14, 2014 3:51 AM, rcrb rcrb [rcrbsw@gmail.com] wrote:
> >> I am considering using a database over UBIFS on my embedded device.
> >> The database file is approximately 1 MiB. I wonder if I can rely on
> >> the filesystem to be sure than this file will never have a corruption,
> >> even in case of power cut during update. Will the filesystem guarantee
> >> that, after reboot, the file will be either in the pre-update state or
> >> be correctly updated ?
> >
> > First of all, UBIFS relies on the underlying MTD driver also
> > doing its job so you should also make sure this works on your
> > board.
> > If your MTD driver works, UBIFS is supposed to guarantee
> > that every write operation is atomic, i.e. it is either fully written or
> > discarded.
> > If your database is guaranteed  correct after a power-cut then
> > depends on if it is consistent after every write or if it requires
> > several write operations to produce a new consistent state.
> > In general this requires that your database also is implemented
> > in a fault tolerant way.
> >
> > BR // Mats
> 
> Thank you for you answer Mats. I checked the write system calls with
> the database I plan to use, it appears that the transactions are
> validated with only one write. So I think it will be OK.

UBIFS writes in 4KiB units. So any aligned 4KiB piece of your file is
guaranteed to either be fully written, then the read will return new
data, or not be written at all, then the read will return old data.

-- 
Best Regards,
Artem Bityutskiy
