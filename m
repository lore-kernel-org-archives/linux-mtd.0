Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HARDM-0005Hk-AN
	for linux-mtd@lists.infradead.org; Fri, 26 Jan 2007 08:34:04 -0500
Subject: Re: [PATCH][UBI] remove __exit on functions referenced in '.text'
	or '.init.text'
From: Artem Bityutskiy <dedekind@infradead.org>
To: bene@linutronix.de
In-Reply-To: <39678.212.184.22.162.1169809215.squirrel@www.tglx.de>
References: <20070122230954.1b7f77e6.b.spranger@linutronix.de>
	<1169656229.3609.4.camel@sauron>
	<39678.212.184.22.162.1169809215.squirrel@www.tglx.de>
Content-Type: text/plain; charset=utf-8
Date: Fri, 26 Jan 2007 15:33:41 +0200
Message-Id: <1169818421.9477.30.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Benedikt Spranger <b.spranger@linutronix.de>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-01-26 at 12:00 +0100, bene@linutronix.de wrote:
> `ubi_sysfs_vol_close' referenced in section `.text' of drivers/built-in.o=
:
> defined in discarded section `.exit.text' of
> drivers/built-in.o`ubi_sysfs_vol_close' referenced in section `.text' of
> drivers/built-in.o: defined in discarded section `.exit.text' of
> drivers/built-in.o`ubi_sysfs_vol_close' referenced in section `.text' of
> drivers/built-in.o: defined in discarded section `.exit.text' of
> drivers/built-in.o`ubi_sysfs_close' referenced in section `.text' of
> drivers/built-in.o: defined in discarded section `.exit.text' of
> drivers/built-in.o`ubi_sysfs_close' referenced in section `.init.text' of
> drivers/built-in.o: defined in discarded section `.exit.text' of
> drivers/built-in.o

Hmm...

'ubi_sysfs_vol_close()' has nor __init/__exit prefix so it has to be
in .text.

But it is called from the 'delete_volumes()' function which has __exit
attribute.

So we reference 'ubi_sysfs_vol_close' which is in .text from .exit.text.
But why is this a problem?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
