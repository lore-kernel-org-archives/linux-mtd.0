Return-Path: <SRS0=/vOe=RA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5198AC43381
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Feb 2019 15:48:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20BEB2087C
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Feb 2019 15:48:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VQcG58it"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20BEB2087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cumminsallison.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4twVNlrPkzkdozI4HbiZe5bGzDegpy+qHjP8EoT8bVg=; b=VQcG58it+V8yh5
	JFN+o3CqaWrHggBqc7GE/o+odAsqOY1Kbc9uZ5cT4jCfFjITl0GWKx5/XGqBmKf4t6otrH54CD1QH
	HMN+CSRFSboeh8vLR+sO/qPYI5TxJt1XKHj1CL1JvhSl6gkBzklPdL5RaMoqM234gUWkSt9ZGERJa
	8BrxEbZ/6BmSIyeib61OWeYpHedcrUxNGZ4kEEkzJF045rJWpTGzVM7VMpuY4xxkf5IEgBahCsKhk
	NqhRFsEpmg25QQFvqqUuOukkB9izhbEVRiXGzfDjRLsupiH1q1E52xA7ijf0sv4b+Y4pj1nwJe1Lz
	tsxHO/m1VTBzyl2dle6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyIUa-0000QK-FA; Mon, 25 Feb 2019 15:48:32 +0000
Received: from mx0b-0028f201.pphosted.com ([148.163.153.29])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyIUX-0000NC-BQ
 for linux-mtd@lists.infradead.org; Mon, 25 Feb 2019 15:48:31 +0000
Received: from pps.filterd (m0113282.ppops.net [127.0.0.1])
 by mx0b-0028f201.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1PFgdHa024993; Mon, 25 Feb 2019 09:48:24 -0600
Received: from astraea.cumminslocal.com (mx2.cumminsallison.com
 [208.73.132.232])
 by mx0b-0028f201.pphosted.com with ESMTP id 2qu1yu8wfp-1;
 Mon, 25 Feb 2019 09:48:24 -0600
Received: from [192.168.72.131] (10.3.20.47) by Astraea.Cumminslocal.com
 (10.1.22.15) with Microsoft SMTP Server (TLS) id 15.0.1210.3; Mon, 25 Feb
 2019 09:48:23 -0600
To: <linux-mtd@lists.infradead.org>, <bbrezillon@kernel.org>,
 <beanhuo@micron.com>
From: Piotr Wojtaszczyk <wojtaszczykp@cumminsallison.com>
Subject: [EXT] Re: [RESEND PATCH V2 1/2] mtd: core: add erase preparation hook
 function pointer
Message-ID: <f4d62c64-824f-7b81-2681-63dff50829fc@cumminsallison.com>
Date: Mon, 25 Feb 2019 09:48:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Language: en-US
X-MS-Exchange-Organization-OriginalArrivalTime: 25 Feb 2019 15:48:23.5601 (UTC)
X-MS-Exchange-Forest-ArrivalHubServer: Astraea.Cumminslocal.com
X-MS-Exchange-Organization-OriginalClientIPAddress: 10.3.20.47
X-MS-Exchange-Organization-OriginalServerIPAddress: 10.1.22.15
X-MS-Exchange-Organization-AuthSource: Astraea.Cumminslocal.com
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 00
X-Originating-IP: [10.3.20.47]
X-ClientProxiedBy: Attis.Cumminslocal.com (10.3.22.61) To
 Astraea.Cumminslocal.com (10.1.22.15)
X-MS-Exchange-Organization-Cross-Premises-Headers-Processed: Astraea.Cumminslocal.com
X-MS-Exchange-Organization-Network-Message-Id: 68288325-23de-40e6-8cd2-08d69b38acce
X-MS-Exchange-Organization-OriginalSize: 2039
X-MS-Exchange-Organization-HygienePolicy: Standard
X-MS-Exchange-Organization-Recipient-Limit-Verified: True
X-MS-Exchange-Organization-Transport-Properties: DeliveryPriority=Normal
X-MS-Exchange-Organization-Prioritization: 1
X-MS-Exchange-Organization-Rules-Execution-History: TransportVersioned.ProofpointBulk%%%TransportVersioned.Copy all emails to
 mailbox - Sender%%%TransportVersioned.Copy all emails to mailbox - Recipient
X-MS-Exchange-Forest-RulesExecuted: Astraea
X-MS-Exchange-Forest-IndexAgent-0: AAH8AwAADwAAAx+LCAAAAAAABACNVNtuGzcQ5cq6y0qCoh8wjy1iSZ
 YRpxcEKeKmRQ20dlElfchLQe1ypUV2SZXkSlHQD+vn9QwpqbabpDZo
 ipeZM2fODPfvwXO61uRMpahUC5luaVVKLS2dvaRfitQaTVcvrl5Spt
 ZFqhxtlkqTHPaf07w06VtSVjpFqakqqTMqHIarVXZCJk2lK4yWZbkl
 tVaaffzS1IslyVvOZoVfD1NydYoYLq/ZB5irUnnl2JHBrfK11Q7eK+
 kcOS997U6AqSgvpVvuQCu5JW08zRU77lGYBEfLxjSr5079WSvt/w3t
 yBsggX8AYU/wWSu7JSstEoSrw6zBwtWlp4LZzn2J2LIoa5ySsTGgtf
 WKMcf0aqmQn3rnraqYwQ0oByXKjDSUscigRNpBVNZSuyJTFlRxwocR
 JjhD1dpapbkUS7lWcEA9DBKya5Ux55W0vmDR2XNjC+9hEJJyY/p1f3
 nnhhibRas1l9KEYm0Kv6TXF5cT/P84O5AxJNemyKJad0id0EahAG8V
 xMGFX0pPGKWSzrPz9Bz8Fre4r6xZWFlVYI8S7DtjrnIDgMJzS+0Kxw
 CXOujHYfJCZzECi8cr/Wn8k9BIWVb40JY7S07gBgfUlRsqsAgF3Ikb
 uoQBCrdL6y4QSwFhtYqZoJJ7jbl5K+PQbnl8BFCmwIM7aBszdPtiBH
 y0gZdgU5lbBBkgxNvXY1YstMpGJs9H8+23dKEgw0+1oWdzrJZYAKsK
 D3mM0gaX3/CW1QZO7PDm+udXL65o9ub1xcX197Mffqdn7937ej43qV
 PrD3iPRiP+ocwW6F03qXw20UhxYuUmLP7YO9BfNJ1+w8aP7/MXUKeo
 Kx5Vimou+DMCANQEFQiv9IvHX+7Szoo8B5UFOkRO/p9KeFv3tENfqX
 c0//pcTdPpeJyfn6nTr85oenr69MmTnQL3Doq87hl42L/k0uPh8xcO
 H2HuokrZhYpPbSV9usSX2ujv2Fg0GuKoKVpt0cHAGjO2HdHFnIhWS7
 QxsA1X3WMxbIoubBLRiFc90cdhTwyPRBNmOA9oXWyjARYYDdHuiwHO
 MWPEoC3Ri4uwZssDhy5fweU4hogGOD8Wj2DQF59hi8OBOI7uwf4IND
 pMrwuXsOjE6N1gFigNYRZ9MYB/IIDBVwlwxG0bZhvzjfQCw10KN92b
 Ses/vg/hHlOLOIEDsxqIh9E3GkTZI3gnqBe27biIYsYaHarTFw+QTj
 sRwwDY2Fm2dsVKRJ/PuyjJgMVhbZHvIKS8v310iMUzW3InJAlEQ87T
 RIhY0E7S4xPO4vNmCIfzD/ty23z0KvRSr5OgNKItHnzcsvcJkKhwJH
 ZQm+d/AAKsogWHCAAAAQvMATw/eG1sIHZlcnNpb249IjEuMCIgZW5j
 b2Rpbmc9InV0Zi0xNiI/Pg0KPFVybFNldD4NCiAgPFZlcnNpb24+MT
 UuMC4wLjA8L1ZlcnNpb24+DQogIDxVcmxzPg0KICAgIDxVcmwgU3Rh
 cnRJbmRleD0iOTk2IiBUeXBlPSJVcmwiPg0KICAgICAgPFVybFN0cm
 luZz5taWNyb24uY29tPC9VcmxTdHJpbmc+DQogICAgPC9Vcmw+DQog
 IDwvVXJscz4NCjwvVXJsU2V0PgENAmVuAQ7PAVJldHJpZXZlck9wZX
 JhdG9yLDEwLDA7UmV0cmlldmVyT3BlcmF0b3IsMTEsMjtQb3N0RG9j
 UGFyc2VyT3BlcmF0b3IsMTAsMTtQb3N0RG9jUGFyc2VyT3BlcmF0b3
 IsMTEsMDtQb3N0V29yZEJyZWFrZXJEaWFnbm9zdGljT3BlcmF0b3Is
 MTAsMztQb3N0V29yZEJyZWFrZXJEaWFnbm9zdGljT3BlcmF0b3IsMT
 EsMDtUcmFuc3BvcnRXcml0ZXJQcm9kdWNlciwyMCw0OA==
X-MS-Exchange-Forest-IndexAgent: 1 1450
X-MS-Exchange-Forest-EmailMessageHash: 559A301C
X-MS-Exchange-Forest-Language: en
X-MS-Exchange-Organization-Journaled-To-Recipients: ArchiveMgr_Journal@cumminsallison.com
X-MS-Exchange-Organization-Processed-By-Journaling: Journal Agent
X-MS-Exchange-Organization-MessageHighPrecisionLatencyInProgress: LSRV=Astraea.Cumminslocal.com:TOTAL-HUB=0.687|UTH=0.004|SMRDE=0.308|SMRCL=0.088|SMRCR=0.111|SMRC=0.113|SMR=0.422|QS=0.001|CATSM=0.001|CRSL=0.004|
 CATRS-Transport Rule Agent=0.001|CATRS-Index Routing
 Agent=0.059|CATRS=0.060|CATRT-Journal Agent=0.096|
 CATRT=0.096|CAT=0.165;2019-02-25T15:48:24.247Z
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-25_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902250115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190225_074829_511747_98DDFA21 
X-CRM114-Status: GOOD (  14.80  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

PiBPbiBzb21lIGxlZ2FjeSBwbGFuYXIgMkQgTWljcm9uIE5BTkQgZGV2aWNlcyB3aGVuIGEKPiBi
bG9jayBlcmFzZSBjb21tYW5kIGlzIGlzc3VlZCwgb2NjYXNpb25hbGx5IGV2ZW4KPiB0aG91Z2gg
YSBibG9jayBlcmFzZSBvcGVyYXRpb24gc3VjY2Vzc2Z1bGx5IGNvbXBsZXRlcwo+IGFuZCByZXR1
cm5zIGEgcGFzcyBzdGF0dXMsIHRoZSBmbGFzaCBibG9jayBtYXkgbm90IGJlCj4gY29tcGxldGVs
eSBlcmFzZWQuIFN1YnNlcXVlbnQgb3BlcmF0aW9ucyB0byB0aGlzIGJsb2NrCj4gb24gdmVyeSBy
YXJlIGNhc2VzIGNhbiByZXN1bHQgaW4gc3VidGxlIGZhaWx1cmVzIG9yCj4gY29ycnVwdGlvbi4g
VGhlc2UgZXh0cmVtZWx5IHJhcmUgY2FzZXMgc2hvdWxkIG5ldmVydGhlbGVzcwo+IGJlIGNvbnNp
ZGVyZWQuCj4KPiBUaGVzZSByYXJlIG9jY3VycmVuY2VzIGhhdmUgYmVlbiBvYnNlcnZlZCBvbiBw
YXJ0aWFsbHkKPiB3cml0dGVuIGJsb2Nrcy4gUGFydGlhbGx5IHdyaXR0ZW4gYmxvY2tzIGFyZSBu
b3QgdW5jb21tb24KPiB3aXRoIFVCSS9VQklGUy4KPgo+IFRvIGF2b2lkIHRoaXMgcmFyZSBvY2N1
cnJlbmNlLCB3ZSBtYWtlIHN1cmUgdGhhdCBhdCBsZWFzdAo+IDE1IHBhZ2VzIGhhdmUgYmVlbiBw
cm9ncmFtbWVkIHRvIGEgYmxvY2sgYmVmb3JlIGl0IGlzIGVyYXNlZC4KPiBJbiBjYXNlIHdlIGZp
bmQgdGhhdCBsZXNzIHRoYW4gMTUgcGFnZXMgaGF2ZSBiZWVuIHByb2dyYW1tZWQsCj4gYWRkaXRp
b25hbCBwYWdlcyBhcmUgcHJvZ3JhbW1lZCBpbiB0aGUgYmxvY2suIFRoZSBvYnNlcnZhdGlvbgo+
IGlzIHRoYXQgYWRkaXRpb25hbCBwYWdlcyByYXJlbHkgbmVlZCB0byBiZSB3cml0dGVuIGFuZCBt
b3N0IG9mCj4gdGhlIHRpbWUgVUJJL1VCSUZTIGVyYXNlcyBibG9ja3MgdGhhdCBjb250YWluIG1v
cmUgcHJvZ3JhbW1lZAo+IHBhZ2VzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQmVhbiBIdW8gPGJlYW5o
dW8gYXQgbWljcm9uLmNvbT4KPiBSZXZpZXdlZC1ieTogWk9MVEFOIFNaVUJCT0NTRVYgPHpzenVi
Ym9jc2V2IGF0IG1pY3Jvbi5jb20+Cj4gLS0tCj4gwqBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5k
X21pY3Jvbi5jIHwgMTE5IAo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
PiDCoDEgZmlsZSBjaGFuZ2VkLCAxMTkgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWljcm9uLmMgCj4gYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9uYW5kX21pY3Jvbi5jCj4gaW5kZXggYjg1ZTFjMS4uZjUyZTA3MiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21pY3Jvbi5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvbmFuZF9taWNyb24uYwoKSXMgdGhlcmUgYSBwbGFuIHRvIG1lcmdlIHRoaXMgcGF0Y2gg
c29vbj8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
