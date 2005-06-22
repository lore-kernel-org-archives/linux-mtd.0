Received: from rproxy.gmail.com ([64.233.170.206])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DlC09-00028p-RV
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2005 16:39:14 -0400
Received: by rproxy.gmail.com with SMTP id c16so180725rne
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Jun 2005 13:39:09 -0700 (PDT)
Message-ID: <61cc712d05062213393c397c6d@mail.gmail.com>
Date: Wed, 22 Jun 2005 13:39:09 -0700
From: Kylo Ginsberg <kylo.ginsberg@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: jffs2 root fs: how to overwrite it?
Reply-To: Kylo Ginsberg <kylo.ginsberg@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a jffs2 root file system.  As part of the user upgrade process,
running from linux, I need to blow the root fs away and replace it
with a new version.  One solution is to reserve a second piece of
flash for this purpose, copy it there on user request and instruct
u-boot to handle the copy, but I'd like not to waste the flash space.=20
Ideally, I'd have an inittab shutdown script umount root (if this is
possible) and copy an image from mem -> flash before rebooting.  Or
something of that sort.

How else do people accomplish this?  Thanks for your comments.

Kylo
