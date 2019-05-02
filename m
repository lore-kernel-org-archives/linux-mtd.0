Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C636FC43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 14:10:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94F9C2085A
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 14:10:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tmb9t8bj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nA/Hb8t6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94F9C2085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+d2uo49CDO8Lhs7/SiNyLRFL6QD1bp9mUHm1lvtgdAM=; b=Tmb9t8bj4Rz8s2
	qM0pcAmRp2TQUYccvOB4Bxp3vauxWNpild8HNh4hHR510aFRwA2wiKdkb4o4mSm2QjKRvJqS+Z5VJ
	Ip2SES/Hh0zGWoqJdd2K/VrQH10+T9vkI4m9BUJ6pMoRK+J8JsvZxHowZvocw2LMf0/sfFl0F1fDG
	7qtLzZL52UR4ycBGM3dSXZ6NMY52oisOk1ttZMXloMjlZ57BgbR4eQ2wjDx5FL/bjoXdmaI8G9DMV
	OOM9wnuT/urlp4DWmB4Fqtkn9nHFKN5KNG8l9RKxJzFt29NrMOL8vRh9jDhzyHhyb53o7oD7cP6HD
	wyC7MN852yFH3IESH5Eg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMCPk-0001gw-2b; Thu, 02 May 2019 14:10:20 +0000
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMCPb-0001AI-3f
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 14:10:18 +0000
Received: by mail-it1-x142.google.com with SMTP id k64so3586477itb.5
 for <linux-mtd@lists.infradead.org>; Thu, 02 May 2019 07:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CzTxP9dt0cEMXB8ZLT3bRjyPydmwtmQUnqm59Ipu0B4=;
 b=nA/Hb8t6zTovVxuEPyklmYdY8j53hus6O8CQ38Q+5dhleYhDtgeBymV3sa5M28ICVj
 fmDBLtsYtXmcjdf15PVFxtxzM34IkSVqF6HIKVOprxxBedZVp27TlplVqtHXU89wTogK
 rcnj0busIRJz6arYPdZEmsIOGqsZkGz0RGaXdZaluJ7r06VdYT8J0+VZp3aWX9FrAfPo
 wQ3aEVOIwN7t8aE2iOiScg0Jk7a3U2TNAKcUWVFJf49P1Bd40J6pqnngAqr3UUTGFDu1
 qwdRsSADf2nQauOacVpLiKe7n/2kL0lFSsmwptI0Ltwa0aYQBOJtGhTsl7iLgzmkl/PR
 Cayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CzTxP9dt0cEMXB8ZLT3bRjyPydmwtmQUnqm59Ipu0B4=;
 b=TLzNw9a3OFvv7oeeTVIJ0dOxIbPtfvpgIO7cfUXdcPh4ov+jOntc6vhIs3HXrSAHXd
 oMvnhB8PCkKClpgN68PoA2zhUwHT7DjRQKqUsWTrtXGzvb35gfLBNQgB2ynjk/yMU1sz
 +EhlbxojjHp0EbocZ0qgZBlxgTyh6OpiHClPFBaWrn3H1db1EqDtIE3go4duDVMHBaNH
 QRBxQu4rIImKpYzwSb2xWZpIjc/et1BqPtLaloqnoSoUpgWY7aUmMBE6YfJmWBa99rDe
 Ug84aveCe3EYh+AQUXm6Sa7JCNbFHg8wMIaW8kWwzinNWkD759KDZYB0+Ykc9Y1awgM/
 9DhA==
X-Gm-Message-State: APjAAAW1DcxQ0UWtSzq7Ik/FFc5p2huTiVZ2UIoLJoPck2QyRse2uelq
 Srk4OBp7ZUzAoIJrUzudNk78JPYKt5uE2Hsel44=
X-Google-Smtp-Source: APXvYqyQnBVy3tEgs5ZeUQB4BK48k9tZQKIHeXjzwFyc6B01aQ5kAp66xuotttqQt1dOlzXHQwgs9f3oiw+VqcpCsVE=
X-Received: by 2002:a24:1104:: with SMTP id 4mr2237306itf.10.1556806210165;
 Thu, 02 May 2019 07:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <1556733121-20133-1-git-send-email-kdasu.kdev@gmail.com>
 <20190502102504.32b45247@xps13>
In-Reply-To: <20190502102504.32b45247@xps13>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Thu, 2 May 2019 10:09:59 -0400
Message-ID: <CAC=U0a2O8V9O8b-dZhn7DRptP3fg1BBCbxhxKXVcsWHykQovaA@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: raw: brcmnand: When oops in progress use pio
 and interrupt polling
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190502_071011_163420_5823B1DA 
X-CRM114-Status: GOOD (  26.62  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBNYXkgMiwgMjAxOSBhdCA0OjI1IEFNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGkgS2FtYWwsCj4KPiBLYW1hbCBEYXN1IDxrZGFz
dS5rZGV2QGdtYWlsLmNvbT4gd3JvdGUgb24gV2VkLCAgMSBNYXkgMjAxOSAxMzo0NjoxNQo+IC0w
NDAwOgo+Cj4gPiBJZiBtdGRfb29wcyBpcyBpbiBwcm9ncmVzcyBzd2l0Y2ggdG8gcG9sbGluZyBm
b3IgbmFuZCBjb21tYW5kIGNvbXBsZXRpb24KPgo+IHMvbmFuZC9OQU5ELwoKV2lsbCBjaGFuZ2Ug
dGhpcy4KCj4KPiA+IGludGVycnVwdHMgYW5kIHVzZSBQSU8gbW9kZSB3aWh0b3V0IERNQSBzbyB0
aGF0IHRoZSBtdGRfb29wcyBidWZmZXIgY2FuCj4gPiBiZSBjb21wbGV0ZWx5IHdyaXR0ZW4gaW4g
dGhlIGFzc2luZ2VkIG5hbmQgcGFydGl0aW9uLgo+Cj4gV2hhdCBhYm91dDoKPgo+ICJJZiBtdGRf
b29wcyBpcyBpbiBwcm9ncmVzcywgc3dpdGNoIHRvIHBvbGxpbmcgZHVyaW5nIE5BTkQgY29tbWFu
ZAo+IGNvbXBsZXRpb24gaW5zdGVhZCBvZiByZWx5aW5nIG9uIERNQS9pbnRlcnJ1cHRzIHNvIHRo
YXQgdGhlIG10ZF9vb3BzCj4gYnVmZmVyIGNhbiBiZSBjb21wbGV0ZWx5IHdyaXR0ZW4gaW4gdGhl
IGFzc2lnbmVkIE5BTkQgcGFydGl0aW9uLiIKPgoKV2lsbCBtYWtlIHRoaXMgY2hhbmdlIGFzIHdl
bGwKCj4gPiBUaGlzIGlzIG5lZWRlZCBpbgo+ID4gY2FzZXMgd2hlcmUgdGhlIHBhbmljIGRvZXMg
bm90IGhhcHBlbiBvbiBjcHUwIGFuZCB0aGVyZSBpcyBvbmx5IG9uZSBvbmxpbmUKPiA+IENQVSBh
bmQgdGhlIHBhbmljIGlzIG5vdCBvbiBjcHUwLgo+Cj4gIlRoaXMgaXMgbmVlZGVkIGluIGNhc2Ug
dGhlIHBhbmljIGRvZXMgbm90IGhhcHBlbiBvbiBDUFUwIGFuZCB0aGVyZSBpcwo+IG9ubHkgb25l
IG9ubGluZSBDUFUuIgo+Cj4gSSBhbSBub3Qgc3VyZSB0byB1bmRlcnN0YW5kIHRoZSBwcm9ibGVt
IG9yIGhvdyB0aGlzIGNhbiBoYXBwZW4gKGFuZAo+IGJlIGEgcHJvYmxlbSkuIEhhdmUgeW91IG1l
dCBzdWNoIGlzc3VlIGFscmVhZHkgb3IgaXMgdGhpcyBwdXJlbHkKPiBzcGVjdWxhdGl2ZT8KCldl
IGhhdmUgc2VlbiB0aGlzIGlzc3VlIGFuZCB0ZXN0ZWQgaXQgb24gbXVsdGkgY29yZSBTb0NzLgoK
Pgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEthbWFsIERhc3UgPGtkYXN1LmtkZXZAZ21haWwuY29t
Pgo+ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8
IDU1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDUyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gPiBpbmRleCA0ODJjNmYwLi5jZmJlNTFhIDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+ID4g
KysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+ID4gQEAgLTgy
Myw2ICs4MjMsMTIgQEAgc3RhdGljIGlubGluZSBib29sIGhhc19mbGFzaF9kbWEoc3RydWN0IGJy
Y21uYW5kX2NvbnRyb2xsZXIgKmN0cmwpCj4gPiAgICAgICByZXR1cm4gY3RybC0+Zmxhc2hfZG1h
X2Jhc2U7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgZGlzYWJsZV9mbGFzaF9k
bWFfeGZlcihzdHJ1Y3QgYnJjbW5hbmRfY29udHJvbGxlciAqY3RybCkKPiA+ICt7Cj4gPiArICAg
ICBpZiAoaGFzX2ZsYXNoX2RtYShjdHJsKSkKPiA+ICsgICAgICAgICAgICAgY3RybC0+Zmxhc2hf
ZG1hX2Jhc2UgPSAwOwo+ID4gK30KPiA+ICsKPiA+ICBzdGF0aWMgaW5saW5lIGJvb2wgZmxhc2hf
ZG1hX2J1Zl9vayhjb25zdCB2b2lkICpidWYpCj4gPiAgewo+ID4gICAgICAgcmV0dXJuIGJ1ZiAm
JiAhaXNfdm1hbGxvY19hZGRyKGJ1ZikgJiYKPiA+IEBAIC0xMjM3LDE1ICsxMjQzLDU4IEBAIHN0
YXRpYyB2b2lkIGJyY21uYW5kX2NtZF9jdHJsKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGludCBk
YXQsCj4gPiAgICAgICAvKiBpbnRlbnRpb25hbGx5IGxlZnQgYmxhbmsgKi8KPiA+ICB9Cj4gPgo+
ID4gK3N0YXRpYyBib29sIGlzX210ZF9vb3BzX2luX3Byb2dyZXNzKHZvaWQpCj4gPiArewo+ID4g
KyAgICAgaW50IGkgPSAwOwo+ID4gKwo+ID4gKyNpZmRlZiBDT05GSUdfTVREX09PUFMKPiA+ICsg
ICAgIGlmIChvb3BzX2luX3Byb2dyZXNzICYmIHNtcF9wcm9jZXNzb3JfaWQoKSkgewo+ID4gKyAg
ICAgICAgICAgICBpbnQgY3B1ID0gMDsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgZm9yX2VhY2hf
b25saW5lX2NwdShjcHUpCj4gPiArICAgICAgICAgICAgICAgICAgICAgKytpOwo+ID4gKyAgICAg
fQo+ID4gKyNlbmRpZgo+ID4gKyAgICAgcmV0dXJuIGkgPT0gMSA/IHRydWUgOiBmYWxzZTsKPgo+
IEkgc3VwcG9zZSByZXR1cm4gKGkgPT0gMSk7IGlzIGVub3VnaAo+CgpPayB3aWxsIG1ha2UgdGhl
IGNoYW5nZS4KCj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBib29sIGJyY21zdGJfbmFuZF93YWl0
X2Zvcl9jb21wbGV0aW9uKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gPiArewo+ID4gKyAgICAg
c3RydWN0IGJyY21uYW5kX2hvc3QgKmhvc3QgPSBuYW5kX2dldF9jb250cm9sbGVyX2RhdGEoY2hp
cCk7Cj4gPiArICAgICBzdHJ1Y3QgYnJjbW5hbmRfY29udHJvbGxlciAqY3RybCA9IGhvc3QtPmN0
cmw7Cj4gPiArICAgICBib29sIGVyciA9IGZhbHNlOwo+ID4gKyAgICAgaW50IHN0czsKPiA+ICsK
PiA+ICsgICAgIGlmIChpc19tdGRfb29wc19pbl9wcm9ncmVzcygpKSB7Cj4gPiArICAgICAgICAg
ICAgIC8qIFN3aXRjaCB0byBpbnRlcnJ1cHQgcG9sbGluZyBhbmQgUElPIG1vZGUgKi8KPiA+ICsg
ICAgICAgICAgICAgZGlzYWJsZV9mbGFzaF9kbWFfeGZlcihjdHJsKTsKPiA+ICsgICAgICAgICAg
ICAgc3RzID0gYmNtbmFuZF9jdHJsX3BvbGxfc3RhdHVzKGN0cmwsIE5BTkRfQ1RSTF9SRFkgfAo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTkFORF9TVEFU
VVNfUkVBRFksCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBOQU5EX0NUUkxfUkRZIHwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIE5BTkRfU1RBVFVTX1JFQURZLCAwKTsKPiA+ICsgICAgICAgICAgICAgZXJyID0g
KHN0cyA8IDApID8gdHJ1ZSA6IGZhbHNlOwo+ID4gKyAgICAgfSBlbHNlIHsKPiA+ICsgICAgICAg
ICAgICAgdW5zaWduZWQgbG9uZyB0aW1lbyA9IG1zZWNzX3RvX2ppZmZpZXMoCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTkFORF9QT0xMX1NUQVRVU19U
SU1FT1VUX01TKTsKPiA+ICsgICAgICAgICAgICAgLyogd2FpdCBmb3IgY29tcGxldGlvbiBpbnRl
cnJ1cHQgKi8KPiA+ICsgICAgICAgICAgICAgc3RzID0gd2FpdF9mb3JfY29tcGxldGlvbl90aW1l
b3V0KCZjdHJsLT5kb25lLCB0aW1lbyk7Cj4gPiArICAgICAgICAgICAgIGVyciA9IChzdHMgPD0g
MCkgPyB0cnVlIDogZmFsc2U7Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICByZXR1cm4gZXJy
Owo+ID4gK30KPiA+ICsKPiA+ICBzdGF0aWMgaW50IGJyY21uYW5kX3dhaXRmdW5jKHN0cnVjdCBu
YW5kX2NoaXAgKmNoaXApCj4gPiAgewo+ID4gICAgICAgc3RydWN0IGJyY21uYW5kX2hvc3QgKmhv
c3QgPSBuYW5kX2dldF9jb250cm9sbGVyX2RhdGEoY2hpcCk7Cj4gPiAgICAgICBzdHJ1Y3QgYnJj
bW5hbmRfY29udHJvbGxlciAqY3RybCA9IGhvc3QtPmN0cmw7Cj4gPiAtICAgICB1bnNpZ25lZCBs
b25nIHRpbWVvID0gbXNlY3NfdG9famlmZmllcygxMDApOwo+ID4gKyAgICAgYm9vbCBlcnIgPSBm
YWxzZTsKPiA+Cj4gPiAgICAgICBkZXZfZGJnKGN0cmwtPmRldiwgIndhaXQgb24gbmF0aXZlIGNt
ZCAlZFxuIiwgY3RybC0+Y21kX3BlbmRpbmcpOwo+ID4gLSAgICAgaWYgKGN0cmwtPmNtZF9wZW5k
aW5nICYmCj4gPiAtICAgICAgICAgICAgICAgICAgICAgd2FpdF9mb3JfY29tcGxldGlvbl90aW1l
b3V0KCZjdHJsLT5kb25lLCB0aW1lbykgPD0gMCkgewo+Cj4gV2hhdCBhYm91dCB0aGUgd2FpdF9m
b3JfY29tcGxldGlvbl90aW1lb3V0KCkgY2FsbCBpbiBicmNtbmFuZF93cml0ZSgpPwo+CgpicmNt
bmFuZF93cml0ZSgpIHRvbyBjYWxscyBicmNtbmFuZF93YWl0ZnVuYygpLCB3aWxsIHBvbGwgaWYg
aXQgbmVlZHMKdG8gZm9yIGNvbXBsZXRpb24uCgo+ID4gKyAgICAgaWYgKGN0cmwtPmNtZF9wZW5k
aW5nKQo+ID4gKyAgICAgICAgICAgICBlcnIgPSBicmNtc3RiX25hbmRfd2FpdF9mb3JfY29tcGxl
dGlvbihjaGlwKTsKPiA+ICsKPiA+ICsgICAgIGlmIChlcnIpIHsKPiA+ICAgICAgICAgICAgICAg
dTMyIGNtZCA9IGJyY21uYW5kX3JlYWRfcmVnKGN0cmwsIEJSQ01OQU5EX0NNRF9TVEFSVCkKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPj4gYnJjbW5hbmRfY21kX3No
aWZ0KGN0cmwpOwo+ID4KPgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKClRoYW5rcwpLYW1hbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
