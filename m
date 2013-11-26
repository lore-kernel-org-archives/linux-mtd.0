From: "Gupta, Pekon" <pekon@ti.com>
To: Huang Shijie <b32955@freescale.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>
Subject: RE: [PATCH 1/4] mtd: spi-nor: move the SPI NOR commands to a new
 header file
Date: Tue, 26 Nov 2013 07:42:21 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA4EC81@DBDE04.ent.ti.com>
References: <1385447575-23773-1-git-send-email-b32955@freescale.com>
 <1385447575-23773-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1385447575-23773-2-git-send-email-b32955@freescale.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "marex@denx.de" <marex@denx.de>, "broonie@linaro.org" <broonie@linaro.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Poddar,
 Sourav" <sourav.poddar@ti.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Shijie,

Few feedbacks inline..=20

> From: Huang Shijie [mailto:b32955@freescale.com]
> This patch adds a new header :spi-nor.h,
> and moves all the SPI NOR commands and relative macros into this new
> header.
>=20
(1)
It's better to take all Flash vendor specific opcodes from DT..=20
With new framework we should do away with macros for each vendor,
instead let each board file provide this information based on flash device
which is mounted on it.

(2)
And also, I suggest not to touch m25p80 in anyway, bcoz it stable driver
used by many. So unless spi-nor framework is accepted and is stable we
m25p80 should continue working as it is.
Thus your patches should be independent of any existing driver or other
frameworks. This way it might get accepted fast. Then later you can provide
a way to attach m25p80 to spi-nor framework.
Thoughts ?


with regards, pekon
