Received: from fitch2.uni2.net ([130.227.52.105])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C2yFd-0001CS-L6
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2004 16:32:11 -0400
Received: from intermail2000.pallasdomain (firewall.pallas.dk [130.227.11.8])
	by fitch2.uni2.net (8.12.6/8.11.6) with ESMTP id i82KW1Yl017397
	for <linux-mtd@lists.infradead.org>; Thu, 2 Sep 2004 22:32:01 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 2 Sep 2004 22:31:57 +0200
Message-ID: <E8B61FD29D18EE4F849311F6423A9AF4231ABC@intermail.pallas.dk>
From: "Agust Karlsson" <Gusti@pallas.dk>
To: <linux-mtd@lists.infradead.org>
Subject: AM29F016 Jedec/CFI
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.
I have been using MTD/JFFS2 on 2 Fujitsu AM29F016 chips for some while =
(with an old release of MTD).
Until now I have used it as a plain Jedec device, but now I need the =
erase suspend functionality.
So my question is, has anybody any experience of using that chip as a =
CFI device. According to tha data sheets it should be possible, but I =
can't get it to respond to the query.

Best regards.

Agust Karlsson            mailto:gusti@pallas.dk
Pallas Informatik A/S     http://www.pallas.dk
Aller=F8d Stationsvej 2D    Tel.: +45 48 10 24 10
DK-3450 Aller=F8d           Fax.: +45 48 10 24 01
