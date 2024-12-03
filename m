Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF73E64A80
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2024 11:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ePidGjbt1Jk8aOns8ws3oIOGioexpUtFsOGAcNjdOA=; b=j4sD5yh+mzDJqV
	M0SM3K/i1yA5ON8eAYk8iKwkDH3ZkVR2IQd1hweEXkMVW4LsRgeMKQMM/TthXkNxtMuSBRVNKjsZQ
	NgDCVUdwhN/OB3RfSoNLFi0cmh8czvq3c2ZMLu1IV2NPdFSQRXds2Fc9LJPLgAh1R8wjB9T+HtXtU
	Q3ueJEZBArIPARNec7h/D0ndJwMvHBkn25JLx+WjTtY1Wi0pvsV/hOLZ+rlWIV2L72KkyJEPa5QhX
	y8b8iD6Xopmy0PhTxYg4c9NKnjt8NBSlN/Gc7Hfyw2QiUE1eXAJJ7bCCZsB0Jj4RDY12MDmj1rS7w
	+BC+oTJ5el4FxDimM8SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQtz-00000009Fnd-36Go;
	Tue, 03 Dec 2024 11:17:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQlr-00000009CsD-3bnB
	for linux-mtd@lists.infradead.org;
	Tue, 03 Dec 2024 11:08:48 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B34BwWg032204;
	Tue, 3 Dec 2024 11:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Utp8wn+oiCv6KEgRhVjryk61jbXzATW0Zd/tGlfn4jQ=; b=I8haX6bMgAhHWGhF
	5KRxDdKyCxLB6Wqk1Xc9PLix2Z/UJSlEGyK9Aj6pzRNzOoNEAglgDyyHVZtKwokc
	vrS63DzzGp9nWuLb2E7UlQhOx+T2j88ESQ3iQl6ICjtikj4mB1ASylI2Aj5a7hZz
	hf/8OQGT5rXH8abuIp4SexxKqQ1lnELR+MBlO+ZFk1b0BIFnLa7Dn65qv/1J0ILi
	rbgsUSLeFu8qQ2rO1Pg60ZQZApDLeW9148mtgHRkSfnnCKIGs2XlUNgVEFkGCgR4
	XEubjNwrFJS3uLwl1Ef6aeLnOY5nuqcQF36nirrjzPgsCgkuinE0GpADXWpBqTWG
	TD7wjQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439trbh2ew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 11:08:44 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B3B8hGa011594
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 11:08:43 GMT
Received: from [10.151.36.201] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 03:08:39 -0800
Message-ID: <77a00ba0-eb28-49a3-89b2-789b34502e8f@quicinc.com>
Date: Tue, 3 Dec 2024 16:38:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] QPIC v2 fixes for SDX75
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <manivannan.sadhasivam@linaro.org>, <richard@nod.at>, <vigneshr@ti.com>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>,
        <quic_nainmeht@quicinc.com>, <quic_laksd@quicinc.com>,
        <quic_varada@quicinc.com>
References: <20241119092058.480363-1-quic_mdalam@quicinc.com>
 <877c8i6nbi.fsf@bootlin.com>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <877c8i6nbi.fsf@bootlin.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Tl5joUrkQJ4RkMGNJsZD9XONOT9MLWwE
X-Proofpoint-ORIG-GUID: Tl5joUrkQJ4RkMGNJsZD9XONOT9MLWwE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=718 mlxscore=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412030096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_030847_900768_317171CC 
X-CRM114-Status: GOOD (  10.00  )
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

CgpPbiAxMi8yLzIwMjQgMTA6MjAgUE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gCj4gSGVsbG8s
Cj4gCj4gT24gMTkvMTEvMjAyNCBhdCAxNDo1MDo1NiArMDUzMCwgTWQgU2FkcmUgQWxhbSA8cXVp
Y19tZGFsYW1AcXVpY2luYy5jb20+IHdyb3RlOgo+IAo+PiBUaGVzZSBwYXRjaGVzIHdpbGwgZml4
IHRoZSBmb2xsb3dpbmc6Cj4+ICAgCj4+IDEpIG9uZmkgcGFyYW0gcGFnZSByZWFkIHdoaWNoIHdh
cyBicm9rZW4gYnkgZXhlY19vcCgpIHBhdGNoLgo+Pgo+PiAyKSBGaXhlZCBvZmZzZXQgcGFzc2Vk
IHRvIEJBTSBmcm9tIFFQSUMgYmFzZQo+IAo+IFdvdWxkIHlvdSBtaW5kIGFkZGluZyBGaXhlcyBh
bmQgQ2M6IHN0YWJsZSB0YWdzIHRvIGVhY2ggcGF0Y2g/Ck9rLCB3aWxsIGFkZCBpbiBuZXh0IHJl
dmlzaW9uLgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
