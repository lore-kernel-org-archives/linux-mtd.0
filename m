Received: from mv-drv-hcb003.ocn.ad.jp ([118.23.109.133])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PZzDA-000319-VG
	for linux-mtd@lists.infradead.org; Tue, 04 Jan 2011 05:13:34 +0000
Date: Tue, 04 Jan 2011 14:13:27 +0900 (JST)
Message-Id: <20110104.141327.25406828.anemo@mba.ocn.ne.jp>
To: ralf.roesch@rw-gmbh.de
Subject: Re: [PATCH] txx9ndfmc: limit transfer bytes to 512 (ECC provides 6
	bytes max)
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <4D1C5123.4050804@rw-gmbh.de>
References: <4D1C5123.4050804@rw-gmbh.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 30 Dec 2010 10:30:11 +0100, Ralf R=F6sch <ralf.roesch@rw-gmbh.d=
e> wrote:
> See commit: c0cbfd0e81d879a950ba6f0df3f75ea30c5ab16e
> Using __nand_correct_data() helper function, this driver can read 512=

> byte (with 6 byte ECC) at a time.
> =

> This is correct, but not more:
> With NAND chips providing page sizes > 512 Bytes
> chip->ecc.bytes are calculated > 6 in txx9ndfmc_nand_scan.
> According the data sheet there are (only) 6 bytes ECC available.
> =

> After applying the patch a Hynix 512M*8 with 2k page size could be
> successfully formatted and used with an ubifs file system.
> =

> Signed-off-by: Ralf Roesch <ralf.roesch@rw-gmbh.de>

Thank you for the fix.  It is good news that this controller can work
with large page NAND.

Acked-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
