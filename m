Received: from [66.89.142.11] (helo=exalane.intransa.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16W081-0004K3-00
	for <linux-mtd@lists.infradead.org>; Wed, 30 Jan 2002 19:10:42 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: looking for pushpull.c [newbie question]
Date: Wed, 30 Jan 2002 11:21:59 -0800
Message-ID: <EA23924D8B48774F889C7733226B28E80E7D99@exalane.intransa.com>
From: "Paul Lai" <paul.lai@intransa.com>
To: "Mtd-Linux (E-mail)" <linux-mtd@lists.infradead.org>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hello All:

So far I've been successful with recognizing/reading/writing my flash
(via mtd*.o & cfi_*.o) and erasing (via util/erase).

The current I'm trying to take is to build a jffs2 fs.  The HOWTO says
to use mkfs.jffs to buid a jffs fs, so by extrapolation I'm assuming a
mkfs.jffs2 should be used to build the jffs2 fs.  In mtd/util, mkfs.jffs
compiles/builds fine.  Whereas, mkfs.jffs2 seems to need pushpull.c.  A
quick find of mtd doesn't discover a pushpull.c -- only pushpull.h.  A
new checkout of the mtd sources doesn't produce this file.  The CVS tree
on the web doesn't have one either.  A look at lk-2.4.9 sources doesn't
find one.  A grep of the source files doesn't show a place where a
pushpull.c might be generated.

So, where's pushpull.c?  Where am I not looking?

Thanks,
-Paul
