Received: from mail.tqs.de ([62.157.136.17])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EzU5z-0004uj-9k
	for linux-mtd@lists.infradead.org; Thu, 19 Jan 2006 02:20:41 -0500
Received: from tq-mailsrv.tq-net.de (tq-mailsrv.tqs.de [172.20.1.2])
	by mail.tqs.de (Postfix) with ESMTP id 78C8E785D
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Jan 2006 08:20:35 +0100 (CET)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Jan 2006 08:20:36 +0100
Message-ID: <47F3F98010FF784EBEE6526EAAB078D1C05FA3@tq-mailsrv.tq-net.de>
From: "Martin Krause" <Martin.Krause@tqs.de>
To: <linux-mtd@lists.infradead.org>
Subject: NAND flash on MPC8xxx via UPM
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

we are working on a new board with a MPC8272 cpu. We plan to connect
the NAND flashes over the Local Bus Controller and control it via
the UPM, like described in the freescale application note:
"How to Interface the PowerQUICC II Pro and PowerQUICC III Local
Bus Controller to NAND Flash":

http://www.freescale.com/files/32bit/doc/white_paper/NANDFLASHWP.pdf

I'm wondering, if this had been done already by someone or if there
is a working lowlevel driver? Or perhaps someone is currently working
on a driver or has plans to do so?

Regards,
Martin

TQ-Systems GmbH
M=FChlstra=DFe 2, Gut Delling, 82229 Seefeld
Tel. +49 (8153) 93 08-157, Fax +49 (8153) 93 08-7157
martin.krause@tqs.de
www.tq-group.com
