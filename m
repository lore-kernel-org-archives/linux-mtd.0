Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC918C55199
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 17:18:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEED320728
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 17:18:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HzcTfhX7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEED320728
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+jAfbWXg9D2R49auC4oU80CeMCgrX08aYLlrZIRlN7w=; b=HzcTfhX7OuwCug
	6nygGJ60VRoYxRaYLyq4RyDXtRNYXxnI4kMzje6dkG7/HciWheqg80mPr387daBS7bLZVlX7CwFAc
	9PJ14/otK1YgQbgIfpibRrzKn3Ohw5uUxPD9de+b+s0GpbmpN9MA3ZnIIIQSZMINxAYD31lRnCu/Y
	G3RLYy3KOAWiDZAjoxZvqQloRh7iZCLoovy1tq0iuc1OwVv9SCoBWi6JSDPAg9CXJT1siZsx5pNq2
	khxdd3pE2hCXQLEPgZM0OzDGxO1MBHmVQ+kHxDHy0b3KKPkkxSaT/KYBtnO+jFeTkPjP7XGCT8z5f
	n2qcyutkTzmT1Zw0YCOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT7On-00069j-7p; Mon, 27 Apr 2020 17:18:29 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT7Oc-0005y3-6F
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 17:18:19 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 35813240003;
 Mon, 27 Apr 2020 17:18:12 +0000 (UTC)
Date: Mon, 27 Apr 2020 19:18:11 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 5/9] mtd: rawnand: bcm47xx: Implement the exec_op()
 interface
Message-ID: <20200427191811.3f32cebc@xps13>
In-Reply-To: <20200419125140.1307309-6-boris.brezillon@collabora.com>
References: <20200419125140.1307309-1-boris.brezillon@collabora.com>
 <20200419125140.1307309-6-boris.brezillon@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_101818_501382_52B230FB 
X-CRM114-Status: GOOD (  23.28  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-mtd@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 bcm-kernel-feedback-list@broadcom.com, openwrt-devel@lists.openwrt.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBTdW4sIDE5IEFwcgoyMDIwIDE0OjUxOjM2ICswMjAwOgoKPiBJbXBsZW1lbnQg
dGhlIGV4ZWNfb3AoKSBpbnRlcmZhY2Ugc28gd2UgY2FuIGdldCByaWQgb2YgdGhlIGNvbnZvbHV0
ZWQKPiBjbWRmdW5jKCkgaW1wbGVtZW50YXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogQm9yaXMg
QnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiAtLS0KPiBUaGlzIGlz
IGJhc2VkIG9uIG15IHVuZGVyc3RhbmRpbmcgb2YgaG93IHRoaXMgY29udHJvbGxlciB3b3Jrcywg
YW5kIEkKPiB0aGluayBpdCBjb3ZlcnMgYWxsIHRoZSB1c2UgY2FzZXMgY292ZXJlZCBieSB0aGUg
Y3VzdG9tIGNtZGZ1bmMoKQo+IGltcGxlbWVudGF0aW9uLiBJIG1pZ2h0IGJlIHdyb25nIG9mIGNv
dXJzZSwgc28gaXQnZCBiZSBncmVhdCB0byBoYXZlCj4gc29tZW9uZSB0ZXN0IG9uIHJlYWwgSFcu
Cj4gLS0tCj4gIC4uLi9uYW5kL3Jhdy9iY200N3h4bmZsYXNoL2JjbTQ3eHhuZmxhc2guaCAgICB8
ICAgMSArCj4gIC4uLi9tdGQvbmFuZC9yYXcvYmNtNDd4eG5mbGFzaC9vcHNfYmNtNDcwNi5jICB8
IDE1MCArKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNTEgaW5zZXJ0aW9u
cygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9iY200N3h4bmZsYXNo
L2JjbTQ3eHhuZmxhc2guaCBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JjbTQ3eHhuZmxhc2gvYmNt
NDd4eG5mbGFzaC5oCj4gaW5kZXggMjAxYjliYWE1MmEwLi4wMGQwOTc0YjczY2IgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYmNtNDd4eG5mbGFzaC9iY200N3h4bmZsYXNoLmgK
PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9iY200N3h4bmZsYXNoL2JjbTQ3eHhuZmxhc2gu
aAo+IEBAIC0xMCw2ICsxMCw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9tdGQvcmF3bmFuZC5oPgo+
ICAKPiAgc3RydWN0IGJjbTQ3eHhuZmxhc2ggewo+ICsJc3RydWN0IG5hbmRfY29udHJvbGxlciBi
YXNlOwo+ICAJc3RydWN0IGJjbWFfZHJ2X2NjICpjYzsKPiAgCj4gIAlzdHJ1Y3QgbmFuZF9jaGlw
IG5hbmRfY2hpcDsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYmNtNDd4eG5m
bGFzaC9vcHNfYmNtNDcwNi5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYmNtNDd4eG5mbGFzaC9v
cHNfYmNtNDcwNi5jCj4gaW5kZXggZmJiN2FjZWJjOGY3Li4xODRmNzhiM2Q0NWEgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYmNtNDd4eG5mbGFzaC9vcHNfYmNtNDcwNi5jCj4g
KysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYmNtNDd4eG5mbGFzaC9vcHNfYmNtNDcwNi5jCj4g
QEAgLTM4Miw2ICszODIsMTUzIEBAIHN0YXRpYyB2b2lkIGJjbTQ3eHhuZmxhc2hfb3BzX2JjbTQ3
MDZfd3JpdGVfYnVmKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmRfY2hpcCwKPiAgCXByX2VycigiSW52
YWxpZCBjb21tYW5kIGZvciBidWYgd3JpdGU6IDB4JVhcbiIsIGI0N24tPmN1cnJfY29tbWFuZCk7
Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQKPiArYmNtNDd4eG5mbGFzaF9vcHNfYmNtNDcwNl9leGVj
X2NtZF9hZGRyKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gKwkJCQkJY29uc3Qgc3RydWN0IG5h
bmRfc3Vib3AgKnN1Ym9wKQo+ICt7Cj4gKwlzdHJ1Y3QgYmNtNDd4eG5mbGFzaCAqYjQ3biA9IG5h
bmRfZ2V0X2NvbnRyb2xsZXJfZGF0YShjaGlwKTsKPiArCXUzMiBuY3RsID0gMCwgY29sID0gMCwg
cm93ID0gMCwgbmNvbHMgPSAwLCBucm93cyA9IDA7Cj4gKwl1bnNpZ25lZCBpbnQgaSwgajsKPiAr
Cj4gKwlmb3IgKGkgPSAwOyBpIDwgc3Vib3AtPm5pbnN0cnM7IGkrKykgewo+ICsJCWNvbnN0IHN0
cnVjdCBuYW5kX29wX2luc3RyICppbnN0ciA9ICZzdWJvcC0+aW5zdHJzW2ldOwo+ICsKPiArCQlz
d2l0Y2ggKGluc3RyLT50eXBlKSB7Cj4gKwkJY2FzZSBOQU5EX09QX0NNRF9JTlNUUjoKPiArCQkJ
aWYgKFdBUk5fT05fT05DRSgobmN0bCAmIE5DVExfQ01EMCkgJiYKPiArCQkJCQkgKG5jdGwgJiBO
Q1RMX0NNRDFXKSkpCj4gKwkJCQlyZXR1cm4gLUVJTlZBTDsKPiArCQkJZWxzZSBpZiAobmN0bCAm
IE5DVExfQ01EMCkKPiArCQkJCW5jdGwgfD0gTkNUTF9DTUQxVyB8Cj4gKwkJCQkJKCh1MzIpaW5z
dHItPmN0eC5jbWQub3Bjb2RlIDw8IDgpOwo+ICsJCQllbHNlCj4gKwkJCQluY3RsIHw9IE5DVExf
Q01EMCB8IGluc3RyLT5jdHguY21kLm9wY29kZTsKPiArCQkJYnJlYWs7Cj4gKwkJY2FzZSBOQU5E
X09QX0FERFJfSU5TVFI6Cj4gKwkJCWZvciAoaiA9IDA7IGogPCBpbnN0ci0+Y3R4LmFkZHIubmFk
ZHJzOyBqKyspIHsKPiArCQkJCXUzMiBhZGRyID0gaW5zdHItPmN0eC5hZGRyLmFkZHJzW2pdOwo+
ICsKPiArCQkJCWlmIChpIDwgMikgewoKRG9uJ3QgeW91IG1lYW4gaiBoZXJlPyAgICAgICAgICAg
ICAgXgoKPiArCQkJCQljb2wgfD0gYWRkciA8PCBpICogODsKCkknbSBub3Qgc3VyZSB0aGlzIHdp
bGwgd29yaywgYWRkciBpcyAzMi1iaXQgYW5kIGNvbCBhcyB3ZWxsLCBJIGJldCB5b3UKd29uJ3Qg
ZW5kIHVwIHdpdGggd2hhdCB5b3UgZXhwZWN0LgoKPiArCQkJCQluY3RsIHw9IE5DVExfQ09MOwo+
ICsJCQkJCW5jb2xzKys7Cj4gKwkJCQl9IGVsc2Ugewo+ICsJCQkJCXJvdyB8PSBhZGRyIDw8IChp
IC0gMikgKiA4Owo+ICsJCQkJCW5jdGwgfD0gTkNUTF9ST1c7Cj4gKwkJCQkJbnJvd3MrKzsKPiAr
CQkJCX0KPiArCQkJfQo+ICsJCQlicmVhazsKPiArCQlkZWZhdWx0Ogo+ICsJCQlXQVJOX09OX09O
Q0UoMSk7Cj4gKwkJCXJldHVybiAtRUlOVkFMOwo+ICsJCX0KPiArCX0KPiArCj4gKwkvKiBLZWVw
IHRoZSBDUyBsaW5lIGFzc2VydGVkIGlmIHRoZXJlJ3Mgc29tZXRoaW5nIGVsc2UgdG8gZXhlY3V0
ZS4gKi8KPiArCWlmICghc3Vib3AtPmlzX2xhc3QpCj4gKwkJbmN0bCB8PSBOQ1RMX0NTQTsKPiAr
Cj4gKwliY21hX2NjX3dyaXRlMzIoYjQ3bi0+Y2MsIEJDTUFfQ0NfTkZMQVNIX0NPTkYsCj4gKwkJ
CUNPTkZfTUFHSUNfQklUIHwKPiArCQkJQ09ORl9DT0xfQllURVMobmNvbHMpIHwKPiArCQkJQ09O
Rl9ST1dfQllURVMobnJvd3MpKTsKPiArCXJldHVybiBiY200N3h4bmZsYXNoX29wc19iY200NzA2
X2N0bF9jbWQoYjQ3bi0+Y2MsIG5jdGwpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50Cj4gK2JjbTQ3
eHhuZmxhc2hfb3BzX2JjbTQ3MDZfZXhlY193YWl0cmR5KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAs
Cj4gKwkJCQkgICAgICAgY29uc3Qgc3RydWN0IG5hbmRfc3Vib3AgKnN1Ym9wKQo+ICt7Cj4gKwlz
dHJ1Y3QgYmNtNDd4eG5mbGFzaCAqYjQ3biA9IG5hbmRfZ2V0X2NvbnRyb2xsZXJfZGF0YShjaGlw
KTsKPiArCWNvbnN0IHN0cnVjdCBuYW5kX29wX2luc3RyICppbnN0ciA9ICZzdWJvcC0+aW5zdHJz
WzBdOwo+ICsJdW5zaWduZWQgbG9uZyB0aW1lb3V0X2ppZmZpZXMgPSBqaWZmaWVzOwo+ICsKPiAr
CWlmIChXQVJOX09OKHN1Ym9wLT5uaW5zdHJzICE9IDEgfHwKPiArCQkgICAgaW5zdHItPnR5cGUg
IT0gTkFORF9PUF9EQVRBX0lOX0lOU1RSKSkKPiArCQlyZXR1cm4gLUVJTlZBTDsKClNhbWUgcmVt
YXJrIGFzIGZvciB0aGUgYXRtZWwgbWlncmF0aW9uLCBJIGRvdWJ0IGFsbCB0aGVzZSBjaGVja3Mg
YXJlCnVzZWZ1bCBhcyBsb25nIGFzIHdlIHVzZSB0aGUgIm9mZmljaWFsIiBwYXJzZXIgdG8gY2Fs
bCB0aGVzZSBoZWxwZXJzLiBJCndvdWxkIHJhdGhlciBwcmVmZXIgdG8gZHJvcCB0aGVtIGFsbC4K
Cj4gKwo+ICsJdGltZW91dF9qaWZmaWVzICs9IG1zZWNzX3RvX2ppZmZpZXMoaW5zdHItPmN0eC53
YWl0cmR5LnRpbWVvdXRfbXMpICsgMTsKPiArCWRvIHsKPiArCQlpZiAoYmNtYV9jY19yZWFkMzIo
YjQ3bi0+Y2MsIEJDTUFfQ0NfTkZMQVNIX0NUTCkgJiBOQ1RMX1JFQURZKQo+ICsJCQlyZXR1cm4g
MDsKPiArCj4gKwkJdXNsZWVwX3JhbmdlKDEwLCAxMDApOwo+ICsJfSB3aGlsZSAodGltZV9iZWZv
cmUoamlmZmllcywgdGltZW91dF9qaWZmaWVzKSk7Cj4gKwo+ICsJcmV0dXJuIC1FVElNRURPVVQ7
Cj4gK30KCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
