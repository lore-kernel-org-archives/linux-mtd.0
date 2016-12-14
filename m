Received: from mx.artech.at ([188.21.106.106] helo=mail.artech.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cH5Pa-0003bh-Kl
 for linux-mtd@lists.infradead.org; Wed, 14 Dec 2016 08:59:44 +0000
From: Matthias Auchmann <m.auchmann@artech.at>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Wed, 14 Dec 2016 09:59:17 +0100
Subject: RE: UBI/UBIFS on NAND with PEB 4MB
Message-ID: <566B344A0B1AB14EB2486D887B6FF9E033AFEBBA83@SRV01.ARTech.local>
References: <566B344A0B1AB14EB2486D887B6FF9E033AFEBBA17@SRV01.ARTech.local>
 <20161214084303.0059cbf5@bbrezillon>
In-Reply-To: <20161214084303.0059cbf5@bbrezillon>
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris!

Thanks for your reply. Just now I found out that when I disable the DMA of =
my NAND driver, ubiattach/detach works. So it must be a problem with the DM=
A and/or cache coherency on this brand-new cache coherent interconnect or w=
hatever. I will investigate it later! Sorry for having bothered you guys wi=
th that, but as I said yesterday night it was kind of preliminary ;-)

On the patches for the UBIFS_MAX_LEB_SZ, can you tell me where I can find t=
hose patches? That would be great ;-)

BR,

Matthias


-----Original Message-----
From: Boris Brezillon [mailto:boris.brezillon@free-electrons.com]=20
Sent: Wednesday, December 14, 2016 8:43 AM
To: Matthias Auchmann
Cc: linux-mtd@lists.infradead.org
Subject: Re: UBI/UBIFS on NAND with PEB 4MB

Hi Matthias,

On Tue, 13 Dec 2016 20:40:59 +0100
Matthias Auchmann <m.auchmann@artech.at> wrote:

> Hi guys!
>=20
> I'm trying to use UBI and UBIFS on a Micron MT29F32G08ABCDBJ4 SLC NAND wi=
th an erase block size 4MB.

Woh! an SLC NAND with 4MB eraseblocks, that's surprizing.

>=20
> First of all, mkfs.ubifs wouldn't support a LEB larger than UBIFS_MAX_LEB=
_SZ being (2*1024*1024).

This is the easy part ;). We already have patches to increase the limit in =
different ubi utils (IIRC, it's also needed in ubinize).

>=20
> When I use ubiattach though, it seems to be quite happy, giving me that o=
n a 128MB partition:
>=20
> UBI device number 0, total 32 LEBs (133169152 bytes, 127.0 MiB),=20
> available 8 LEBs (33292288 bytes, 31.8 MiB), LEB size 4161536 bytes=20
> (4.0 MiB)
>=20
> Anyway, when I detach and reattach, it won't work. Details are in the bot=
tom of that mail, but since I haven't thoroughly looked into it myself yet,=
 this is only for those who care... I don't want to ask preliminary questio=
ns.
>=20
> Anyway, my questions I guess then are:
> -) Are there any patches/branches that enable UBIFS to be run with a LEB =
of 4161536?
> -) Are there any known limitations with using a 4MiB PEB with UBI itself,=
 or shall I assume for now that the problem is on my board/NAND driver rega=
rding the above ubiattach errors upon the second attach?

I don't think so. We did several tests on different MLC NANDs exposing 4MB =
blocks, and the UBI/UBIFS layers were not complaining about that (we had ot=
her problems related to the MLC constraints).
What's your controller?

Regards,

Boris
