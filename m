Received: from mail-fx0-f49.google.com ([209.85.161.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RTGyn-00019A-MX
 for linux-mtd@lists.infradead.org; Wed, 23 Nov 2011 17:51:30 +0000
Received: by faar25 with SMTP id r25so2497154faa.36
 for <linux-mtd@lists.infradead.org>; Wed, 23 Nov 2011 09:51:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <225442585F89274EA3A62F88671ECBAC0D60B8ED@prod-svr-1.intranet.str.ca>
References: <1322017153-6783-1-git-send-email-Shengzhou.Liu@freescale.com>
 <CAN8TOE-kgmNy+t0ZBW8c8Goj2HGwBVMHU2c55NUGDJYwWn3PMw@mail.gmail.com>
 <225442585F89274EA3A62F88671ECBAC0D60B8ED@prod-svr-1.intranet.str.ca>
Date: Wed, 23 Nov 2011 09:51:26 -0800
Message-ID: <CAN8TOE9Uzekgw0QcsqceUgwn=AXs8rqDWtZe5ZEUpeg+CK9Ptg@mail.gmail.com>
Subject: Re: [PATCH] mtd/nand: Add NAND chip ID to support Micron 4k pagesize
 NAND chip
From: Brian Norris <computersforpeace@gmail.com>
To: =?ISO-8859-1?Q?Jean=2DS=E9bastien_Gagnon?= <jsgagnon@vizimax.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Shengzhou Liu <Shengzhou.Liu@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2011/11/23 Jean-S=E9bastien Gagnon <jsgagnon@vizimax.com>:
> If we really want to add a line for the Micron MT29F8G08ABABA,
> The line should be like this, since we cannot detect the layout:
>
> + =A0 =A0 =A0 {"NAND 1GiB 3,3V 8-bit", =A0 =A0 =A0 =A00x38, 4096, 1024, 0=
x80000, LP_OPTIONS | NAND_NO_SUBPAGE_WRITE},

This would give the wrong OOB-size, though, since this hard-coding
mechanism assumes that:
    mtd->oobsize =3D mtd->writesize / 32;
Thus, we get oobsize =3D 128 instead of oobsize =3D 224.

> But like Brian said, ONFI should be used, otherwise, any newer device wit=
h the same ID (0x38) will
> Probably be detected with wrong settings.

None exist that I know of for now but valid point.

Brian
