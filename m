Received: from mx2.atitech.com ([204.176.13.66] helo=mx2.ati.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CyDz1-0006z2-KY
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2005 13:51:40 -0500
Received: from smmail.ma.atitech.com (fwma1.atitech.com [204.176.13.6])
	by mx2.ati.com (8.10.0/8.10.0) with ESMTP id j17IpZa20230
	for <linux-mtd@lists.infradead.org>;
	Mon, 7 Feb 2005 13:51:35 -0500 (EST)
Received: from ma00exh02.atitech.com (ma00exh02 [129.100.2.8])
	by smmail.ma.atitech.com (8.12.10+Sun/8.12.11) with ESMTP id
	j17IpTm4015565 for <linux-mtd@lists.infradead.org>;
	Mon, 7 Feb 2005 13:51:29 -0500 (EST)
Message-ID: <54CC136E5398384485619BC34B3A0F0B055D0DB0@ma00exh02.atitech.com>
From: Matthew Cole <mcole@ati.com>
To: linux-mtd@lists.infradead.org
Date: Mon, 7 Feb 2005 13:51:22 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Follow-up to wearing / caching question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The question posed by Martin Neilsen leads me to write in search of an
answer that I've been pondering for a few days.  I've been tasked with
approximating the lifespan of the flash (JFFS2) filesystem embedded in =
our
products.  Is there a best method for calculating the space required =
for a
fixed-size file over a given lifespan?  If we want our flash filesystem =
to
be available for an approximate lifespan of 20 years, given the
wear-leveling duty-cycle of JFFS2, and an average block endurance of =
100k
write/erase cycles, would I need 150% of the file's size? 200%? 1000%?  =
The
worst-case answer should be acceptable, but obviously, the =
most-realistic
case is what we're aiming for.  The actual read/write duty cycle of the
application is quite variable, so that adds some complexity to the =
problem,
but a good guess for now would be that it writes the entire file out to
flash once a minute.  But as that is an independent variable, maybe =
someone
could help me solve for that over a span of duty cycles?

I'd very much appreciate any input that anyone could offer me on this
problem.

Matthew Cole
Software Engineer
DTV Systems
ATI Research, Inc.
62 Forest St.
Marlborough, MA 01752
=A0
mcole@ati.com
O: 508-486-1179
F: 508-303-3920
C: 508-241-7923
