Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTrxH-0007yn-0D
 for linux-mtd@lists.infradead.org; Wed, 09 Oct 2013 11:29:28 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>, Wolfgang Denk <wd@denx.de>
Subject: RE: Grow UBI device?
Date: Wed, 9 Oct 2013 11:28:52 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA20350@DBDE04.ent.ti.com>
References: <20131008192846.A25E7380A65@gemini.denx.de>
 <alpine.DEB.2.00.1310091038110.28562@lnxricardw.se.axis.com>
In-Reply-To: <alpine.DEB.2.00.1310091038110.28562@lnxricardw.se.axis.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> From: Ricard Wanderlof
> > On Tue, 8 Oct 2013, Wolfgang Denk wrote:
> > I'm looking for a clever way to migrate devices (in the field) from
> > JFFS2 to UBI/UBIFS.  In the end result, I want to have single UBI
> > device (which covers the whole NAND chip) with several volumes used
> > with UBIFS.  Unfortunately I must keep some of the existing data.
> >
> > It would be nice if I could start with a UBI device that is smaller
> > than the NAND, so I can keep an existing MTD partition with a JFFS2
> > file system. After copying the data from JFFS2 to a UBIFS volume, I
> > would like to free and reuse the space of this JFFS2 partition.
> >
That seems to be a nice move, but where would you copy the existing
JFFS2 data ?
(a) In memory, then there is threat of losing the data due to
  power-failure, and you should have enough RAM.
(b) copy to target UBIFS volume/partition. So assumption is that target
  UBI volume has enough space and is writable.
I'm assuming (b) is more workable ..=20


> > Is there a way to "grow" the existing UBI device so that it now also
> > covers the rest of the NAND chip?  Or is my only option to create a
> > second UBI device?
>=20
> UBI devices are 'attached' to existing mtd partitions. So to grow a UBI
> device, you need to detach it from the partition, re-partition the flash
> (and I'm not sure if this step is even possible as it involves
> unregistering existing mtd partitions), then attach a UBI device to the a
> new partition.
>=20
Yes, currently registering and de-registering of MTD partitions are
done as part of nand_probe() and nand_remove().
If we do on-the-fly registering / de-registering of MTD device, then we
also need to tweak the mtd partition information, which will change
- partition base offset and=20
- shift masks (to calculate offset within the partition)
which is ok, because they are not used by controller drivers directly.


> Come to think of it, I'm not sure that would work anyway, as the
> resulting, new, enlarged partition would partly contain UBI data and
> partly old jffs2 data. I'm not sure what UBI does when it encounters
> incorrect data, if it just erases the relevant blocks and formats them fo=
r
> its own use, or if it barfs completely and just bails out complaining tha=
t
> the partition does not contain UBI data. If the relevant blocks were
> erased, then I think UBI would simply concede that the a previous erase
> attempt had been prematurely aborted, and re-erase the blocks and write
> its headers, so perhaps that is something to try. At any rate it involves
> at least some mild trickery (erase the blocks that previously contained
> jffs2 data).
>=20
Yes, during mounting of UBIFS volumes, UBI checks for erase-header
on first-page of every block.=20
- If it's able to find a valid erase-header, with correct image_seq field,
then it attaches it to its pool.
- Otherwise, if the valid erase-header was not found, then it assumes
 then it ubi will try re-erasing it. And add it to its pool of free-blocks.

So, effectively you don't even need to erase the partition to convert
it into UBI volume, you just try attaching it as UBI volume and UBI
should erase it for you. (though flagging some warnings on the way).


> It's probably easier to create a new UBI device by attaching it to the
> partition previously used by jffs2, after erasing it, but multiple UBI
> devices across a flash partly defeats the purpose of wear-leveling which
> UBI provides.
>
True but this is good for on-field devices which are still on JFFS2 and
want to migrate to UBIFS for same reasons. Also, this would help in
other areas like recovery from power-failures.
=20

with regards, pekon
