Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U9uWW-00063p-4N
 for linux-mtd@lists.infradead.org; Mon, 25 Feb 2013 09:39:05 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: RE: [PATCH v2] mtd: nand: support BENAND (Built-in ECC NAND)
Date: Mon, 25 Feb 2013 09:38:58 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E99A07D@DBDE01.ent.ti.com>
References: <F3B6523425E7914AA6214ED358D820AF2674E3EA@TGXML341.toshiba.local>
 <20980858CB6D3A4BAE95CA194937D5E73E99A025@DBDE01.ent.ti.com>
 <512B2DC6.8090104@parrot.com>
In-Reply-To: <512B2DC6.8090104@parrot.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: Matthieu CASTET [mailto:matthieu.castet@parrot.com]
> Sent: Monday, February 25, 2013 2:54 PM
> To: Gupta, Pekon
> Cc: katsuki.uwatoko@toshiba.co.jp; linux-mtd@lists.infradead.org
> Subject: Re: [PATCH v2] mtd: nand: support BENAND (Built-in ECC NAND)
>=20
> Gupta, Pekon a =E9crit :
> > Hi,
> >
> >> This enables support for BENAND, which is an SLC NAND flash solution
> >> with embedded error correction code (ECC), currently supports only
> >> 128bytes OOB type.
> >>
> >> In the read sequence, "status read command" is executed to check the
> >> ECC status after read data. If bitflips occur, these are
> >> automatically corrected by BENAND and the status indicates the result.
> >>
> >> The write sequence is the same as raw write and the ECC data are
> >> automatically written to OOB by BENAND.
> >
> > Just inquisitive, can anyone please share any throughput comparison
> between 'BENAND' & 'normal NAND' devices having same capacity and
> working on same clock-freq ?
> >
> > (a) Usually on-chip memory controllers work on faster clock frequencies=
, as
> compared to the NAND devices connected to them externally on board.
> > Thus I assume, ECC computation & correction can be done at faster rate.
> >
> > (b) However, on other hand BENAND(s) have luxury of accessing the Flash
> storage array locally, thus eliminating I/O delays | un-optimized IO sign=
al
> timing from the access-path.
> >
> > So, if you can share the details throughput comparison between the two
> types of NAND devices, under various conditions it would be helpful.
> >
> You always have to transfer the data from/to the nand devices to/from the
> host.
>=20
> - Either the ecc internal controller is fast and the throughput are the s=
ame
> than 'normal nand' (assuming the ecc controller on the host is fast),
> - either it is slow and the throughput is limited by the internal ecc con=
troller
> (throughput is slower than 'normal nand')
>=20
I agree about the data portion..=20
But assuming there is no file-system OOB metadata | cleanmarker to be store=
d (like in UBIFS)
Do we still need to transfer OOB data from Host processor to NAND device ?
If yes, then ECC calculation & correction which at times is main bottle-nec=
k in NAND accesses,=20
may be best done at Host-processor side..=20

Also, In-case there is some file-system metadata to be stored in OOB|spare =
area along with ECC,
how do we ensure that layout of metadata does not overlap with ECC syndrome=
 in BENAND ?
Is the BENAND capable of re-adjusting its ECC layout ?=20


with regards, pekon

>=20
> Matthieu
