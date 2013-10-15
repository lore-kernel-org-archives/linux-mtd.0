Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VW7uF-0006Ve-EM
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2013 16:55:39 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 1/3] spi/qspi: Add memory mapped read support.
Date: Tue, 15 Oct 2013 16:54:34 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA234E2@DBDE04.ent.ti.com>
References: <52566ACC.1080100@ti.com> <20131010101410.GG21581@sirena.org.uk>
 <52568AA3.9080203@ti.com> <20131011100839.GA21581@sirena.org.uk>
 <525CDB77.4040201@ti.com> <20131015111647.GX2443@sirena.org.uk>
 <525D2BB3.4020705@ti.com> <20131015124656.GM2443@sirena.org.uk>
 <525D41E2.30206@ti.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA23446@DBDE04.ent.ti.com>
 <20131015160101.GS2443@sirena.org.uk>
In-Reply-To: <20131015160101.GS2443@sirena.org.uk>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Peter Korsgaard <peter@korsgaard.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>, "Poddar,
 Sourav" <sourav.poddar@ti.com>, Trent Piepho <tpiepho@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> From: Mark Brown [mailto:broonie@kernel.org]
> > On Tue, Oct 15, 2013 at 03:33:19PM +0000, Gupta, Pekon wrote:
> > Problem here..
> > spi_sync() is not blocking, that means it would just add a spi_message
> > to queue and return. And it depends on kthread_worker when it pumps
> > this spi_message to QPSI controller driver for actual configuration.
> > So this is actually a race-condition. You cannot use spi_sync() to conf=
igure.
>=20
> No, spi_sync() is blocking - spi_async() is non-blocking.

Sorry my bad, I must have been dreaming or something.
Yes, it's spi_sync() is blocking, its clearly written in its comments too..

with regards, pekon
