MIME-Version: 1.0
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9E84D2@DBDE04.ent.ti.com>
References: <CAHSAbzP0Nc1ahf_ra6yDuMvV998_+EGcUOGDv5ifKaagYf+NOg@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9E84D2@DBDE04.ent.ti.com>
Date: Tue, 16 Jul 2013 16:59:49 +0800
Message-ID: <CAHSAbzMDOWo5oBqUHqMxybuDwUjFbczYwN+85gH+rxZ9z8u2Pw@mail.gmail.com>
Subject: Re: support DUAL and QUAD[patch v1]
From: yuhang wang <wangyuhang2014@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd <linux-mtd-bounces@lists.infradead.org>,
 Grant Likely <grant.likely@secretlab.ca>, Mark Brown <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>, "Poddar,
 Sourav" <sourav.poddar@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Gupta


> [Pekon]: Instead of adding new fields you can use existing 'mode' field to
> pass on the platform specific configurations. And if 'u8 mode' does not
> suffice you can increase it to 'u32'.
> #define QSPI_MODE       1 << 5; // just check which bit-fields are un-used
> spi_board_info->mode |= QSPI_MODE;
>

well, can dual and quad be regarded as a spi mode? if so, your comment seems
to be right.
