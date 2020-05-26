Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F2F8C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 09:28:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C6D020787
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 09:28:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NUZvCjF5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C6D020787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+cFQYqXl/lM/O0ftxlTP05Mv6a6EvHZZODdc5Dusz4=; b=NUZvCjF5fK5ogF
	2mHcjBRHJ+lvoysZ9o9MG6ljX/r4gGbNDCYg5HlKC0Ymz5ubXrnOiSPKRM7rFfEEvlEY/uH6idNYR
	FnlEeWmTTduqmoUF75rRdkW2sbm4VDV1e6+ksAN2jeBueIRySxrZsvLRODc1sc0NxOZyGhIQ5b0+7
	+X4mZMTVrd+DDc8GSc73gD82GFv9xRMAxYquclMXc19jfxcqbEQVLJYGSEm7Qs1AAVBzsndHTph/T
	squaP7vtk/YFXEwIicF57JIlpLEMziELZkvca/j4thWUHgk674dFU3VvAG9oDtbFOH5uGgPNJn9am
	2YvH/jXCFmpzZ+8KevnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdVsO-0005eh-C2; Tue, 26 May 2020 09:28:00 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdVsK-0005e4-Rd
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 09:27:58 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 08FAA2A0297;
 Tue, 26 May 2020 10:27:55 +0100 (BST)
Date: Tue, 26 May 2020 11:27:52 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Pratyush Yadav <me@yadavpratyush.com>
Subject: Re: [RFC PATCH 3/3] spi: hisi-sfc-v3xx: Add prepare/unprepare
 methods to avoid race condition
Message-ID: <20200526112752.6dd0da2c@collabora.com>
In-Reply-To: <20200525161436.c5h6d27pm3jptwbo@yadavpratyush.com>
References: <1590060231-23242-1-git-send-email-yangyicong@hisilicon.com>
 <1590060231-23242-4-git-send-email-yangyicong@hisilicon.com>
 <20200525161436.c5h6d27pm3jptwbo@yadavpratyush.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_022757_156444_8B104E22 
X-CRM114-Status: GOOD (  35.73  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 john.garry@huawei.com, linux-spi@vger.kernel.org, broonie@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 Yicong Yang <yangyicong@hisilicon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 25 May 2020 21:44:36 +0530
Pratyush Yadav <me@yadavpratyush.com> wrote:

> Hi Yicong,
> 
> On 21/05/20 07:23PM, Yicong Yang wrote:
> > The controller can be shared with the firmware, which may cause race
> > problems. As most read/write/erase/lock/unlock of spi-nor flash are
> > composed of a set of operations, while the firmware may use the controller
> > and start its own operation in the middle of the process started by the
> > kernel driver, which may lead to the kernel driver's function broken.
> > 
> > Bit[20] in HISI_SFC_V3XX_CMD_CFG register plays a role of a lock, to
> > protect the controller from firmware access, which means the firmware
> > cannot reach the controller if the driver set the bit. Add prepare/
> > unprepare methods for the controller, we'll hold the lock in prepare
> > method and release it in unprepare method, which will solve the race
> > issue.  
> 
> I'm trying to understand the need for this change. What's wrong with
> performing the lock/unlock procedure in hisi_sfc_v3xx_exec_op()? You can 
> probably do something like:
> 
>   hisi_sfc_v3xx_lock();
>   ret = hisi_sfc_v3xx_generic_exec_op(host, op, chip_select);
>   hisi_sfc_v3xx_unlock();
>   return ret;
> 
> What's the benefit of making upper layers do this? Acquiring the lock is 
> a simple register write, so it should be relatively fast. Unless there 
> is a lot of contention on the lock between the firmware and kernel, I 
> would expect the performance impact to be minimal. Maybe you can run 
> some benchmarks and see if there is a real difference.
> 
> > Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> > ---
> >  drivers/spi/spi-hisi-sfc-v3xx.c | 41 ++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 40 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/spi/spi-hisi-sfc-v3xx.c b/drivers/spi/spi-hisi-sfc-v3xx.c
> > index e3b5725..13c161c 100644
> > --- a/drivers/spi/spi-hisi-sfc-v3xx.c
> > +++ b/drivers/spi/spi-hisi-sfc-v3xx.c
> > @@ -18,6 +18,7 @@
> >  #define HISI_SFC_V3XX_VERSION (0x1f8)
> >  
> >  #define HISI_SFC_V3XX_CMD_CFG (0x300)
> > +#define HISI_SFC_V3XX_CMD_CFG_LOCK BIT(20)
> >  #define HISI_SFC_V3XX_CMD_CFG_DUAL_IN_DUAL_OUT (1 << 17)
> >  #define HISI_SFC_V3XX_CMD_CFG_DUAL_IO (2 << 17)
> >  #define HISI_SFC_V3XX_CMD_CFG_FULL_DIO (3 << 17)
> > @@ -41,6 +42,34 @@ struct hisi_sfc_v3xx_host {
> >  	int max_cmd_dword;
> >  };
> >  
> > +int hisi_sfc_v3xx_op_prepare(struct spi_mem *mem)
> > +{
> > +	struct spi_device *spi = mem->spi;
> > +	struct hisi_sfc_v3xx_host *host;
> > +	u32 reg = HISI_SFC_V3XX_CMD_CFG_LOCK;
> > +
> > +	host = spi_controller_get_devdata(spi->master);
> > +
> > +	writel(reg, host->regbase + HISI_SFC_V3XX_CMD_CFG);
> > +
> > +	reg = readl(host->regbase + HISI_SFC_V3XX_CMD_CFG);
> > +	if (!(reg & HISI_SFC_V3XX_CMD_CFG_LOCK))
> > +		return -EIO;  
> 
> IIUC, you are checking if you actually got the lock, and you won't get 
> the lock if the firmware is using the controller. So, is it a good idea 
> to give up so easily? Maybe we should do this in a loop at some 
> intervals, and only error out when we reach a number of failed attempts?
> 
> > +
> > +	return 0;
> > +}
> > +
> > +void hisi_sfc_v3xx_op_unprepare(struct spi_mem *mem)
> > +{
> > +	struct spi_device *spi = mem->spi;
> > +	struct hisi_sfc_v3xx_host *host;
> > +
> > +	host = spi_controller_get_devdata(spi->master);
> > +
> > +	/* Release the lock and clear the command register. */
> > +	writel(0, host->regbase + HISI_SFC_V3XX_CMD_CFG);
> > +}
> > +
> >  #define HISI_SFC_V3XX_WAIT_TIMEOUT_US		1000000
> >  #define HISI_SFC_V3XX_WAIT_POLL_INTERVAL_US	10
> >  
> > @@ -163,7 +192,15 @@ static int hisi_sfc_v3xx_generic_exec_op(struct hisi_sfc_v3xx_host *host,
> >  					 u8 chip_select)
> >  {
> >  	int ret, len = op->data.nbytes;
> > -	u32 config = 0;
> > +	u32 config;
> > +
> > +	/*
> > +	 * The lock bit is in the command register. Clear the command
> > +	 * field with lock bit held if it has been set in
> > +	 * .prepare().
> > +	 */
> > +	config = readl(host->regbase + HISI_SFC_V3XX_CMD_CFG);
> > +	config &= HISI_SFC_V3XX_CMD_CFG_LOCK;  
> 
> This will unlock the controller _before_ the driver issues 
> hisi_sfc_v3xx_read_databuf(). I'm not very familiar with the hardware, 
> but to me it seems like it can lead to a race. What if the firmware 
> issues a command that over-writes the databuf (I assume this is shared 
> between the two) before the driver gets a chance to copy that data to 
> the kernel buffer?

Like Pratyush said, I don't see why you need to expose new
prepare/unprepare steps. Looks like something entirely controller
specific.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
