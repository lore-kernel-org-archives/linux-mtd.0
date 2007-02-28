Received: from mail.artecdesign.ee ([62.65.32.9] helo=postikukk.artecdesign.ee)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HMKNs-000609-J8
	for linux-mtd@lists.infradead.org; Wed, 28 Feb 2007 03:42:04 -0500
From: Indrek Kruusa <indrek.kruusa@artecdesign.ee>
To: "doodiexx doodiexx" <doodiexx@gmail.com>
Subject: Re: NAND flash mounting problem
Date: Wed, 28 Feb 2007 10:41:49 +0200
References: <87f18bad0702272352v44058e20x17390c10b9373930@mail.gmail.com>
In-Reply-To: <87f18bad0702272352v44058e20x17390c10b9373930@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200702281041.49203.indrek.kruusa@artecdesign.ee>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=DChel kenal p=E4eval (kolmap=E4ev 28 veebruar 2007 9:52 am) kirjutas doodi=
exx=20
doodiexx:
> Hi,
>
> We are using Atmel's AT32AP7000 processor and ST 512Mbit NAND Flash
> and having problems in creating a JFFS2 fs.
>
> The mtd system detects the flash and I think everything is fine with
> the kernel startup:
>
> NAND device: Manufacturer ID: 0x20, Chip ID: 0x76 (ST Micro NAND 64MiB
> 3,3V 8-bit)
> Scanning device for bad blocks
> Bad eraseblock 2995 at 0x02ecc000
> Bad eraseblock 4078 at 0x03fb8000
> Creating 1 MTD partitions on "NAND 64MiB 3,3V 8-bit":
> 0x00000000-0x04000000 : "rootfs"
>
> I try to flash_eraseall -j and it completes without any error, but
> when I try to mount it I get :
> # mount /dev/mtd1 /mnt/nand
> mount: mounting /dev/mtd1 on /mnt/nand failed

Is it busybox? The error message is not too verbose. I suppose you missed -=
t=20
jffs2 here. This and other nice hints can be found:

http://linux-mtd.infradead.org/faq/jffs2.html

cheers,
Indrek



>
> nanddump gives:
>
> # ./nanddump -l 512 -p /dev/mtd1
> Block size 16384, page size 512, OOB size 16
> Dumping data starting at 0x00000000 and ending at 0x00000200...
> 0x00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> <skipping.., all values are ff >
> 0x000001f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>   OOB Data: ff ff ff ff ff ff ff ff 19 85 20 03 00 00 00 08
>
> The 1985 and 2003 parts seem to be wrong endian ??
>
> Any ideas to solve the problem ?
>
> The processor is big endian,
> kernel version 2.6.18
> flash_eraseall is from the git repo at git.infradead.org/mtd-utils.git
> busybox version is the latest (1.4.1)
>
> BR,
> J.Doo
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
