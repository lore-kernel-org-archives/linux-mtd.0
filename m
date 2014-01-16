Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W3i7w-0007XK-C1
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2014 08:16:37 +0000
Message-ID: <1389860167.26808.84.camel@sauron.fi.intel.com>
Subject: Re: UBIFS data integrity
From: Artem Bityutskiy <dedekind1@gmail.com>
To: rcrb rcrb <rcrbsw@gmail.com>
Date: Thu, 16 Jan 2014 10:16:07 +0200
In-Reply-To: <1389859251.26808.76.camel@sauron.fi.intel.com>
References: <CAEwL26xsAe+x0NS5XQmp3wL_tyG_0fbXC6PfaPCtjFFFB+pOCA@mail.gmail.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FDD43AD@post.tritech.se>
 <CAEwL26y2Sdz4Lu=0ru3J-GF5pa-AXcWeuFNHDmWZ9PyKx7if-A@mail.gmail.com>
 <1389859251.26808.76.camel@sauron.fi.intel.com>
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

On Thu, 2014-01-16 at 10:00 +0200, Artem Bityutskiy wrote:
> On Wed, 2014-01-15 at 19:31 +0100, rcrb rcrb wrote:
> > On Tue, Jan 14, 2014 at 10:32 AM, Mats Kärrman <Mats.Karrman@tritech.se> wrote:
> > > Hi,
> > >
> > > On Tuesday, January 14, 2014 3:51 AM, rcrb rcrb [rcrbsw@gmail.com] wrote:
> > >> I am considering using a database over UBIFS on my embedded device.
> > >> The database file is approximately 1 MiB. I wonder if I can rely on
> > >> the filesystem to be sure than this file will never have a corruption,
> > >> even in case of power cut during update. Will the filesystem guarantee
> > >> that, after reboot, the file will be either in the pre-update state or
> > >> be correctly updated ?
> > >
> > > First of all, UBIFS relies on the underlying MTD driver also
> > > doing its job so you should also make sure this works on your
> > > board.
> > > If your MTD driver works, UBIFS is supposed to guarantee
> > > that every write operation is atomic, i.e. it is either fully written or
> > > discarded.
> > > If your database is guaranteed  correct after a power-cut then
> > > depends on if it is consistent after every write or if it requires
> > > several write operations to produce a new consistent state.
> > > In general this requires that your database also is implemented
> > > in a fault tolerant way.
> > >
> > > BR // Mats
> > 
> > Thank you for you answer Mats. I checked the write system calls with
> > the database I plan to use, it appears that the transactions are
> > validated with only one write. So I think it will be OK.
> 
> UBIFS writes in 4KiB units.

I guess this is a bit confusing. The low-level flash write operations
can be bigger or smaller. However, the file data "buffers" that UBIFS
writes contain 4KiB of file data (aligned, e.g., regions of the file
would be 0-4K, 4K-8K, etc). Every such "buffer" is protected with CRC32,
and if a power cut results in the buffer not being fully written, the
CRC32 mismatches and UBIFS discards the entire buffer. And the old
contents of this file region is stays on the flash. The old contents
does not go away before the new contents reaches the flash media. So the
read operation for any aligned 4KiB region always returns the old
contents, or the new contents, nothing else.

>  So any aligned 4KiB piece of your file is
> guaranteed to either be fully written, then the read will return new
> data, or not be written at all, then the read will return old data.

-- 
Best Regards,
Artem Bityutskiy
