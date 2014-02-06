Received: from mail2.lawo.de ([80.149.95.33] helo=ExchangeEdge1.lawo.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WBOef-0006bn-9N
 for linux-mtd@lists.infradead.org; Thu, 06 Feb 2014 13:06:10 +0000
From: "Wiedemer, Thorsten (Lawo AG)" <Thorsten.Wiedemer@lawo.com>
To: Bill Pringlemeir <bpringlemeir@nbsps.com>, Richard Weinberger
 <richard@nod.at>
Date: Thu, 6 Feb 2014 14:05:40 +0100
Subject: AW: UBI leb_write_unlock NULL pointer Oops (continuation)
Message-ID: <D7B1B5F4F3F27A4CB073BF422331203F2A18A74752@Exchange1.lawo.de>
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>
 <CAFLxGvya5WXoKcYmOgeM_SmVVEht1jEzeLG9vHhwFudFU+Ny8A@mail.gmail.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18997F8B@Exchange1.lawo.de>
 <52EF772D.8080207@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18DD7989@Exchange1.lawo.de>
 <52EF9FFE.4020405@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18A7474A@Exchange1.lawo.de>
 <52F1F658.9080701@nod.at> <87vbwt1bex.fsf@nbsps.com>
 <52F2B78A.1050802@nod.at>,<87r47h19o0.fsf@nbsps.com>
In-Reply-To: <87r47h19o0.fsf@nbsps.com>
Content-Language: de-DE
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

________________________________________
Von: Bill Pringlemeir [bpringlemeir@nbsps.com]
Gesendet: Mittwoch, 5. Februar 2014 23:23
An: Richard Weinberger
Cc: Wiedemer, Thorsten (Lawo AG); linux-mtd@lists.infradead.org
Betreff: Re: UBI leb_write_unlock NULL pointer Oops (continuation)

On  5 Feb 2014, richard@nod.at wrote:


> I think the issue is not related to fastmap because we have reports
> for kernels older than 3.7.  Fastmap got merged in 3.7.

Yes, of course.  I meant fastmap may prevent the issue from happening.
So, I wondered about Thorsten's configuration.

Fwiw,
Bill Pringlemeir.
________________________________________

we run on a 3.6.11 kernel, so no fastmap.

grep -E 'MTD|UBI' .config | grep -v '^#'   gives

CONFIG_TCP_CONG_CUBIC=3Dy
CONFIG_MTD=3Dy
CONFIG_MTD_CMDLINE_PARTS=3Dy
CONFIG_MTD_OF_PARTS=3Dy
CONFIG_MTD_CHAR=3Dy
CONFIG_MTD_BLKDEVS=3Dy
CONFIG_MTD_BLOCK=3Dy
CONFIG_MTD_CFI=3Dy
CONFIG_MTD_GEN_PROBE=3Dy
CONFIG_MTD_CFI_ADV_OPTIONS=3Dy
CONFIG_MTD_CFI_NOSWAP=3Dy
CONFIG_MTD_CFI_GEOMETRY=3Dy
CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
CONFIG_MTD_CFI_I1=3Dy
CONFIG_MTD_CFI_INTELEXT=3Dy
CONFIG_MTD_CFI_UTIL=3Dy
CONFIG_MTD_PHYSMAP=3Dy
CONFIG_MTD_NAND_ECC=3Dy
CONFIG_MTD_NAND=3Dy
CONFIG_MTD_NAND_IDS=3Dy
CONFIG_MTD_NAND_MXC=3Dy
CONFIG_MTD_UBI=3Dy
CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
CONFIG_MTD_UBI_BEB_RESERVE=3D2
CONFIG_OF_MTD=3Dy
CONFIG_UBIFS_FS=3Dy
CONFIG_UBIFS_FS_LZO=3Dy
CONFIG_UBIFS_FS_ZLIB=3Dy

Regards an thanks a lot for your time !

Thorsten
