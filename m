Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OcTCx-0006CI-BG
	for linux-mtd@lists.infradead.org; Sat, 24 Jul 2010 01:07:20 +0000
Received: by vws11 with SMTP id 11so946636vws.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 Jul 2010 18:07:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1279427219.16247.5.camel@localhost.localdomain>
References: <eb53f5a0215250d7e523de47d15b0d12@localhost>
	<c65631c48fb5d2de8d25f65bffa5e22d@localhost>
	<1279386513.7515.33.camel@localhost.localdomain>
	<1279427219.16247.5.camel@localhost.localdomain>
Date: Fri, 23 Jul 2010 18:07:17 -0700
Message-ID: <AANLkTikddtAwHnOs8weap9+eaxXkZY01DLHCST0VK+vd@mail.gmail.com>
Subject: Re: [PATCHv2 4/5] libmtd: add support for 64-bit offsets, OOB
From: Kevin Cernekee <cernekee@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, jwboyer@gmail.com, saeed.bishara@gmail.com,
	vapier.adi@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jul 17, 2010 at 9:26 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> +int do_oob_op(libmtd_t desc, const struct mtd_dev_info *mtd, int fd,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t start, uint64_t leng=
th, void *data, int cmd64, int cmd)

cmd64 should be an unsigned int.  When it gets compared to
MEMREADOOB64 (0xc0184d16), gcc says "comparison is always false due to
limited range of data type."

> + =C2=A0 =C2=A0 =C2=A0 if (cmd64 =3D=3D =C2=A0MEMREADOOB64) {

Extra space after =3D=3D

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* MEMREADOOB64/M=
EMWRITEOOB64 support was added in kernel
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* version 2.6.30=
, so probably we are working with older kernel
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* and these ioct=
ls are not supported.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/

The new sysfs attributes were in 2.6.30, but the new ioctls did not
make it in until 2.6.31 (commit 0dc54e).
