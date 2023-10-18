Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A98CDB47E
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Oct 2023 11:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2MJ080Qm9PNlqjqT8XjYmbpIaFy7AKnOmKH1KGZBnpA=; b=iBBgWNwqBKTMzh
	TOD6K2NuP3TPRFokX5vHGpF6NGN2gpJaLSpNHtiDpCSxJiKjFqaPNX0LIV5SwizzIMAaGzXGg8Te2
	8AgKTAwBwj7t2gztxHt0iCSn7ZBmele2K6nb9xBMQ0IeFiMx41/nhdbzqyrNYkpRJ25QbdK/lmZlC
	I2U8fg/granl3D5i0407Do5kuDC0HH4CFlUIIdQiTNiq4glwvhsCAhGYEnJFQz4nMJNqtwujF4VsR
	D6dXVGjvOo1NzOEaHXoS+IlTIuGEu1Ps+50zFHXKNTfaxDch24eu3Wam+JSGqWzB5+E9NKdmaN/kf
	6pVAUvvnsRnomzFzf5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4OQ-00EVhT-2m;
	Wed, 18 Oct 2023 11:07:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4OM-00EVgW-2E
	for linux-mtd@lists.infradead.org;
	Wed, 18 Oct 2023 11:07:12 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39I5OKGP015238;
	Wed, 18 Oct 2023 11:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0ZZzJrMCnz11NTdj9q9mswUtohFFrY5CF+zPZe52VIs=;
 b=gCFwccLFIswHHl1Sj3+btNYVqhsEbgbMZAAOPT5t6tfxu9NjWkJQcAPSfAN82MyLXodw
 cEl5tOijGnh7u84/gmkf5C6QbDPxBi8Dlxs1udgzGuhZQoQDyORsQ7F5qTNSG4vXiQGs
 oZDgzPCTVFyPfyMaLxVSnRfhIuul9dkUHTKs9WQV2bNjZYEvLSmFBA5kAUMEufj8uPJH
 xxFyhbQZmxWDW6Xz+713nYr2B496yQajZuX1J3ndVCOaxslcNFDAi7w7ESEUe9FlZU/4
 LuNpjiJ7H9ED6w42g089w+b/wu7Tj2EMYjlBbDdzZWO3i2XfB4QXPBuDlt2HNiGrAk4r /w== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tt8xs8reb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 11:07:01 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39IB70dk010040
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 11:07:00 GMT
Received: from [10.201.3.104] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 18 Oct
 2023 04:06:57 -0700
Message-ID: <c489e1d8-e621-df30-f424-b6dfaddbd6b7@quicinc.com>
Date: Wed, 18 Oct 2023 16:36:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] mtd: spi-nor: Ensure operation completion before shutdown
To: Michael Walle <michael@walle.cc>
CC: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20231012055148.2445303-1-quic_mdalam@quicinc.com>
 <bb12db1205a5d1bfbee341d23defe0be@walle.cc>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <bb12db1205a5d1bfbee341d23defe0be@walle.cc>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RErKqp0_q_2ZBcl3Ksvz8nysHFS2zX1J
X-Proofpoint-ORIG-GUID: RErKqp0_q_2ZBcl3Ksvz8nysHFS2zX1J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-18_09,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=696 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310180092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_040710_731152_6892646D 
X-CRM114-Status: GOOD (  16.91  )
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

CgpPbiAxMC8xMi8yMDIzIDI6NDEgUE0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4gSGksCj4gCj4g
QW0gMjAyMy0xMC0xMiAwNzo1MSwgc2NocmllYiBNZCBTYWRyZSBBbGFtOgo+PiBFbnN1cmUgdGhh
dCB0aGVyZSBhcmUgbm8gcGVuZGluZyBzcGkgb3BlcmF0aW9uIGlucHJvZ3Jlc3MKPj4gd2hlbiBz
eXN0ZW0gaGFsdHMuCj4gCj4gV2hhdCBvcGVyYXRpb24gbWlnaHQgYmUgaW4gcHJvZ3Jlc3MgaGVy
ZT8gRGlkIHlvdSBlbmNvdW50ZXIgc29tZSBwcm9ibGVtcz8KPiBQbGVhc2UgZXhwbGFpbiBpdCBp
biBtb3JlIGRldGFpbCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCj4gCj4gRml4ZXMgdGFnPwoKICAg
V2UgaGF2ZSBmYWNlZCBpc3N1ZSB3aGlsZSBkb2luZyBub3IgZmxhc2ggcmVhZC93cml0ZSB0ZXN0
IHdpdGggc3BlY2lmaWMgbm9yIHBhcnQuCiAgIFdpbGwgY2hlY2sgb25jZSBhZ2FpbiB3aXRoIHRo
ZSBzYW1lIHBhcnQgYW5kIHBvc3QgbmV3IHBhdGNoLgo+IAo+IC1taWNoYWVsCj4gCj4+IFNpZ25l
ZC1vZmYtYnk6IE1kIFNhZHJlIEFsYW0gPHF1aWNfbWRhbGFtQHF1aWNpbmMuY29tPgo+PiAtLS0K
Pj4gwqBkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyB8IDMgKysrCj4+IMKgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5v
ci9jb3JlLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+PiBpbmRleCAxYzQ0M2ZlNTY4
Y2YuLmFkYzRkMmM2ODY5NSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3Jl
LmMKPj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPj4gQEAgLTM2OTAsNiArMzY5
MCw5IEBAIHN0YXRpYyB2b2lkIHNwaV9ub3Jfc2h1dGRvd24oc3RydWN0IHNwaV9tZW0gKnNwaW1l
bSkKPj4gwqB7Cj4+IMKgwqDCoMKgIHN0cnVjdCBzcGlfbm9yICpub3IgPSBzcGlfbWVtX2dldF9k
cnZkYXRhKHNwaW1lbSk7Cj4+Cj4+ICvCoMKgwqAgLyogRW5zdXJlIG5vIHBlbmRpbmcgc3BpIG9w
ZXJhdGlvbiBpbiBwcm9ncmVzcyAqLwo+PiArwqDCoMKgIHNwaV9ub3Jfd2FpdF90aWxsX3JlYWR5
KG5vcik7Cj4+ICsKPj4gwqDCoMKgwqAgc3BpX25vcl9yZXN0b3JlKG5vcik7Cj4+IMKgfQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
