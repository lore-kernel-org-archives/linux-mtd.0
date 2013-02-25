Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U9u0w-0004BJ-2K
 for linux-mtd@lists.infradead.org; Mon, 25 Feb 2013 09:06:26 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "katsuki.uwatoko@toshiba.co.jp" <katsuki.uwatoko@toshiba.co.jp>
Subject: RE: [PATCH v2] mtd: nand: support BENAND (Built-in ECC NAND)
Date: Mon, 25 Feb 2013 09:06:19 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E99A025@DBDE01.ent.ti.com>
References: <F3B6523425E7914AA6214ED358D820AF2674E3EA@TGXML341.toshiba.local>
In-Reply-To: <F3B6523425E7914AA6214ED358D820AF2674E3EA@TGXML341.toshiba.local>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
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

Hi,

> This enables support for BENAND, which is an SLC NAND flash solution
> with embedded error correction code (ECC), currently supports only
> 128bytes OOB type.
>=20
> In the read sequence, "status read command" is executed to check the
> ECC status after read data. If bitflips occur, these are
> automatically corrected by BENAND and the status indicates the result.
>=20
> The write sequence is the same as raw write and the ECC data are
> automatically written to OOB by BENAND.

Just inquisitive, can anyone please share any throughput comparison between=
 'BENAND' & 'normal NAND' devices having same capacity and working on same =
clock-freq ?

(a) Usually on-chip memory controllers work on faster clock frequencies, as=
 compared to the NAND devices connected to them externally on board.
Thus I assume, ECC computation & correction can be done at faster rate.

(b) However, on other hand BENAND(s) have luxury of accessing the Flash sto=
rage array locally, thus eliminating I/O delays | un-optimized IO signal ti=
ming from the access-path.

So, if you can share the details throughput comparison between the two type=
s of NAND devices, under various conditions it would be helpful.


with regards, pekon
