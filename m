Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VW9Rv-00010i-T4
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2013 18:34:32 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Trent Piepho <tpiepho@gmail.com>
Subject: RE: [PATCH 1/3] spi/qspi: Add memory mapped read support.
Date: Tue, 15 Oct 2013 18:33:23 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA23640@DBDE04.ent.ti.com>
References: <52566ACC.1080100@ti.com> <20131010101410.GG21581@sirena.org.uk>
 <52568AA3.9080203@ti.com> <20131011100839.GA21581@sirena.org.uk>
 <525CDB77.4040201@ti.com> <20131015111647.GX2443@sirena.org.uk>
 <525D2BB3.4020705@ti.com> <20131015124656.GM2443@sirena.org.uk>
 <525D41E2.30206@ti.com> <20131015180142.GS23337@ld-irv-0074.broadcom.com>
 <CA+7tXigv1Q3BPE3uhzdJpx3DsqUpxzrBUaPfWR-i15PsVtMWsQ@mail.gmail.com>
In-Reply-To: <CA+7tXigv1Q3BPE3uhzdJpx3DsqUpxzrBUaPfWR-i15PsVtMWsQ@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Peter Korsgaard <peter@korsgaard.com>, "Balbi, Felipe" <balbi@ti.com>,
 Mark Brown <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>, "Poddar,
 Sourav" <sourav.poddar@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> From: Trent Piepho
> Are there any numbers to show if memory mapped read support is a
> benefit in Linux?  There is some question as to whether it's useful at
> all or not.
>=20
> If it is, I think low latency for small reads is probably one of the
> only advantages.  To do that, you aren't going to want to deal with
> device PM for every single read.  It would make more sense to turn the
> hardware on when the MTD device is opened and leave it on until
> closed.
>=20
+1

Therefore early suggestions were to make 'MM_MODE' as default
(if device enables it via DT). This means:
(1) switch to 'SPI_MODE' _only_ when required for commands like
 mtd_erase, etc. and switch back to 'MM_MODE' when done.
(2) And keep your controller clocks on.

This would ensure that you do minimum config-switching when using
MM_MODE. And would thus achieve low latency, and no driver intervention.

Yes, real thruput numbers would help clear the picture here ..

with regards, pekon
