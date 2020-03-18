Return-Path: <SRS0=w4g4=5D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA860C5ACD7
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 08:21:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7EE02076D
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2020 08:21:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RJLeq+MP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7EE02076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kioxia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W1QhzN7syc644jeXTdEtEpEc6OADY9LNdxFPwHuHFws=; b=RJLeq+MPUQKeNfdZmEJSv9ERL
	eh0qOq8PMqy6jY1piDzNXeoz+dJ/rebGwvkfgxje3If7NExYZ24tcqcrsV6/FIY4O1cf6Gox1iGa5
	mU13fPXfbPuTxLGL+vqsNZrOlIelp9Ok07rlwkK8uN6Y5XtjI+iRDlSZTtKbkycFzykPhljZJpibG
	2qkvmedwSHNozrrW7a+ltZMlALjK1pLmK1EhJ+12aLK3KViyuJcGxjGOb8I2CT7WSlTIK6M/0Xpu/
	+5AawGZHvTC+YbVcKZpmZ2B+j/ZQOLpbsm37iQ+xXVP5zuLJsUKY3pFDLGh5DEPMuN9ykIke+mosO
	wIdkQZ/Tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jETxB-0002Cp-HT; Wed, 18 Mar 2020 08:21:29 +0000
Received: from mo-csw1115.securemx.jp ([210.130.202.157]
 helo=mo-csw.securemx.jp)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jETx7-0002Bv-4l
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2020 08:21:27 +0000
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 02I8L2fm010762;
 Wed, 18 Mar 2020 17:21:02 +0900
X-Iguazu-Qid: 2wHI1scKEP6Un1aFpV
X-Iguazu-QSIG: v=2; s=0; t=1584519662; q=2wHI1scKEP6Un1aFpV;
 m=tYEeYQOfbv0NS8WQPefQvNX9sqJ7svQnh+4MDaVVJEk=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
 by relay.securemx.jp (mx-mr1113) id 02I8L0Dp028359;
 Wed, 18 Mar 2020 17:21:01 +0900
Received: from enc01.localdomain ([106.186.93.100])
 by imx2.toshiba.co.jp  with ESMTP id 02I8bJ4b003726;
 Wed, 18 Mar 2020 17:37:19 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
 by enc01.localdomain  with ESMTP id 02I8L0KQ016170;
 Wed, 18 Mar 2020 17:21:00 +0900
Subject: Re: [PATCH v4 0/2] mtd: spinand: toshiba: Support for new Kioxia
 Serial NAND
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <cover.1583834323.git.ytc-mb-yfuruyama7@kioxia.com>
 <20200311165011.63a3d82e@xps13>
From: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
X-TSB-HOP: ON
Message-ID: <42e02e2c-ee61-1b0d-5d8e-3a512c042151@kioxia.com>
Date: Wed, 18 Mar 2020 14:40:47 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200311165011.63a3d82e@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_012125_460794_BB7B5150 
X-CRM114-Status: GOOD (  14.49  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjAvMDMvMTIgMDo1MCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBZb3NoaW8sCj4K
PiBZb3NoaW8gRnVydXlhbWEgPHl0Yy1tYi15ZnVydXlhbWE3QGtpb3hpYS5jb20+IHdyb3RlIG9u
IFdlZCwgMTEgTWFyCj4gMjAyMCAxMDo0NzowNCArMDkwMDoKPgo+PiBGaXJzdCBwYXRjaCBpcyB0
byByZW5hbWUgZnVuY3Rpb24gbmFtZSBiZWNhc2Ugb2YgYWRkIG5ldyBkZXZpY2UuCj4+IFNlY29u
ZCBwYXRjaCBpcyB0byBzdXBwcm90IGZvciBuZXcgZGV2aWNlLgo+Pgo+PiBZb3NoaW8gRnVydXlh
bWEgKDIpOgo+PiAgICBtdGQ6IHNwaW5hbmQ6IHRvc2hpYmE6IFJlbmFtZSBmdW5jdGlvbiBuYW1l
IHRvIGNoYW5nZSBzdWZmaXggYW5kCj4+ICAgICAgcHJlZml4ICg4R2JpdCkKPj4gICAgbXRkOiBz
cGluYW5kOiB0b3NoaWJhOiBTdXBwb3J0IGZvciBuZXcgS2lveGlhIFNlcmlhbCBOQU5ECj4+Cj4+
ICAgZHJpdmVycy9tdGQvbmFuZC9zcGkvdG9zaGliYS5jIHwgMTczICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEzMCBpbnNlcnRp
b25zKCspLCA0MyBkZWxldGlvbnMoLSkKPj4KPiBJIGFtIHZlcnkgc29ycnkgYnV0IGFjdHVhbGx5
IEkgaGFkIGlzc3VlcyBhcHBseWluZyBhbGwgeW91ciBwYXRjaGVzIG5vdAo+IGJlY2F1c2UgdGhl
eSB3ZXJlIG5vdCBiYXNlZCBvbiB2NS42LXJjMSwgYnV0IGJlY2F1c2Ugc2luY2UgdGhlbiBJCj4g
YXBwbGllZCBhIHBhdGNoIGNoYW5naW5nIHRoZSBkZXRlY3Rpb24gdGhhdCBjaGFuZ2VkIHRoZSBj
b250ZW50IG9mIGEKPiBsb3Qgb2Ygc3RydWN0dXJlcyAoaW5jbHVkaW5nIGluIFRvc2hpYmEncyBk
cml2ZXIpLgo+Cj4gQ2FuIHlvdSBwbGVhc2UgcmViYXNlIGFnYWluIG9uIHRvcCBvZiB0aGUgY3Vy
cmVudCBuYW5kL25leHQ/IEkgYW0gdmVyeQo+IHNvcnJ5IGZvciB0aGlzIGV4dHJhIHdvcmssIHRo
aXMgaXMgbXkgbWlzdGFrZS4KClRoYW5rcyBjb21tZW50LiDCoCDCoCDCoCDCoCBJIHdpbGwgcmV2
aXNlIHJldiAoVjUpIG5leHQgd2Vlay4KCkJSCgo+IEhlYWQgc2hvdWxkIGJlOgo+Cj4gCWE1ZDUz
YWQyNmE4YiAoIm10ZDogcmF3bmFuZDogYnJjbW5hbmQ6IEFkZCBzdXBwb3J0IGZvciBmbGFzaC1l
ZHUgZm9yIGRtYSB0cmFuc2ZlcnMiKQo+Cj4gQW5kIHRoZSBjdWxwcml0IGNvbW1pdCBpczoKPgo+
IAlmMTU0MTc3M2FmNDkgKCJtdGQ6IHNwaW5hbmQ6IHJld29yayBkZXRlY3QgcHJvY2VkdXJlIGZv
ciBkaWZmZXJlbnQgUkVBRF9JRCBvcGVyYXRpb24iKQo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKPgo+
Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
