Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PHOrY-0007Le-WB
	for linux-mtd@lists.infradead.org; Sat, 13 Nov 2010 22:46:25 +0000
Received: by wwi17 with SMTP id 17so3542309wwi.18
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Nov 2010 14:46:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1289648919.2218.39.camel@localhost>
References: <1288772847-8120-1-git-send-email-computersforpeace@gmail.com>
	<1288772847-8120-6-git-send-email-computersforpeace@gmail.com>
	<1289648919.2218.39.camel@localhost>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Sat, 13 Nov 2010 17:45:51 -0500
Message-ID: <AANLkTinOWWgUX4y6KR4C=zshV4sjpmUxZu3xPKk4z8np@mail.gmail.com>
Subject: Re: [PATCH 06/10] mtd-utils: nandwrite: Use 64-bit offset
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org, Jehan Bing <jehan@orb.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Nov 13, 2010 at 06:48, Artem Bityutskiy wrote:
> On Wed, 2010-11-03 at 01:27 -0700, Brian Norris wrote:
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mtdoffset =3D strtol(optarg, NULL, 0);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mtdoffset =3D strtoll(optarg, NULL, 0);
>
> Ideally this should check for strtoll failures, but this just a side
> note. Not sure if this is the best way, but I'd do it like this:
>
> char *endp;
>
> mtdoffset =3D strtoul(optarg, &endp, 0);
> if (*endp !=3D '\0' || endp =3D=3D optarg)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return errmsg("bad volume alignment: \"%s\"", =
optarg);
>
> or something like this. The check for negative mtdoffset could be there
> as well.

or use simple_strtoll() from common.h as that includes error handling ...
-mike
