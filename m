Received: from mail-yw0-f204.google.com ([209.85.211.204])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OMdp7-0000pY-Vr
	for linux-mtd@lists.infradead.org; Thu, 10 Jun 2010 09:13:18 +0000
Received: by ywh42 with SMTP id 42so6590203ywh.15
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Jun 2010 02:13:16 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 10 Jun 2010 14:43:16 +0530
Message-ID: <AANLkTimMvLdm54CwALZClYKxZc6vu7NV24pXltQqGH1q@mail.gmail.com>
Subject: NAND bad block table creation
From: Naveen Mamindlapalli <naveen.mamindlapalli@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I am going through mtd subsystem code for bad block management
information. The linux kernel version I am using is linux-2.6.34. In
the create_bbt( )=A0 function in drivers/mtd/nand/nand_bbt.c, the for
loop which checks for whether a block is bad or not is incrementing by
2 (line 436) . That means alternate NAND blocks are checked to find
out whether that block is bad or not.

Is this correct?

Code is pasted below ( drivers/mtd/nand/nand_bbt.c ):

    417         for (i =3D startblock; i < numblocks;) {
    418                 int ret;
    419
    420                 if (bd->options & NAND_BBT_SCANALLPAGES)
    421                         ret =3D scan_block_full(mtd, bd, from,
buf, readlen,
    422                                               scanlen, len);
    423                 else
    424                         ret =3D scan_block_fast(mtd, bd, from, buf,=
 len);
    425
    426                 if (ret < 0)
    427                         return ret;
    428
    429                 if (ret) {
    430                         this->bbt[i >> 3] |=3D 0x03 << (i & 0x6);
    431                         printk(KERN_WARNING "Bad eraseblock %d
at 0x%012llx\n",
    432                                i >> 1, (unsigned long long)from);
    433                         mtd->ecc_stats.badblocks++;
    434                 }
    435
    436                 i +=3D 2;
    437                 from +=3D (1 << this->bbt_erase_shift);
    438         }

Thanks and Regards,
Naveen
