Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78255C0218F
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2025 06:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WzXbjwmf6dc7nn7b459almHzLOlnoKeybZuvrIr/2oM=; b=irLGJ3kDsttXW2
	baUJR5AcRpdBhCNaj6+5FuIagjPt079i+OoTC1zpJlTIMQd4ROB/5Yr2dHRnv7hOtppmtyQC+RrnE
	igrvorHbUQ8J0095T7VfzXHFgtJIT2/CS9cPlkjtkKR8gFMCBncve3FImLj6VGMSiEYNBWw6OSAWX
	XypPXn9QuJ59HNed42wlu+/miP/RBqqTmobCrU3an8c5slYTndXfmPfiu5ThXc2OqgNxwpr619O7V
	I4HtWoTzj/a3fKr8d/rez9yYgxFm5oC15t0vd5ESRQMnXceltzQ2GSoJv/IT80eBCqZzTH7WWDS1s
	3jDcGI6Xrx/CTh0usAVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcIvI-00000001kVt-1F3U;
	Mon, 27 Jan 2025 06:48:40 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcIvG-00000001kVV-1hLv
	for linux-mtd@lists.infradead.org;
	Mon, 27 Jan 2025 06:48:39 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50R6mWNr965975
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jan 2025 00:48:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737960512;
	bh=HSh+0bb0UN8kln0r6zqRtG5yft8h1j/jvEnw6M9tNyc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=c/juxLc/A4+sonzNDLiGoGrM/ZlYT3UvasFYqPZELV1ebpsqDdvz3D/iyGthzG8nK
	 THE2hHXgbOkO5Lynm1sU/gxs8+yRuBJsURWjVAERAkGBhz9zxG5twNwia6n6+3rEQ3
	 lHTbfD0F9ItBFMks9tGSGD7WEsJFvbNfzyeFSNuI=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50R6mWkZ057778
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jan 2025 00:48:32 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 27
 Jan 2025 00:48:31 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 27 Jan 2025 00:48:31 -0600
Received: from [172.24.227.241] (santhoshkumark.dhcp.ti.com [172.24.227.241])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50R6mSdb074357;
	Mon, 27 Jan 2025 00:48:29 -0600
Message-ID: <dab27fe4-a517-4042-8fb5-25770c173486@ti.com>
Date: Mon, 27 Jan 2025 12:18:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mtd: spinand: Define OctalIO ops
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <quic_sridsn@quicinc.com>,
        <quic_mdalam@quicinc.com>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <p-mantena@ti.com>, <s-k6@ti.com>
References: <20250102115110.1402440-1-s-k6@ti.com>
 <20250102115110.1402440-2-s-k6@ti.com> <87a5brlwa3.fsf@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <87a5brlwa3.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_224838_499304_21033235 
X-CRM114-Status: GOOD (  14.20  )
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

SGVsbG8sIE1pcXVlbCwKCk9uIDE2LzAxLzI1IDAwOjQ5LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
IEhlbGxvIFNhbnRob3NoLAo+IAo+IE9uIDAyLzAxLzIwMjUgYXQgMTc6MjE6MDggKzA1MzAsIFNh
bnRob3NoIEt1bWFyIEsgPHMtazZAdGkuY29tPiB3cm90ZToKPiAKPj4gRGVmaW5lIHRoZSBtYWNy
b3MgZm9yIE9jdGFsLWJhc2VkIHJlYWQgYW5kIGxvYWQgb3BlcmF0aW9ucyBvbiBPU1BJCj4+IE5B
TkQgZmxhc2hlcy4KPiAKPiBGb2xsb3dpbmcgYSByZWNlbnQgZGlzY3Vzc2lvbiB3aXRoIHRoZSBT
UEktTk9SIG1haW50YWluZXJzLCBJIHBsYW4gb24KPiByZW5hbWluZyBzb21lIG9mIHRoZXNlIG1h
Y3JvcyB0byBtYWtlIHRoZW0gbW9yZSBjbGVhciByZWdhcmRpbmcgd2hhdAo+IHRoZXkgZG8uIFRo
ZXJlIGFyZSBtYW55IHdheXMgdG8gZG8gb2N0YWwgdHJhbnNmZXJzIChkYXRhIG9ubHksIGFkZHJl
c3MKPiBhbmQgZGF0YSwgYWxsIGN5Y2xlcywgc2RyIHZzIGR0ci4uLikgYW5kIHdlIHdhbnQgdG8g
Y2xhcmlmeSB0aGF0Lgo+IAo+IEFsc28sIEkgYmVsaWV2ZSB0aGVyZSBhcmUgZnJlcXVlbmN5IGxp
bWl0YXRpb25zIHdoaWNoIGFyZSBub3QgY29ycmVjdGx5Cj4gZGVjbGFyZWQgYW5kIHBvc3NpYmx5
IHNvbWUgaXNzdWVzIHdpdGggdGhlIGR1bW15IGN5Y2xlcyB3aGljaCBuZWVkIHRvIGJlCj4gY2xh
cmlmaWVkLCBlc3BlY2lhbGx5IGluIHRoZSBXaW5ib25kIGRyaXZlci4KPiAKPiBJIHBsYW4gb24g
d29ya2luZyBvbiB0aGlzIGluIHRoZSBuZXh0IHdlZWtzLCBvbmNlIG15IGhlYWQgaXMgY2xlYXIg
YWJvdXQKPiB0aGUgc3BlY2lmaWNpdGllcyB3aXRoIHRoZXNlIGNoaXBzLiBJIHdpbGwgYWRkIHlv
dSBpbiBDYy4KClNvdW5kcyBnb29kISEKClJlZ2FyZHMsClNhbnRob3NoLgoKPiAKPiBDaGVlcnMs
Cj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
