Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zlxr2-0008K2-Ha
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2015 11:34:54 +0000
From: Yanjiantao <yanjiantao@hisilicon.com>
To: "computersforpeace@gmail.com" <computersforpeace@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Caizhiyong
 <caizhiyong@hisilicon.com>, "Wanli (welly)" <welly.wan@hisilicon.com>,
 Quyaxin <quyaxin@hisilicon.com>
Subject: questions about  [PATCH]mtd: nand: fix SCAN2NDPAGE check for BBM
Date: Tue, 13 Oct 2015 11:33:54 +0000
Message-ID: <A5C805F07496A54EAFF48B92DEC9C1057AECB1A7@SZXEMA501-MBX.china.huawei.com>
References: <C3050A4DBA34F345975765E43127F10F62D61353@SZXEMA512-MBX.china.huawei.com> 
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Brian,

i read the patch:  " mtd: nand: fix SCAN2NDPAGE check for BBM "
And i am confused about the markbad flows.

		xxxxx;
        if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
                ofs +=3D mtd->erasesize - mtd->writesize;

		xxxxx;

        do {=20
                if (chip->options & NAND_BUSWIDTH_16) {
                        chip->cmdfunc(mtd, NAND_CMD_READOOB,
                                        chip->badblockpos & 0xFE, page);
                        bad =3D cpu_to_le16(chip->read_word(mtd));
                        if (chip->badblockpos & 0x1)=20
                                bad >>=3D 8;
                        else=20
                                bad &=3D 0xFF;
                } else {
                        chip->cmdfunc(mtd, NAND_CMD_READOOB, chip->badblock=
pos,
                                        page);
                        bad =3D chip->read_byte(mtd);
                }   =20

                if (likely(chip->badblockbits =3D=3D 8))
                        res =3D bad !=3D 0xFF;
                else=20
                        res =3D hweight8(bad) < chip->badblockbits;
                ofs +=3D mtd->writesize;
                page =3D (int)(ofs >> chip->page_shift) & chip->pagemask;
                i++;=20
        } while (!res && i < 2 && (chip->bbt_options & NAND_BBT_SCAN2NDPAGE=
));=20
mark bad flows is the same.

If I understand the patch right, then I think that:
1. when NAND_BBT_SCANLASTPAGE is set, markbad and checkbad on the last page=
 only.
2. when NAND_BBT_SCAN2NDPAGE is set, markbad and checkbad on the 1st and 2n=
d page.

I checked some datasheets of different manufacturers(such as SAMSUNG/HYNIX/=
MICRON/TOSHIBA), they claim that bad block marker is on 1st/2nd, or 1st/las=
t, or 1st/2nd/last(for spansion).
the checkbad method may check fail in some cases:
for example,:
1. for spansion nand(bad block marker is on 1st or 2nd or last page), set N=
AND_BBT_SCAN2NDPAGE while badblock marker is on last page or set NAND_BBT_S=
CANLASTPAGE while badblock marker is on 1st/2nd page may cause badblock che=
ch failed.
2. for HYNIX (H27UBG8T2CTR) nand (bad block marker is on 1st or last page),=
 check may failed whether NAND_BBT_SCANLASTPAGE is set or not.
