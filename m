Received: from mail.tqs.de ([62.157.136.17])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G8aUx-00032R-UJ
	for linux-mtd@lists.infradead.org; Thu, 03 Aug 2006 06:32:18 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: MPC8xxx UPM NAND Flash
Date: Thu, 3 Aug 2006 12:32:10 +0200
Message-ID: <47F3F98010FF784EBEE6526EAAB078D1024F81D8@tq-mailsrv.tq-net.de>
In-Reply-To: <BAF87F8E-7862-4676-98AC-DDF4649959BC@purplevisiontech.com>
From: "Martin Krause" <Martin.Krause@tqs.de>
To: "Harsha Padmanabha" <harsha@purplevisiontech.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Harsha,

Harsha Padmanabha wrote on Thursday, August 03, 2006 10:19 AM:
> Hey Martin,
>=20
> I saw your post on the web-board for MTD support. Do you have any
> clues or luck using the freescale whitepaper to interface with the
> NAND Flash?. We are able to generate the required timing waveforms
> but are unable to write to flash or read it back using UPM.

Currently we are working on this on a MPC8548 board (TQM8548).
Unfortunately I'm not involved in this project, so I don't know much
details, but the guys working on this told me, that some basic flash
accesses are running already (at a bus clock of 50 MHz).

The boot software we use is not U-boot, but our own bootloader
"MON85xx", so I couldn't send patches or code snippets. But I hope
that U-Boot will be ported for this board too, once everything is=20
running well.

Regards,
Martin
