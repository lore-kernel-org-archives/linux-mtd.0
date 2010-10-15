Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P6oVd-0001ns-Jn
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2010 17:56:02 +0000
Received: by ewy7 with SMTP id 7so702082ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Oct 2010 10:56:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1287128665-6573-2-git-send-email-computersforpeace@gmail.com>
References: <1287128665-6573-1-git-send-email-computersforpeace@gmail.com>
	<1287128665-6573-2-git-send-email-computersforpeace@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 15 Oct 2010 13:55:39 -0400
Message-ID: <AANLkTi=XdvN2vGu7Z5M7jj=z_qrx=9F93WiDnPYkcDgY@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd-utils: nanddump: Dynamic buffer,
	increase pagesize/oobsize
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

On Fri, Oct 15, 2010 at 03:44, Brian Norris wrote:
> + =C2=A0 =C2=A0 =C2=A0 static unsigned char *readbuf, *oobbuf;

no need to make these static still

> + =C2=A0 =C2=A0 =C2=A0 oobbuf =3D malloc(sizeof(oobbuf) * meminfo.oobsize=
);
> +       readbuf =3D malloc(sizeof(readbuf) * meminfo.writesize);

include common.h and use xmalloc

> - =C2=A0 =C2=A0 =C2=A0 close(fd);
> - =C2=A0 =C2=A0 =C2=A0 close(ofd);
> + =C2=A0 =C2=A0 =C2=A0 if (fd) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ofd) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 close(ofd);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 }

0 is a valid fd, thus these checks on the value of the fd dont make
much sense.  i would leave the code as it was.

> + =C2=A0 =C2=A0 =C2=A0 if (oobbuf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(oobbuf);
> + =C2=A0 =C2=A0 =C2=A0 if (readbuf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(readbuf);

drop the "if".  free(NULL) works just fine.
-mike
