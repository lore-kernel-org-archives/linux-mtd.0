Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6F1C0015E
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 04:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZOXCLpDVYslBw+sjT/hOpmIGJG0RWEhC9yu8O3NwGYU=; b=bxLe/moZJN5gNd
	bg2i43UyyOKBTX70CcwP+HHXkrJkYS0bI1ptjcbR8KedP7qlVDlOpND3B+m2RTAe+0qd4NPt23Z2Z
	h6BaCTxsxTS1Dkt6mxxo34fz6XYkXBakht5eZNKgg7qWTBQWsDTZmGQ5GmsWirXIrdx5Nfgj5SnWP
	9U4blUKvZyW//fQwy0t/CghCkXL5w+i237O3SYeds0Atzwpz3P97/cgPiTxFlxBiBpHSYkYOZ7pul
	zTRt4EJvhGxyZxJKrOh70LGUmD3wXQ06m9gjW1iZJ7UkJEbciiTBdG+zAopW2Qwrzf6kPZ/aY+o//
	xdlYQeIPCss2j2IRWwzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPEsc-001Yw5-2F;
	Fri, 28 Jul 2023 04:15:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPEsZ-001Yuc-2H;
	Fri, 28 Jul 2023 04:15:05 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36S3dC9F021094;
	Fri, 28 Jul 2023 04:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=LYjVM6PZKX6ad2Q/4Qy7LfQu4fDekyaFvqEnu3lH2lg=;
 b=kWTIKBO40MSGTfiylI+91iO3NLVDl2ukZp4QRLm9WsS618PrkKOsx/gCQXMzXylx5/y9
 fpypFfl7nWIfF55zZTq+ME/vJu8UsCBTC4JJposlMwuc34ch6YoiR03nwhZR5llkarm9
 Lfn8vmb5TkBerQx7RuxhlZuuaiFujdB3MmScAbOJfedFweto7UA81zUq5vAG6DP7XCqF
 IRiHy7716we3sZEN6+yhqc6iiJOHhDmNpMqGt1qY2VRTQNQZ7fiXDjhRNkC44YNnfzwL
 Zz7NV937bn9ZOnzblb/Nbs8WPARyGajtkNeJoGxsOaagLI040vI3AVXupsV5US/FQEZH Sw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s3k7u2k37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jul 2023 04:14:45 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36S4EiAE004610
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jul 2023 04:14:44 GMT
Received: from [10.216.45.120] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 27 Jul
 2023 21:14:40 -0700
Message-ID: <f022d84c-0fe1-7b21-eccf-bc0ba4fd871f@quicinc.com>
Date: Fri, 28 Jul 2023 09:44:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 8/8] mtd: rawnand: qcom: Fix address parsing within
 ->exec_op()
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
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
 <9d8296a4-8566-cc83-2ef8-3589afeb22f2@quicinc.com>
In-Reply-To: <9d8296a4-8566-cc83-2ef8-3589afeb22f2@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _a7AXIQUIBfbYwtq7nr1tMm_4J0fJ0PY
X-Proofpoint-ORIG-GUID: _a7AXIQUIBfbYwtq7nr1tMm_4J0fJ0PY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=854
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307280037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_211503_896417_26E12AEE 
X-CRM114-Status: GOOD (  16.87  )
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

SGkgTWlxdWVsLAoKT24gNy8yOC8yMDIzIDg6MDMgQU0sIFNyaWNoYXJhbiBSYW1hYmFkaHJhbiB3
cm90ZToKPiBIaSBNaXF1ZWwsCj4gCj4gT24gNy8yNy8yMDIzIDg6MjkgUE0sIE1pcXVlbCBSYXlu
YWwgd3JvdGU6Cj4+IEhpIFNhZHJlLAo+Pgo+PiBtYW5pQGtlcm5lbC5vcmcgd3JvdGUgb24gTW9u
LCAxNyBKdWwgMjAyMyAxMjowODo0MyArMDUzMDoKPj4KPj4+IE9uIFN1biwgSnVsIDE2LCAyMDIz
IGF0IDA0OjQ2OjEyUE0gKzAyMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+Pj4gVGhlIG5hZGRy
cyB2YXJpYWJsZSBpcyBpbml0aWFsaXplZCBidXQgbm90IHVzZWQuIEZpeGluZyB0aGlzIGNvdWxk
IGhhdmUKPj4+PiBiZWVuIGEgbWF0dGVyIG9mIGRyb3BwaW5nIHRoZSB2YXJpYWJsZSwgYnV0IHRo
ZSByaWdodCB3YXkgdG8gZG8gaXQgCj4+Pj4gbG9va3MKPj4+PiBhIGJpdCBtb3JlIGNvbXBsZXg6
IHdlIGNhbiBhdm9pZCB1c2VsZXNzIHdyaXRlcyB0byB0aGUgcV9vcCAKPj4+PiBzdHJ1Y3R1cmUg
YnkKPj4+PiB1c2luZyBpdC4gSW4gcHJhY3RpY2Ugd2UgY291bGQgZXZlbiBoYXZlIHBvc3NpYmxl
IG91dC1vZi1ib3VuZCBidWdzIAo+Pj4+IHdpdGgKPj4+PiB0aGUgZXhpc3RpbmcgaW1wbGVtZW50
YXRpb24uIExldCdzIGZpeCBhbGwgdGhhdCBieSBqdXN0IHBlcmZvcm1pbmcgdGhlCj4+Pj4gcmln
aHQgbnVtYmVyIG9mIGFzc2lnbm1lbnRzIGluIHRoZSBhZGRyezEsMn1fcmVnIGZpZWxkcy4KPj4+
Pgo+Pj4+IEZpeGVzOiA4OTU1MGJlYjA5OGUgKCJtdGQ6IHJhd25hbmQ6IHFjb206IEltcGxlbWVu
dCBleGVjX29wKCkiKQo+Pj4+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGlu
dGVsLmNvbT4KPj4+PiBDbG9zZXM6IAo+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWti
dWlsZC1hbGwvMjAyMzA3MTMxOTU5LlBkUFNDODZLLWxrcEBpbnRlbC5jb20vIAo+Pj4+Cj4+Pj4g
Q2xvc2VzOiAKPj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjMw
NzEzMTczMC5OT1liY2pCci1sa3BAaW50ZWwuY29tLyAKPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4+Pgo+Pj4gTEdUTSEg
QnV0IEknbSByZWx5aW5nIG9uIFNhZHJlIHRvIHRlc3QgaXQuCj4+Pgo+Pj4gQWNrZWQtYnk6IE1h
bml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPgo+Pgo+PiBJIGRvbid0IHRoaW5r
IEkndmUgcmVjZWl2ZWQgZmVlZGJhY2sgZnJvbSBTYWRyZSwgSSB3b3VsZCBsaWtlIHRvIGNsb3Nl
Cj4+IHRoZXNlIGlzc3VlcywgY2FuIHlvdSBwbGVhc2UgdGVzdCBhbmQgZ2l2ZSB1cyBmZWVkYmFj
az8KPj4KPiAKPiAgwqBTb3JyeSBmb3IgdGhlIGRlbGF5IGluIHJlc3BvbnNlLiBUZXN0aW5nIHRo
aXMsIHdpbGwgcmVzcG9uZCBiYWNrCj4gIMKgc2hvcnRseSB0b2RheS4KCiAgVGVzdGVkIHRoaXMg
c2VyaWVzIG9uIGlwcTgwNzQtaGswMSBib2FyZC4KICBUZXN0ZWQgYm9vdGNoZWNrLCBib3RoIC9k
ZXYvbXRkIGFuZCAvZGV2L210ZGJsb2NrIGZvciBkYXRhIGludGVncml0eS4KICBBbGwgbG9va3Mg
ZmluZS4gU28sCgogIFRlc3RlZC1ieTogU3JpY2hhcmFuIFJhbWFiYWRocmFuIDxxdWljX3NyaWNo
YXJhQHF1aWNpbmMuY29tPgoKUmVnYXJkcywKICBTcmljaGFyYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
