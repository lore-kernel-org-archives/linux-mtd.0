From: bpqw <bpqw@micron.com>
To: Marek Vasut <marex@denx.de>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH 1/1 v3] driver:mtd:spi-nor: Add quad I/O support for
 Micron spi nor
Date: Thu, 30 Oct 2014 14:31:42 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6315E9252@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6315DCC46@NTXXIAMBX02.xacn.micron.com>
 <201409251211.57183.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315DCDF1@NTXXIAMBX02.xacn.micron.com>
 <201409261046.07132.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315E7AC2@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315E7AC2@NTXXIAMBX02.xacn.micron.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "grmoore@altera.com" <grmoore@altera.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "shijie8@gmail.com" <shijie8@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>This patch adds code which enables Quad I/O mode on Micron SPI NOR flashes=
.

>For Micron SPI NOR flash, enabling or disabling quad I/O=20
>protocol is controlled by EVCR (Enhanced Volatile Configuration
>Register), Quad I/O protocol bit 7.When EVCR bit 7 is reset to 0,
>the SPI NOR flash will operate in quad I/O mode.

>Signed-off-by: bean huo <beanhuo@micron.com>
>Acked-by: Marek Vasut <marex@denx.de>

Hi,Brian
How about this patch?if can be accepted?
It has been long time.
