Received: from relay02.pair.com ([209.68.5.16])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JVAOU-0000Xy-Hq
	for linux-mtd@lists.infradead.org; Fri, 29 Feb 2008 18:55:42 +0000
Date: Fri, 29 Feb 2008 10:55:34 -0800
Subject: Re: Writing JFFS2 to Samsung K9F1208U0B NAND on AMCC PPC405EX/r
	Kilauea/Haleakala
From: Grant Erickson <gerickson@nuovations.com>
To: "Manfred jun. Schl=?ISO-8859-1?B?5A==?=gl" <manfred.schlaegl@gmx.at>
Message-ID: <C3ED9526.DB2F%gerickson@nuovations.com>
In-Reply-To: <1204275029.3408.31.camel@lisa.alm.archives.at>
Mime-version: 1.0
Content-type: text/plain;
	charset="ISO-8859-1"
Content-transfer-encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2/29/08 12:50 AM, Manfred jun. Schl=E4gl wrote:
> Am Donnerstag, den 28.02.2008, 16:30 -0800 schrieb Grant Erickson:
>> I am attempting to create and write a JFFS2 file system to the Samsung
>> K9F1208U0B NAND part on an AMCC PPC405EXr "Haleakala" board and seem to =
be
>> running into a hurdle or two.
>>=20
>> Given the Samsung K9F1208U0B's 16 KiB erase block and 512 B page sizes, =
I
>> invoked mkfs.jffs2 with:
>>=20
>> % mkfs.jffs2 -n -b -s 512 -e 16 KiB -d /export/haleakala -o haleakala.im=
g
>=20
>> I then erase the device with 'flash_eraseall' using the '-j' option:
>>=20
>> # flash_eraseall -j /dev/mtd9
>> Erasing 16 Kibyte @ 3f94000 -- 99 % complete. Cleanmarker written at
>> 3f94000.
>>=20
>> However, when I attempt to lay down the file system image with nandwrite
>> (again, using the '-j' option), I get a driver error:
>>=20
>> # nandwrite -j /dev/mtd9 haleakala.img
>> MEMSETOOBSEL: Inappropriate ioctl for device
>>=20
>> Eliding the '-j' option, I get errors about page alignment:
>>=20
>> # nandwrite /dev/mtd9 haleakala.img
>> Input file is not page aligned
>> Data was only partially written due to error: Success

> You have to pad(-p) your image, so that it's size is a multiple of page
> size
> % mkfs.jffs2 -n -b -s 512 -p 512 -e 16 KiB -d /export/haleakala -o
> haleakala.img
>=20
> Then you should be able to write it with:
> % nandwrite /dev/mtd9 haleakala.img
>=20
> greetings
> manfred

Manfred:

Danke sch=F6n. Your suggestion of adding padding ('-p 512') along with
Andrey's suggestion to remove the deprecated '-j' options to flash_eraseall
and nandwrite did the trick:

# mount -t jffs2 /dev/mtdblock9 /import/
# df -h
Filesystem                Size      Used Available Use% Mounted on
...
/dev/mtdblock9           63.6M     14.4M     49.2M  23% /import

Regards,

Grant
