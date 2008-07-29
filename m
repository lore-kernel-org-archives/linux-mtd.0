Subject: 2nd problem with read_subpage() ?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Jul 2008 09:53:52 +0300
Message-Id: <1217314432.3124.9.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Glance at nand_do_read_ops():


if (likely(sndcmd)) {
        chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
        sndcmd =3D 0;
}

/* Now read the page into the buffer */
if (unlikely(ops->mode =3D=3D MTD_OOB_RAW))
        ret =3D chip->ecc.read_page_raw(mtd, chip, bufpoi);
else if (!aligned && NAND_SUBPAGE_READ(chip) && !oob)
        ret =3D chip->ecc.read_subpage(mtd, chip, col, bytes, bufpoi);
else
        ret =3D chip->ecc.read_page(mtd, chip, bufpoi);
if (ret < 0)
        break;


What happens is that first NAND_CMD_READ0 command is sent, and the
chip reads _full_ page 0. Then read_subpage() is called and chip
reads the subpage again. Does it make any sense?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
