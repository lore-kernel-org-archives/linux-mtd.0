Received: from relay04.roc.ny.frontiernet.net ([66.133.182.167])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EdXJO-00026L-Gu
	for linux-mtd@lists.infradead.org; Sat, 19 Nov 2005 13:19:45 -0500
From: John Bowler <jbowler@acm.org>
To: "'David Vrabel'" <dvrabel@arcom.com>
Date: Sat, 19 Nov 2005 10:17:32 -0800
Message-ID: <001401c5ed35$83316830$1001a8c0@kalmiopsis>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <437B5FD8.9060900@arcom.com>
Cc: linux-mtd@lists.infradead.org,
	'Alessandro Zummo' <azummo-lists@towertech.it>
Subject: RE: [PATCH] [MTD] MAPS/ixp4xx.c: fix BE system break in 2.6.15-rc1,
	enable LE operation in 2.6.15
Reply-To: jbowler@acm.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

So far we've verified the *BE* part pretty much completely, but only
verified LE by code examination (it looks fine to me).  Anyway, I don't
anticipate any problems.

John Bowler <jbowler@acm.org>
