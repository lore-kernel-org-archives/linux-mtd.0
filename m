Received: from sun06.mazet.de ([193.29.17.6])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15f0WK-0004sB-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Sep 2001 15:52:44 +0100
Received: from se_server.mazet.de ([193.99.171.10])
	by sun06.MAZeT.de (8.9.3/8.9.3) with SMTP id QAA03802
	for <linux-mtd@lists.infradead.org>; Thu, 6 Sep 2001 16:51:01 +0200 (MET DST)
Message-Id: <3B978FD5.D35F06BF@mazet.de>
Date: Thu, 06 Sep 2001 17:01:41 +0200
From: Holger Friedrich <friedrich@MAZeT.de>
Mime-Version: 1.0
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: DiskOnChip write performance
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
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

Hi all,
I'm using a DiskOnChip 2000 and thanks to this mailing list I'm able to
boot linux off it. =

My application needs to write big files pretty fast and I was expecting
a write speed of 500 kBytes/sec, the M-Systems DOC 2000 spec claims to
achieve this. Unfortunately the fastest speed I could obtain was about
70 kBytes/sec which seems pretty poor to me. When I asked the M-Systems
support the answers were not really helpfull so far. =

Does anybody of you guys know, how to speed it up? I'm using ext2 at
present, will another fs be faster?
I would be even glad if someone told me it can't go faster so I can stop
bothering with DOC and try something better.
Thanks in advance for any helpfull hint
Holger
-- =

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Holger Friedrich

MAZeT GmbH                  mailto:friedrich@mazet.de
branch office Jena          Phone: +49 3641 280954
G=F6schwitzer Stra=DFe 32
07745 Jena
Germany
Visit our website: http://www.MAZeT.de
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
