Return-Path: <SRS0=gt70=JF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF61C433ED
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 13:27:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0951261107
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 13:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0951261107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5ja2foakADKnmgLZmBn2OlUE0QlTL36JJT23o6SeYXU=; b=Pbya59BezDTFpw/wHphRx/78i
	/p4okBtRKa3uGZXfz10unseefLNLuVtH9LhLsFq6kiTMlD9CS4nofrnNpkOAZJUV/tZnNsMxn9FnR
	fP5WDmEosgyx6tzk6zozkyQOUBxVZyUmyhR7wZXbcdF3V+Sk0ebQABePm8shrNa4ifh2rS55Ug5R0
	GkmSSyyjK1+sqgVFUY1PkHbMPG8g7nr+vmxnGZE7VvY6l4c+r37LOzLndo2iYQQvuDmu2i+LAiCpW
	clsHvuaxKMFcreuHqYm5BK8QTS/JmgWlPxFQVyN17PKYINBG3+UXrmoW8vzM0tvuapQHHUv715ZLf
	7MlJQP8yw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUUgA-0087WA-6R; Thu, 08 Apr 2021 13:26:38 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUUfv-0087Sq-Mm; Thu, 08 Apr 2021 13:26:25 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGMQp1WjJzpWXF;
 Thu,  8 Apr 2021 21:23:30 +0800 (CST)
Received: from [10.174.179.129] (10.174.179.129) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 21:26:10 +0800
Subject: Re: [PATCH 3/3] mtd: phram: Fix error return code in phram_setup()
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <joern@lazybastard.org>, <richard@nod.at>, <vigneshr@ti.com>,
 <matthias.bgg@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <yi.zhang@huawei.com>
References: <20210408111514.1011020-1-yukuai3@huawei.com>
 <20210408111514.1011020-4-yukuai3@huawei.com> <20210408144610.0c0686ae@xps13>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <cc02de9c-6315-3fa6-4b0a-4287b2713484@huawei.com>
Date: Thu, 8 Apr 2021 21:26:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210408144610.0c0686ae@xps13>
X-Originating-IP: [10.174.179.129]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_142624_027895_A9D69353 
X-CRM114-Status: GOOD (  12.62  )
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

T24gMjAyMS8wNC8wOCAyMDo0NiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBZdSwKPiAKPiBZ
dSBLdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+IHdyb3RlIG9uIFRodSwgOCBBcHIgMjAyMSAxOTox
NToxNCArMDgwMDoKPiAKPj4gRml4IHRvIHJldHVybiBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgZnJv
bSB0aGUgZXJyb3IgaGFuZGxpbmcKPj4gY2FzZSBpbnN0ZWFkIG9mIDAsIGFzIGRvbmUgZWxzZXdo
ZXJlIGluIHRoaXMgZnVuY3Rpb24uCj4+Cj4+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxr
Y2lAaHVhd2VpLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogWXUgS3VhaSA8eXVrdWFpM0BodWF3ZWku
Y29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL210ZC9kZXZpY2VzL3BocmFtLmMgfCAxICsKPj4gICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL2RldmljZXMvcGhyYW0uYyBiL2RyaXZlcnMvbXRkL2RldmljZXMvcGhyYW0uYwo+PiBpbmRl
eCA1YjA0YWU2YzMwNTcuLjZlZDZjNTFmYWM2OSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQv
ZGV2aWNlcy9waHJhbS5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL2RldmljZXMvcGhyYW0uYwo+PiBA
QCAtMjcwLDYgKzI3MCw3IEBAIHN0YXRpYyBpbnQgcGhyYW1fc2V0dXAoY29uc3QgY2hhciAqdmFs
KQo+PiAgIAlpZiAobGVuID09IDAgfHwgZXJhc2VzaXplID09IDAgfHwgZXJhc2VzaXplID4gbGVu
Cj4+ICAgCSAgICB8fCBlcmFzZXNpemUgPiBVSU5UX01BWCB8fCByZW0pIHsKPj4gICAJCXBhcnNl
X2VycigiaWxsZWdhbCBlcmFzZXNpemUgb3IgbGVuXG4iKTsKPj4gKwkJcmV0ID0gLUVJTlZBTDsK
Pj4gICAJCWdvdG8gZXJyb3I7Cj4+ICAgCX0KPj4gICAKPiAKPiBJdCBsb29rcyBsaWtlIHlvdSdy
ZSBkb2luZyB0aGUgb3Bwb3NpdGUgb2Ygd2hhdCB5b3Ugc2F5Lgo+IApIaSwKCnNvcnJ5IGFib3V0
IHRoYXQsIEkgbWlzdW5kZXJzdG9vZCAnZml4IHRvJy4KClRoYW5rcwpZdSBLdWFpCj4gVGhhbmtz
LAo+IE1pcXXDqGwKPiAuCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
