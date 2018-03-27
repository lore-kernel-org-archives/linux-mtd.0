Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0pHm-0002zC-S8
 for linux-mtd@lists.infradead.org; Tue, 27 Mar 2018 14:09:21 +0000
From: Richard Weinberger <richard@nod.at>
To: Olivier Schonken <olivier.schonken@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: Re: Atmel Nand PMECC UBI ECC issue
Date: Tue, 27 Mar 2018 16:08:46 +0200
Message-ID: <3546894.3QeRhpBW0o@blindfold>
In-Reply-To: <CALdGsk++QA-mHmQx+L6qumt7xaXicfdqC=iBhmda7vYB+-bNpg@mail.gmail.com>
References: <CALdGskLaHrZGa7u4_jmJjq1VPRv6AYgRpSsYcNy+-EtgWR0H=Q@mail.gmail.com>
 <1849050.lXIvJB3S2I@blindfold>
 <CALdGsk++QA-mHmQx+L6qumt7xaXicfdqC=iBhmda7vYB+-bNpg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Oliver,

Am Dienstag, 27. M=E4rz 2018, 10:28:52 CEST schrieb Olivier Schonken:
> Hi Richard
>=20
> The bytes in question is at offset 36c90.

Okay. At this offset we have a UBIFS data node of length 1477.
One bit of the UBIFS magic changed. 0x30 instead of 0x31
=46un fact, the UBIFS CRC32 is correct. UBIFS magic and the CRC32 are not=20
covered by the CRC.
So, really just one bit changed, in the magic.

Thanks,
//richard
