Received: from zorglub.ssji.net ([2001:7a8:3030::face])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CDNjt-0003WW-Pm
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2004 09:46:27 -0400
Received: from yagoo.io.ssji.net ([2001:7a8:3030:0:240:5ff:fe35:fead]
	helo=yagoo) by zorglub.ssji.net with smtp (Exim 4.24)
	id 1CDNjm-0006z3-HY
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2004 15:46:18 +0200
Date: Fri, 1 Oct 2004 15:46:17 +0200
From: Nicolas Pouillon <nipo@ssji.net>
To: linux-mtd@lists.infradead.org
Message-Id: <20041001154617.163cc484.nipo@ssji.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha1";
	boundary="Signature=_Fri__1_Oct_2004_15_46_17_+0200_NnxrFaaC9=HFx4EI"
Subject: Issues with a Doc Milplus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Signature=_Fri__1_Oct_2004_15_46_17_+0200_NnxrFaaC9=HFx4EI
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Hello list !

I'm porting Linux to my PDA (Asus A620).
It has a DocMilPlus inside.
I'm running handhelds.org kernel, which has a non-up-to-date mtd part.
http://cvs.handhelds.org/cgi-bin/viewcvs.cgi/linux/kernel26/drivers/mtd/
(It still has Self-contained drivers)

When trying to make MTD part work, I bumped in different problems:


1/ Doc is mapped to mem address 0x0, in docprobe.c there is an
expression like: 
if (doc_config_location) {
	[probe at specified address]
} else {
	[probe hardlisted addresses]
}

So it never probes for my chip at 0. I noticed the same construct is
present in newer probing routines.
Is there a special way of declaring a chip at 0x0 ?


2/ It was not known by nan_ids, I had to add the following line:
{"NAND 64MiB 3,3V", 0xa5, 26, 0x4000, 0},

Then the chip is detected as:

INFTL: inftlcore.c $Revision: 1.14 $, inftlmount.c $Revision: 1.12 $
Using configured DiskOnChip probe address 0x0
DiskOnChip Millennium Plus found at address 0x0
Flash chip found: Manufacturer ID: 98, Chip ID: A5 (Toshiba:MyNAND 64MiB
3,3V) 
Flash chip found: Manufacturer ID: 98, Chip ID: A5 (Toshiba:MyNAND64MiB
3,3V) 
2 flash chips found. Total DiskOnChip size: 128 MiB
INFTL: could not find valid boot record?
INFTL: could not mount device
slram: not enough parameters.


3/ It seems to be detected twice, it should be 64MiB total, and there is
physically one chip on the board.
Could one chip be virtually two 32MiB chips ?
Is there some special tweaking I missed ?


4/ Using arm part in doc2000.h which is:
#define ReadDOC_(adr, reg)      ((unsigned char)(*(volatile __u32
*)(((unsigned long)adr)+((reg)<<2)))) 
#define WriteDOC_(d, adr, reg) do{ *(volatile __u32 *)(((unsigned
#long)adr)+((reg)<<2)) = (__u32)d; wmb();} while(0)

makes the machine crash, I have to use readb/writeb in order to make the
device work.



I'm sorry for this so-long mail, dont hesitate to flame me with some
RTFMs if I need them, but I've not found similar solved entries ;)

Thanks !

-- 
Nipo <nipo@ssji.net>
Gnu-PGP: 1024D/1DBF658F
http://nipo.ssji.net/nipo.asc

--Signature=_Fri__1_Oct_2004_15_46_17_+0200_NnxrFaaC9=HFx4EI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFBXV+qLh2qAR2/ZY8RAvieAJwKM7ejcK9T+ZWEiM0X6xzsrdp6BgCfTOkX
riQDfpMVsW/Ws2ioE57L+j8=
=6Kz8
-----END PGP SIGNATURE-----

--Signature=_Fri__1_Oct_2004_15_46_17_+0200_NnxrFaaC9=HFx4EI--
