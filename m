Received: from mail-bw0-f215.google.com ([209.85.218.215])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NovD2-0006BM-Ax
	for linux-mtd@lists.infradead.org; Tue, 09 Mar 2010 08:54:41 +0000
Received: by bwz7 with SMTP id 7so5285091bwz.4
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Mar 2010 00:54:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <804f0d21003090023h1787eebds8106b4fea1b0e7b4@mail.gmail.com>
References: <804f0d21003080735q49fb834bo3369987059b17208@mail.gmail.com>
	<ce9ab5791003082107r43df18by8cbcd8a9f589c326@mail.gmail.com>
	<804f0d21003090023h1787eebds8106b4fea1b0e7b4@mail.gmail.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Tue, 9 Mar 2010 14:24:14 +0530
Message-ID: <ce9ab5791003090054k386d4cbejf40875e43a1c9584@mail.gmail.com>
Subject: Re: flashcp failed (bad block)?
To: Arno Steffen <arno.steffen@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Thanks. That's true, mtd6 doesn't have bad blocks
> I did a
> "flash_eraseall -j /dev/mtd5" =A0 =A0and
> "nandwrite -amp /dev/mtd5 /tmp/rootfs.jffs2"
>
> ( I tried the =A0some options but get
> nandwrite -ajmp /dev/mtd5 /tmp/rootfs.jffs2
> Autoplacement is not possible for legacy -j/-y options
> [root@SPV ]# nandwrite -jmp /dev/mtd5 /tmp/rootfs.jffs2
> MEMSETOOBSEL: Inappropriate ioctl for device )

You need not to specify '-aj' options. I use to give only '-p' option.


--=20
Regards,
Vimal Singh
