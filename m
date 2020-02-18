Return-Path: <SRS0=v3L2=4G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D63C34031
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 07:13:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A87C6207FD
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 07:13:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dhkogOjy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="Kyk6oqJQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A87C6207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jFd1ue7KyNzRy1wqTlkc+P0koBUznAKhnnsWYLTNmnM=; b=dhkogOjyknC7pnp1L35/491/V
	Q2gJMFKQ27iDY1ztaAE9+i0bKiFbUMqZxQaYyAHNQngh3hFxfrYLF8myR2QlhtDv9stMn1QDR7p3V
	JC4Mjwy5QhcSifVvkRYZ1godx9quj+150eciq3JMR7Fj64Dtvkp8zUfnJhy6bPRuJ/LzVxl7dP1ZX
	gdEWFn6nsWynouDfSp5+hIaCyq+5AfMt2sqRFzBr5e+lYR3kBctEmJMzvOtWrDdWXlpIERbPMGOoX
	UwCVGD74tyiSJEHdUaskH5E45fTPFfrkpFauhHZ8+niy7XDtgMuMU/fK/VKb4WrQC4T5Dk84qaC4s
	uOrGS54gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3x3q-0004j0-Gz; Tue, 18 Feb 2020 07:12:50 +0000
Received: from de-out1.bosch-org.com ([139.15.230.186])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3x3l-0004iA-6i
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2020 07:12:48 +0000
Received: from fe0vm1650.rbesz01.com (unknown [139.15.230.188])
 by fe0vms0187.rbdmz01.com (Postfix) with ESMTPS id 48MBrD2TH7z1XLDRh;
 Tue, 18 Feb 2020 08:12:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
 s=key3-intmail; t=1582009948;
 bh=kQT7GYNs2QKbrPoNwmqdBrYYuEol2RWS44IJGfP1KPA=; l=10;
 h=Subject:From:From:Reply-To:Sender;
 b=Kyk6oqJQLdYnko+bRh9/6f8OIt8E4yrfqiaFkea3c5FeBmHcBRnCDu+zqatX1xNIL
 /PyGNN9M+RPvViM21r79hun3Q2eSyfb444UvgQrvMdtBa2005lcYwZKIWYjKaJnN7m
 ntOlesTNdRNbiJWDtv+qGICZ7pokx+ypIHltMTDs=
Received: from si0vm2082.rbesz01.com (unknown [10.58.172.176])
 by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 48MBrD1zHdz1rW;
 Tue, 18 Feb 2020 08:12:28 +0100 (CET)
X-AuditID: 0a3aad16-099ff70000004782-ae-5e4b8e5c6d12
Received: from fe0vm1651.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by si0vm2082.rbesz01.com (SMG Outbound) with SMTP id 4A.80.18306.C5E8B4E5;
 Tue, 18 Feb 2020 08:12:28 +0100 (CET)
Received: from FE-HUB2000.de.bosch.com (unknown [10.4.103.109])
 by fe0vm1651.rbesz01.com (Postfix) with ESMTPS id 48MBrD03vqzvl2;
 Tue, 18 Feb 2020 08:12:28 +0100 (CET)
Received: from [10.34.222.178] (10.34.222.178) by FE-HUB2000.de.bosch.com
 (10.4.103.109) with Microsoft SMTP Server id 15.1.1847.3; Tue, 18 Feb 2020
 08:12:27 +0100
Subject: Re: [PATCH RFT 0/2/2] mtd: hyperbus: add Renesas RPC-IF driver
To: Vignesh Raghavendra <vigneshr@ti.com>, Sergei Shtylyov
 <sergei.shtylyov@cogentembedded.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
References: <fd1360ab-8872-f750-1314-77c6d432b413@cogentembedded.com>
 <eba43289-3cb2-406b-cc5f-1209778621bf@cogentembedded.com>
 <16309076-4378-d9ff-30c3-93a46af1d803@ti.com>
From: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
Message-ID: <eed17a25-e21c-b493-98e8-e25150216731@de.bosch.com>
Date: Tue, 18 Feb 2020 08:12:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <16309076-4378-d9ff-30c3-93a46af1d803@ti.com>
Content-Language: en-US
X-Originating-IP: [10.34.222.178]
X-Brightmail-Tracker: H4sIAAAAAAAAA21SfUwbZRzmvbv23jY9d70O+rOCH42LmdPZ4TR1OmZC4hrZsi3RGM2AFTna
 aj/wriwDP4aLASHANoYfdFI6qBvZqoMNV9iMzs5tjMDQRVxlug7thEGdn0T8w2CPg7V/+M/l
 uef5Pb/n/f3eF5PcOG3ADreXF9xWp1GpptRrPsp5cGtTQZHpQLPCfGrXQdp8pvYzhXlffwKZ
 hw6P0ea54d/oJxUWf+hVy7V35gjL8eBOy3f+Vyzno2Fis+IF9ROlvNOxnRceytumts8Ge1B5
 dO2ON/fFqWrky61HKgzsatg/cllRj9SYY98j4FTTu0r55wiCgettC8ohBEcD50jJomPXw9js
 SVoSlrLfIoj9MUrJVT0I/qr/fb5KyT4K00EfkjDDroOuWMM8T7HLoLcuSEs4ky2Ec+EaWq7R
 woXWOCVhFbsGju5NzPMka4bW9hEkYz2MxdsJGd8F4V8+IOUh7oFPfmih9yCtL62VL83uS7P7
 0uwBRB1GmaLDtN2VazLnrhRKeLHKtGrlix7XMSRfQVYf+nCwLIIIjCLoEUwYM5ma/IIi7rYS
 T2ml3Srai4UKJy8aDczORF0hp7tFixUlLocoOjzuCAJMGpcyBfqnizim1FpZxQse2RZBd2DK
 qGdseNNWjrVZvfzLPF/OC4vq4xgbgclpTAZqBd7G7yhzOL2LsjGHQRkZGVxWupIeS2BVBD2M
 NcnsnoZkC0Yst7pEh23Bfrts5xbZlHUQ5eMr3cEOkqPcHjdv0DOd0hFYqdJe4b51AkM2Y7kv
 OVRmmpDqMoWiCCOjjjkphWuSbzuVDUy1tC7tApky5QaTHrYawL9LgNnEVQT+vhkE0en3SRh4
 O0xCX7xZAc3XG5Sw+9IXSrg6+A0Nc/6/abgZaMPgb+3EcKN1GsNAywkV1F0aVMGfDcMqiHZd
 VsFsqEsNFyK1Grj573kNTA4NaMB/Yk4DZ4cCDHy8J85Af13HEhjq7V0CzT8d0cKN9t0c9E5N
 cNAd/lyX/JzRwWTfFd1Ucq9Ecq/eOy3SXr1W7//sdYFNDWeoRqpPN7x1MLKhcSK7OK9s+WTA
 JL7hPPT6A2tD4zNfjxRaR6s0zL3PP7Z6S/c6utbhxSu+2pSYyG5rCg1fw8882zH63OkmX1bN
 S+zG2OmLnrwadejixsrXuonj68sP/Jo18+U/SvSj0HJ3rGNvf77e1Xl2vCVWrF32PWGb0JA/
 NxY/NbLfSIl266r7SUG0/gcwVjetdAQAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_231245_924095_C06F293D 
X-CRM114-Status: GOOD (  23.88  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Vignesh,

On 18.02.2020 05:00, Vignesh Raghavendra wrote:
> Hi Sergei
> 
> On 30/01/20 2:09 am, Sergei Shtylyov wrote:
>> Add the HyperFLash driver for the Renesas RPC-IF.  It's the "front end"
>> driver using the "back end" APIs in the main driver to talk to the real
>> hardware.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>>   drivers/mtd/hyperbus/Kconfig  |    6 +
>>   drivers/mtd/hyperbus/Makefile |    1
>>   drivers/mtd/hyperbus/rpc-if.c |  162 ++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 169 insertions(+)
>>
>> Index: linux/drivers/mtd/hyperbus/Kconfig
>> ===================================================================
>> --- linux.orig/drivers/mtd/hyperbus/Kconfig
>> +++ linux/drivers/mtd/hyperbus/Kconfig
>> @@ -22,4 +22,10 @@ config HBMC_AM654
>>   	 This is the driver for HyperBus controller on TI's AM65x and
>>   	 other SoCs
>>   
>> +config RPCIF_HYPERBUS
>> +	tristate "Renesas RPC-IF HyperBus driver"
>> +	depends on RENESAS_RPCIF
>> +	help
>> +	  This option includes Renesas RPC-IF HyperFlash support.
>> +
>>   endif # MTD_HYPERBUS
>> Index: linux/drivers/mtd/hyperbus/Makefile
>> ===================================================================
>> --- linux.orig/drivers/mtd/hyperbus/Makefile
>> +++ linux/drivers/mtd/hyperbus/Makefile
>> @@ -2,3 +2,4 @@
>>   
>>   obj-$(CONFIG_MTD_HYPERBUS)	+= hyperbus-core.o
>>   obj-$(CONFIG_HBMC_AM654)	+= hbmc-am654.o
>> +obj-$(CONFIG_RPCIF_HYPERBUS)	+= rpc-if.o
>> Index: linux/drivers/mtd/hyperbus/rpc-if.c
>> ===================================================================
>> --- /dev/null
>> +++ linux/drivers/mtd/hyperbus/rpc-if.c
>> @@ -0,0 +1,162 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Linux driver for RPC-IF HyperFlash
>> + *
>> + * Copyright (C) 2019 Cogent Embedded, Inc.
>> + */
>> +
>> +#include <linux/err.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/mtd/hyperbus.h>
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/mux/consumer.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/types.h>
>> +
>> +#include <memory/renesas-rpc-if.h>
>> +
>> +struct	rpcif_hyperbus {
>> +	struct rpcif rpc;
>> +	struct hyperbus_ctlr ctlr;
>> +	struct hyperbus_device hbdev;
>> +};
>> +
>> +static const struct rpcif_op rpcif_op_tmpl = {
>> +	.cmd = {
>> +		.buswidth = 8,
>> +		.ddr = true,
>> +	},
>> +	.ocmd = {
>> +		.buswidth = 8,
>> +		.ddr = true,
>> +	},
>> +	.addr = {
>> +		.nbytes = 1,
>> +		.buswidth = 8,
>> +		.ddr = true,
>> +	},
>> +	.data = {
>> +		.buswidth = 8,
>> +		.ddr = true,
>> +	},
>> +};
>> +
> 
> Looking around, there seems to be more than one SPI controllers, apart
> from Renesas, which also support SPI NOR and HyperFlash protocol within
> a single IP block. E.g.: Cadence xSPI controller [1]. Therefore, we need
> a generic framework to support these kind of controllers.
> 
> One way would be to extend spi_mem_op to support above template along
> with a new field to distinguish SPI NOR vs HyperFlash protocol. HyperBus
> core can then register a spi_device and use spi-mem ops to talk to
> controller driver.
> So, I suggest making Renesas RPC-IF backend a full fledged spi-mem
> driver (instead of driver/memory) and use extended spi_mem_op to support
> HyperFlash.


 From Renesas Hyperflash user point of view, I wonder if a two step 
approach would be possible and acceptable, here?

Being a user of the Renesas Hyperflash, I want a driver for that. And, 
of course, I want it "now" ;)

So I wonder if it would be a valid option to have a functioning Renesas 
Hypeflash driver, first. And in a second step abstract that in a more 
generic way to support additional controllers. While in parallel having 
a functional driver for the Renesas people, already.

Is the support for [1] a more or less theoretical one, at the moment? Or 
are there users of that which need support "now", too?

Best regards

Dirk


> [1]
> https://ip.cadence.com/uploads/1244/cdn-dsd-mem-fla-host-controller-ip-for-xspi-pdf
> 
> 
> Regards
> Vignesh
> 
>> +static u16 rpcif_hb_read16(struct hyperbus_device *hbdev, unsigned long addr)
>> +{
>> +	struct rpcif_hyperbus *hyperbus =
>> +		container_of(hbdev, struct rpcif_hyperbus, hbdev);
>> +	struct rpcif_op op = rpcif_op_tmpl;
>> +	map_word data;
>> +
>> +	op.cmd.opcode = 0xC0;
>> +	op.addr.val = addr >> 1;
>> +	op.dummy.buswidth = 1;
>> +	op.dummy.ncycles = 15;
>> +	op.data.dir = RPCIF_DATA_IN;
>> +	op.data.nbytes = 2;
>> +	op.data.buf.in = &data;
>> +	rpcif_prepare(&hyperbus->rpc, &op, NULL, NULL); // ?
>> +	rpcif_io_xfer(&hyperbus->rpc);
>> +
>> +	return be16_to_cpu(data.x[0]);
>> +}
>> +
>> +static void rpcif_hb_write16(struct hyperbus_device *hbdev, unsigned long addr,
>> +			     u16 data)
>> +{
>> +	struct rpcif_hyperbus *hyperbus =
>> +		container_of(hbdev, struct rpcif_hyperbus, hbdev);
>> +	struct rpcif_op op = rpcif_op_tmpl;
>> +
>> +	op.cmd.opcode = 0x40;
>> +	op.addr.val = addr >> 1;
>> +	op.data.dir = RPCIF_DATA_OUT;
>> +	op.data.nbytes = 2;
>> +	op.data.buf.out = &data;
>> +	cpu_to_be16s(&data);
>> +	rpcif_prepare(&hyperbus->rpc, &op, NULL, NULL); // ?
>> +	rpcif_io_xfer(&hyperbus->rpc);
>> +}
>> +
>> +static void rpcif_hb_copy_from(struct hyperbus_device *hbdev, void *to,
>> +			       unsigned long from, ssize_t len)
>> +{
>> +	struct rpcif_hyperbus *hyperbus =
>> +		container_of(hbdev, struct rpcif_hyperbus, hbdev);
>> +	struct rpcif_op op = rpcif_op_tmpl;
>> +
>> +	op.cmd.opcode = 0xA0;
>> +	op.addr.val = from;
>> +	op.dummy.buswidth = 1;
>> +	op.dummy.ncycles = 15;
>> +	op.data.dir = RPCIF_DATA_IN;
>> +	op.data.nbytes = len;
>> +	op.data.buf.in = to;
>> +	rpcif_prepare(&hyperbus->rpc, &op, NULL, NULL); // ?
>> +	rpcif_dirmap_read(&hyperbus->rpc, from, len, to);
>> +}
>> +
>> +static const struct hyperbus_ops rpcif_hb_ops = {
>> +	.read16 = rpcif_hb_read16,
>> +	.write16 = rpcif_hb_write16,
>> +	.copy_from = rpcif_hb_copy_from,
>> +};
>> +
>> +static int rpcif_hb_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct rpcif_hyperbus *hyperbus;
>> +	int status;
>> +
>> +	hyperbus = devm_kzalloc(dev, sizeof(*hyperbus), GFP_KERNEL);
>> +	if (!hyperbus)
>> +		return -ENOMEM;
>> +
>> +	rpcif_sw_init(&hyperbus->rpc, pdev->dev.parent);
>> +
>> +	platform_set_drvdata(pdev, hyperbus);
>> +
>> +	rpcif_enable_rpm(&hyperbus->rpc);
>> +
>> +	rpcif_hw_init(&hyperbus->rpc, true);
>> +
>> +	hyperbus->hbdev.map.size = hyperbus->rpc.size;
>> +	hyperbus->hbdev.map.virt = hyperbus->rpc.dirmap;
>> +
>> +	hyperbus->ctlr.dev = dev;
>> +	hyperbus->ctlr.ops = &rpcif_hb_ops;
>> +	hyperbus->hbdev.ctlr = &hyperbus->ctlr;
>> +	hyperbus->hbdev.np = of_get_next_child(pdev->dev.parent->of_node, NULL);
>> +	status = hyperbus_register_device(&hyperbus->hbdev);
>> +	if (status) {
>> +		dev_err(dev, "failed to register device\n");
>> +		rpcif_disable_rpm(&hyperbus->rpc);
>> +	}
>> +
>> +	return status;
>> +}
>> +
>> +static int rpcif_hb_remove(struct platform_device *pdev)
>> +{
>> +	struct rpcif_hyperbus *hyperbus = platform_get_drvdata(pdev);
>> +	int error = hyperbus_unregister_device(&hyperbus->hbdev);
>> +	struct rpcif *rpc = dev_get_drvdata(pdev->dev.parent);
>> +
>> +	rpcif_disable_rpm(rpc);
>> +	return error;
>> +}
>> +
>> +static struct platform_driver rpcif_platform_driver = {
>> +	.probe	= rpcif_hb_probe,
>> +	.remove	= rpcif_hb_remove,
>> +	.driver	= {
>> +		.name	= "rpc-if-hyperflash",
>> +	},
>> +};
>> +
>> +module_platform_driver(rpcif_platform_driver);
>> +
>> +MODULE_DESCRIPTION("Renesas RPC-IF HyperFlash driver");
>> +MODULE_LICENSE("GPL v2");

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
