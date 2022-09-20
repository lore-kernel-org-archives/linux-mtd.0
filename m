Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05228C54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 10:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sMeAxYFNK3kLpxQ67XRLZmUK36e51Yb0XLhRDJ1KaTY=; b=GdVhF6WnhDhhVk
	S7sMODvHooc/cOBHoPgk3odhNqDeZFbXrHUyUwml6ZBDj5VUQI/uy8NQufQDaj4bOw/98ztQ3R/1q
	KI+3Q72/5ojr3C6AkezfmUC07lQyeYItpfRqNfdQavN0pROBGgQ4TFMHWViOuU3cxU5C2KWxHp5fx
	MN+WkyueMoxb+jhjFpUBsGBr1hvdK4qKUw0qsZi6Ow23E8/eDebXd2TdnSSIUP6F+UAmDEg7rf5Sd
	MJPfj+fMwB9NmcU04oWyhyxtJEE4/NfeZ8Yco3JVgeGpeoDu+yFcNpMNw7DVpfsiJFSEqixeWEZAU
	QfN4FgFpex7iEhygj9dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaaMD-002tjU-Gr; Tue, 20 Sep 2022 10:20:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaaMA-002teT-DR
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 10:19:59 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28K7xnsW000538;
	Tue, 20 Sep 2022 10:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=nd5K05KlUljLOd4JOAHFBcf48g9JQumc72I+9PCMMas=;
 b=cXJLS0JuYShfNPhyeG7QcNHtJEW9TfxLvfGKO3AX/Mxognvk1+A+oXWSrNLLHnauhhIH
 lm25T2mAcGUCq14CoMl114rkvLGfmvQPBLvSDMBlkKCQ9II5jZz+tGkCPVjry0Xo8Z4s
 Dp5npGN404InTd3cZSnIZf4l4pfzk7LUveVuSJYsIMQ6YuKYP2y51rzsbpnn64+BOQzP
 xW6sR3a/UlfjJA12kYdzEZ5n2HKB9JNpyy0lBdZzrjBCRbfrN1M+O46tZdh1CoG7SCkA
 in/cHVZr6d3+yTMZo9iA7JJeW9o8venY7uDfEmbCKVkYv/LAUZ+33/T+JT5bbzIo0BCE kg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jq73213br-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Sep 2022 10:19:49 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28KAJnUS021616
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Sep 2022 10:19:49 GMT
Received: from [10.216.36.207] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 20 Sep
 2022 03:19:46 -0700
Message-ID: <afb6d82b-d1fc-4af7-8d1b-f0fdd26836b2@quicinc.com>
Date: Tue, 20 Sep 2022 15:49:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] mtd: rawnand: qcom: Implement exec_op()
Content-Language: en-US
To: Manivannan Sadhasivam <mani@kernel.org>,
        Md Sadre Alam
	<quic_mdalam@quicinc.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1654273498-31998-1-git-send-email-quic_mdalam@quicinc.com>
 <20220915134328.GD4550@workstation>
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <20220915134328.GD4550@workstation>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FXW-PHmY22oWeb8dIxxpc2lu5_2VUmCW
X-Proofpoint-GUID: FXW-PHmY22oWeb8dIxxpc2lu5_2VUmCW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_02,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=841 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1011 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209200062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_031958_480257_EF8E7747 
X-CRM114-Status: GOOD (  11.04  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFuaSwKCk9uIDkvMTUvMjAyMiA3OjEzIFBNLCBNYW5pdmFubmFuIFNhZGhhc2l2YW0gd3Jv
dGU6Cj4gT24gRnJpLCBKdW4gMDMsIDIwMjIgYXQgMDk6NTQ6NThQTSArMDUzMCwgTWQgU2FkcmUg
QWxhbSB3cm90ZToKPj4gSW1wbGVtZW50IGV4ZWNfb3AoKSBzbyB3ZSBjYW4gbGF0ZXIgZ2V0IHJp
ZCBvZiB0aGUgbGVnYWN5IGludGVyZmFjZQo+PiBpbXBsZW1lbnRhdGlvbi4KPj4KPj4gQ28tZGV2
ZWxvcGVkLWJ5OiBTcmljaGFyYW4gUiA8cXVpY19zcmljaGFyYUBxdWljaW5jLmNvbT4KPj4gU2ln
bmVkLW9mZi1ieTogU3JpY2hhcmFuIFIgPHF1aWNfc3JpY2hhcmFAcXVpY2luYy5jb20+Cj4+IFNp
Z25lZC1vZmYtYnk6IE1kIFNhZHJlIEFsYW0gPHF1aWNfbWRhbGFtQHF1aWNpbmMuY29tPgo+IFNh
ZHJlLCBTcmksIGFueSB1cGRhdGUgb24gdGhpcyBwYXRjaD8KClNvcnJ5IGdvdCBzdHVjayB3aXRo
IGZldyBvdGhlciBhY3Rpdml0aWVzLCB3ZSBhcmUgdGFraW5nIHRoaXMgbm93IHVwIGFnYWluLgpT
byB3aWxsIHBvc3QgdGhlIHJld29ya2VkIHBhdGNoZXMgc29tZXRpbWUgbmV4dCB3ZWVrLgoKUmVn
YXJkcywKIMKgIFNyaWNoYXJhbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
