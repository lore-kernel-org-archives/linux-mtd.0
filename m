Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EWZKh-0003gF-4Z
	for linux-mtd@lists.infradead.org; Mon, 31 Oct 2005 08:04:22 -0500
Message-ID: <4366162C.4050406@yandex.ru>
Date: Mon, 31 Oct 2005 16:03:40 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?=22Fredrik_J=F6nsson_B_=28AL/EAB=29=22?=
	<fredrik.b.jonsson@ericsson.com>
References: <EF4121B4EBC4E045BDE1273F9D0A87FFCD410C@esealmw107.eemea.ericsson.se>
In-Reply-To: <EF4121B4EBC4E045BDE1273F9D0A87FFCD410C@esealmw107.eemea.ericsson.se>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Subject: Re: The magic bitmask question - again
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fredrik J=F6nsson B (AL/EAB) wrote:
> This may be a stupid question, but I still need to ask.
>=20
> We have a system with a 128Mb NOR-flash of which 3Mb is used as a
> keep-off area for the kernel and the rest for a JFFS2 root file
> system.
128 Megabit?

> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at
> 0x00000000: 0x4800 instead
This message says that there is something unexpected at the offset=20
0x00000000 of the JFFS2 partition. JFFS2 expects there is either a node=20
there (most likely a clean marker node) or the block contains all 0xFF.

How can this garbage get into the beginning of an eraseblock? No idea.=20
May be this is an effect of an unclean reboot? But if it happens often=20
it is strange and looks like something not normal. Or the other=20
possibility is that you did not erase your flash properly before putting =

the JFFS2 image there. And also it may be the result of hardware/driver=20
problems.

Try to play with this. Try to erase the partition, check that it=20
actually contain all 0xFFs, flash your image, compare with the original, =

mount and see is there are such messages.

--=20
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
