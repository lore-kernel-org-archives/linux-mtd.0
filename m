From: tglx@linutronix.de (Thomas Gleixner)
Date: Wed, 12 Mar 2003 20:53:12 +0100
Subject: How to fix JFFS2 with some kind of repair tool or manually?
In-Reply-To: <oprlxldmqr7bj7b7@cbnsitar.cbnco.com>
References: <oprlxldmqr7bj7b7@cbnsitar.cbnco.com>
Message-ID: <200303122053.12261.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wednesday 12 March 2003 17:57, Vladimir Doukhanine wrote:
> Hi,
> I=E2=80=99m just looking for an advice. My JFFS2 FS has some errors and=
 I=E2=80=99d like to
> find a way to fix them.
> An image of the JFFS2 was created on some other platform, which is not
> accessible anymore. Also I have no more devices to create another FS ex=
cept
> RAM and almost no free space on the JFFS2. How to fix JFFS2 with some k=
ind
> of repair tool or manually?
Just copy a bunch of files around, until all that offending entries are=20
removed by garbage-collect..

--=20
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
