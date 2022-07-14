Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4856BC43334
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Jul 2022 14:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vCnSA6Q3xHrpK8Cyj9P+JY/nHFwB3XAc5R6dDGxj320=; b=cAfhILgIBCz1og
	zFqKbhXwUF6i81qzAkXcZ7gSFBoiR3FWbX9Ozd545jkXs0tfGyXfVliEG0Xi+hUFyxHi2c7E51P0z
	FZqnbKqeGXK0m1Iwq+0bPQx2LJ317Pu68onbPqVDnBIuM601lG0hc/b4EBPY/huxVlARcnzH1SNuJ
	9RlMqRP7AZeXIwi1AgN+waO0Mb7m6zXdNd8BBxKP+Mg5N3H1/V6trSQwqad9QquHO7CcixgarY2oS
	fImJdSde9He6GnTOXRRRjPgiWLq7An9szh1OFoPBJju7DapRfVUpXdnQ82Jzu/0WvZJROXljLqm6U
	Ufa30ZQF3Lvgs5xrG2cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBzrd-00FCqz-EV; Thu, 14 Jul 2022 14:30:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBzra-00FCii-E9
	for linux-mtd@lists.infradead.org; Thu, 14 Jul 2022 14:30:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26ECRddX021374;
	Thu, 14 Jul 2022 14:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=LupV7ixCNZWBwIe/ErNzqPMhAB4KwQY5KFAC5+6N81I=;
 b=iacV4VwHrh2/PWIfASO32ZyamggQqsBCDma/Q9pUShiH3hO6KTSZHj0I8SxWwXh5UVLJ
 K68BwkO84V+6fL5S8KfYBGHJg9wb8Atg2rOedW9n88E9/f0/jFQxmlL0s0Weldy49qXD
 eVw7rLRwE3ufRcTqzVipHR7sqMAIlfk5p0VP5Y/5qymX502qqebbFCBe7KWkW8/6wpHR
 0bzMaf65K4HkZWjmjDPcx56kU1Y8wUzguMQkCRlkvBPeflzj0CMgCjiIZdcl20SKlU8W
 B1zaVmvwKrkLfF7AQAO2Fyt9CmnxxXtTXXtilXLVEo91A8QPC4N5NXYs/I0FaWDv7XUt yQ== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3h9wwcuan3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Jul 2022 14:30:24 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.47.97.222])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 26EEUNEx001570
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Jul 2022 14:30:23 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Jul 2022 07:30:23 -0700
Received: from [10.110.120.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 14 Jul
 2022 07:30:22 -0700
Message-ID: <114fcde6-bdf7-68ee-d031-35a916027aee@quicinc.com>
Date: Thu, 14 Jul 2022 07:30:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] mtd: spi-nor: winbond: add support for W25Q512NW-IQ/IN
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
CC: <clg@kaod.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <p.yadav@ti.com>,
        <quic_ggregory@quicinc.com>, <quic_jiles@quicinc.com>,
        <tudor.ambarus@microchip.com>
References: <20220710145721.1207157-1-quic_jaehyoo@quicinc.com>
 <20220711095042.2095360-1-michael@walle.cc>
 <a42fbef2-3eff-9e88-233e-a805cfbe2376@quicinc.com>
 <4972a85d04e39ebb7b4a5872f6632c45@walle.cc>
 <2260955b-354d-ceda-cadc-49453bfca3e4@quicinc.com>
 <00f0c9d480ef5a414f1c34492661bd9e@walle.cc>
 <63cedfce-34bb-ed63-3871-75a6c3dd5d73@quicinc.com>
 <6be710bb5c1bf0449e54a54b78f6f7a0@walle.cc>
 <47c01d768ea56edc9a2f9d317af7b495@walle.cc>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <47c01d768ea56edc9a2f9d317af7b495@walle.cc>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GTO82u501krg2h7VqTPnVsPOzWiQ18Js
X-Proofpoint-ORIG-GUID: GTO82u501krg2h7VqTPnVsPOzWiQ18Js
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-14_10,2022-07-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxlogscore=903 mlxscore=0 clxscore=1011 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207140061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_073046_645642_3B53C76D 
X-CRM114-Status: GOOD (  14.48  )
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

T24gNy8xNC8yMDIyIDc6MjEgQU0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4gQW0gMjAyMi0wNy0x
NCAxNjoxNiwgc2NocmllYiBNaWNoYWVsIFdhbGxlOgo+PiBBbSAyMDIyLTA3LTE0IDE1OjQ3LCBz
Y2hyaWViIEphZSBIeXVuIFlvbzoKPj4+IE9uIDcvMTQvMjAyMiAxMjo0MSBBTSwgTWljaGFlbCBX
YWxsZSB3cm90ZToKPj4+PiBXaGF0IGRvZXMgImRvZXNuJ3QgYm9vdCBhdCBhbGwiIG1lYW4/IEFy
ZSB0aGVyZSBhbnkga2VybmVsIHN0YXJ0dXAKPj4+PiBtZXNzYWdlcz8KPj4+Cj4+PiBJJ20gc2hh
cmluZyB0aGUgZXJyb3IgbWVzc2FnZXMgYmVsb3cuCj4+Cj4+IFRoYW5rcy4KPj4KPj4+IFvCoMKg
wqAgMC43NDg1OTRdIHNwaS1ub3Igc3BpMC4wOiB3MjVxNTEybndxICg2NTUzNiBLYnl0ZXMpCj4+
PiBbwqDCoMKgIDAuODY1MjE2XSBzcGktYXNwZWVkLXNtYyAxZTYyMDAwMC5zcGk6IENFMCByZWFk
IGJ1c3dpZHRoOjQgCj4+PiBbMHg0MDZjMDc0MV0KPj4+IFvCoMKgwqAgMC44NzI4MzNdIC0tLS0t
LS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+Pj4gW8KgwqDCoCAwLjg3Nzk4NF0gV0FS
TklORzogQ1BVOiAxIFBJRDogMSBhdCBkcml2ZXJzL210ZC9tdGRjb3JlLmM6NTgzCj4+PiBhZGRf
bXRkX2RldmljZSsweDI4Yy8weDUzYwo+Pj4gW8KgwqDCoCAwLjg4NzIzN10gQ1BVOiAxIFBJRDog
MSBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQKPj4+IDUuMTUuNDMtQVVUT0lOQy1kaXJ0eS0y
MzgwMWE2ICMxCj4+Cj4+IENvdWxkIHlvdSBwbGVhc2UgdHJ5IGl0IG9uIHRoZSBsYXRlc3QgKHZh
bmlsbGEpIGxpbnV4LW5leHQ/Cj4gCj4gb3Igc3BpLW5vci9uZXh0IFsxXSBhcyB0aGVyZSBhcmUg
cXVpdGUgYSBsb3Qgb2YgY2hhbmdlcy4gVGhlCj4gcGF0Y2hlcyBzaGFsbCBiZSBiYXNlZCBvbiB0
aGF0LgoKT2theS4gTGV0IG1lIHRyeSB0aGF0LiBJIHRlc3RlZCBpdCB1c2luZyA1LjE1LjQzIHdp
dGggYmFjay1wb3J0ZWQKc3BpLW5vciBwYXRjaGVzIGZyb20gdGhlIGxhdGVzdC4gSSdsbCBiYWNr
LXBvcnQgbW9yZSBjaGFuZ2VzIGZyb20KdGhlIHNwaS1ub3IvbmV4dCBhbmQgd2lsbCB0ZXN0IHRo
ZSBJTkZPKDB4ZWY2MDIwLCAwLCAwLCAwKSBzZXR0aW5nCmFnYWluLgoKLUphZQoKPiAtbWljaGFl
bAo+IAo+IFsxXSAKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvbXRkL2xpbnV4LmdpdCNzcGktbm9yL25leHQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
