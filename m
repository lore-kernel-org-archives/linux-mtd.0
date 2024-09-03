Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2559CD13CF
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Sep 2024 09:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ClflbL7/QDIA+9GRueppVHYXfVraobw6I8wCXMYEsdw=; b=oGyvShlGqgR3DKQYaiwzGDon0K
	O6wD+Uo2IAzO0YRu4JPjhpEXRCzh9xe2ZteDJ+NUfQVk9KwwpKClpIIkW4O9S//ljgd/2gHgfYb9Y
	UFB0XWjSQ9CwAqPMbruD2zcULY05bSz/qZxF43Jh6/B5TPrq0FlFK7Tv00lrY97hUzaJglm7yIN92
	KjauXe2hx/wJgAplyu03i+oFtvBrPh9oMdOK026ERbrvHSYYcTWCd4pTjFophqDd1m1c4pAH9FXLk
	puRIa2W7HCw9/nB6694YTdy3KE8iACzygr73J7beQ4dGEOzoD84EbjxTl0vkatFbb04uFqeH0jEPt
	vY13Jm2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slPg5-0000000H6Vw-2YRn;
	Tue, 03 Sep 2024 09:18:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slPe3-0000000H5s0-3z6p
	for linux-mtd@lists.infradead.org;
	Tue, 03 Sep 2024 09:16:18 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4835AldG009037;
	Tue, 3 Sep 2024 09:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f+aDtDkpqgV1KQ/TcVWTCcSca/Y0X5xFWjMV1qZhGnM=; b=VdGUxvQPWzKAoMkO
	T0himFDsc9/6hcdNDyf3bIY1Sjq/GTEqWqb3E2JJz1P+TyvKhLrPOs+DeiO6Q0GW
	40NDT2z+W2Y7k21QWUt0N5l5a5Hmql+HLdacfuhBsIRQgvervtpD1zhYhL0gk28n
	I3O0ph/u5L1v0CkIPxEzsZSm7nvXzOBLseAoQe8uyareib8c+uueetl0ji00oAQ1
	YblUxjC7yuMjZ+CGTx68PLhntYsy8IH6PKz6Fa6UZQ8c6V+GuRCP9Yna61xAWd81
	AL8HIfEm2/nLVdKhOF8vVsht4xCfkencTutYkKg5jC1jkYr4/SgLWGSMTwdSoqdR
	J3ajvg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bt66xu4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 09:15:55 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4839Fs58008084
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 09:15:54 GMT
Received: from [10.216.9.110] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 02:15:49 -0700
Message-ID: <5169761b-422d-70ab-ba53-a898cb7bfa2f@quicinc.com>
Date: Tue, 3 Sep 2024 14:45:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v8 0/8] Add QPIC SPI NAND driver
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <esben@geanix.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>
References: <20240820104239.1774600-1-quic_mdalam@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240820104239.1774600-1-quic_mdalam@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UmnCr2WGft70bqzkiVvBtlXxBDElRjoT
X-Proofpoint-GUID: UmnCr2WGft70bqzkiVvBtlXxBDElRjoT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_021616_169701_095FE077 
X-CRM114-Status: GOOD (  10.46  )
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

Hi Miquel,

On 8/20/2024 4:12 PM, Md Sadre Alam wrote:
> v8:
>   * Fixed compilation warning reported by kernel test robot
>   * Added "chip" description in nandc_set_read_loc_first()
>   * Added "chip" description" in nandc_set_read_loc_last()
>   * Changed data type of read_location0, read_location1,
>     read_location2, read_location3, addr0, addr1, cmd, cfg0,
>     cfg1, ecc_bch_cfg, ecc_buf_cfg, clrflashstatus, clrreadstatus,
>     orig_cmd1, orig_vld to __le32 to fix compilation warning.
>   * Included bitfield.h header file in spi-qpic-snand.c to
>     fix compilation warning
>   * Removed unused variable "steps" variable from
>     qcom_spi_ecc_init_ctx_pipelined()
> 
     I have addressed your comments to v6 and further posted till v8.
     Could you please let me know if this is fine.
     and how to get this merged ?

Regards,
Alam.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
