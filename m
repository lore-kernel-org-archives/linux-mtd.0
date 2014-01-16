Received: from tritech.se ([46.59.120.190])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W3j0h-000050-08
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2014 09:13:11 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: rcrb rcrb <rcrbsw@gmail.com>
Subject: RE: UBIFS data integrity
Date: Thu, 16 Jan 2014 09:12:33 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FDD5418@post.tritech.se>
References: <CAEwL26xsAe+x0NS5XQmp3wL_tyG_0fbXC6PfaPCtjFFFB+pOCA@mail.gmail.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FDD43AD@post.tritech.se>
 <CAEwL26y2Sdz4Lu=0ru3J-GF5pa-AXcWeuFNHDmWZ9PyKx7if-A@mail.gmail.com>
 <1389859251.26808.76.camel@sauron.fi.intel.com>,
 <1389860167.26808.84.camel@sauron.fi.intel.com>
In-Reply-To: <1389860167.26808.84.camel@sauron.fi.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, January 16, 2014 9:16 AM, Artem Bityutskiy wrote:=0A=
> > UBIFS writes in 4KiB units.=0A=
> =0A=
> I guess this is a bit confusing. The low-level flash write operations=0A=
> can be bigger or smaller. However, the file data "buffers" that UBIFS=0A=
> writes contain 4KiB of file data (aligned, e.g., regions of the file=0A=
> would be 0-4K, 4K-8K, etc). Every such "buffer" is protected with CRC32,=
=0A=
> and if a power cut results in the buffer not being fully written, the=0A=
> CRC32 mismatches and UBIFS discards the entire buffer. And the old=0A=
> contents of this file region is stays on the flash. The old contents=0A=
> does not go away before the new contents reaches the flash media. So the=
=0A=
> read operation for any aligned 4KiB region always returns the old=0A=
> contents, or the new contents, nothing else.=0A=
> =0A=
> >  So any aligned 4KiB piece of your file is=0A=
> > guaranteed to either be fully written, then the read will return new=0A=
> > data, or not be written at all, then the read will return old data.=0A=
=0A=
Sorry if I mislead you, I guess the final statement of my original mail is=
=0A=
still valid then:=0A=
"In general this requires that your database also is implemented=0A=
in a fault tolerant way."=0A=
I.e. it must itself make sure it's entire write is completed before=0A=
switching to a new "state". Unless the DB implements some kind of=0A=
journaling this may be a problem.=0A=
=0A=
BR // Mats=0A=
