Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E2BE77188
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 05:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Qgm0eYkXbvTpj5aCE/4DPer7dDo34+J/bcUYYRFEEs=; b=vPaaYnSsh4iBY+
	sDm72A4eObY0yJ5F7WxvDdWYJfevuHOK+hPT4ZdhtLYSQ6ArtONDEjOyY8E3spc7iSn+iA18NMUGQ
	rgQBQWI9nitOkwGqAYGwb2/crzdc4+wVzsEr8L9EkUPuOSaAGSegta3ElogCAqYSPkpCeKhPsikWr
	B3JlsdRVe7TJuTxduf9E/VZRHRLOsobRFRaEacDofgGYObLen/qEnfmxs9C0K5WtgTC22GuE03AcP
	BdneuDeDFxutLS0EV5SIaIhE3xCkimj6y632nbRzshWjVuTIAdlJHuxWvMIWl1kzztE/CAtLmcX88
	yls9q4niBRsKEXJeyicg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPx9W-0000000BHJ8-22Wh;
	Tue, 24 Dec 2024 05:08:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPx9T-0000000BHIf-0jUd
	for linux-mtd@lists.infradead.org;
	Tue, 24 Dec 2024 05:08:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BO4T9no002423;
	Tue, 24 Dec 2024 05:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Or765rq803BulnmGwYC6lg6plwc6SPFaXTcn2gUF2EU=; b=ludezCFRctrsgWKS
	QWVKx8zHte7E24I8pVd5ubaqPP3/JCvdtWAg6JdPA+VZLzDkJphixHACvukqlOLC
	fDYVRp0j9oBMC/D0Ul1iWV9uEhiWUl6puW631ewoaE2HPzm3Px1utnfswMX5YQAL
	hS9pLT8osWDtn33zDSdGIamxAE947TgKsAgB6gyu87xDgFsuZLrpKOnUPP3d9ft1
	4cizxMQmG1HZhvBF2dlQJXt/Cu4ByGEvTec9J+sUl/5Tw3RYWucyPXnWz/m6Wd2T
	cHnRL2SdfyzfMTyOW0HOdN8kN6+SyCqe3rArMpzEWHbBAMLhRN/ZOR9BcvPW4Glj
	g2LnPw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qnxxg3wj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 05:08:08 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BO5873D007492
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 05:08:07 GMT
Received: from [10.50.31.100] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 21:08:01 -0800
Message-ID: <c6d05aa3-95f2-83d3-ef20-75305f928992@quicinc.com>
Date: Tue, 24 Dec 2024 10:37:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v14 0/8] Add QPIC SPI NAND driver
To: Miquel Raynal <miquel.raynal@bootlin.com>, <broonie@kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <richard@nod.at>,
        <vigneshr@ti.com>, <manivannan.sadhasivam@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <quic_srichara@quicinc.com>,
        <quic_varada@quicinc.com>
References: <20241120091507.1404368-1-quic_mdalam@quicinc.com>
 <87mshe58gq.fsf@bootlin.com> <87o712qki7.fsf@bootlin.com>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <87o712qki7.fsf@bootlin.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YnaAL2S88cmyIimwO3UJ2ZVAcUndI6AU
X-Proofpoint-ORIG-GUID: YnaAL2S88cmyIimwO3UJ2ZVAcUndI6AU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412240038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_210815_341639_B4D7E4F0 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

CgpPbiAxMi8yNC8yMDI0IDEyOjQ0IEFNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIE1hcmss
Cj4gCj4+PiB2MTQ6Cj4+PiAgICogVXBkYXRlZCBjb21taXQgbWVzc2FnZQo+Pj4gICAqIEZpeCBz
cGVsbGluZyBtaXN0YWtlCj4+PiAgICogUmVtb3ZlICJpbmxpbmUiIGZyb20gbXVsdGlwbGUgQVBJ
cyBmcm9tIHFjb21fbmFuZGMuYyBmaWxlCj4+PiAgICogTW92ZSAnfCcgaW4gcWNvbV9wYXJhbV9w
YWdlX3R5cGVfZXhlYygpIEFQSXMgYXQgdGhlIGVuZCBvZiBsaW5lCj4+Cj4+IEkgZ3Vlc3MgaXQg
aXMgbm93IHRpbWUgdG8gbW92ZSBvbiwgSSBjYW4gYXBwbHkgcGF0Y2hlcyAyLTUgYW5kIHNoYXJl
IGFuCj4+IGltbXV0YWJsZSB0YWcuCj4gCj4gRG8geW91IHdhbnQgYW4gaW1tdXRhYmxlIHRhZyBv
ciB3aWxsIHlvdSB3YWl0IHRoZSBuZXh0IGN5Y2xlIHRvIGFwcGx5Cj4gdGhlIHNwaSBwYXRjaGVz
PwoKUGxlYXNlIHNoYXJlIHRoZSB0YWcuIFdpbGwgYXBwbHkgdGhlIHJlbWFpbmluZyBwYXRjaGVz
IChhbmQgcmVzb2x2ZSAKY29uZmxpY3RzLCBpZiBhbnkpIGFuZCBlbnN1cmUgdGhleSB3b3JrIGFz
IGV4cGVjdGVkLgoKVGhhbmtzCkFsYW0uCgo+PiBIb3dldmVyLCBkdWUgdG8gdGhlIGZyZXF1ZW50
IGluY29uc2lzdGVuY2llcyBvYnNlcnZlZAo+PiBkdXJpbmcgdGhlIGxpZmV0aW1lIG9mIHRoaXMg
cGF0Y2hzZXQsIHdlIG1pZ2h0IGJlIHNsaWdodGx5IG1vcmUKPj4gY29uc2VydmF0aXZlIHRoYW4g
dXN1YWwgYW5kIHNwbGl0IHRoZSBwYXRjaGVzIG92ZXIgdHdvIGtlcm5lbAo+PiByZWxlYXNlcy4g
SSBmZWFyIHRoZXJlIG1pZ2h0IGJlIGFubm95aW5nIGZpeGVzIG9uIHRoZSBtdGQgc2lkZSBuZWVk
ZWQKPj4gYmVjYXVzZSBvZiBzb21lIHNpZGUgZWZmZWN0cy4gV2l0aG91dCB0aGVzZSwgdGhlIHNw
aSB0cmVlIG1pZ2h0IGhhdmUKPj4gYnJva2VuIHFjb20gc3VwcG9ydCBmb3Igc2V2ZXJhbCB3ZWVr
cy4gV2hhdCBkbyB5b3UgdGhpbms/Cj4+Cj4+IENoZWVycywKPj4gTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
