Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FQh8I-00039Z-Ke
	for linux-mtd@lists.infradead.org; Tue, 04 Apr 2006 04:43:39 -0400
Message-ID: <4432318E.5050002@yandex.ru>
Date: Tue, 04 Apr 2006 12:42:54 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <20060329232520.1677d2b3.akpm@osdl.org>	<442C0494.2040609@zytor.com>	<20060330114014.53150d1b.akpm@osdl.org>	<442C6B78.3060706@zytor.com>
	<m3hd5anj51.fsf@maxwell.lnxi.com>	<4431E304.6020908@zytor.com>
	<20060404083019.GA9747@wohnheim.fh-wedel.de>
In-Reply-To: <20060404083019.GA9747@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: blkmtd and name_to_dev_t
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel wrote:
  > You are not wrong.
>=20
> A possibly better way to deliver the same functionality (jffs2 rootfs
> on block device through emulation) might be to add transparent
> translation support to jffs2.  Something that will make "mount
> /dev/hda1 /mnt -t jffs2" work.  How exactly the code for this should
> look, I don't know yet.  But given that jffs2 is the only sane user of
> bd->mtd translation, it looks like the Right Thing to me.

This is a bit out of context and I'm not arguing. Just wanted to note.=20
Mount and linux long support device-less mount. The beset way to mount=20
JFFS2 would be to do like this:

mount mtd0 /mnt/jffs2 -t jffs2

No need to have any fake block device, no need to have any device node=20
at all. JFFS2 seems to (not sure) not support this but it is trivial to a=
dd.

I tend to think that this mtdblock fake stuff is some ancient crap and=20
has to go and not confuse people.

--=20
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
