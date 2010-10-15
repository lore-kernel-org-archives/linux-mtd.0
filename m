Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P6pb1-0004Qa-DP
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2010 19:05:40 +0000
Received: by wyi11 with SMTP id 11so1166424wyi.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Oct 2010 12:05:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1287128665-6573-3-git-send-email-computersforpeace@gmail.com>
References: <1287128665-6573-1-git-send-email-computersforpeace@gmail.com>
	<1287128665-6573-3-git-send-email-computersforpeace@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 15 Oct 2010 14:58:09 -0400
Message-ID: <AANLkTik2v8=Lx+HKFTQdgh4czjYuz6P5uevThvAOFcAE@mail.gmail.com>
Subject: Re: [PATCH 3/3] mtd-utils: nandwrite: Large page+oob support
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
> + =C2=A0 =C2=A0 =C2=A0 oobbuf =3D (unsigned char *)malloc(meminfo.oobsize=
);

include common.h and use xmalloc.  also, the malloc cast is useless, so dro=
p it.
> - =C2=A0 =C2=A0 =C2=A0 if (filebuf) {
> + =C2=A0 =C2=A0 =C2=A0 if (filebuf)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(filebuf);
> - =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 if (oobbuf)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(oobbuf);

free(NULL) works fine, so drop the "if" check.
-mike
