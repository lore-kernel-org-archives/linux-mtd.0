Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0HL8-0003PE-9u
 for linux-mtd@lists.infradead.org; Sat, 21 Nov 2015 23:13:06 +0000
Received: by wmec201 with SMTP id c201so115967452wme.0
 for <linux-mtd@lists.infradead.org>; Sat, 21 Nov 2015 15:12:46 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 1/3] spi: core: add max_msg_size to spi_master
To: Mark Brown <broonie@kernel.org>, Brian Norris <computersforpeace@gmail.com>
References: <564CEB61.2000601@gmail.com>
 <20151118215755.GL31303@sirena.org.uk> <564D0098.4030107@gmail.com>
 <20151119114057.GN31303@sirena.org.uk>
 <F224F5F3-FAD5-47FE-9419-39E53BCBB8C6@sperl.org>
 <20151119171538.GO31303@sirena.org.uk>
 <9CDADBED-FD18-4635-82A9-5AB14C9ABCAE@sperl.org>
 <20151120120502.GT31303@sirena.org.uk>
 <08871ECD-52DF-4CBF-AF3D-4C3A442C008A@sperl.org>
 <20151121134946.GI26072@sirena.org.uk> <56507B3B.4080608@gmail.com>
 <CAOMqctR=UDEPbgJDY3YvxpbVEEp4t6ajkyv=cVAZp2fLBNBanA@mail.gmail.com>
Cc: Michal Suchanek <hramrach@gmail.com>, Martin Sperl <martin@sperl.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Message-ID: <5650F7D4.1090209@gmail.com>
Date: Sun, 22 Nov 2015 00:01:40 +0100
MIME-Version: 1.0
In-Reply-To: <CAOMqctR=UDEPbgJDY3YvxpbVEEp4t6ajkyv=cVAZp2fLBNBanA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a member to spi_master allowing to better handle
SPI chips with a message size HW limit.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 include/linux/spi/spi.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index cce80e6..23e259b 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -302,6 +302,7 @@ static inline void spi_unregister_driver(struct spi_driver *sdrv)
  *	and it's up to the individual driver to perform any validation.
  * @min_speed_hz: Lowest supported transfer speed
  * @max_speed_hz: Highest supported transfer speed
+ * @max_msg_size: maximum message size
  * @flags: other constraints relevant to this driver
  * @bus_lock_spinlock: spinlock for SPI bus locking
  * @bus_lock_mutex: mutex for SPI bus locking
@@ -417,6 +418,9 @@ struct spi_master {
 	u32			min_speed_hz;
 	u32			max_speed_hz;
 
+	/* maximum message size */
+	size_t			max_msg_size;
+
 	/* other constraints relevant to this driver */
 	u16			flags;
 #define SPI_MASTER_HALF_DUPLEX	BIT(0)		/* can't do full duplex */
-- 
2.6.2
