Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OcUhv-0006R9-7F
	for linux-mtd@lists.infradead.org; Sat, 24 Jul 2010 02:43:23 +0000
Received: by vws11 with SMTP id 11so1000920vws.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 Jul 2010 19:43:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1279386513.7515.33.camel@localhost.localdomain>
References: <eb53f5a0215250d7e523de47d15b0d12@localhost>
	<c65631c48fb5d2de8d25f65bffa5e22d@localhost>
	<1279386513.7515.33.camel@localhost.localdomain>
Date: Fri, 23 Jul 2010 19:43:21 -0700
Message-ID: <AANLkTinJ5u2BPk5e-46cL10=c5cG_3sFEQixZymwqU-w@mail.gmail.com>
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

On Sat, Jul 17, 2010 at 10:08 AM, Artem Bityutskiy <dedekind1@gmail.com> wr=
ote:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* MEMERASE64 sup=
port was added in kernel version 2.6.30, so
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* probably we ar=
e working with older kernel and this ioctl is
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* not supported.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/

s/2.6.30/2.6.31/

I applied both of your patches, applied my flash_eraseall v3 patch,
then tested erase only (no OOB) on 2.6.18 and 2.6.31.  Works fine.  I
verified with strace that the proper ioctl was being called in each
instance.

Thanks.
