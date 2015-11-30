Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3V1m-0007ck-2h
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2015 20:26:27 +0000
Received: by wmec201 with SMTP id c201so174389123wme.0
 for <linux-mtd@lists.infradead.org>; Mon, 30 Nov 2015 12:26:04 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH resubmit 2/2] spi: fsl-espi: make use of max_msg_size in
 spi_master to handle HW restrictions
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
Message-ID: <565CB0C0.9060104@gmail.com>
Date: Mon, 30 Nov 2015 21:25:36 +0100
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

Propagate the 64K message size limitation allowing client drivers
to deal properly with this limitation.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/spi/spi-fsl-espi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-fsl-espi.c b/drivers/spi/spi-fsl-espi.c
index c27124a..773bbab 100644
--- a/drivers/spi/spi-fsl-espi.c
+++ b/drivers/spi/spi-fsl-espi.c
@@ -670,6 +670,7 @@ static struct spi_master * fsl_espi_probe(struct device *dev,
 	master->cleanup = fsl_espi_cleanup;
 	master->transfer_one_message = fsl_espi_do_one_msg;
 	master->auto_runtime_pm = true;
+	master->max_msg_size = SPCOM_TRANLEN_MAX;
 
 	mpc8xxx_spi = spi_master_get_devdata(master);
 
-- 
2.6.2
