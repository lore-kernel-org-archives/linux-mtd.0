Received: from mail-in-03.arcor-online.net ([151.189.21.43])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UV5wR-0002MA-C9
 for linux-mtd@lists.infradead.org; Wed, 24 Apr 2013 20:05:24 +0000
Received: from mail-in-15-z2.arcor-online.net (mail-in-15-z2.arcor-online.net
 [151.189.8.32]) by mx.arcor.de (Postfix) with ESMTP id DF2F8D7F19
 for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2013 21:32:47 +0200 (CEST)
Received: from mail-in-17.arcor-online.net (mail-in-17.arcor-online.net
 [151.189.21.57])
 by mail-in-15-z2.arcor-online.net (Postfix) with ESMTP id AC49933F5CD
 for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2013 21:32:47 +0200 (CEST)
Received: from antares (xdsl-89-0-103-241.netcologne.de [89.0.103.241])
 (Authenticated sender: dralbrecht.dress@arcor.de)
 by mail-in-17.arcor-online.net (Postfix) with ESMTPSA id 9A2EECBC53
 for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2013 21:32:47 +0200 (CEST)
Received: from antares (antares [127.0.0.1])
 by antares (Postfix) with ESMTPS id 3934BB4071
 for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2013 21:32:46 +0200 (CEST)
Date: Wed, 24 Apr 2013 21:32:38 +0200
From: Albrecht =?iso-8859-1?b?RHJl3w==?= <albrecht.dress@arcor.de>
Subject: Q: jffs2 startup slow-down / cleanup
To: linux-mtd@lists.infradead.org
Message-Id: <1366831965.2912.0@antares>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 protocol="application/pgp-signature"; boundary="=-+7cOmOLYUtZYznUExymx"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=-+7cOmOLYUtZYznUExymx
Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

I use a PPC-based system, running kernel 3.2.41, including a 512 kByte NV R=
AM chip which is integrated as mtd-ram with a JFFS2 file system with lzo co=
mpression.  In fs/jffs2/background.c, I found the note

	/* Problem - immediately after bootup, the GCD spends a lot
	 * of time in places like jffs2_kill_fragtree(); so much so
	 * that userspace processes (like gdm and X) are starved
	 * despite plenty of cond_resched()s and renicing.  Yield()
	 * doesn't help, either (presumably because userspace and GCD
	 * are generally competing for a higher latency resource -
	 * disk).

The first task I launch activates the hardware watchdog of the system, and =
accesses data on the NV RAM.  When the NV RAM is newly initialised, everyth=
ing works fine, i.e. a high load after booting is visible only for a very s=
hort period (<< 1 second).

I then create, modify and erase files on that file system, and apparently t=
he time needed increases with each boot (I observed about 3-4 seconds) - up=
 to a point where the user space process is too slow the trigger the wdt pr=
operly.  Thus, the system is rebooted by the wdt, which again checks the JF=
FS2 in background, and the wdt triggers...  The only remedy in this situati=
on is to erase the NV RAM by removing the buffer battery.

I could add a delay between mounting the NV RAM and starting my main applic=
ation, but of course this is not desirable, as the system should come up as=
 quick as possible.  The alternative would be waiting until the background =
task has finished, or to regularly "clean up" the jffs2.

My questions:

- Is it possible to detect (e.g. through sysfs) when the background task ha=
s finished, so it's safe to activate the WDT (i.e. optimise the delay betwe=
en mount and wdt activation)?

- Is it possible to clean/re-organise the jffs2 so the background process n=
eeds less time (optimal: a constant time) after booting?

Thanks in advance,
Albrecht.=

--=-+7cOmOLYUtZYznUExymx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iD8DBQBReDNdn/9unNAn/9ERAiWHAJsGoiwkowxNIzbc0xxTGKhsJha27ACaApZ0
9/ete0fTqxtqMNJqy91NkGY=
=5Xxu
-----END PGP SIGNATURE-----

--=-+7cOmOLYUtZYznUExymx--
