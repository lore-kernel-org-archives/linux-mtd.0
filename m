Received: from mail03.agrinet.ch ([81.221.250.52])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19sfDt-0000iT-IU
	for <linux-mtd@lists.infradead.org>; Fri, 29 Aug 2003 10:07:13 +0100
Received: from pegasus (80.254.183.189) by mail03.agrinet.ch (7.0.018)
	id 3F4A99F100082D2D for linux-mtd@lists.infradead.org;
	Fri, 29 Aug 2003 11:06:17 +0200
From: Felix Frey <ffrey@freesurf.ch>
To: linux-mtd@lists.infradead.org
Date: Fri, 29 Aug 2003 11:04:06 +0200
MIME-Version: 1.0
Message-Id: <200308291104.06237.ffrey@freesurf.ch>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: SRAM and MTD
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I'd like to connect a 32kx8 static RAM (battery buffered) to the ISAbus o=
f my=20
x86 based system to frequently store sensitive data which _must_ survive =
a=20
powerfail. Access should be made through the mtd character device. By div=
ing=20
a bit into the code I saw there is a ram chip driver, however, I got pret=
ty=20
confused.=20
Do I have to write my own mapping driver or how can I tell the chip drive=
r=20
where it finds my RAM device and how large it is ?
Does the ram chip driver accept any parameters ?

Any help is greatly appreciated.

Felix
