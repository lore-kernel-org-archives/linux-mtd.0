Received: from freesurfmta04.sunrise.ch ([194.230.0.33] helo=freesurfmail.sunrise.ch)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 169msx-0000yb-00
	for <linux-mtd@lists.infradead.org>; Fri, 30 Nov 2001 12:35:19 +0000
Received: from theodul (194.230.247.215) by freesurfmail.sunrise.ch (5.5.034)
        id 3BA89AC5004CAD4B for linux-mtd@lists.infradead.org; Fri, 30 Nov 2001 13:40:28 +0100
From: Felix Frey <ffrey@freesurf.ch>
To: linux-mtd@lists.infradead.org
Subject: Booting from DOC-Millenium
Date: Fri, 30 Nov 2001 13:45:51 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
MIME-Version: 1.0
Message-Id: <01113013455100.01045@theodul>
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

Hi

I'm using a DOC-Millenium( w/ 8megs) on a PC104-modul, holding the rootfs=
 and=20
applications. First of all I was using the driver from m-systems (binary=20
only!) which caused me a headache since it's using up a lot of system=20
performance and - even worse - it interferes with the serial port i a man=
ner=20
that I'm loosing data from the serial port. The next attempt was trying t=
he=20
(open source-) nftl-driver. Basically this was very successful and also=20
solved the problem with the serial port. The only remaining problem is th=
at I=20
can't boot from the DOC anymore. I'm using doc-lilo as bootloader.
I appreciate any advice.

Regards
Felix=20
