Return-Path: <SRS0=/HUW=DJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 550C8C4363D
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2020 13:44:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD82A206CA
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2020 13:44:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OfB1UlcJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ydYjizua"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD82A206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZTt2U8sIysVUs62fAF0/sYezaxHdKdRLf/iML4qxdRw=; b=OfB1UlcJMfCnA7xLD4Yb7qZOw
	Y05TDertir73inYBQZVAwVFRy90YLCQUfuaCqFhq6rD6LzfpZuxVWWo9tcAtslPGsxtQg9WkmqEsu
	sSBBDOCgMRRReqpOxf20uBxWC1DprJWJRr4pb6/3+STpmShz6eP5W6ur1Fa3Y2iGxMRWLBXzZg+h4
	JOLKNm1breGUfKCNLlDgOMwtNqdS3O58+LMYqygiXDiIVSlN8HPItn8AGPtn4gSfPD7+TmOX3Zs3E
	UZDVbGbtFfkLfrcX7hmGAqDrUkse3zlJ4PjWV2Fol6I58hw0C1OgluobUp+rfChnPg5/AjZ3NeFwz
	k47+F7BJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOLLS-0003mv-PF; Fri, 02 Oct 2020 13:43:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOLLQ-0003li-OD
 for linux-mtd@lists.infradead.org; Fri, 02 Oct 2020 13:43:33 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D84A206CA;
 Fri,  2 Oct 2020 13:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601646212;
 bh=ztJ79iu751NzFNs1C+Y906mgA/xV0xzf9l84gu1qG6Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ydYjizua5HHKMPw1y3vHC3z/Aj+G49Pb/0OdzRNaE0+Jmj/C+HC96w102hxzsKTo0
 hz0bz0EiwzhuCnnxloiOMTa9WKlYz/U9kr/Q98rJgL+Fw5M0OqRyUUJDV/wlw6LwWA
 s+9rzsRp9RkP+5XM8uGael6MtHFydliSPWzv41FU=
Date: Fri, 2 Oct 2020 15:43:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Gutson <daniel.gutson@eclypsium.com>
Subject: Re: [PATCH 2/2] Platform integrity information in sysfs (version 9)
Message-ID: <20201002134331.GA3418160@kroah.com>
References: <20200930163714.12879-1-daniel.gutson@eclypsium.com>
 <20200930163714.12879-3-daniel.gutson@eclypsium.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930163714.12879-3-daniel.gutson@eclypsium.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_094332_899446_9336BB6F 
X-CRM114-Status: GOOD (  27.91  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Richard Weinberger <richard@nod.at>, Richard Hughes <hughsient@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Alex Bazhaniuk <alex@eclypsium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Sep 30, 2020 at 01:37:14PM -0300, Daniel Gutson wrote:
> This patch exports the BIOS Write Enable (bioswe), BIOS
> Lock Enable (biosle), and the SMM BIOS Write Protect (SMM_BIOSWP) fields of
> the BIOS Control register using the platform-integrity misc kernel module.
> The idea is to keep adding more flags, not only from the BC but also from
> other registers in following versions.
> 
> The goal is that the attributes are avilable to fwupd when SecureBoot
> is turned on.
> 
> Signed-off-by: Daniel Gutson <daniel.gutson@eclypsium.com>

The subject line doesn't match what this patch does, please fix that up.

But there are more core issues in this patch:

> 
> ---
>  drivers/mtd/spi-nor/controllers/Kconfig       |  1 +
>  .../mtd/spi-nor/controllers/intel-spi-pci.c   | 75 ++++++++++++++-
>  .../spi-nor/controllers/intel-spi-platform.c  |  2 +-
>  drivers/mtd/spi-nor/controllers/intel-spi.c   | 91 ++++++++++++++++++-
>  drivers/mtd/spi-nor/controllers/intel-spi.h   |  9 +-
>  5 files changed, 171 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/controllers/Kconfig b/drivers/mtd/spi-nor/controllers/Kconfig
> index 5c0e0ec2e6d1..e7eaef506fc2 100644
> --- a/drivers/mtd/spi-nor/controllers/Kconfig
> +++ b/drivers/mtd/spi-nor/controllers/Kconfig
> @@ -29,6 +29,7 @@ config SPI_NXP_SPIFI
>  
>  config SPI_INTEL_SPI
>  	tristate
> +	depends on PLATFORM_INTEGRITY_DATA
>  
>  config SPI_INTEL_SPI_PCI
>  	tristate "Intel PCH/PCU SPI flash PCI driver (DANGEROUS)"
> diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
> index c72aa1ab71ad..644b1a6091dc 100644
> --- a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
> +++ b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
> @@ -10,11 +10,19 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/platform-integrity.h>
>  
>  #include "intel-spi.h"
>  
>  #define BCR		0xdc
>  #define BCR_WPD		BIT(0)
> +#define BCR_BLE		BIT(1)
> +#define BCR_SMM_BWP	BIT(5)
> +
> +struct cnl_spi_attr {
> +	struct device_attribute dev_attr;
> +	u32 mask;
> +};
>  
>  static const struct intel_spi_boardinfo bxt_info = {
>  	.type = INTEL_SPI_BXT,
> @@ -24,6 +32,70 @@ static const struct intel_spi_boardinfo cnl_info = {
>  	.type = INTEL_SPI_CNL,
>  };
>  
> +#ifdef CONFIG_PLATFORM_INTEGRITY_DATA
> +static ssize_t intel_spi_cnl_spi_attr_show(struct device *dev,
> +					   struct device_attribute *attr,
> +					   char *buf, u32 mask)
> +{
> +	u32 bcr;
> +
> +	if (dev->parent == NULL)
> +		return -EIO;
> +
> +	if (pci_read_config_dword(container_of(dev->parent, struct pci_dev, dev),
> +				  BCR, &bcr) != PCIBIOS_SUCCESSFUL)
> +		return -EIO;
> +
> +	return sprintf(buf, "%d\n", (int)!!(bcr & mask));
> +}
> +
> +static ssize_t bioswe_show(struct device *dev, struct device_attribute *attr,
> +			   char *buf)
> +{
> +	return intel_spi_cnl_spi_attr_show(dev, attr, buf, BCR_WPD);
> +}
> +static DEVICE_ATTR_RO(bioswe);
> +
> +static ssize_t biosle_show(struct device *dev, struct device_attribute *attr,
> +			   char *buf)
> +{
> +	return intel_spi_cnl_spi_attr_show(dev, attr, buf, BCR_BLE);
> +}
> +static DEVICE_ATTR_RO(biosle);
> +
> +static ssize_t smm_bioswp_show(struct device *dev, struct device_attribute *attr,
> +			       char *buf)
> +{
> +	return intel_spi_cnl_spi_attr_show(dev, attr, buf, BCR_SMM_BWP);
> +}
> +static DEVICE_ATTR_RO(smm_bioswp);
> +
> +static struct attribute *cnl_attrs[] = {
> +	&dev_attr_bioswe.attr,
> +	&dev_attr_biosle.attr,
> +	&dev_attr_smm_bioswp.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(cnl);

If you are forcing the driver to create the groups, then you are forcing
us to audit each driver and verify that the files are the same name and
such.  Put the files in the "common" code please, and if you really need
a way to get the data out, make that a callback or something.

Also, this name "platform integrity" is really really generic, while in
reality you are describing something very specific.  Are you sure you
want that?

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
