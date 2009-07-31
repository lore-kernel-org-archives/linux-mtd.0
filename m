Received: from [213.79.90.228] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWgAA-0007YB-Vr
	for linux-mtd@lists.infradead.org; Fri, 31 Jul 2009 00:40:03 +0000
Date: Fri, 31 Jul 2009 04:39:57 +0400
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 0/6] Device table matching for SPI subsystem
Message-ID: <20090731003957.GA23982@oksana.dev.rtsoft.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Cc: Ben Dooks <ben@fluff.org>, David Brownell <dbrownell@users.sourceforge.net>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-kernel@vger.kernel.org, lm-sensors@lm-sensors.org,
	Grant Likely <grant.likely@secretlab.ca>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Jean Delvare <khali@linux-fr.org>, David Woodhouse <dwmw2@infradead.org>
Reply-To: avorontsov@ru.mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew,

This new patch set overwrites following patches:

  hwmon-lm70-convert-to-device-table-matching.patch
  hwmon-adxx-convert-to-device-table-matching.patch
  spi-merge-probe-and-probe_id-callbacks.patch
  spi-prefix-modalias-with-spi.patch
  of-remove-stmm25p40-alias.patch
  mtd-m25p80-convert-to-device-table-matching.patch
  spi-add-support-for-device-table-matching.patch


Changes since v1:

- Implemented Ben Dooks' idea of spi_get_device_id(), so we won't
  call spi_match_id() twice for drivers that don't need the id.

- "spi: Merge probe and probe_id callbacks" patch no longer needed
  as we don't change probe()'s arguments;

- Rename spi_device_id->data to driver_data, and turn it into
  kernel_ulong_t to match majority of subsystems. Most drivers
  don't need a pointer type anyway (e.g. m25p80 needs it, but
  lm70 and adcxx don't);

- SPI_NAME_SIZE now defined to 32 (as it should be, using 20
  for name size was a cut-n-paste typo from I2C defines).


Thanks!

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
