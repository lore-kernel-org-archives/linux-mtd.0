Received: from exchange.autotap.com ([12.32.143.36]
	helo=exchange1.exchange.bb-elec.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DvKPG-0004HA-1S
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2005 15:39:12 -0400
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 Jul 2005 14:23:07 -0500
Message-ID: <2813685E09A8A54FA42CB32F8EBB4973077BB165@exchange1.exchange.bb-elec.com>
From: "Jeremy Severson" <jseverson@bb-elec.com>
To: <linux-mtd@lists.infradead.org>
Subject: Support for ST M29W320DB
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Does anyone know if there is MTD support for the ST M29W320DB? I am
trying to use MTD to address two separate ST M29W320DB flash parts from
a 2.4.18 kernel. Ideally I would like to partition the second flash part
into two parts one of which I could set to writable for my configuration
information. I am hoping that there is already a driver out there for
it. Has anyone had trouble detecting these parts using the CFI? Right
now the CFI is telling me that it has located only a single flash part.
AFU (ARM Flash Utility) detects two so that tells me that electrically
everything should be fine.
