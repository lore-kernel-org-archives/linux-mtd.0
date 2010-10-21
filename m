Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P8piF-0000n3-9h
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2010 07:37:23 +0000
Received: by wyi11 with SMTP id 11so4988122wyi.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Oct 2010 00:37:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1287645577-13538-2-git-send-email-computersforpeace@gmail.com>
References: <1287645577-13538-1-git-send-email-computersforpeace@gmail.com>
	<1287645577-13538-2-git-send-email-computersforpeace@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 21 Oct 2010 03:37:00 -0400
Message-ID: <AANLkTikthtaMh0qjFVLu29ZbageANnd_JsbB7wLqiMSM@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mtd-utils: nanddump/nandwrite: style, signed-ness,
	printing fixups
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

On Thu, Oct 21, 2010 at 03:19, Brian Norris wrote:
> There were some signed/unsigned integer comparisons. Their types were
> changed for safety. Also, "strtol" was improperly used for unsigned
> data types.

dont really like these being merged, but that's obviously Artem's call, not=
 mine

> - =C2=A0 =C2=A0 =C2=A0 while (lx < (linebuflen - 1) && lx < (ascii_column=
 - 1))
> + =C2=A0 =C2=A0 =C2=A0 do {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linebuf[lx++] =3D =
' ';
> + =C2=A0 =C2=A0 =C2=A0 } while (lx < (linebuflen - 1) && lx < (ascii_colu=
mn - 1));

hmm, unrelated to your changes, but i'm pretty sure this can be
rewritten into a sprintf ...
  sprintf(linebuf + lx, "%*s", (linebuflen - 1) - lx, "")
and integrating the ascii_column stuff too.  or maybe that's too complicate=
d.
-mike
