Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PATvl-00068T-7Y
	for linux-mtd@lists.infradead.org; Mon, 25 Oct 2010 20:46:09 +0000
Received: by ewy19 with SMTP id 19so1860749ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Oct 2010 13:46:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1288033416.1865.2.camel@brekeke>
References: <201010211643.33332.manningc2@actrix.gen.nz>
	<1288033416.1865.2.camel@brekeke>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 25 Oct 2010 16:45:46 -0400
Message-ID: <AANLkTikd9uTV+8bRhjKt8P0vXC6p0FUbWd=bb6k2FGKi@mail.gmail.com>
Subject: Re: Issues with ubi utils Makefile
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Charles Manning <manningc2@actrix.gen.nz>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 25, 2010 at 15:03, Artem Bityutskiy wrote:
> Commit 96a4f76f2e9dad7fdbd6fd7740de44bc90d5769e broke 'make install'.
> Before that commit, $DESTDIR was undefined, so =C2=A0${DESTDIR}/${SBINDIR=
}
> was /usr/sbin, and after the commit $DESTDIR became /usr/local, so
> ${DESTDIR}/${SBINDIR} became /usr/local//usr/sbin, which is wrong.

that isnt really true.  DESTDIR had value in makefiles before my changes.

> Fix this by making $DESTDIR become the distination directory of installin=
g,
> i.e. 'DESTDIR ?=3D /usr' and making SBINDIR become just 'sbin'.

i'd rather we change DESTDIR to match the standard -- it's a "root"
prefix only.  so the default should be:
DESTDIR ?=3D
-mike
