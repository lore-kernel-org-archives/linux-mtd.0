Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GPydI-0002sD-4t
	for linux-mtd@lists.infradead.org; Wed, 20 Sep 2006 10:44:44 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: JFFS2 appears to "freeze" during erase
Date: Wed, 20 Sep 2006 11:30:41 +0200
Message-ID: <F6AD7E21CDF4E145A44F61F43EE6D9399B42C8@tmnt04.transmode.se>
From: "Joakim Tjernlund" <joakim.tjernlund@transmode.se>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi list

We have been using JFFS2 since around 2001 on linux 2.4 and it has
worked well
for us. Now we are upgrading to 2.6 and and I see a problem that was
solved=20
long time ago in our JFFS2 tree:=20

When JFFS2 is starts on a fresh FS without clean markers or if I remove
a large file,
futher FS operations hangs as if all pending erase operations has to be
completed
before futher activity is allowed.

Is this the expected behaviour today or a bug? I see this
on linux 2.6.11 and 2.6.17 on powerpc.
Flash: Intel Strata P30 family.

 Jocke

PS.
    http://lists.infradead.org/ seems dead.
