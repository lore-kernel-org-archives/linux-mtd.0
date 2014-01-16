Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W3jDq-0000N8-PJ
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2014 09:26:47 +0000
Message-ID: <1389864382.26808.97.camel@sauron.fi.intel.com>
Subject: Re: UBIFS data integrity
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mats =?ISO-8859-1?Q?K=E4rrman?= <Mats.Karrman@tritech.se>
Date: Thu, 16 Jan 2014 11:26:22 +0200
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4FDD5418@post.tritech.se>
References: <CAEwL26xsAe+x0NS5XQmp3wL_tyG_0fbXC6PfaPCtjFFFB+pOCA@mail.gmail.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FDD43AD@post.tritech.se>
 <CAEwL26y2Sdz4Lu=0ru3J-GF5pa-AXcWeuFNHDmWZ9PyKx7if-A@mail.gmail.com>
 <1389859251.26808.76.camel@sauron.fi.intel.com>
 ,<1389860167.26808.84.camel@sauron.fi.intel.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FDD5418@post.tritech.se>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 rcrb rcrb <rcrbsw@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-01-16 at 09:12 +0000, Mats Kärrman wrote:
> On Thursday, January 16, 2014 9:16 AM, Artem Bityutskiy wrote:
> > > UBIFS writes in 4KiB units.
> > 
> > I guess this is a bit confusing. The low-level flash write operations
> > can be bigger or smaller. However, the file data "buffers" that UBIFS
> > writes contain 4KiB of file data (aligned, e.g., regions of the file
> > would be 0-4K, 4K-8K, etc). Every such "buffer" is protected with CRC32,
> > and if a power cut results in the buffer not being fully written, the
> > CRC32 mismatches and UBIFS discards the entire buffer. And the old
> > contents of this file region is stays on the flash. The old contents
> > does not go away before the new contents reaches the flash media. So the
> > read operation for any aligned 4KiB region always returns the old
> > contents, or the new contents, nothing else.
> > 
> > >  So any aligned 4KiB piece of your file is
> > > guaranteed to either be fully written, then the read will return new
> > > data, or not be written at all, then the read will return old data.
> 
> Sorry if I mislead you, I guess the final statement of my original mail is
> still valid then:
> "In general this requires that your database also is implemented
> in a fault tolerant way."
> I.e. it must itself make sure it's entire write is completed before
> switching to a new "state". Unless the DB implements some kind of
> journaling this may be a problem.

Sure. The ordering or the 4K writes is not guaranteed, but I think the
memory management subsystem uses LRU lists so older writes go first. Any
write that crosses the 4096 byte-aligned boundary is not atomic. So the
only thing UBIFS guarantees is something like:

fsync
write(4k-5k)
fsync

will guarantee that the 1K piece of data either gets fully written or
not at all.

-- 
Best Regards,
Artem Bityutskiy
