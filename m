Received: from fed1mtao01.cox.net ([68.6.19.244])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17uF6X-0003no-00
	for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2002 17:33:38 +0100
Subject: RE: Interest in DOC and YAFFS? --> YAFFS bootloading
From: Russ Dill <Russ.Dill@asu.edu>
To: Henrik =?ISO-8859-1?Q?Nordstr=F6m?= <hno@marasystems.com>
Cc: Srinivasan.Ramasubramaniam@nokia.com, elf@buici.com,
	kenneth.johansson@etx.ericsson.se, linux-mtd@lists.infradead.org
In-Reply-To: 
	<Pine.LNX.4.44.0209251531440.32689-100000@filer.marasystems.com>
References: <Pine.LNX.4.44.0209251531440.32689-100000@filer.marasystems.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Date: 25 Sep 2002 09:34:13 -0700
Message-Id: <1032971654.13282.18.camel@russ>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wed, 2002-09-25 at 06:34, Henrik Nordstr=F6m wrote:
> On 25 Sep 2002, Russ Dill wrote:
>=20
> > the compressed cramfs image will be loaded into ram, and then, from
> > there, as pages are needed, they will be decompressed again and put int=
o
> > ram (but again, if memory is in a pinch, these pages can be dropped). I
> > don't know if an ext2 initrd will do XIP (execute in place), but I
> > somehow doubt that anyone has worked on that, meaning that the pages
> > would need to be copied again, in which case, a cramfs would use less
> > ram.
>=20
> I have never succeded in getting cramfs to work from a ramdisk.. it does=20
> something magic with blocksizes that seems to srew up the ramdisk data=20
> (first blocks get "forgotten").

the block size needs to be changed to 4k, there are patches floating
around
=20
> As the ramdisk is living within the buffer cache a ext2 image most likely=
=20
> will do XIP.

I don't know about that, the data would need to be aligned to 4k, I
would think that the first part of most 4k pages would have fs
information or some such, someone can call me on this though
