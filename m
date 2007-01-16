Received: from bay0-omc2-s7.bay0.hotmail.com ([65.54.246.143])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H6i2C-0007XS-Pa
	for linux-mtd@lists.infradead.org; Tue, 16 Jan 2007 06:43:09 +0000
Message-ID: <BAY115-W662D176F1CAC9AB6A4F538BB40@phx.gbl>
From: Chandrasekhar Nagaraj <chandrasekhar_n@hotmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: Flash Endianess
Date: Tue, 16 Jan 2007 12:11:59 +0530
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

I have the following questions with regard to flash endianness. I=20
have a big endian processor based board; so I want to make=20
sure that I have the processor-flash interface with respect to=20
endianness correct before I start on the actual work.

1) Does a flash chip by itself have any endianness? If so what is=20
the endian mode of Intel/flash chips?

2) Also does CFI have anything to say about flash endian?

3) Is there any documentation on the endian support inside MTD=20
code?(with respect to CFI queries and actual data)

Also any things I need to watch out on the board schematics with=20
respect to endianness?

Thanks and Regards
Chandrasekhar
_________________________________________________________________
Call friends with PC-to-PC calling -- FREE
http://get.live.com/messenger/overview=
