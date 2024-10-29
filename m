Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEE0D5B870
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2024 04:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMREALmIUsPFobLt+A+qEA940KAeFT7vWzrFXKCxJbE=; b=QxzsJ4z+iibNUd
	qTSDiDELdiH4oxDP58dzXyqW6RXtdHLYjFttgTck1+ZcPBNroWC61EgYJb5CZcoQ7AuHk6EOymkWj
	KHD2HhDsHQ/ID00OXuyFS1Hvu3cmHmg6edszQeKzse5FJQySOnyvMVRe5T6L+y8CXUSii0sBFJoD4
	GmbIXX2L4jvCy8/wnjARk9QJfveS9R5l+xYb6FKLNdYNOdGLClCOasxCnggl2el62CqhomOQvJXrJ
	AKZ/m0ky8YlwBuRWya1DOqLvuOEl7tDVdoLiwdiTUQfS/94/Gh7s/tnlTduzCWw8QLLTPlnUDXYeQ
	CQ6f+ncL1fRjTQntyVMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5de7-0000000DA6b-3CAa;
	Tue, 29 Oct 2024 04:15:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5de4-0000000DA6B-1ce3
	for linux-mtd@lists.infradead.org;
	Tue, 29 Oct 2024 04:15:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKeops008480;
	Tue, 29 Oct 2024 04:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3LBEammmJWyw3g0OzjhKohK2SuwOFyJvCBOLPi8y7Hw=; b=p8Gmiyz22CHHi5W2
	PoA6U33xe0nJFym5sMuSFMxkNYMgU+nAoqkqduqXHtDYLgfhIlzi3rsmQIwJLpXA
	ZAYeiU1VeBA27AAzDnEr8GW9XyA3rV7991ZzLlKEfW6EsQN3A/xDa4fQyQEBnC/3
	lzrH21X8ExwXTHMCP3upstRP9FoqBb3NOh7n8eY8xqBrtEIfv+zVEL0aNH05PoDY
	3UrKk0PYsfuifNoDBwV+S1/tkzBPvBYBX4ZiOXwE2lXLxp2U0zncTs84jBTZe9l7
	o3ui5ZmJIH57tFcg2foUnIwR3Vd9zXTpLLmMMq6aRiOCsI0sqZlIfcHp0zzyQLZO
	PGaaww==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqrgq32g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 04:15:44 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49T4FhT7004294
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 04:15:43 GMT
Received: from [10.151.37.94] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Oct
 2024 21:15:37 -0700
Message-ID: <8795ecde-5faf-0110-a01c-8e194ea9b43b@quicinc.com>
Date: Tue, 29 Oct 2024 09:45:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v12 6/8] spi: spi-qpic: add driver for QCOM SPI NAND flash
 Interface
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        kernel test robot
	<lkp@intel.com>, <broonie@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
CC: <oe-kbuild-all@lists.linux.dev>, <quic_srichara@quicinc.com>,
        <quic_varada@quicinc.com>
References: <20241021115620.1616617-7-quic_mdalam@quicinc.com>
 <202410252355.ZofaMeku-lkp@intel.com>
 <5a98076f-f5ce-4400-b554-6593d51de9f2@oss.qualcomm.com>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <5a98076f-f5ce-4400-b554-6593d51de9f2@oss.qualcomm.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: addbZRrfOE2H6dZn2kuNmTa_OeTRhRZL
X-Proofpoint-GUID: addbZRrfOE2H6dZn2kuNmTa_OeTRhRZL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1011 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_211552_586041_B0A63E2C 
X-CRM114-Status: GOOD (  12.75  )
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



On 10/25/2024 11:44 PM, Konrad Dybcio wrote:
> On 25.10.2024 6:08 PM, kernel test robot wrote:
>> Hi Md,
>>
>> kernel test robot noticed the following build warnings:
>>
>> [auto build test WARNING on mtd/nand/next]
>> [also build test WARNING on broonie-spi/for-next robh/for-next linus/master v6.12-rc4 next-20241025]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Md-Sadre-Alam/spi-dt-bindings-Introduce-qcom-spi-qpic-snand/20241021-200849
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
>> patch link:    https://lore.kernel.org/r/20241021115620.1616617-7-quic_mdalam%40quicinc.com
>> patch subject: [PATCH v12 6/8] spi: spi-qpic: add driver for QCOM SPI NAND flash Interface
>> config: sparc64-randconfig-r073-20241023 (https://download.01.org/0day-ci/archive/20241025/202410252355.ZofaMeku-lkp@intel.com/config)
>> compiler: sparc64-linux-gcc (GCC) 14.1.0
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202410252355.ZofaMeku-lkp@intel.com/
>>
>> smatch warnings:
>> drivers/spi/spi-qpic-snand.c:1260 qcom_spi_write_page() warn: unsigned 'cmd' is never less than zero.
>> drivers/spi/spi-qpic-snand.c:1279 qcom_spi_send_cmdaddr() warn: unsigned 'cmd' is never less than zero.
>>
>> vim +/cmd +1260 drivers/spi/spi-qpic-snand.c
>>
>>    1252	
>>    1253	static int qcom_spi_write_page(struct qcom_nand_controller *snandc,
>>    1254				       const struct spi_mem_op *op)
>>    1255	{
>>    1256		struct qpic_snand_op s_op = {};
>>    1257		u32 cmd;
>>    1258	
>>    1259		cmd = qcom_spi_cmd_mapping(snandc, op->cmd.opcode);
>>> 1260		if (cmd < 0)
>>    1261			return cmd;
> 
> The robot is right, qcom_spi_cmd_mapping() should return an int, as you
> return a negative errno upon failure
Ok will fix in next revision.
> 
> Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
