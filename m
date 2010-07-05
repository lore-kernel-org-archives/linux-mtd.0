Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OVud5-00020h-1L
	for linux-mtd@lists.infradead.org; Mon, 05 Jul 2010 22:59:11 +0000
Received: by gwaa18 with SMTP id a18so960165gwa.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 05 Jul 2010 15:59:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <b025d903aab9bff2a1f0ddadff7f31a8@localhost>
References: <4822394121cd0a8f08b0bd3ecd6af199@localhost>
	<b025d903aab9bff2a1f0ddadff7f31a8@localhost>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 5 Jul 2010 18:58:49 -0400
Message-ID: <AANLkTilkCKGDJTINit1rCaVlmGlollKfaUGdnOsZcMdF@mail.gmail.com>
Subject: Re: [PATCH 4/5] libmtd: add support for 64-bit offsets, OOB
To: Kevin Cernekee <cernekee@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, jwboyer@gmail.com, saeed.bishara@gmail.com,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 5, 2010 at 18:10, Kevin Cernekee wrote:
> Change mtd_erase() so that it attempts to use MEMERASE64 first, then fall=
s
> back to the old <2.6.31 MEMERASE if MEMERASE64 is unsupported.

very cool

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct erase_info_user=
 ei_old;
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ei_old.start =3D (__u3=
2)ei.start;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ei_old.length =3D (__u=
32)ei.length;

the casts are useless since the assigned types are __u32

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct mtd_oob_buf oob=
_old;
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oob_old.start =3D (__u=
32)oob.start;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oob_old.length =3D (__=
u32)oob.length;

same here
-mike
