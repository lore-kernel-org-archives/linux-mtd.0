Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67016C61DB3
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 06:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yxS/E/8wwu1z4hnN+X6qf9cPuNWcOoB6wNAlczzN8XM=; b=y1zjQWCeq5bU9n
	+ri4ptaaTHdEIpEBZ4ISxnX4aSeSueQQi7YGDjIBTHdyvm1CNGpYSVASDhibltmXrPDXDXnLPPPZH
	MX18eA03RSuUadpgYtC8UyvFRa/InoXM4SMNtQvpNfQsQvCMJNJUJn9qdzmLYQUpU6a043WBtUquS
	N3meknJWCZVO2Vidum0PndkuJd1oZKBa5T9obmSqUnxZnamDm68gpGo++jUoAcqcQzfuLz1/8QjaU
	JJipsnLG6bpQFQyW1L4P7xnH9JzmPqpTbF1VL60AMkgOx4CKyZwwW2VNvj6UB1NTv3viQcJuhsPT1
	lMAoIkdPrLjjMfJ2tgWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDVE-000mUn-Mx; Fri, 13 Jan 2023 06:25:24 +0000
Received: from [2001:4bb8:181:656b:9509:7d20:8d39:f895] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDU8-000lc0-50; Fri, 13 Jan 2023 06:24:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org,
	dmaengine@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sh@vger.kernel.org
Subject: [PATCH 09/22] i2c: remove i2c-sh7760
Date: Fri, 13 Jan 2023 07:23:26 +0100
Message-Id: <20230113062339.1909087-10-hch@lst.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113062339.1909087-1-hch@lst.de>
References: <20230113062339.1909087-1-hch@lst.de>
MIME-Version: 1.0
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Now that arch/sh is removed this driver is dead code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/i2c/busses/Kconfig      |   9 -
 drivers/i2c/busses/Makefile     |   1 -
 drivers/i2c/busses/i2c-sh7760.c | 565 --------------------------------
 3 files changed, 575 deletions(-)
 delete mode 100644 drivers/i2c/busses/i2c-sh7760.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 22602c512a6e50..44267a023fd19a 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1016,15 +1016,6 @@ config I2C_S3C2410
 	  Say Y here to include support for I2C controller in the
 	  Samsung SoCs (S3C, S5Pv210, Exynos).
 
-config I2C_SH7760
-	tristate "Renesas SH7760 I2C Controller"
-	depends on CPU_SUBTYPE_SH7760
-	help
-	  This driver supports the 2 I2C interfaces on the Renesas SH7760.
-
-	  This driver can also be built as a module.  If so, the module
-	  will be called i2c-sh7760.
-
 config I2C_SH_MOBILE
 	tristate "SuperH Mobile I2C Controller"
 	depends on ARCH_RENESAS || COMPILE_TEST
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index e73cdb1d2b5a85..6be213e5e4dd16 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -104,7 +104,6 @@ obj-$(CONFIG_I2C_RIIC)		+= i2c-riic.o
 obj-$(CONFIG_I2C_RK3X)		+= i2c-rk3x.o
 obj-$(CONFIG_I2C_RZV2M)		+= i2c-rzv2m.o
 obj-$(CONFIG_I2C_S3C2410)	+= i2c-s3c2410.o
-obj-$(CONFIG_I2C_SH7760)	+= i2c-sh7760.o
 obj-$(CONFIG_I2C_SH_MOBILE)	+= i2c-sh_mobile.o
 obj-$(CONFIG_I2C_SIMTEC)	+= i2c-simtec.o
 obj-$(CONFIG_I2C_SPRD)		+= i2c-sprd.o
diff --git a/drivers/i2c/busses/i2c-sh7760.c b/drivers/i2c/busses/i2c-sh7760.c
deleted file mode 100644
index 319d1fa617c883..00000000000000
--- a/drivers/i2c/busses/i2c-sh7760.c
+++ /dev/null
@@ -1,565 +0,0 @@
-/*
- * I2C bus driver for the SH7760 I2C Interfaces.
- *
- * (c) 2005-2008 MSC Vertriebsges.m.b.H, Manuel Lauss <mlau@msc-ge.com>
- *
- * licensed under the terms outlined in the file COPYING.
- *
- */
-
-#include <linux/completion.h>
-#include <linux/delay.h>
-#include <linux/err.h>
-#include <linux/i2c.h>
-#include <linux/interrupt.h>
-#include <linux/ioport.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-#include <linux/io.h>
-#include <linux/module.h>
-
-#include <asm/clock.h>
-#include <asm/i2c-sh7760.h>
-
-/* register offsets */
-#define I2CSCR		0x0		/* slave ctrl		*/
-#define I2CMCR		0x4		/* master ctrl		*/
-#define I2CSSR		0x8		/* slave status		*/
-#define I2CMSR		0xC		/* master status	*/
-#define I2CSIER		0x10		/* slave irq enable	*/
-#define I2CMIER		0x14		/* master irq enable	*/
-#define I2CCCR		0x18		/* clock dividers	*/
-#define I2CSAR		0x1c		/* slave address	*/
-#define I2CMAR		0x20		/* master address	*/
-#define I2CRXTX		0x24		/* data port		*/
-#define I2CFCR		0x28		/* fifo control		*/
-#define I2CFSR		0x2C		/* fifo status		*/
-#define I2CFIER		0x30		/* fifo irq enable	*/
-#define I2CRFDR		0x34		/* rx fifo count	*/
-#define I2CTFDR		0x38		/* tx fifo count	*/
-
-#define REGSIZE		0x3C
-
-#define MCR_MDBS	0x80		/* non-fifo mode switch	*/
-#define MCR_FSCL	0x40		/* override SCL pin	*/
-#define MCR_FSDA	0x20		/* override SDA pin	*/
-#define MCR_OBPC	0x10		/* override pins	*/
-#define MCR_MIE		0x08		/* master if enable	*/
-#define MCR_TSBE	0x04
-#define MCR_FSB		0x02		/* force stop bit	*/
-#define MCR_ESG		0x01		/* en startbit gen.	*/
-
-#define MSR_MNR		0x40		/* nack received	*/
-#define MSR_MAL		0x20		/* arbitration lost	*/
-#define MSR_MST		0x10		/* sent a stop		*/
-#define MSR_MDE		0x08
-#define MSR_MDT		0x04
-#define MSR_MDR		0x02
-#define MSR_MAT		0x01		/* slave addr xfer done	*/
-
-#define MIE_MNRE	0x40		/* nack irq en		*/
-#define MIE_MALE	0x20		/* arblos irq en	*/
-#define MIE_MSTE	0x10		/* stop irq en		*/
-#define MIE_MDEE	0x08
-#define MIE_MDTE	0x04
-#define MIE_MDRE	0x02
-#define MIE_MATE	0x01		/* address sent irq en	*/
-
-#define FCR_RFRST	0x02		/* reset rx fifo	*/
-#define FCR_TFRST	0x01		/* reset tx fifo	*/
-
-#define FSR_TEND	0x04		/* last byte sent	*/
-#define FSR_RDF		0x02		/* rx fifo trigger	*/
-#define FSR_TDFE	0x01		/* tx fifo empty	*/
-
-#define FIER_TEIE	0x04		/* tx fifo empty irq en	*/
-#define FIER_RXIE	0x02		/* rx fifo trig irq en	*/
-#define FIER_TXIE	0x01		/* tx fifo trig irq en	*/
-
-#define FIFO_SIZE	16
-
-struct cami2c {
-	void __iomem *iobase;
-	struct i2c_adapter adap;
-
-	/* message processing */
-	struct i2c_msg	*msg;
-#define IDF_SEND	1
-#define IDF_RECV	2
-#define IDF_STOP	4
-	int		flags;
-
-#define IDS_DONE	1
-#define IDS_ARBLOST	2
-#define IDS_NACK	4
-	int		status;
-	struct completion xfer_done;
-
-	int irq;
-	struct resource *ioarea;
-};
-
-static inline void OUT32(struct cami2c *cam, int reg, unsigned long val)
-{
-	__raw_writel(val, (unsigned long)cam->iobase + reg);
-}
-
-static inline unsigned long IN32(struct cami2c *cam, int reg)
-{
-	return __raw_readl((unsigned long)cam->iobase + reg);
-}
-
-static irqreturn_t sh7760_i2c_irq(int irq, void *ptr)
-{
-	struct cami2c *id = ptr;
-	struct i2c_msg *msg = id->msg;
-	char *data = msg->buf;
-	unsigned long msr, fsr, fier, len;
-
-	msr = IN32(id, I2CMSR);
-	fsr = IN32(id, I2CFSR);
-
-	/* arbitration lost */
-	if (msr & MSR_MAL) {
-		OUT32(id, I2CMCR, 0);
-		OUT32(id, I2CSCR, 0);
-		OUT32(id, I2CSAR, 0);
-		id->status |= IDS_DONE | IDS_ARBLOST;
-		goto out;
-	}
-
-	if (msr & MSR_MNR) {
-		/* NACK handling is very screwed up.  After receiving a
-		 * NAK IRQ one has to wait a bit  before writing to any
-		 * registers, or the ctl will lock up. After that delay
-		 * do a normal i2c stop. Then wait at least 1 ms before
-		 * attempting another transfer or ctl will stop working
-		 */
-		udelay(100);	/* wait or risk ctl hang */
-		OUT32(id, I2CFCR, FCR_RFRST | FCR_TFRST);
-		OUT32(id, I2CMCR, MCR_MIE | MCR_FSB);
-		OUT32(id, I2CFIER, 0);
-		OUT32(id, I2CMIER, MIE_MSTE);
-		OUT32(id, I2CSCR, 0);
-		OUT32(id, I2CSAR, 0);
-		id->status |= IDS_NACK;
-		msr &= ~MSR_MAT;
-		fsr = 0;
-		/* In some cases the MST bit is also set. */
-	}
-
-	/* i2c-stop was sent */
-	if (msr & MSR_MST) {
-		id->status |= IDS_DONE;
-		goto out;
-	}
-
-	/* i2c slave addr was sent; set to "normal" operation */
-	if (msr & MSR_MAT)
-		OUT32(id, I2CMCR, MCR_MIE);
-
-	fier = IN32(id, I2CFIER);
-
-	if (fsr & FSR_RDF) {
-		len = IN32(id, I2CRFDR);
-		if (msg->len <= len) {
-			if (id->flags & IDF_STOP) {
-				OUT32(id, I2CMCR, MCR_MIE | MCR_FSB);
-				OUT32(id, I2CFIER, 0);
-				/* manual says: wait >= 0.5 SCL times */
-				udelay(5);
-				/* next int should be MST */
-			} else {
-				id->status |= IDS_DONE;
-				/* keep the RDF bit: ctrl holds SCL low
-				 * until the setup for the next i2c_msg
-				 * clears this bit.
-				 */
-				fsr &= ~FSR_RDF;
-			}
-		}
-		while (msg->len && len) {
-			*data++ = IN32(id, I2CRXTX);
-			msg->len--;
-			len--;
-		}
-
-		if (msg->len) {
-			len = (msg->len >= FIFO_SIZE) ? FIFO_SIZE - 1
-						      : msg->len - 1;
-
-			OUT32(id, I2CFCR, FCR_TFRST | ((len & 0xf) << 4));
-		}
-
-	} else if (id->flags & IDF_SEND) {
-		if ((fsr & FSR_TEND) && (msg->len < 1)) {
-			if (id->flags & IDF_STOP) {
-				OUT32(id, I2CMCR, MCR_MIE | MCR_FSB);
-			} else {
-				id->status |= IDS_DONE;
-				/* keep the TEND bit: ctl holds SCL low
-				 * until the setup for the next i2c_msg
-				 * clears this bit.
-				 */
-				fsr &= ~FSR_TEND;
-			}
-		}
-		if (fsr & FSR_TDFE) {
-			while (msg->len && (IN32(id, I2CTFDR) < FIFO_SIZE)) {
-				OUT32(id, I2CRXTX, *data++);
-				msg->len--;
-			}
-
-			if (msg->len < 1) {
-				fier &= ~FIER_TXIE;
-				OUT32(id, I2CFIER, fier);
-			} else {
-				len = (msg->len >= FIFO_SIZE) ? 2 : 0;
-				OUT32(id, I2CFCR,
-					  FCR_RFRST | ((len & 3) << 2));
-			}
-		}
-	}
-out:
-	if (id->status & IDS_DONE) {
-		OUT32(id, I2CMIER, 0);
-		OUT32(id, I2CFIER, 0);
-		id->msg = NULL;
-		complete(&id->xfer_done);
-	}
-	/* clear status flags and ctrl resumes work */
-	OUT32(id, I2CMSR, ~msr);
-	OUT32(id, I2CFSR, ~fsr);
-	OUT32(id, I2CSSR, 0);
-
-	return IRQ_HANDLED;
-}
-
-
-/* prepare and start a master receive operation */
-static void sh7760_i2c_mrecv(struct cami2c *id)
-{
-	int len;
-
-	id->flags |= IDF_RECV;
-
-	/* set the slave addr reg; otherwise rcv wont work! */
-	OUT32(id, I2CSAR, 0xfe);
-	OUT32(id, I2CMAR, (id->msg->addr << 1) | 1);
-
-	/* adjust rx fifo trigger */
-	if (id->msg->len >= FIFO_SIZE)
-		len = FIFO_SIZE - 1;	/* trigger at fifo full */
-	else
-		len = id->msg->len - 1;	/* trigger before all received */
-
-	OUT32(id, I2CFCR, FCR_RFRST | FCR_TFRST);
-	OUT32(id, I2CFCR, FCR_TFRST | ((len & 0xF) << 4));
-
-	OUT32(id, I2CMSR, 0);
-	OUT32(id, I2CMCR, MCR_MIE | MCR_ESG);
-	OUT32(id, I2CMIER, MIE_MNRE | MIE_MALE | MIE_MSTE | MIE_MATE);
-	OUT32(id, I2CFIER, FIER_RXIE);
-}
-
-/* prepare and start a master send operation */
-static void sh7760_i2c_msend(struct cami2c *id)
-{
-	int len;
-
-	id->flags |= IDF_SEND;
-
-	/* set the slave addr reg; otherwise xmit wont work! */
-	OUT32(id, I2CSAR, 0xfe);
-	OUT32(id, I2CMAR, (id->msg->addr << 1) | 0);
-
-	/* adjust tx fifo trigger */
-	if (id->msg->len >= FIFO_SIZE)
-		len = 2;	/* trig: 2 bytes left in TX fifo */
-	else
-		len = 0;	/* trig: 8 bytes left in TX fifo */
-
-	OUT32(id, I2CFCR, FCR_RFRST | FCR_TFRST);
-	OUT32(id, I2CFCR, FCR_RFRST | ((len & 3) << 2));
-
-	while (id->msg->len && IN32(id, I2CTFDR) < FIFO_SIZE) {
-		OUT32(id, I2CRXTX, *(id->msg->buf));
-		(id->msg->len)--;
-		(id->msg->buf)++;
-	}
-
-	OUT32(id, I2CMSR, 0);
-	OUT32(id, I2CMCR, MCR_MIE | MCR_ESG);
-	OUT32(id, I2CFSR, 0);
-	OUT32(id, I2CMIER, MIE_MNRE | MIE_MALE | MIE_MSTE | MIE_MATE);
-	OUT32(id, I2CFIER, FIER_TEIE | (id->msg->len ? FIER_TXIE : 0));
-}
-
-static inline int sh7760_i2c_busy_check(struct cami2c *id)
-{
-	return (IN32(id, I2CMCR) & MCR_FSDA);
-}
-
-static int sh7760_i2c_master_xfer(struct i2c_adapter *adap,
-				  struct i2c_msg *msgs,
-				  int num)
-{
-	struct cami2c *id = adap->algo_data;
-	int i, retr;
-
-	if (sh7760_i2c_busy_check(id)) {
-		dev_err(&adap->dev, "sh7760-i2c%d: bus busy!\n", adap->nr);
-		return -EBUSY;
-	}
-
-	i = 0;
-	while (i < num) {
-		retr = adap->retries;
-retry:
-		id->flags = ((i == (num-1)) ? IDF_STOP : 0);
-		id->status = 0;
-		id->msg = msgs;
-		init_completion(&id->xfer_done);
-
-		if (msgs->flags & I2C_M_RD)
-			sh7760_i2c_mrecv(id);
-		else
-			sh7760_i2c_msend(id);
-
-		wait_for_completion(&id->xfer_done);
-
-		if (id->status == 0) {
-			num = -EIO;
-			break;
-		}
-
-		if (id->status & IDS_NACK) {
-			/* wait a bit or i2c module stops working */
-			mdelay(1);
-			num = -EREMOTEIO;
-			break;
-		}
-
-		if (id->status & IDS_ARBLOST) {
-			if (retr--) {
-				mdelay(2);
-				goto retry;
-			}
-			num = -EREMOTEIO;
-			break;
-		}
-
-		msgs++;
-		i++;
-	}
-
-	id->msg = NULL;
-	id->flags = 0;
-	id->status = 0;
-
-	OUT32(id, I2CMCR, 0);
-	OUT32(id, I2CMSR, 0);
-	OUT32(id, I2CMIER, 0);
-	OUT32(id, I2CFIER, 0);
-
-	/* reset slave module registers too: master mode enables slave
-	 * module for receive ops (ack, data). Without this reset,
-	 * eternal bus activity might be reported after NACK / ARBLOST.
-	 */
-	OUT32(id, I2CSCR, 0);
-	OUT32(id, I2CSAR, 0);
-	OUT32(id, I2CSSR, 0);
-
-	return num;
-}
-
-static u32 sh7760_i2c_func(struct i2c_adapter *adap)
-{
-	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
-}
-
-static const struct i2c_algorithm sh7760_i2c_algo = {
-	.master_xfer	= sh7760_i2c_master_xfer,
-	.functionality	= sh7760_i2c_func,
-};
-
-/* calculate CCR register setting for a desired scl clock.  SCL clock is
- * derived from I2C module clock  (iclk)  which in turn is derived from
- * peripheral module clock (mclk, usually around 33MHz):
- * iclk = mclk/(CDF + 1).  iclk must be < 20MHz.
- * scl = iclk/(SCGD*8 + 20).
- */
-static int calc_CCR(unsigned long scl_hz)
-{
-	struct clk *mclk;
-	unsigned long mck, m1, dff, odff, iclk;
-	signed char cdf, cdfm;
-	int scgd, scgdm, scgds;
-
-	mclk = clk_get(NULL, "peripheral_clk");
-	if (IS_ERR(mclk)) {
-		return PTR_ERR(mclk);
-	} else {
-		mck = mclk->rate;
-		clk_put(mclk);
-	}
-
-	odff = scl_hz;
-	scgdm = cdfm = m1 = 0;
-	for (cdf = 3; cdf >= 0; cdf--) {
-		iclk = mck / (1 + cdf);
-		if (iclk >= 20000000)
-			continue;
-		scgds = ((iclk / scl_hz) - 20) >> 3;
-		for (scgd = scgds; (scgd < 63) && scgd <= scgds + 1; scgd++) {
-			m1 = iclk / (20 + (scgd << 3));
-			dff = abs(scl_hz - m1);
-			if (dff < odff) {
-				odff = dff;
-				cdfm = cdf;
-				scgdm = scgd;
-			}
-		}
-	}
-	/* fail if more than 25% off of requested SCL */
-	if (odff > (scl_hz >> 2))
-		return -EINVAL;
-
-	/* create a CCR register value */
-	return ((scgdm << 2) | cdfm);
-}
-
-static int sh7760_i2c_probe(struct platform_device *pdev)
-{
-	struct sh7760_i2c_platdata *pd;
-	struct resource *res;
-	struct cami2c *id;
-	int ret;
-
-	pd = dev_get_platdata(&pdev->dev);
-	if (!pd) {
-		dev_err(&pdev->dev, "no platform_data!\n");
-		ret = -ENODEV;
-		goto out0;
-	}
-
-	id = kzalloc(sizeof(struct cami2c), GFP_KERNEL);
-	if (!id) {
-		dev_err(&pdev->dev, "no mem for private data\n");
-		ret = -ENOMEM;
-		goto out0;
-	}
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "no mmio resources\n");
-		ret = -ENODEV;
-		goto out1;
-	}
-
-	id->ioarea = request_mem_region(res->start, REGSIZE, pdev->name);
-	if (!id->ioarea) {
-		dev_err(&pdev->dev, "mmio already reserved\n");
-		ret = -EBUSY;
-		goto out1;
-	}
-
-	id->iobase = ioremap(res->start, REGSIZE);
-	if (!id->iobase) {
-		dev_err(&pdev->dev, "cannot ioremap\n");
-		ret = -ENODEV;
-		goto out2;
-	}
-
-	ret = platform_get_irq(pdev, 0);
-	if (ret < 0)
-		goto out3;
-	id->irq = ret;
-
-	id->adap.nr = pdev->id;
-	id->adap.algo = &sh7760_i2c_algo;
-	id->adap.class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
-	id->adap.retries = 3;
-	id->adap.algo_data = id;
-	id->adap.dev.parent = &pdev->dev;
-	snprintf(id->adap.name, sizeof(id->adap.name),
-		"SH7760 I2C at %08lx", (unsigned long)res->start);
-
-	OUT32(id, I2CMCR, 0);
-	OUT32(id, I2CMSR, 0);
-	OUT32(id, I2CMIER, 0);
-	OUT32(id, I2CMAR, 0);
-	OUT32(id, I2CSIER, 0);
-	OUT32(id, I2CSAR, 0);
-	OUT32(id, I2CSCR, 0);
-	OUT32(id, I2CSSR, 0);
-	OUT32(id, I2CFIER, 0);
-	OUT32(id, I2CFCR, FCR_RFRST | FCR_TFRST);
-	OUT32(id, I2CFSR, 0);
-
-	ret = calc_CCR(pd->speed_khz * 1000);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "invalid SCL clock: %dkHz\n",
-			pd->speed_khz);
-		goto out3;
-	}
-	OUT32(id, I2CCCR, ret);
-
-	if (request_irq(id->irq, sh7760_i2c_irq, 0,
-			SH7760_I2C_DEVNAME, id)) {
-		dev_err(&pdev->dev, "cannot get irq %d\n", id->irq);
-		ret = -EBUSY;
-		goto out3;
-	}
-
-	ret = i2c_add_numbered_adapter(&id->adap);
-	if (ret < 0)
-		goto out4;
-
-	platform_set_drvdata(pdev, id);
-
-	dev_info(&pdev->dev, "%d kHz mmio %08x irq %d\n",
-		 pd->speed_khz, res->start, id->irq);
-
-	return 0;
-
-out4:
-	free_irq(id->irq, id);
-out3:
-	iounmap(id->iobase);
-out2:
-	release_resource(id->ioarea);
-	kfree(id->ioarea);
-out1:
-	kfree(id);
-out0:
-	return ret;
-}
-
-static int sh7760_i2c_remove(struct platform_device *pdev)
-{
-	struct cami2c *id = platform_get_drvdata(pdev);
-
-	i2c_del_adapter(&id->adap);
-	free_irq(id->irq, id);
-	iounmap(id->iobase);
-	release_resource(id->ioarea);
-	kfree(id->ioarea);
-	kfree(id);
-
-	return 0;
-}
-
-static struct platform_driver sh7760_i2c_drv = {
-	.driver	= {
-		.name	= SH7760_I2C_DEVNAME,
-	},
-	.probe		= sh7760_i2c_probe,
-	.remove		= sh7760_i2c_remove,
-};
-
-module_platform_driver(sh7760_i2c_drv);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SH7760 I2C bus driver");
-MODULE_AUTHOR("Manuel Lauss <mano@roarinelk.homelinux.net>");
-- 
2.39.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
