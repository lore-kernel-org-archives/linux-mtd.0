Received: from mail.tqs.de ([62.157.136.17])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EzUNm-0005F4-2W
	for linux-mtd@lists.infradead.org; Thu, 19 Jan 2006 02:39:06 -0500
Received: from tq-mailsrv.tq-net.de (tq-mailsrv.tqs.de [172.20.1.2])
	by mail.tqs.de (Postfix) with ESMTP id 2C332785D
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Jan 2006 08:38:59 +0100 (CET)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Jan 2006 08:38:59 +0100
Message-ID: <47F3F98010FF784EBEE6526EAAB078D1C05FA4@tq-mailsrv.tq-net.de>
From: "Martin Krause" <Martin.Krause@tqs.de>
To: <linux-mtd@lists.infradead.org>
Subject: Support for parallel connected NAND flash chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

in the NAND Flash API documentation I read, that parallel arrays
of NAND flashes (e. g. to extend the buswith from 8x to 16x=20
with two 8 bit flashes in parrallel) are currently not sopported=20
by the driver. Are there any plans to implement such a feature
in future?

Regards,
Martin

TQ-Systems GmbH
M=FChlstra=DFe 2, Gut Delling, 82229 Seefeld
Tel. +49 (8153) 93 08-157, Fax +49 (8153) 93 08-7157
martin.krause@tqs.de
www.tq-group.com
