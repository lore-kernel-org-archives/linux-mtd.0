Received: from [66.220.10.164] (helo=mail.rinconhosting.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 194tOO-00036C-7o
	for <linux-mtd@lists.infradead.org>; Mon, 14 Apr 2003 03:08:20 +0100
Received: from dirt ([66.68.146.73])
        by mail.rinconhosting.com (Merak 5.5.7) with SMTP id HUB73912
        for <linux-mtd@lists.infradead.org>; Sun, 13 Apr 2003 19:12:04 -0700
Date: Sun, 13 Apr 2003 21:01:33 -0500
From: Earl Manning <EManning@PRISMIQ.com>
To: linux-mtd@lists.infradead.org
Message-Id: <20030413210133.64cc28b9.EManning@PRISMIQ.com>
In-Reply-To: <002901c3021b$546a6fe0$525deecb@noshel>
References: <002901c3021b$546a6fe0$525deecb@noshel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Subject: Re: A question on ECC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Edward,

I am using a similar chip with JFFS2.  When you wrote the image, did you us=
e the supplied utility 'nandwrite'?  If you did, did you invoke it with the=
 "--yaffs" option? =20

I hope this helps,
Earl Manning


On Mon, 14 Apr 2003 09:18:09 +0900
Edward Lee \(=C0=CC=C0=E5=BF=F8\) <noshel@idis.co.kr> wrote:

> Hello. I'm Edward Lee in Korea.
>=20
> I'm using samsung NAND flash, with YAFFS on it..
> But I'm having problems with ECC.
> I wrote a file that's needed to use the flash chip with my board,
> and here's  a small part of code that defines the partitions.
>=20
> static struct mtd_partition partition_info[] =3D {
>     { name: "a",
>       offset: 0,
>       size: 32 * 512 },
>     { name: "b",
>       offset: 16384,
>       size: 2 * 1024 * 1024 },
>     { name: "c",
>       offset: 2113536,
>       size: 2 * 1024 * 1024 },
>     { name: "d",
>       offset: 4210688,
>       size: 11 * 1024 * 1024 },
>     { name: "e",
>       offset: 15745024,=20
>       size: 1032192 }
> };
> #define NUM_PARTITIONS 5
>=20
>     I'm using YAFFS on partitions "d" and "e".
> But I can't stop recieving annoying kernel messages saying
> "Reading data from NAND FLASH without ECC is not recommended".
>=20
>      On YAFFS's side, I set the option CONFIG_YAFFS_USE_NANDECC,
> which I believe that asks the mtd NAND to do the ECC.
> So, I would like to ask if any other settings are necessary in order to e=
nable ECC.
> (Probably something should be added to the stuff above?)
>=20
> Well, that's all, and thanks for the great work.
