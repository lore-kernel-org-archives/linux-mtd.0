Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eKq7u-0005wv-Vm
 for linux-mtd@lists.infradead.org; Fri, 01 Dec 2017 18:33:33 +0000
Date: Fri, 1 Dec 2017 19:33:02 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "A.W.C." <bluestream@ymail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 <miquel.raynal@free-electrons.com>, David Oberhollenzer
 <david.oberhollenzer@sigma-star.at>
Subject: Re: nanddump Rev.1.1.1.1 syntax
Message-ID: <20171201193302.2187783f@bbrezillon>
In-Reply-To: <2131523289.160432.1512130231803@mail.yahoo.com>
References: <2131523289.160432.1512130231803.ref@mail.yahoo.com>
 <2131523289.160432.1512130231803@mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+MTD ML
+David (the mtd-utils maintainer)
-GKH, Alexandre

Hello,

Please try to send your questions to the relevant mailing list, people
next time.

On Fri, 1 Dec 2017 12:10:31 +0000 (UTC)
"A.W.C." <bluestream@ymail.com> wrote:

> What is correct syntax of a nanddump command?
>=20
> nanddump Revision: 1.1.1.1
>=20
> Usage: nanddump [OPTIONS] MTD-device
> Dumps the contents of a nand mtd partition.
>=20
> --help=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 display this help and exit
> --version=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output version informa=
tion and exit
> -f file=C2=A0 =C2=A0 --file=3Dfile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dump=
 to file
> -i=C2=A0 =C2=A0 =C2=A0 =C2=A0 --ignoreerrors=C2=A0 =C2=A0 =C2=A0 ignore e=
rrors
> -l length=C2=A0 --length=3Dlength=C2=A0 =C2=A0 =C2=A0 length
> -n=C2=A0 =C2=A0 =C2=A0 =C2=A0 --noecc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 read without error correction
> -o=C2=A0 =C2=A0 =C2=A0 =C2=A0 --omitoob=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 omit oob data
> -b=C2=A0 =C2=A0 =C2=A0 =C2=A0 --omitbad=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 omit bad blocks from the dump
> -p=C2=A0 =C2=A0 =C2=A0 =C2=A0 --prettyprint=C2=A0 =C2=A0 =C2=A0 =C2=A0 pr=
int nice (hexdump)
> -s addr=C2=A0 =C2=A0 --startaddress=3Daddr=C2=A0 start address
>=20
>=20
> Does nanddump command support only MTD-device name as argument? ( /dev/mt=
dx )
> For example, MTD partitions specified with starting and ending offsets of=
 NAND partition:
>=20
> 0x01b60000-0x01d60000 : "HS_FW"
>=20
> I tried commands
>=20
> nanddump -o -b -f=C2=A0 /tmp/hsfw.bin=C2=A0 -s 0x01b60000 -l 0x00080000
>=20
> nanddump  /dev/mtd9 /tmp/hsfw.bin
>=20
> but in both cased the output is help / usage info.
>=20
> Also, are the -o and -b arguments already default?(included in nandump co=
de)
>=20
>=20
> The example of command will be very helpful.

Well, if you read the help context carefully, you'll see that all your
attempts are wrong. And even if you don't understand the doc, googling
for nanddump would have lead you to [1] which has a working example.

So, the correct command is:

# nanddump -f=C2=A0/tmp/hsfw.bin=C2=A0 -s 0x01b60000 -l 0x00080000 /dev/mtd9

But please, try to search a bit before sending an email next time!

Regards,

Boris

[1]http://processors.wiki.ti.com/index.php/Mtdutils
