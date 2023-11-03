Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBAEC4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Nov 2023 11:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=03guwA1wmfoHsyXe6XT9m0wcNEMv20JeLwuDT6OksXU=; b=aBZgFRC77l+25d
	86eyYZ9ZNVOgFFiQTD6cwypFuF/TM1y2+HvVZZzwuOGP7FRPQtPPumk08Mbzk3IVCoQRCsWd8Gohl
	See9HHePzIVJxM1yUubtdVmYSQeKXUC92PdPKfHcPq6KPagRue6pGjx+aB0dRUm3Pxm3lBMfSJFPh
	f7oZVk2tdeA2CaOhU64+XnC7hGNv2vdnKVTxb+u2zoD5KQw34qLfGd6VSP7pvuEMhLK2fJC33w2Au
	FVNmD/XAhTdHt0ztfK1fVQhlK9vXX4zuJ2yVhkRNV8u0YZYbYChbB1Qms8ZKVorEJ/ZkBkemTmhME
	YpjrPZ+1Prmdy/PhQdWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qysFA-00BKAs-1C;
	Fri, 03 Nov 2023 11:21:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qysF4-00BKAD-0x
	for linux-mtd@lists.infradead.org;
	Fri, 03 Nov 2023 11:21:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A3AeZlM026437;
	Fri, 3 Nov 2023 11:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=K/2UxAYCtKuzSZFP+fH2NhbmOwxBW6Zit195L5A9CXA=;
 b=b3zQ3p6aMNNqStH7R/EWZY5GVmtl0uz9Jd66PanlwDGOLQWKbJi7v+Xlj0GjR02MlAnC
 MIyZrxy4DfVVB5ym69IUzaqqJsXQ6as7p6eWToiLO61pwlxV7o7mXnffA7KTV1l63FrV
 M6CIXN9lv+pscollYKQ6vPHHQdSmBoE36Gd9JnZyBjXGhrySFG1XvQqMa5zDc9o5ML2D
 SPOyjQvAUiAp+rcFEo3ud22gRzpJEiOczmeyShg0XVsOj5avMIuqgRtABo7RmqHZd7Hj
 qCi7TRB8H/LQlMR5tYlnf5D/1J1Zg1J1vG/3g/GyiG1Qdm4n2YbWqou+hndg43BBtrt6 sg== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u4v8mrenw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Nov 2023 11:21:23 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A3BL3AJ009110
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Nov 2023 11:21:03 GMT
Received: from [10.216.26.1] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 3 Nov
 2023 04:20:57 -0700
Message-ID: <2b9e943a-198e-7999-b898-e7b2498a9ffa@quicinc.com>
Date: Fri, 3 Nov 2023 16:50:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH 4/5] spi: qpic: Add support for qpic spi nand driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
CC: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <conor+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>,
        <quic_srichara@quicinc.com>, <qpic_varada@quicinc.com>
References: <20231031120307.1600689-1-quic_mdalam@quicinc.com>
 <20231031120307.1600689-5-quic_mdalam@quicinc.com>
 <a1270a88-49a9-4bdb-89a9-ce6929f2294d@sirena.org.uk>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <a1270a88-49a9-4bdb-89a9-ce6929f2294d@sirena.org.uk>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2wlQn1H9NHky1Amy3XFnWxUhp4JxxpWt
X-Proofpoint-ORIG-GUID: 2wlQn1H9NHky1Amy3XFnWxUhp4JxxpWt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-03_11,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311030095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_042134_472434_9923384C 
X-CRM114-Status: GOOD (  29.13  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 10/31/2023 7:53 PM, Mark Brown wrote:
> On Tue, Oct 31, 2023 at 05:33:06PM +0530, Md Sadre Alam wrote:
> 
>> +config SPI_QPIC_SNAND
>> +	tristate "QPIC SNAND controller"
>> +	default y
>> +	depends on ARCH_QCOM
>> +	help
>> +	  QPIC_SNAND(Quad SPI) driver for Qualcomm QPIC_SNAND controller.
>> +
> 
> I don't see any build dependencies on anything QC specific so please add
> an || COMPILE_TEST here, this makes it much easier to do generic changes
> without having to build some specific config.

Ok

> 
>> +++ b/drivers/spi/Makefile
>> @@ -153,6 +153,7 @@ obj-$(CONFIG_SPI_XTENSA_XTFPGA)		+= spi-xtensa-xtfpga.o
>>   obj-$(CONFIG_SPI_ZYNQ_QSPI)		+= spi-zynq-qspi.o
>>   obj-$(CONFIG_SPI_ZYNQMP_GQSPI)		+= spi-zynqmp-gqspi.o
>>   obj-$(CONFIG_SPI_AMD)			+= spi-amd.o
>> +obj-$(CONFIG_SPI_QPIC_SNAND)            += spi-qpic-snand.o
> 
> Please keep this alphabetically sorted (there are some mistakes there
> but no need to add to them).

Ok

> 
>> + * 	Sricharan R <quic_srichara@quicinc.com>
>> + */
>> +
>> +#include <linux/mtd/spinand.h>
>> +#include <linux/mtd/nand-qpic-common.h>
>> +
> 
> This should be including the SPI API, and other API headers that are
> used directly like the platform and clock APIs.
>

Ok

>> +static int qcom_snand_init(struct qcom_nand_controller *snandc)
>> +{
>> +	u32 snand_cfg_val = 0x0;
>> +	int ret;
> 
> ...
> 
>> +	ret = submit_descs(snandc);
>> +	if (ret)
>> +		dev_err(snandc->dev, "failure in sbumitting spiinit descriptor\n");
>> +
>> +	free_descs(snandc);
> 
> This seems to be doing a bit more than I would expect an init function
> to, and it's very surprising to see the descriptors freed immediately
> after something called a submit (which suggests that the descriptors are
> still in flight).
>

Our controller supports only bam mode , that means for writing/reading even
single register we have to use bam.
submit_descs() is synchronous so I/O is complete when it returns.
Hence freeing the descriptor after it.


>> +static int qpic_snand_read_page(struct qcom_nand_controller *snandc,
>> +				const struct spi_mem_op *op)
>> +{
>> +	return 0;
>> +}
>> +
>> +static int qpic_snand_write_page(struct qcom_nand_controller *snandc,
>> +				const struct spi_mem_op *op)
>> +{
>> +	return 0;
>> +}
> 
> ...
> 
>> +static int qpic_snand_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>> +{
>> +	struct qcom_nand_controller *snandc = spi_controller_get_devdata(mem->spi->master);
>> +	dev_dbg(snandc->dev, "OP %02x ADDR %08llX@%d:%u DATA %d:%u", op->cmd.opcode,
>> +		op->addr.val, op->addr.buswidth, op->addr.nbytes,
>> +		op->data.buswidth, op->data.nbytes);
>> +
>> +	/*
>> +	 * Check for page ops or normal ops
>> +	 */
>> +	if (qpic_snand_is_page_op(op)) {
>> +		if (op->data.dir == SPI_MEM_DATA_IN)
>> +			return qpic_snand_read_page(snandc, op);
>> +		else
>> +			return qpic_snand_write_page(snandc, op);
> 
> So does the device actually support page operations?  The above looks
> like the driver will silently noop them.

Sorry It was to do item and I missed to mention that in commit log.
Will add in V1.

> 
>> +	snandc->base_phys = res->start;
>> +	snandc->base_dma = dma_map_resource(dev, res->start,
>> +					   resource_size(res),
>> +					   DMA_BIDIRECTIONAL, 0);
>> +	if (dma_mapping_error(dev, snandc->base_dma))
>> +		return -ENXIO;
>> +
>> +	ret = clk_prepare_enable(snandc->core_clk);
>> +	if (ret)
>> +		goto err_core_clk;
> 
> The DMA mapping and clock enables only get undone in error handling,
> they're not undone in the normal device release path.

Will fix in V1



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
