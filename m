Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A4DC0218C
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2025 06:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pYzIOvzKmmaUz5isqQY7gE5bzP5GvqkO8idvyKga55M=; b=SCgRaM/IiIzZe4
	bRRbDJZmFgtpa80Ja+IsRrWReZHhILam7Ph3AeoGpj6Noxz0nUdz7SQO3pIupZz4DQ0kMhgX86b7v
	WbKE8G3dO9kylb6IY/5FUVJwHfpfWuu3zpAblRaylxqqOabkB7a9lI5TB2xcahap9dU+bP/a3/ffT
	kWo9ziIBfd6sFPC0ou8I7Vy2dwmNtW7V09Ey5Ui8k2YXfKdl8gny5IYUiJFy2X9PW0FPDKKM3ui87
	KhMQmvZa5w0eSAX5SjPnVc3uFO+QnsJaVRypsiS1LnMI3EJrkZY4o+s3ws2/Eg/W9+Lifp+jP3VxH
	uhRLDZIyXVZjJGJCBuoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcIvK-00000001kWM-3J0x;
	Mon, 27 Jan 2025 06:48:42 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcIvI-00000001kVm-15xN
	for linux-mtd@lists.infradead.org;
	Mon, 27 Jan 2025 06:48:41 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50R6malS1786169
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jan 2025 00:48:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737960516;
	bh=LxlSf1KubBBxPFHvLQTtf9GitcBXQZRja8ie9ZtPl6I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ggCLe3fgn8OQyLT6gWlxR+NidD/XzTvSUjmJWRi8dxxB023zDWC5X85/p6RDOLoO/
	 ko/i0cKmKYDUqfbfHH5/7YM4YGG9K/VVgl4zJok7gwnKFhwAE/0xGfb1Eiv9ARzCzz
	 cpuwxy/nw8SiLvvbNXiBbuf+sNLWKklR66z73t6M=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50R6mapX063564
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jan 2025 00:48:36 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 27
 Jan 2025 00:48:36 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 27 Jan 2025 00:48:36 -0600
Received: from [172.24.227.241] (santhoshkumark.dhcp.ti.com [172.24.227.241])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50R6mSdc074357;
	Mon, 27 Jan 2025 00:48:33 -0600
Message-ID: <ff477be2-0ee3-400e-9cbb-316d63f31d21@ti.com>
Date: Mon, 27 Jan 2025 12:18:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mtd: spinand: winbond: Fix oob_layout for W25N01JW
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <quic_sridsn@quicinc.com>,
        <quic_mdalam@quicinc.com>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <p-mantena@ti.com>, <s-k6@ti.com>
References: <20250102115110.1402440-1-s-k6@ti.com>
 <20250102115110.1402440-4-s-k6@ti.com> <87r053lwg1.fsf@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <87r053lwg1.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_224840_347202_7CB7875F 
X-CRM114-Status: GOOD (  10.72  )
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

SGVsbG8sIE1pcXVlbCwKCk9uIDE2LzAxLzI1IDAwOjQ2LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
IEhlbGxvIFNhbnRob3NoLAo+IAo+IE9uIDAyLzAxLzIwMjUgYXQgMTc6MjE6MTAgKzA1MzAsIFNh
bnRob3NoIEt1bWFyIEsgPHMtazZAdGkuY29tPiB3cm90ZToKPiAKPj4gRml4IHRoZSBXMjVOMDFK
VydzIG9vYl9sYXlvdXQgYWNjb3JkaW5nIHRvIHRoZSBkYXRhc2hlZXQuIFsxXQo+Pgo+PiBbMV0g
aHR0cHM6Ly93d3cud2luYm9uZC5jb20vaHEvcHJvZHVjdC9jb2RlLXN0b3JhZ2UtZmxhc2gtbWVt
b3J5L3FzcGluYW5kLWZsYXNoLz9fX2xvY2FsZT1lbiZwYXJ0Tm89VzI1TjAxSlcKPj4KPj4gRml4
ZXM6IDZhODA0ZmI3MmRlNSAoIm10ZDogc3BpbmFuZDogd2luYm9uZDogYWRkIHN1cHBvcnQgZm9y
IHNlcmlhbCBOQU5EIGZsYXNoIikKPj4gQ0M6IFNyaWRoYXJhbiBTIE4gPHF1aWNfc3JpZHNuQHF1
aWNpbmMuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBTYW50aG9zaCBLdW1hciBLIDxzLWs2QHRpLmNv
bT4KPiAKPiBUaGVyZSBoYXZlIGJlZW4gY2hhbmdlcyBpbiB0aGlzIGRyaXZlciwgSSdkIHN1Z2dl
c3QgdG8gcmViYXNlIHlvdXIgd29yawo+IG9uY2UgLXJjMSBpcyBvdXQuCj4gCj4gQWxzbywgUGxl
YXNlIGFkZCBDYzogc3RhYmxlIGluIGNvcHkgYW5kIGVpdGhlciBtb3ZlIHRoaXMgcGF0Y2ggZmly
c3QgaW4KPiB0aGUgc2VyaWVzLCBvciBldmVuIGRldGFjaCBpdCBiZWNhdXNlIGl0IGhhcyBsaXR0
bGUgdG8gZG8gd2l0aCB0aGUgdHdvCj4gb3RoZXIgcGF0Y2hlcy4KCkdvdCBpdCwgSSdsbCBkZXRh
Y2ggdGhpcyBvbmUuCgpSZWdhcmRzLApTYW50aG9zaC4KCj4gCj4gVGhhbmtzIQo+IE1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
