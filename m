Message-ID: <52061C53.4050905@gmail.com>
Date: Sat, 10 Aug 2013 12:56:19 +0200
From: Daniel Mack <zonque@gmail.com>
MIME-Version: 1.0
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 00/20] ARM: pxa: move core and drivers to dmaengine
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
 <87zjsqzdg8.fsf@free.fr>
In-Reply-To: <87zjsqzdg8.fsf@free.fr>
Content-Type: multipart/mixed; boundary="------------070500070707050900070408"
Cc: mark.rutland@arm.com, s.neumann@raumfeld.com, linux-mtd@lists.infradead.org,
 haojian.zhuang@linaro.org, cxie4@marvell.com, lars@metafoo.de, nico@linaro.org,
 vinod.koul@intel.com, marek.vasut@gmail.com,
 ezequiel.garcia@free-electrons.com, rmk+kernel@arm.linux.org.uk,
 devicetree@vger.kernel.org, samuel@sortiz.org, arnd@arndb.de,
 broonie@kernel.org, mika.westerberg@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, thomas.petazzoni@free-electrons.com,
 eric.y.miao@gmail.com, gregkh@linuxfoundation.org, davem@davemloft.net,
 sachin.kamat@linaro.org, kernel@pengutronix.de, djbw@fb.com,
 g.liakhovetski@gmx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------070500070707050900070408
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Robert,

On 10.08.2013 00:50, Robert Jarzmik wrote:
> Daniel Mack <zonque@gmail.com> writes:
> 
>>  * camera driver:
>>      I started the transition, but I'm not sure how much sense that
>>      makes without access to the hardware. I'd much appreciate if
>>      anyone could volunteer for this piece; I'll happily share what
>>      I got so far. Sascha, Sachin, Guennadi?
> Hi Daniel,
> 
> Do you mean this driver ? :
> drivers/media/platform/soc_camera/pxa_camera.c

Yes, exactly.

> In that case I might help. But before I can do that, I have to be convinced that
> dmaengine can deal with this driver. I'm thinking in particular of :
>  - "hot running DMA" queuing
>  - multiple DMA channel synchronization (ie. 3 channel sync)
> 
> All that is described in there :
>   Documentation/video4linux/pxa_camera.txt

Yes, I've seen that, and while the documentation about all that is
excellent, I lack an explanation why things are so complicated for this
application, and why a simple cyclic DMA approach does not suffice here.
I'm sure there's a reason though.

There might be need to teach the dmaengine core more functionality, but
in order to do that, we first need to understand the exact requirements.

> If someone with dmaengine knowledge could have a look at pxa_camera.txt (maybe
> Vinod ?) and tell me that dma_engine framework fullfills the 2 requirements,
> then I'll be happy to help.

Yes, Vinod and and Dan are certainly the best ones to comment on that I
think.

> One minor point though is that I'm working on pxa27x. If the serie is not
> compatible in a way with pxa27x, I won't be able to do anything.

No, it should work just fine on pxa27x.

> Another point I'd like to know, is what is the performance penalty in using
> dmaengine, and do you have any figures ?

The DMA transfers themselves certainly perform equally well, and the
framework is just a thin layer. Where would you expect performance penalty?

> Lastly, they was debug information to debug descriptors chaining, channel
> statuses, requestors. I didn't see where these had gone, could you point me to
> the right file ?

Such a debug interface is not part of the mmp-pdma implementation at
this point, and the core doesn't have a generic debugfs feature either.
If you need that, we'd have to add it back.

FWIW, I attached my work-in-progress patch for this driver which just
does some basic dmaengine preparations. Be aware that this does not even
compile, it's really just a snapshot.


Thanks,
Daniel


--------------070500070707050900070408
Content-Type: text/x-patch;
 name="0001-drivers-media-platform-soc_camera-pxa_camera.c-DMAEN.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-drivers-media-platform-soc_camera-pxa_camera.c-DMAEN.pa";
 filename*1="tch"

>From 8d7333689479640d2586358ffb8f4e1704e4b015 Mon Sep 17 00:00:00 2001
From: Daniel Mack <zonque@gmail.com>
Date: Sun, 4 Aug 2013 00:23:00 +0200
Subject: [PATCH] drivers/media/platform/soc_camera/pxa_camera.c DMAENGINE WIP

---
 drivers/media/platform/soc_camera/pxa_camera.c | 262 ++++++++++++-------------
 1 file changed, 121 insertions(+), 141 deletions(-)

diff --git a/drivers/media/platform/soc_camera/pxa_camera.c b/drivers/media/platform/soc_camera/pxa_camera.c
index d4df305..4dfd97f 100644
--- a/drivers/media/platform/soc_camera/pxa_camera.c
+++ b/drivers/media/platform/soc_camera/pxa_camera.c
@@ -28,6 +28,9 @@
 #include <linux/clk.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/dmaengine.h>
+#include <linux/dma-mapping.h>
+#include <linux/dma/mmp-pdma.h>
 
 #include <media/v4l2-common.h>
 #include <media/v4l2-dev.h>
@@ -37,7 +40,6 @@
 
 #include <linux/videodev2.h>
 
-#include <mach/dma.h>
 #include <linux/platform_data/camera-pxa.h>
 
 #define PXA_CAM_VERSION "0.0.6"
@@ -177,8 +179,6 @@ enum pxa_camera_active_dma {
 /* descriptor needed for the PXA DMA engine */
 struct pxa_cam_dma {
 	dma_addr_t		sg_dma;
-	struct pxa_dma_desc	*sg_cpu;
-	size_t			sg_size;
 	int			sglen;
 };
 
@@ -206,7 +206,8 @@ struct pxa_camera_dev {
 	void __iomem		*base;
 
 	int			channels;
-	unsigned int		dma_chans[3];
+	struct dma_chan		*dma_chans[3];
+	unsigned int		dma_len;
 
 	struct pxacamera_platform_data *pdata;
 	struct resource		*res;
@@ -257,15 +258,18 @@ static int pxa_videobuf_setup(struct videobuf_queue *vq, unsigned int *count,
 static void free_buffer(struct videobuf_queue *vq, struct pxa_buffer *buf)
 {
 	struct soc_camera_device *icd = vq->priv_data;
-	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
 	struct videobuf_dmabuf *dma = videobuf_to_dma(&buf->vb);
-	int i;
 
 	BUG_ON(in_interrupt());
 
 	dev_dbg(icd->parent, "%s (vb=0x%p) 0x%08lx %d\n", __func__,
 		&buf->vb, buf->vb.baddr, buf->vb.bsize);
 
+	/* FIXME */
+	dmaengine_terminate_all(NULL);
+	dmaengine_terminate_all(NULL);
+	dmaengine_terminate_all(NULL);
+
 	/*
 	 * This waits until this buffer is out of danger, i.e., until it is no
 	 * longer in STATE_QUEUED or STATE_ACTIVE
@@ -274,15 +278,6 @@ static void free_buffer(struct videobuf_queue *vq, struct pxa_buffer *buf)
 	videobuf_dma_unmap(vq->dev, dma);
 	videobuf_dma_free(dma);
 
-	for (i = 0; i < ARRAY_SIZE(buf->dmas); i++) {
-		if (buf->dmas[i].sg_cpu)
-			dma_free_coherent(ici->v4l2_dev.dev,
-					  buf->dmas[i].sg_size,
-					  buf->dmas[i].sg_cpu,
-					  buf->dmas[i].sg_dma);
-		buf->dmas[i].sg_cpu = NULL;
-	}
-
 	buf->vb.state = VIDEOBUF_NEEDS_INIT;
 }
 
@@ -309,6 +304,27 @@ static int calculate_dma_sglen(struct scatterlist *sglist, int sglen,
 	return i + 1;
 }
 
+static void pxa_camera_dma_irq(int channel, struct pxa_camera_dev *pcdev,
+			       enum pxa_camera_active_dma act_dma);
+
+static void pxa_camera_dma_irq_y(int channel, void *data)
+{
+	struct pxa_camera_dev *pcdev = data;
+	pxa_camera_dma_irq(channel, pcdev, DMA_Y);
+}
+
+static void pxa_camera_dma_irq_u(int channel, void *data)
+{
+	struct pxa_camera_dev *pcdev = data;
+	pxa_camera_dma_irq(channel, pcdev, DMA_U);
+}
+
+static void pxa_camera_dma_irq_v(int channel, void *data)
+{
+	struct pxa_camera_dev *pcdev = data;
+	pxa_camera_dma_irq(channel, pcdev, DMA_V);
+}
+
 /**
  * pxa_init_dma_channel - init dma descriptors
  * @pcdev: pxa camera device
@@ -332,61 +348,61 @@ static int pxa_init_dma_channel(struct pxa_camera_dev *pcdev,
 				struct scatterlist **sg_first, int *sg_first_ofs)
 {
 	struct pxa_cam_dma *pxa_dma = &buf->dmas[channel];
+	struct dma_chan *dma_chan = pcdev->dma_chans[channel];
 	struct device *dev = pcdev->soc_host.v4l2_dev.dev;
 	struct scatterlist *sg;
-	int i, offset, sglen;
+	int ret, i, offset, sglen;
 	int dma_len = 0, xfer_len = 0;
+	struct dma_slave_config config;
+	struct dma_async_tx_descriptor *tx;
 
-	if (pxa_dma->sg_cpu)
-		dma_free_coherent(dev, pxa_dma->sg_size,
-				  pxa_dma->sg_cpu, pxa_dma->sg_dma);
+	dmaengine_terminate_all(dma_chan);
 
 	sglen = calculate_dma_sglen(*sg_first, dma->sglen,
 				    *sg_first_ofs, size);
 
-	pxa_dma->sg_size = (sglen + 1) * sizeof(struct pxa_dma_desc);
-	pxa_dma->sg_cpu = dma_alloc_coherent(dev, pxa_dma->sg_size,
-					     &pxa_dma->sg_dma, GFP_KERNEL);
-	if (!pxa_dma->sg_cpu)
-		return -ENOMEM;
-
 	pxa_dma->sglen = sglen;
 	offset = *sg_first_ofs;
 
 	dev_dbg(dev, "DMA: sg_first=%p, sglen=%d, ofs=%d, dma.desc=%x\n",
 		*sg_first, sglen, *sg_first_ofs, pxa_dma->sg_dma);
 
+	memset(&config, 0, sizeof(config));
+	config.src_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE; /* FIXME? */
+	config.src_maxburst = 8;
+	config.src_addr = pcdev->res->start + cibr;
+	config.direction = DMA_DEV_TO_MEM;
 
-	for_each_sg(*sg_first, sg, sglen, i) {
-		dma_len = sg_dma_len(sg);
-
-		/* PXA27x Developer's Manual 27.4.4.1: round up to 8 bytes */
-		xfer_len = roundup(min(dma_len - offset, size), 8);
-
-		size = max(0, size - xfer_len);
+	ret = dmaengine_slave_config(dma_chan, &config);
+	if (ret < 0) {
+		printk("%s(): dma slave config failed: %d\n", __func__, ret);
+		return ret;
+	}
 
-		pxa_dma->sg_cpu[i].dsadr = pcdev->res->start + cibr;
-		pxa_dma->sg_cpu[i].dtadr = sg_dma_address(sg) + offset;
-		pxa_dma->sg_cpu[i].dcmd =
-			DCMD_FLOWSRC | DCMD_BURST8 | DCMD_INCTRGADDR | xfer_len;
-#ifdef DEBUG
-		if (!i)
-			pxa_dma->sg_cpu[i].dcmd |= DCMD_STARTIRQEN;
-#endif
-		pxa_dma->sg_cpu[i].ddadr =
-			pxa_dma->sg_dma + (i + 1) * sizeof(struct pxa_dma_desc);
+	pcdev->dma_len = dma_map_sg(dma_chan->device->dev, *sg_first, sg_len,
+				    DMA_FROM_DEVICE);
 
-		dev_vdbg(dev, "DMA: desc.%08x->@phys=0x%08x, len=%d\n",
-			 pxa_dma->sg_dma + i * sizeof(struct pxa_dma_desc),
-			 sg_dma_address(sg) + offset, xfer_len);
-		offset = 0;
+	tx = dmaengine_prep_slave_sg(chan, *sg_first, pcdev->dma_len,
+				     config.direction,
+				     DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+	if (!tx) {
+		printk("%s(): prep_slave_sg() failed\n", __func__, ret);
+		return;
+	}
 
-		if (size == 0)
-			break;
+	switch (channel) {
+	case 0:
+		tx->callback = pxa_camera_dma_irq_y;
+		break;
+	case 1:
+		tx->callback = pxa_camera_dma_irq_u;
+		break;
+	case 2:
+		tx->callback = pxa_camera_dma_irq_v;
+		break;
 	}
 
-	pxa_dma->sg_cpu[sglen].ddadr = DDADR_STOP;
-	pxa_dma->sg_cpu[sglen].dcmd  = DCMD_FLOWSRC | DCMD_BURST8 | DCMD_ENDIRQEN;
+	tx->callback_param = pcdev;
 
 	/*
 	 * Handle 1 special case :
@@ -395,14 +411,16 @@ static int pxa_init_dma_channel(struct pxa_camera_dev *pcdev,
 	 *    for next plane should be the next after the last used to store the
 	 *    last scatter gather RAM page
 	 */
-	if (xfer_len >= dma_len) {
-		*sg_first_ofs = xfer_len - dma_len;
+	if (xfer_len >= pcdev->dma_len) {
+		*sg_first_ofs = xfer_len - pcdev->dma_len;
 		*sg_first = sg_next(sg);
 	} else {
 		*sg_first_ofs = xfer_len;
 		*sg_first = sg;
 	}
 
+	dmaengine_submit(tx);
+
 	return 0;
 }
 
@@ -524,11 +542,7 @@ static int pxa_videobuf_prepare(struct videobuf_queue *vq,
 	return 0;
 
 fail_v:
-	dma_free_coherent(dev, buf->dmas[1].sg_size,
-			  buf->dmas[1].sg_cpu, buf->dmas[1].sg_dma);
 fail_u:
-	dma_free_coherent(dev, buf->dmas[0].sg_size,
-			  buf->dmas[0].sg_cpu, buf->dmas[0].sg_dma);
 fail:
 	free_buffer(vq, buf);
 out:
@@ -552,10 +566,8 @@ static void pxa_dma_start_channels(struct pxa_camera_dev *pcdev)
 
 	for (i = 0; i < pcdev->channels; i++) {
 		dev_dbg(pcdev->soc_host.v4l2_dev.dev,
-			"%s (channel=%d) ddadr=%08x\n", __func__,
-			i, active->dmas[i].sg_dma);
-		DDADR(pcdev->dma_chans[i]) = active->dmas[i].sg_dma;
-		DCSR(pcdev->dma_chans[i]) = DCSR_RUN;
+			"%s (channel=%d)\n", __func__, i);
+		dma_async_issue_pending(pcdev->dma_chans[i]);
 	}
 }
 
@@ -566,7 +578,7 @@ static void pxa_dma_stop_channels(struct pxa_camera_dev *pcdev)
 	for (i = 0; i < pcdev->channels; i++) {
 		dev_dbg(pcdev->soc_host.v4l2_dev.dev,
 			"%s (channel=%d)\n", __func__, i);
-		DCSR(pcdev->dma_chans[i]) = 0;
+		dmaengine_terminate_all(pcdev->dma_chans[i]);
 	}
 }
 
@@ -739,25 +751,13 @@ static void pxa_camera_dma_irq(int channel, struct pxa_camera_dev *pcdev,
 
 	spin_lock_irqsave(&pcdev->lock, flags);
 
-	status = DCSR(channel);
-	DCSR(channel) = status;
+/* FIXME: dma_unmap_sg() */
 
 	camera_status = __raw_readl(pcdev->base + CISR);
 	overrun = CISR_IFO_0;
 	if (pcdev->channels == 3)
 		overrun |= CISR_IFO_1 | CISR_IFO_2;
 
-	if (status & DCSR_BUSERR) {
-		dev_err(dev, "DMA Bus Error IRQ!\n");
-		goto out;
-	}
-
-	if (!(status & (DCSR_ENDINTR | DCSR_STARTINTR))) {
-		dev_err(dev, "Unknown DMA IRQ source, status: 0x%08x\n",
-			status);
-		goto out;
-	}
-
 	/*
 	 * pcdev->active should not be NULL in DMA irq handler.
 	 *
@@ -777,52 +777,28 @@ static void pxa_camera_dma_irq(int channel, struct pxa_camera_dev *pcdev,
 	buf = container_of(vb, struct pxa_buffer, vb);
 	WARN_ON(buf->inwork || list_empty(&vb->queue));
 
-	dev_dbg(dev, "%s channel=%d %s%s(vb=0x%p) dma.desc=%x\n",
-		__func__, channel, status & DCSR_STARTINTR ? "SOF " : "",
-		status & DCSR_ENDINTR ? "EOF " : "", vb, DDADR(channel));
-
-	if (status & DCSR_ENDINTR) {
-		/*
-		 * It's normal if the last frame creates an overrun, as there
-		 * are no more DMA descriptors to fetch from QCI fifos
-		 */
-		if (camera_status & overrun &&
-		    !list_is_last(pcdev->capture.next, &pcdev->capture)) {
-			dev_dbg(dev, "FIFO overrun! CISR: %x\n",
-				camera_status);
-			pxa_camera_stop_capture(pcdev);
-			pxa_camera_start_capture(pcdev);
-			goto out;
-		}
-		buf->active_dma &= ~act_dma;
-		if (!buf->active_dma) {
-			pxa_camera_wakeup(pcdev, vb, buf);
-			pxa_camera_check_link_miss(pcdev);
-		}
+	/*
+	 * It's normal if the last frame creates an overrun, as there
+	 * are no more DMA descriptors to fetch from QCI fifos
+	 */
+	if (camera_status & overrun &&
+	    !list_is_last(pcdev->capture.next, &pcdev->capture)) {
+		dev_dbg(dev, "FIFO overrun! CISR: %x\n",
+			camera_status);
+		pxa_camera_stop_capture(pcdev);
+		pxa_camera_start_capture(pcdev);
+		goto out;
+	}
+	buf->active_dma &= ~act_dma;
+	if (!buf->active_dma) {
+		pxa_camera_wakeup(pcdev, vb, buf);
+		pxa_camera_check_link_miss(pcdev);
 	}
 
 out:
 	spin_unlock_irqrestore(&pcdev->lock, flags);
 }
 
-static void pxa_camera_dma_irq_y(int channel, void *data)
-{
-	struct pxa_camera_dev *pcdev = data;
-	pxa_camera_dma_irq(channel, pcdev, DMA_Y);
-}
-
-static void pxa_camera_dma_irq_u(int channel, void *data)
-{
-	struct pxa_camera_dev *pcdev = data;
-	pxa_camera_dma_irq(channel, pcdev, DMA_U);
-}
-
-static void pxa_camera_dma_irq_v(int channel, void *data)
-{
-	struct pxa_camera_dev *pcdev = data;
-	pxa_camera_dma_irq(channel, pcdev, DMA_V);
-}
-
 static struct videobuf_queue_ops pxa_videobuf_ops = {
 	.buf_setup      = pxa_videobuf_setup,
 	.buf_prepare    = pxa_videobuf_prepare,
@@ -1655,6 +1631,7 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	struct pxa_camera_dev *pcdev;
 	struct resource *res;
 	void __iomem *base;
+	unsigned int drcmr;
 	int irq;
 	int err = 0;
 
@@ -1717,36 +1694,35 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	pcdev->base = base;
 
 	/* request dma */
-	err = pxa_request_dma("CI_Y", DMA_PRIO_HIGH,
-			      pxa_camera_dma_irq_y, pcdev);
-	if (err < 0) {
+	dma_cap_zero(mask);
+	dma_cap_set(DMA_SLAVE, mask);
+
+	drcmr = 68;
+	pcdev->dma_chans[0] =
+		dma_request_slave_channel_compat(mask, mmp_pdma_filter_fn,
+						 &drcmr, &pdev->dev, "CI_Y");
+	if (!pcdev->dma_chans[0]) {
 		dev_err(&pdev->dev, "Can't request DMA for Y\n");
-		return err;
+		return -ENODEV;
 	}
-	pcdev->dma_chans[0] = err;
-	dev_dbg(&pdev->dev, "got DMA channel %d\n", pcdev->dma_chans[0]);
 
-	err = pxa_request_dma("CI_U", DMA_PRIO_HIGH,
-			      pxa_camera_dma_irq_u, pcdev);
-	if (err < 0) {
-		dev_err(&pdev->dev, "Can't request DMA for U\n");
+	drcmr = 69;
+	pcdev->dma_chans[1] =
+		dma_request_slave_channel_compat(mask, mmp_pdma_filter_fn,
+						 &drcmr, &pdev->dev, "CI_U");
+	if (!pcdev->dma_chans[1]) {
+		dev_err(&pdev->dev, "Can't request DMA for Y\n");
 		goto exit_free_dma_y;
 	}
-	pcdev->dma_chans[1] = err;
-	dev_dbg(&pdev->dev, "got DMA channel (U) %d\n", pcdev->dma_chans[1]);
 
-	err = pxa_request_dma("CI_V", DMA_PRIO_HIGH,
-			      pxa_camera_dma_irq_v, pcdev);
-	if (err < 0) {
+	drcmr = 70;
+	pcdev->dma_chans[2] =
+		dma_request_slave_channel_compat(mask, mmp_pdma_filter_fn,
+						 &drcmr, &pdev->dev, "CI_V");
+	if (!pcdev->dma_chans[2]) {
 		dev_err(&pdev->dev, "Can't request DMA for V\n");
 		goto exit_free_dma_u;
 	}
-	pcdev->dma_chans[2] = err;
-	dev_dbg(&pdev->dev, "got DMA channel (V) %d\n", pcdev->dma_chans[2]);
-
-	DRCMR(68) = pcdev->dma_chans[0] | DRCMR_MAPVLD;
-	DRCMR(69) = pcdev->dma_chans[1] | DRCMR_MAPVLD;
-	DRCMR(70) = pcdev->dma_chans[2] | DRCMR_MAPVLD;
 
 	/* request irq */
 	err = devm_request_irq(&pdev->dev, pcdev->irq, pxa_camera_irq, 0,
@@ -1769,11 +1745,11 @@ static int pxa_camera_probe(struct platform_device *pdev)
 	return 0;
 
 exit_free_dma:
-	pxa_free_dma(pcdev->dma_chans[2]);
+	dma_release_channel(dma_chans[2]);
 exit_free_dma_u:
-	pxa_free_dma(pcdev->dma_chans[1]);
+	dma_release_channel(dma_chans[1]);
 exit_free_dma_y:
-	pxa_free_dma(pcdev->dma_chans[0]);
+	dma_release_channel(dma_chans[0]);
 	return err;
 }
 
@@ -1783,9 +1759,13 @@ static int pxa_camera_remove(struct platform_device *pdev)
 	struct pxa_camera_dev *pcdev = container_of(soc_host,
 					struct pxa_camera_dev, soc_host);
 
-	pxa_free_dma(pcdev->dma_chans[0]);
-	pxa_free_dma(pcdev->dma_chans[1]);
-	pxa_free_dma(pcdev->dma_chans[2]);
+	dmaengine_terminate_all(dma_chans[0]);
+	dmaengine_terminate_all(dma_chans[1]);
+	dmaengine_terminate_all(dma_chans[2]);
+
+	dma_release_channel(dma_chans[0]);
+	dma_release_channel(dma_chans[1]);
+	dma_release_channel(dma_chans[2]);
 
 	soc_camera_host_unregister(soc_host);
 
-- 
1.8.3.1


--------------070500070707050900070408--
