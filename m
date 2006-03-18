Received: from mxs2.siemens.at ([194.138.12.133])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FKbFy-0008Jv-Hj
	for linux-mtd@lists.infradead.org; Sat, 18 Mar 2006 08:14:19 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-ID: <38F58D7B92CB20438DF49D28B572CC6F13C4AC@budgw09a.ww300.siemens.net>
References: <38F58D7B92CB20438DF49D28B572CC6F13C4A4@budgw09a.ww300.siemens.net><6d6a94c50603170012l62ee51dfxe0b33166398ad88d@mail.gmail.com><38F58D7B92CB20438DF49D28B572CC6F13C4A7@budgw09a.ww300.siemens.net>
	<f9d2a5e10603171104p4cf9b28es4f574ccdd08ab340@mail.gmail.com>
From: "Selmeci, Tamas" <tamas.selmeci@siemens.com>
To: "Russ Dill" <russ.dill@gmail.com>
Cc: linux-mtd@lists.infradead.org, Aubrey <aubreylee@gmail.com>
Subject: The solution for NAND/SMC on S3C2410 problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Sat, 18 Mar 2006 13:14:21 -0000

> > [can't mount root fs (cramfs) from SMC, complaining about ECC read =
errors]
>=20
> Wait, you are trying to store a kernel and cramfs filesystem on raw
> NAND flash? Chances are, they are each sitting on at least one bad
> sector. You need an FTL or YAFFS.

Yesterday I've found a working solution.

Firstly, I had to disable both FTL and NFTL support. When these were =
switched on, the kernel worked not better at all. I've spent 10-12 hours =
with examining MTD (NAND and S3C2410-specific) codes, drawn some =
figures, made notes and it turned out what was the problem:=20

Mmy old (64MB, Samsung) SMC was in an absolutely bad condition, Windows =
could detect and use it with FAT, but the many bad blocks on them =
prevented vivi to create an adequate partition table etc... after =
obtaining a new SMC, everything went better.=20

Vivi was recompiled without BonFS support. As it turned out, BonFS is =
absolutely unneeded for NAND/SMC, I don't known why Embest implemented =
in 2.4.18-rmk7... furthermore, I still don't know what BonFS is good =
for...

With vivi, I simply created 4 MTD partitions on the SMC (vivi, param, =
kernel and root).
In the board-specific code (arch/arm/mach-s3c2410/mach-....), I had to =
add some NAND-related structures describing the NAND-set present on the =
board, timing settings and the partition table layout etc...

After adding this, it seemed that MTD code for S3C2410 has some bugs in =
calculating flash timings/clocks, so I fixed that =
(s3c2410_nand_get_clk_rate?). After this, the card was successfully =
identified by the kernel, and the initial block scan (to build up bad =
block table) runned perfectly. I figured out that MTD registered the =
partitions as /dev/mtdblock0,1,2,3, so my root was /dev/mtdblock3.

For some reason, with correct root=3D kernel parameter, the kernel =
complained about read errors (ECC), when it tried to mount the root =
partition. With hardware ECC, there were less, with SW ECC, there were =
more ECC-error messages... It seems, that there are still bugs or =
misconfigurations in the ECC-calculation algorithms in S3C2410, because =
after manually disabling ECC-check, everything worked well, the root =
partition was mounted!!! (I saw some selections for ECC-calculations, =
maybe I'm gonna try them)

Now I'm making kernel menu extensions, slightly modifying codes, dealing =
with BBT, and trying to find a solution for that ECC-problem. (I've =
found a boot log on the internet with 2.6.11 on an S3C2410, and ECC was =
disabled there too, so it seems to me that there are problems with =
ECC-support). Currently my root partition is cramfs, but JFFS2 will be =
also tried.

Maybe I should try using FTL or YAFFS, because it ensures that =
bad-blocks are separated, if I'm right...?

I'm very happy, because I could make my SMC work with partitions! :)

Bye
--
Tamas Selmeci
