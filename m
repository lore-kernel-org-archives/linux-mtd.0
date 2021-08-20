Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E040DC4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 13:15:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A180F61130
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 13:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A180F61130
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVEfjeha95Kzm13+Ps3GdL1rE3fANhcxpVogxhdw89s=; b=W/kuArPbPisjfEYhkhWj4XjaMZ
	wrg7xTaT3fy6FR6rBkNNAnBKcF6EXJSo+4abUfpO9pLYvzJ1mf4Lhom4typq7+Hm+mVeF0xeH0ypD
	cFU4/DkJlDqFBDohh7394J1nxVk2Tp2wCVG3uPWGOUek6KtA4JsrIOuASlDoOgrX4MAW8GpntlXIq
	YP6n0/IZpXEtSk/nFeZrJVDZ9ZIzQRdi4wZDKY0ZKt9ktNvUVK5IVF3+gsCTvN9aG3RE2n0PyHNyP
	UHgNB9LdR9/BCTeVtHUm/Z3i2bIfwpr8fI2L+1iPo1iu3Kl1oB1Xto5DxSk2Fh84vghcEz2n/mRsA
	mA+wbkug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH4MG-00BFbk-FD; Fri, 20 Aug 2021 13:14:52 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH4MA-00BFaL-B5
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 13:14:50 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17KDEabO079205;
 Fri, 20 Aug 2021 08:14:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629465276;
 bh=zjV2VV/W/R/LlnVIjGzbmQRZCHArbsyZBGSViRrmZLY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=nvbK7Sln3P6qZvNkZSrpRqy0ZeCZEa+Mw7g3tXLqpHoen6tzx1nishrOL3dlg99yr
 3CVhsqLYPg9xsJ3NM6AAmDOrdrrNJZlMH+wv3kQKf+HyaL9m2sInEK796AvMCmkIXJ
 qxU9JjBM4E2qk8zeGIvHLunusHBRtgiyNgGMVG/Y=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17KDEaQr109892
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 20 Aug 2021 08:14:36 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 20
 Aug 2021 08:14:36 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 20 Aug 2021 08:14:35 -0500
Received: from [10.250.232.95] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17KDEV4o056759;
 Fri, 20 Aug 2021 08:14:32 -0500
Subject: Re: [PATCH 13/13] mtd: spinand: Add support for Winbond W35N01JW SPI
 NAND flash
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, Pratyush Yadav <p.yadav@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-14-a-nandan@ti.com> <20210806211423.5c9d3e96@xps13>
 <64f130dc-1d87-5657-ae93-09bfdb7e93a1@ti.com> <20210820140210.47d348dc@xps13>
From: Apurva Nandan <a-nandan@ti.com>
Message-ID: <949d3af1-1513-e606-bc9e-7265cbf97e58@ti.com>
Date: Fri, 20 Aug 2021 18:44:30 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820140210.47d348dc@xps13>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_061446_552745_1EC65E47 
X-CRM114-Status: GOOD (  15.18  )
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

CgpPbiAyMC8wOC8yMSA1OjMyIHBtLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFwdXJ2YSwK
PiAKPiBBcHVydmEgTmFuZGFuIDxhLW5hbmRhbkB0aS5jb20+IHdyb3RlIG9uIEZyaSwgMjAgQXVn
IDIwMjEgMTc6MjE6MzMKPiArMDUzMDoKPiAKPj4gSGkgTWlxdcOobCwKPj4KPj4gT24gMDcvMDgv
MjEgMTI6NDQgYW0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+PiBIaSBBcHVydmEsCj4+Pgo+Pj4g
QXB1cnZhIE5hbmRhbiA8YS1uYW5kYW5AdGkuY29tPiB3cm90ZSBvbiBUdWUsIDEzIEp1bCAyMDIx
IDEzOjA1OjM4Cj4+PiArMDAwMDoKPj4+ICAgIAo+Pj4+IFdpbmJvbmQgVzM1TjAxSlcgaXMgU1BJ
IE5BTkQgZmxhc2ggc3VwcG9ydGluZyBPY3RhbCBEVFIgU1BJIHByb3RvY29sLgo+Pj4KPj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgYQo+Pj4gICAgCj4+Pj4gQWRkIG9wX3ZhaXJhbnRzIGZvciBX
MzVOMDFKVywgd2hpY2ggaW5jbHVkZSB0aGUgT2N0YWwgRFRSIHJlYWQvd3JpdGUKPj4+Cj4+PiB2
YXJpYW50cwo+Pj4gICAgCj4+Pj4gcGFnZSBvcHMgYXMgd2VsbC4gQWRkIFczNU4wMUpXJ3Mgb29i
IGxheW91dCBmdW5jdGlvbnMgZm9yIHRoZQo+Pj4KPj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBPT0IKPj4+ICAgIAo+Pgo+PiBPa2F5LCB3aWxsIGNvcnJlY3QgdGhlc2Uu
Cj4+Cj4+Pj4gbXRkX29vYmxheW91dF9vcHMuIEFkZCBhbGwgb3AgYWRqdXN0bWVudHMgcmVxdWly
ZWQgZm9yIE9jdGFsIERUUiBTUEkKPj4+PiBtb2RlIHVzaW5nIHRoZSBhZGp1c3Rfb3AoKS4gRmlu
YWxseSwgYWRkIGFuIGVudHJ5IGZvciBXMzVOMDFKVyBpbgo+Pj4+IHNwaW5hbmRfaW5mbyB0YWJs
ZS4KPj4+Pgo+Pj4+IERhdGFzaGVldDogaHR0cHM6Ly93d3cud2luYm9uZC5jb20vZXhwb3J0L3Np
dGVzL3dpbmJvbmQvZGF0YXNoZWV0L1czNU4wMUpXX0RhdGFzaGVldF9CcmllZi5wZGYKPj4+PiAg
IAo+Pj4KPj4+IE1heWJlIHdlIGNhbiBzcGxpdCB0aGlzIGludG8gdHdvIHBhcnRzOgo+Pj4gMS8g
c3VwcG9ydCB0aGUgY2hpcAo+Pj4gMi8gYWRkIDgtRCBzdXBwb3J0Cj4+PiAgICAKPj4KPj4gSSBj
YW4gc3BsaXQgdGhlIHBhdGNoIGludG86Cj4+IDEvIEFkZCBpbXBsZW1lbnRhdGlvbiBvZiBtYW51
ZmFjdHVyZXJfb3BzOiBhZGp1c3Rfb3AoKSB0byBoYW5kbGUgdmFyaWF0aW9ucyBvZiBvcHMgaW4g
OEQtOEQtOEQgbW9kZQo+PiAyLyBBZGQgc3VwcG9ydC9lbnRyeSBmb3IgV2luYm9uZCBXMzVOMDFK
VyBTUEkgTkFORCBmbGFzaCBjaGlwCj4+Cj4+IEFzIDgtRCBzdXBwb3J0IGhhcyBhbHJlYWR5IGJl
ZW4gYWRkZWQgaW4gYSBwcmV2aW91cyBwYXRjaC4KPiAKPiBJIGFsc28gZG9uJ3Qgd2FudCB0aGUg
cmVuYW1pbmcgdG8gaGFwcGVuIGluIHRoZSBwYXRjaCBhZGRpbmcgbW9yZQo+IGxvZ2ljLgo+IAoK
T2theSwgZ290IGl0LiBXaWxsIGFtZW5kIHRoaXMuCgo+IFRoYW5rcywKPiBNaXF1w6hsCj4gCgpU
aGFua3MsCkFwdXJ2YSBOYW5kYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
