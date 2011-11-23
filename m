Received: from mailserver2.vizimax.com ([216.208.233.162])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RTGo6-000322-KY
 for linux-mtd@lists.infradead.org; Wed, 23 Nov 2011 17:40:27 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH] mtd/nand: Add NAND chip ID to support Micron 4k pagesize
 NAND chip
Date: Wed, 23 Nov 2011 12:40:21 -0500
Message-ID: <225442585F89274EA3A62F88671ECBAC0D60B8ED@prod-svr-1.intranet.str.ca>
In-Reply-To: <CAN8TOE-kgmNy+t0ZBW8c8Goj2HGwBVMHU2c55NUGDJYwWn3PMw@mail.gmail.com>
References: <1322017153-6783-1-git-send-email-Shengzhou.Liu@freescale.com>
 <CAN8TOE-kgmNy+t0ZBW8c8Goj2HGwBVMHU2c55NUGDJYwWn3PMw@mail.gmail.com>
From: =?iso-8859-1?Q?Jean-S=E9bastien_Gagnon?= <jsgagnon@vizimax.com>
To: "Brian Norris" <computersforpeace@gmail.com>,
 "Shengzhou Liu" <Shengzhou.Liu@freescale.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If we really want to add a line for the Micron MT29F8G08ABABA,=20
The line should be like this, since we cannot detect the layout:

+	{"NAND 1GiB 3,3V 8-bit",	0x38, 4096, 1024, 0x80000, LP_OPTIONS | =
NAND_NO_SUBPAGE_WRITE},

But like Brian said, ONFI should be used, otherwise, any newer device =
with the same ID (0x38) will
Probably be detected with wrong settings.

Also note that this device must be used with at least 4 ECC bits/512 =
bytes.

J-S

>=20
> Hi,
>
> On Tue, Nov 22, 2011 at 6:59 PM, Shengzhou Liu
> <Shengzhou.Liu@freescale.com> wrote:
> > Add NAND chip ID 0x38 in ids table to support Micron 4k large-page =
NAND chip.
>
> Do you have an example part number for which this patch is necessary?
> I see that Micron MT29F8G08ABABA, for instance, has this ID, but
> listing its ID in nand_ids.c is useless because there is no ID
> decoding pattern for the rest of its ID string. AFAIK, all 0x38 chips
> are ONFI-only and should not be included in nand_ids.c.
>
> Brian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
