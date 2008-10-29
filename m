Received: from mail.tqs.de ([62.157.136.17])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KvDJ9-0007mL-Uy
	for linux-mtd@lists.infradead.org; Wed, 29 Oct 2008 15:50:09 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: CFI: major/minor number check?
Date: Wed, 29 Oct 2008 16:50:05 +0100
Message-ID: <47F3F98010FF784EBEE6526EAAB078D103AC7274@tq-mailsrv.tq-net.de>
From: "Jens Gehrlein" <Jens.Gehrlein@tqs.de>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Why does the MTD driver check the major and minor version
in the CFI primary extended table of AMD Flashes?

We have a Samsung K8P2815UQB NOR-Flash supporting AMD
command set 0x2, but returns Major.Minor =3D 0.0
Thus, the kernel does not accept the device by reporting
"Unknown Amd/Fujitsu Extended Query version 0.0."

Of course, I could easily disable the check and it will work.
Is there a certain reason to constrain the valid number range?

Best regards,
Jens
