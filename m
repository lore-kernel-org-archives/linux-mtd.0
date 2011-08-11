Received: from sm-d311v.smileserver.ne.jp ([203.211.202.206])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QrN0e-00073z-3a
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2011 04:36:44 +0000
Message-ID: <4E435C53.6080701@dsn.okisemi.com>
Date: Thu, 11 Aug 2011 13:36:35 +0900
From: Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>
MIME-Version: 1.0
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: mtd/m25p80: Device search issue
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Cc: "toshiharu-linux@dsn.okisemi.com" <toshiharu-linux@dsn.okisemi.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a question.
We've faced issue when connecting SPI Flash memory "SST25VF016B" via
SPI_TOPCLIFF_PCH, the Flash is not detected.
The cause is that jedec_probe fails in m25p80.


m25p80.c
static const struct spi_device_id *__devinit jedec_probe(struct
spi_device *spi)
{

...

	jedec = id[0];
	jedec = jedec << 8;
	jedec |= id[1];
	jedec = jedec << 8;
	jedec |= id[2];

...

After the above calculation,
jedec becomes "bf25".

I think jedec must be "bf2541", right ?
Let me know what's wrong?

Thanks in advance.
-- 
tomoya
OKI SEMICONDUCTOR CO., LTD.
