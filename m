Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3V1j-0007cd-TX
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2015 20:26:24 +0000
Received: by wmec201 with SMTP id c201so174387892wme.0
 for <linux-mtd@lists.infradead.org>; Mon, 30 Nov 2015 12:26:02 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 1/2] spi: core: add max_msg_size to spi_master
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
Message-ID: <565CB06B.4000503@gmail.com>
Date: Mon, 30 Nov 2015 21:24:11 +0100
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
v2: add accessor

 include/linux/spi/spi.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index cce80e6..a8abd24 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -302,6 +302,7 @@ static inline void spi_unregister_driver(struct spi_driver *sdrv)
  *	and it's up to the individual driver to perform any validation.
  * @min_speed_hz: Lowest supported transfer speed
  * @max_speed_hz: Highest supported transfer speed
+ * @max_msg_size: maximum supported message size
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
@@ -556,6 +560,11 @@ static inline void spi_master_put(struct spi_master *master)
 		put_device(&master->dev);
 }
 
+static inline size_t spi_master_get_max_msg_size(struct spi_master *master)
+{
+	return master->max_msg_size;
+}
+
 /* PM calls that need to be issued by the driver */
 extern int spi_master_suspend(struct spi_master *master);
 extern int spi_master_resume(struct spi_master *master);
-- 
2.6.2
