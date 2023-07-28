Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE04EC001DC
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 02:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hfvx/Vjw/YD/VnnjKx6AXm8bTazAkP1ayyNewYyc+3E=; b=SmtGSbRpKupeei
	oMF16zkQLLR8vsDDjiYawgPNUmVG1xoHSk4Jp3pwMp/wNvGJK4CsK/gu5fuLV2eYprOd/oZLQZYLa
	1G2+714H+VKu8ZDXeAG3tzeAXBTuldCNQfJk2H4/L2Xqr+YHh5tdHEFAD+PJODRJ4iKj1WbbZl4mc
	oCYvlZVt/tgAu1MrdYYMjBgY9sHzxKXZO2s1IVkqF4l6GVS3HnsYiPM4pxfGWhD+IsVGZOVgThWqY
	sLXKK2SaaOIoMzX5DrYRL5lYSzrnL4QiApwZFWfkPQBMRmzyWXH6obJAQi9PvIgQxbkemomdifiGS
	jJzaMZbcn5jFX1deNQkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPDIa-001JQC-1n;
	Fri, 28 Jul 2023 02:33:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPDIX-001JOu-1M;
	Fri, 28 Jul 2023 02:33:47 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36S2FOs9012439;
	Fri, 28 Jul 2023 02:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=93x7U2HTwhv8Uw4ybnu+PwXlw6+ODhbER4QZj3N8mHY=;
 b=AZwQ+QgpUIVua+ZuOWq2uCWqXR70sgZVlAb0oM1w0cqlTaFzPAFHIY2tiLhefej4Us/w
 g3u2zPCm9vSQwg1yZ7G7SpsQ3lFOaQ3S/mJzkIvOxNhbs0jHchbAZsepWJffagtTsQGh
 E3ipR2nf7bkhOmz1bfYyAEUJ9PaMs0VW+qNlp8WmQBO7rkq0BtscHwgjFPIslm/Ypy+t
 y6a3vP0jcImOmDHwWH1BY0JSvBsueopgZdpuZIuNARssa3jYUqfL9zPqFq4lI4D7I1PM
 BzDRzJNYKsn0vLPCMgCbLfDtFqknaLlY7pDk5wBw698iZoftyDWBVntgqeK6jRkSvpv/ iA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s3mpt2a8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jul 2023 02:33:33 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36S2XW7n015139
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jul 2023 02:33:32 GMT
Received: from [10.216.45.120] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 27 Jul
 2023 19:33:27 -0700
Message-ID: <9d8296a4-8566-cc83-2ef8-3589afeb22f2@quicinc.com>
Date: Fri, 28 Jul 2023 08:03:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 8/8] mtd: rawnand: qcom: Fix address parsing within
 ->exec_op()
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Manivannan Sadhasivam
	<mani@kernel.org>
CC: Md Sadre Alam <quic_mdalam@quicinc.com>,
        Richard Weinberger
	<richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus
	<tudor.ambarus@linaro.org>,
        Pratyush Yadav <pratyush@kernel.org>,
        "Michael
 Walle" <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        kernel test robot <lkp@intel.com>
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
 <20230716144612.32132-9-miquel.raynal@bootlin.com>
 <20230717063843.GA7062@thinkpad> <20230727165923.32488041@xps-13>
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <20230727165923.32488041@xps-13>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6Ok3j2Bb-2ph4OajFl8OzkIIkFkBzjQ8
X-Proofpoint-GUID: 6Ok3j2Bb-2ph4OajFl8OzkIIkFkBzjQ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 mlxlogscore=911
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307280022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_193345_595207_C5B72FCC 
X-CRM114-Status: GOOD (  16.21  )
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

On 7/27/2023 8:29 PM, Miquel Raynal wrote:
> Hi Sadre,
> 
> mani@kernel.org wrote on Mon, 17 Jul 2023 12:08:43 +0530:
> 
>> On Sun, Jul 16, 2023 at 04:46:12PM +0200, Miquel Raynal wrote:
>>> The naddrs variable is initialized but not used. Fixing this could have
>>> been a matter of dropping the variable, but the right way to do it looks
>>> a bit more complex: we can avoid useless writes to the q_op structure by
>>> using it. In practice we could even have possible out-of-bound bugs with
>>> the existing implementation. Let's fix all that by just performing the
>>> right number of assignments in the addr{1,2}_reg fields.
>>>
>>> Fixes: 89550beb098e ("mtd: rawnand: qcom: Implement exec_op()")
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202307131959.PdPSC86K-lkp@intel.com/
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202307131730.NOYbcjBr-lkp@intel.com/
>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>
>> LGTM! But I'm relying on Sadre to test it.
>>
>> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> 
> I don't think I've received feedback from Sadre, I would like to close
> these issues, can you please test and give us feedback?
> 

  Sorry for the delay in response. Testing this, will respond back
  shortly today.

Regards,
  Sricharan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
