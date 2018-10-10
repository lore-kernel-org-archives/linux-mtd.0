Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAElz-0004kB-Gl
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2018 13:43:37 +0000
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] eeprom: at25: SPI transfer improvements
Date: Wed, 10 Oct 2018 15:43:14 +0200
Message-Id: <20181010134317.8466-1-geert+renesas@glider.be>
In-Reply-To: <20181010134036.8296-1-geert+renesas@glider.be>
References: <20181010134036.8296-1-geert+renesas@glider.be>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[Resend with correct linux-mtd address]

	Hi all,

This patch series contains various improvements for the AT25 SPI EEPROM
driver, related to SPI transfers.

Tested on a Renesas Ebisu development board with R-Car E3 using MSIOF
and a 25LC040 EEPROM.  The MSIOF SPI Controller can only do DMA for
transfers with a length that is a multiple of 4 bytes.

Thanks!

Geert Uytterhoeven (3):
  eeprom: at25: Drop obsolete cast in at25_ee_write()
  eeprom: at25: Use spi_message_init_with_transfers() instead of open
    coding
  eeprom: at25: Split writes in two SPI transfers to optimize DMA

 drivers/misc/eeprom/at25.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
