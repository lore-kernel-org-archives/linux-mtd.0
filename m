Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P8SdZ-0007Ww-4m
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2010 06:59:01 +0000
Received: by wyi11 with SMTP id 11so3639671wyi.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Oct 2010 23:58:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1287557125-2672-1-git-send-email-computersforpeace@gmail.com>
References: <1287557125-2672-1-git-send-email-computersforpeace@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 20 Oct 2010 02:58:37 -0400
Message-ID: <AANLkTinHRsvyH30UcCQZWKihHCPivDz8C0-9J+fLdciF@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd-utils: more style fixups
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 20, 2010 at 02:45, Brian Norris wrote:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ioctl(fd, MTDF=
ILEMODE, (void *) MTD_MODE_RAW);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ioctl(fd, MTDF=
ILEMODE, (void *)MTD_MODE_RAW);

i'd just drop the cast completely.  ioctl() is a vararg func so there
is no need to tweak the type.
-mike
