Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D656D41C37
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2024 11:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ee+I4qnYadxs6L15UWWFDZog5yj5sjg11KEY+H63qFM=; b=1tAnteLn1fufdz
	sULi8dzEOHV0hjm4kprCaxTxrBnyEXSVHkaQH/QItLfdH3sbI90igkVAQ09TaSvFYmZY5AlJayTMk
	EUwkDl4WiRYkFki4ywXr37wmr2TolbPmHhRALnHDxpBuDlGAISjD9zdIs1CW2f5yVaIpH/vaFR0qc
	AZknM+XJDG9hhW4Rx/ttsePsnNDbu7rCaCPqjooQVQWDVJQQ6dEx40BQrkI9qI+5Hi39pf1zmvJzm
	H/bC+C6OcEVKVSdpLNnSajq4mcuosLqYYUJ3b0iX1AIotYzLFHQhn3sSZIAmEbOo/6O/PqeKbi2iO
	WEwLcx2M3C7wJXmRqmew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBB7e-00000006Wk1-3etA;
	Wed, 13 Nov 2024 11:01:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBA76-00000006Kow-1FpL
	for linux-mtd@lists.infradead.org;
	Wed, 13 Nov 2024 09:56:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD9bKUY017153;
	Wed, 13 Nov 2024 09:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EvNtgJl1mKwo5mTwwA6QMCNpCNq78hZ69wzyqL9tjcU=; b=fQNHDJuvtZDg+djr
	h5/WkaNSN5ROcLPUQlkSdcMwLFr4XdVJ+rFW1dB1uOUQulffdZCs0gssxu8FuzFb
	ucSYsj4bFTiY1FueLJdgIJQBlFA/eXKDUhFtShAnfHs/xw8jx99Dk9YKhFnPtUK0
	+vuFTILkIn3Ng9auJn/kvRW7lakeWJT/LsDx/MpNNH5XkjIaw4WXVWcxdlmFInOC
	UUzmOc9t4Fxpe+QininPD5H8fSYxB3jcBF+LWOgl21L5QX2hbWguVDSj0yzHxmR7
	CqT9AnDbb519mei4NOArvK7BDutR3FezxLB9pvlbh7YTGLZs+m2kk0wcSXzf/39r
	7GxI0w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t118ab9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 09:56:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD9uXG6017805
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 09:56:33 GMT
Received: from [10.152.197.144] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 01:56:28 -0800
Message-ID: <cdd25fe8-3d12-7460-93e8-a18dd121dc49@quicinc.com>
Date: Wed, 13 Nov 2024 15:26:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v13 2/8] mtd: rawnand: qcom: cleanup qcom_nandc driver
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20241030121919.865716-1-quic_mdalam@quicinc.com>
 <20241030121919.865716-3-quic_mdalam@quicinc.com>
 <871pzh397j.fsf@bootlin.com>
 <374ea155-0970-38bd-470f-cc440ca0bab5@quicinc.com>
 <87bjyjsds3.fsf@bootlin.com>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <87bjyjsds3.fsf@bootlin.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: isZzNuTSru7Tk9uTY21uYlkwmy7yDKwh
X-Proofpoint-GUID: isZzNuTSru7Tk9uTY21uYlkwmy7yDKwh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=976 lowpriorityscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_015640_363228_12CC8828 
X-CRM114-Status: GOOD (  10.69  )
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

CgpPbiAxMS8xMy8yMDI0IDI6MzcgUE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGVsbG8sCj4g
Cj4gT24gMTIvMTEvMjAyNCBhdCAxNzo0NTowNyArMDUzMCwgTWQgU2FkcmUgQWxhbSA8cXVpY19t
ZGFsYW1AcXVpY2luYy5jb20+IHdyb3RlOgo+IAo+PiBPbiAxMS8xMi8yMDI0IDEyOjAwIEFNLCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOgo+Pj4gT24gMzAvMTAvMjAyNCBhdCAxNzo0OToxMyArMDUzMCwg
TWQgU2FkcmUgQWxhbSA8cXVpY19tZGFsYW1AcXVpY2luYy5jb20+IHdyb3RlOgo+Pj4KPj4+PiBj
bGVhbnVwIHFjb21fbmFuZGMgZHJpdmVyIGFzIGJlbG93Cj4+PiBQZXJmb3JtIGEgZ2xvYmFsIGNs
ZWFudXAgb2YgdGhlIFF1YWxjb21tIE5BTkQgY29udHJvbGxlciBkcml2ZXIgd2l0aAo+Pj4gdGhl
Cj4+PiBmb2xsb3dpbmcgaW1wcm92ZW1lbnRzOgo+PiBPawo+Pj4+Cj4+Pj4gLSBSZW1vdmUgcmVn
aXN0ZXIgdmFsdWUgaW5kaXJlY3Rpb24gYXBpCj4+PiBBUEkKPj4gT2sKPj4+Cj4+Pj4KPj4+PiAt
IFJlbW92ZSBzZXRfcmVnKCkgYXBpCj4+PiBBUEkKPj4gT2sKPj4+Cj4+Pj4KPj4+PiAtIENvbnZl
cnQgcmVhZF9sb2NfZmlyc3QgJiByZWFkX2xvY19sYXN0IG1hY3JvIHRvIGZ1bmN0aW9uCj4+PiBm
dW5jdGlvbnMKPj4gT2sKPj4+Cj4+Pj4KPj4+PiAtIFJlbmFtZWQgbXVsdGlwbGUgdmFyaWFibGVz
Cj4+PiBSZW5hbWUKPj4gT2sKPiAKPiBJbiBnZW5lcmFsIHdoZW4gdGhlIG1haW4gYW5zd2VyIGlz
ICJva2F5IiwgeW91IGNhbiBwcm9iYWJseSBqdXN0IHNheSBhCj4gc2VudGVuY2UgbGlrZSAidGhh
bmtzIGZvciB0aGUgY29tbWVudHMgSSdsbCB0YWtlIHRoZW0gaW50byBhY2NvdW50IiwKPiB3aXRo
b3V0IGFuc3dlcmluZyB0byBlYWNoIGFuZCBldmVyeSBjb21tZW50LiBUaGlzIHdheSwgaXQgd2ls
bCBiZSBlYXNpZXIKPiBmb3IgbWUgdG8gY2F0Y2ggaWYgeW91IGhhdmUgZnVydGhlciByZW1hcmtz
LgpTb3JyeSwgSSB3aWxsIHRha2UgY2FyZSB0aGlzIGZyb20gbmV4dCByZXZpc2lvbiBvbndhcmQu
Cj4gCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
