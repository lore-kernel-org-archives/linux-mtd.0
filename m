Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7cnW-0000p3-4J
 for linux-mtd@lists.infradead.org; Fri, 09 Aug 2013 02:51:26 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: yuhang wang <wangyuhang2014@gmail.com>
Subject: RE: [PATCH] SPI: DUAL and QUAD support
Date: Fri, 9 Aug 2013 02:50:55 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9F2296@DBDE04.ent.ti.com>
References: <20130729064234.GS9858@sirena.org.uk>
 <1375095194-7093-1-git-send-email-wangyuhang2014@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9EE267@DBDE04.ent.ti.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9F1993@DBDE04.ent.ti.com>,
 <CAHSAbzMoqA2uk7VygVwx6wC4j=LWfAn8C+kD4bG4o7XSG3rNww@mail.gmail.com>
In-Reply-To: <CAHSAbzMoqA2uk7VygVwx6wC4j=LWfAn8C+kD4bG4o7XSG3rNww@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>, "Poddar,
 Sourav" <sourav.poddar@ti.com>, "tpiepho@gmail.com" <tpiepho@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "broonie@kernel.org" <broonie@kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 2. I don't think that  SPI_NBITS_SINGLE_HALF_DUPLEX is necessary.
> tx_nbits and rx_nbits in @spi_transfer should be passed to spi master
> driver and the master driver will set the certain mode depend on the
> info in @spi_transfer. So there is no need to let the master driver
> know SPI_NBITS_SINGLE_HALF_DUPLEX, also master can get the 3-wire SPI
> info from spi_device->mode.
I should have been more explicit here.. it would be good it you replace
'spi_device->mode & SPI_3_WIRE' with your above mode & tx_nbit, rx_nbits
so that the channel width information becomes consistent for all modes.
All mode bit flags in same octet look better.

with regards, pekon
