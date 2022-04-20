Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D45C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 05:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BhEUNjOyRUYJKXdVKLFk2iZQyvjNIm7Ol7gzEUOz2CQ=; b=Aw6q7ed6CTejXk
	2LRpAsubiiiUPDR6CqK8FZ1lCsCNjYJdA2H11WEo6y/vJ0SrM4lBJy2Typ6yw5v5ChUwUWe2n2LZT
	6ZHfrPPQokKVnmu3m2zOzkRGwq2IzrNfijVIJHlFWXM+UKC/sATOzuKphl6yhdGAIPiV3IJTh3THo
	kaTUwkYDXrCbuc3X9pztXmRYyHQQ/JzARRja/MuPYTu1k2xsH3tVzsDsPlA1+A7l7UKqTlOQacKj5
	zw0vJdWVWKYKKEKsW0+Q5NfFw2BEe5fmxmX52Fvqg4ZJdpOyX9fX+YtPaPI8QuD1o+/ff6iEG4DCN
	IRAhZeXHrHYITtwR/wMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh2lT-007O0B-83; Wed, 20 Apr 2022 05:20:31 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh2lP-007Nzg-SJ
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 05:20:29 +0000
Received: by mail-pj1-x1030.google.com with SMTP id ll10so879510pjb.5
 for <linux-mtd@lists.infradead.org>; Tue, 19 Apr 2022 22:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=JZkx/n/p7b6ySTx2ldt9RivXk5pNmCw4WRsx44qY0Ws=;
 b=Tq4vABg+4hyQP54GofN1qIh6eoKGlrApJrWSp3c3KgoVqCbsc+EgHE+3aTb7V60l7Q
 RU5DVDjnrc55YfCFkrN1YuzJkt3ipeXVnq2GfXeycdHMLS5ae06o8vszL3cg487IbFEa
 ufzH7R2UutbjcXgVFZZuFoo0WMQCDQ7ZcujZZYEGyPVpqtwvah3L2ct71Fz6hKZdN3ZX
 U2j54ZiTjbxCQHg8myxq0s1UC61b28itChxyBqrUWRvQv6aSuoe+t7p3tC7Q87gwedWv
 /YHy7X6ZSLN1/Wnk85F+0PKkNOjUUcAcWReN2bqIRdhbdUgMlY7RBglrKUzPzPFTRJOe
 tkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=JZkx/n/p7b6ySTx2ldt9RivXk5pNmCw4WRsx44qY0Ws=;
 b=TvRU8riyrz1Sff19lDpjpx5S5OSYEQF/uEBmHTKk2MsYoIvIqovPpcDliY7urikKIr
 FPNwiwt8lP7BFB+Z8KJKPAEaaptTTckKzGzBI36z3Nc6AYGMv59svF/6umUQAkZYxqoT
 e09vtMldgq2Bt1I30ytiBGrlIa7NzEp2eP3OznCKlEDvrCnWJGQJMtW3ga0oWTIl3hdp
 FIfGJnyQ1zZv8EaqAG5XKs3yLUSAGE2Xiwy/5cL1BUshISkqBUPCFH4ppWdF/Prr+fRA
 6qZmWGBU/ELktrLFmSfy4MHwTNYjn5GurbtYuaViA65mUDu7cNDIf3broxKpGbvzuxzB
 c3mQ==
X-Gm-Message-State: AOAM530zptI+f2eYXi6TtlDLSiWC9cQMik71upeMdUIQG3rtofVhbrHk
 cLpC2vLcN3ADI3geAv1gPcc=
X-Google-Smtp-Source: ABdhPJxfDJjqoSntvyEMjUAZrtP48TBzoup54jMkCX4yPAvO1JZrKy7Lkd+kOaTYzitnmqwBworCWQ==
X-Received: by 2002:a17:902:cece:b0:158:d875:e6d6 with SMTP id
 d14-20020a170902cece00b00158d875e6d6mr18136030plg.165.1650432026222; 
 Tue, 19 Apr 2022 22:20:26 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a17090a529400b001d2f1a8e191sm2090941pjh.22.2022.04.19.22.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 22:20:25 -0700 (PDT)
From: Takahiro Kuwano <tkuw584924@gmail.com>
X-Google-Original-From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Message-ID: <140aa0dd-edd0-f241-672d-d48afe29ef8b@gmail.com>
Date: Wed, 20 Apr 2022 14:20:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 6/9] mtd: spi-nor: core: Add helpers to read/write any
 register
Content-Language: en-US
To: Pratyush Yadav <p.yadav@ti.com>, Tudor.Ambarus@microchip.com
Cc: michael@walle.cc, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nicolas.Ferre@microchip.com,
 Takahiro.Kuwano@infineon.com
References: <20220411091033.98754-1-tudor.ambarus@microchip.com>
 <20220411091033.98754-7-tudor.ambarus@microchip.com>
 <0e4ec58c21490dcd9cf82ab89bd8c34c@walle.cc>
 <e21b0d76bf778f78f432ba27a673222d@walle.cc>
 <f318dbd9-d4bf-301a-b5c9-556d04d5bfe6@microchip.com>
 <20220419123245.zu4hypebz77ckygn@ti.com>
 <996f36b1303d191e472f56393aa6398e@walle.cc>
 <89083a31-b862-de50-fdca-d427fb908a08@microchip.com>
 <20220420043425.l77hmc4zm7cwfwdn@ti.com>
In-Reply-To: <20220420043425.l77hmc4zm7cwfwdn@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_222027_960428_66ABA3EE 
X-CRM114-Status: GOOD (  26.70  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiA0LzIwLzIwMjIgMTozNCBQTSwgUHJhdHl1c2ggWWFkYXYgd3JvdGU6Cj4gT24gMTkvMDQv
MjIgMTI6NTZQTSwgVHVkb3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tIHdyb3RlOgo+PiBPbiA0LzE5
LzIyIDE1OjQ2LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5v
dCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29u
dGVudCBpcyBzYWZlCj4+Pgo+Pj4gQW0gMjAyMi0wNC0xOSAxNDozMiwgc2NocmllYiBQcmF0eXVz
aCBZYWRhdjoKPj4+PiBPbiAxOS8wNC8yMiAxMjowOFBNLCBUdWRvci5BbWJhcnVzQG1pY3JvY2hp
cC5jb20gd3JvdGU6Cj4+Pj4+IE9uIDQvMTkvMjIgMTQ6NDYsIE1pY2hhZWwgV2FsbGUgd3JvdGU6
Cj4+Pj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNo
bWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUKPj4+Pj4+Cj4+Pj4+PiBB
bSAyMDIyLTA0LTE5IDEzOjE5LCBzY2hyaWViIE1pY2hhZWwgV2FsbGU6Cj4+Pj4+Pj4gQW0gMjAy
Mi0wNC0xMSAxMToxMCwgc2NocmllYiBUdWRvciBBbWJhcnVzOgo+Pj4+Pj4+PiBUaGVyZSBhcmUg
bWFudWZhY3R1cmVycyB0aGF0IHVzZSByZWdpc3RlcnMgaW5kZXhlZCBieSBhZGRyZXNzLiBTb21l
IG9mCj4+Pj4+Pj4+IHRoZW0gc3VwcG9ydCAicmVhZC93cml0ZSBhbnkgcmVnaXN0ZXIiIG9wY29k
ZXMuIFByb3ZpZGUgY29yZSBtZXRob2RzCj4+Pj4+Pj4+IHRoYXQKPj4+Pj4+Pj4gY2FuIGJlIHVz
ZWQgYnkgYWxsIG1hbnVmYWN0dXJlcnMuIFNQSSBOT1IgY29udHJvbGxlciBvcHMgYXJlCj4+Pj4+
Pj4+IGludGVudGlvbmFsbHkKPj4+Pj4+Pj4gbm90IHN1cHBvcnRlZCBhcyB3ZSBpbnRlbmQgdG8g
bW92ZSBhbGwgdGhlIFNQSSBOT1IgY29udHJvbGxlciBkcml2ZXJzCj4+Pj4+Pj4+IHVuZGVyIHRo
ZSBTUEkgc3Vic3lzdGVtLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBUdWRvciBB
bWJhcnVzIDx0dWRvci5hbWJhcnVzQG1pY3JvY2hpcC5jb20+Cj4+Pj4+Pj4+IFRlc3RlZC1ieTog
VGFrYWhpcm8gS3V3YW5vIDxUYWthaGlyby5LdXdhbm9AaW5maW5lb24uY29tPgo+Pj4+Pj4+PiBS
ZXZpZXdlZC1ieTogUHJhdHl1c2ggWWFkYXYgPHAueWFkYXZAdGkuY29tPgo+Pj4+Pj4+Cj4+Pj4+
Pj4gSSBzdGlsbCBkb24ndCBsaWtlIGl0IGJlY2F1c2UgdGhlIGZ1bmN0aW9uIGRvZXNuJ3QgZG8K
Pj4+Pj4+PiBhbnl0aGluZyB3aGF0IHRoZSBmdW5jdGlvbiBuYW1lIG1pZ2h0IHN1Z2dlc3QuIFRo
ZSByZWFkCj4+Pj4+Pj4ganVzdCBleGVjdXRlcyBhbiBvcCwgdGhlIHdyaXRlIGV4ZWN1dGVzIGFu
IG9wIHdpdGggYQo+Pj4+Pj4+IHdyaXRlIGVuYWJsZSBiZWZvcmUuIEFsbCB0aGUgYmVoYXZpb3Ig
aXMgZGV0ZXJtaW5lZCBieSB0aGUKPj4+Pj4+PiAnb3AnIGFyZ3VtZW50Lgo+Pj4+Pj4+Cj4+Pj4+
Pj4gQW55d2F5LAo+Pj4+Pj4+IFJldmlld2VkLWJ5OiBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdh
bGxlLmNjPgo+Pj4+Pj4+Cj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+PiB2Mzogbm8gY2hhbmdlcwo+Pj4+
Pj4+Pgo+Pj4+Pj4+PiDCoCBkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyB8IDQxCj4+Pj4+Pj4+
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+Pj4+Pj4+IMKgIGRyaXZl
cnMvbXRkL3NwaS1ub3IvY29yZS5oIHzCoCA0ICsrKysKPj4+Pj4+Pj4gwqAgMiBmaWxlcyBjaGFu
Z2VkLCA0NSBpbnNlcnRpb25zKCspCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9zcGktbm9yL2NvcmUuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4+Pj4+
Pj4+IGluZGV4IDYxNjVkYzdiZmQxNy4uNDI3OTQzMjhkM2I2IDEwMDY0NAo+Pj4+Pj4+PiAtLS0g
YS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+Pj4+Pj4+PiArKysgYi9kcml2ZXJzL210ZC9z
cGktbm9yL2NvcmUuYwo+Pj4+Pj4+PiBAQCAtMzA3LDYgKzMwNyw0NyBAQCBzc2l6ZV90IHNwaV9u
b3Jfd3JpdGVfZGF0YShzdHJ1Y3Qgc3BpX25vciAqbm9yLAo+Pj4+Pj4+PiBsb2ZmX3QgdG8sIHNp
emVfdCBsZW4sCj4+Pj4+Pj4+IMKgwqDCoMKgwqAgcmV0dXJuIG5vci0+Y29udHJvbGxlcl9vcHMt
PndyaXRlKG5vciwgdG8sIGxlbiwgYnVmKTsKPj4+Pj4+Pj4gwqAgfQo+Pj4+Pj4+Pgo+Pj4+Pj4+
PiArLyoqCj4+Pj4+Pj4+ICsgKiBzcGlfbm9yX3JlYWRfcmVnKCkgLSByZWFkIHJlZ2lzdGVyIHRv
IGZsYXNoIG1lbW9yeQo+Pj4+Pj4+PiArICogQG5vcjrCoMKgwqDCoMKgwqDCoCBwb2ludGVyIHRv
ICdzdHJ1Y3Qgc3BpX25vcicuCj4+Pj4+Pj4+ICsgKiBAb3A6wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFNQSSBtZW1vcnkgb3BlcmF0aW9uLiBvcC0+ZGF0YS5idWYgbXVzdCBiZSBETUEtYWJsZS4K
Pj4+Pj4+Pj4gKyAqIEBwcm90bzrCoCBTUEkgcHJvdG9jb2wgdG8gdXNlIGZvciB0aGUgcmVnaXN0
ZXIgb3BlcmF0aW9uLgo+Pj4+Pj4+PiArICoKPj4+Pj4+Pj4gKyAqIFJldHVybjogemVybyBvbiBz
dWNjZXNzLCAtZXJybm8gb3RoZXJ3aXNlCj4+Pj4+Pj4+ICsgKi8KPj4+Pj4+Pj4gK2ludCBzcGlf
bm9yX3JlYWRfcmVnKHN0cnVjdCBzcGlfbm9yICpub3IsIHN0cnVjdCBzcGlfbWVtX29wICpvcCwK
Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVudW0gc3BpX25vcl9w
cm90b2NvbCBwcm90bykKPj4+Pj4+Pj4gK3sKPj4+Pj4+Pj4gK8KgwqDCoCBpZiAoIW5vci0+c3Bp
bWVtKQo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVPUE5PVFNVUFA7
Cj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gK8KgwqDCoCBzcGlfbm9yX3NwaW1lbV9zZXR1cF9vcChub3Is
IG9wLCBwcm90byk7Cj4+Pj4+Pj4+ICvCoMKgwqAgcmV0dXJuIHNwaV9ub3Jfc3BpbWVtX2V4ZWNf
b3Aobm9yLCBvcCk7Cj4+Pj4+Pj4+ICt9Cj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gKy8qKgo+Pj4+Pj4+
PiArICogc3BpX25vcl93cml0ZV9yZWcoKSAtIHdyaXRlIHJlZ2lzdGVyIHRvIGZsYXNoIG1lbW9y
eQo+Pj4+Pj4+PiArICogQG5vcjrCoMKgwqDCoMKgwqDCoCBwb2ludGVyIHRvICdzdHJ1Y3Qgc3Bp
X25vcicKPj4+Pj4+Pj4gKyAqIEBvcDrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU1BJIG1lbW9y
eSBvcGVyYXRpb24uIG9wLT5kYXRhLmJ1ZiBtdXN0IGJlIERNQS1hYmxlLgo+Pj4+Pj4+PiArICog
QHByb3RvOsKgIFNQSSBwcm90b2NvbCB0byB1c2UgZm9yIHRoZSByZWdpc3RlciBvcGVyYXRpb24u
Cj4+Pj4+Pj4+ICsgKgo+Pj4+Pj4+PiArICogUmV0dXJuOiB6ZXJvIG9uIHN1Y2Nlc3MsIC1lcnJu
byBvdGhlcndpc2UKPj4+Pj4+Pj4gKyAqLwo+Pj4+Pj4+PiAraW50IHNwaV9ub3Jfd3JpdGVfcmVn
KHN0cnVjdCBzcGlfbm9yICpub3IsIHN0cnVjdCBzcGlfbWVtX29wICpvcCwKPj4+Pj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW51bSBzcGlfbm9yX3Byb3RvY29sIHBy
b3RvKQo+Pj4+Pj4+PiArewo+Pj4+Pj4+PiArwqDCoMKgIGludCByZXQ7Cj4+Pj4+Pj4+ICsKPj4+
Pj4+Pj4gK8KgwqDCoCBpZiAoIW5vci0+c3BpbWVtKQo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gLUVPUE5PVFNVUFA7Cj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gK8KgwqDCoCBy
ZXQgPSBzcGlfbm9yX3dyaXRlX2VuYWJsZShub3IpOwo+Pj4+Pj4+PiArwqDCoMKgIGlmIChyZXQp
Cj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+Pj4+Pj4+ICvC
oMKgwqAgc3BpX25vcl9zcGltZW1fc2V0dXBfb3Aobm9yLCBvcCwgcHJvdG8pOwo+Pj4+Pj4+PiAr
wqDCoMKgIHJldHVybiBzcGlfbm9yX3NwaW1lbV9leGVjX29wKG5vciwgb3ApOwo+Pj4+Pj4KPj4+
Pj4+IEFmdGVyIHNlZWluZyB5b3VyIG5leHQgdHdvIHBhdGNoZXMuIFNob3VsZG4ndCB0aGUKPj4+
Pj4+IHNwaV9ub3Jfd2FpdF91bnRpbF9yZWFkeSgpIGNhbGwgYmUgaGVyZSB0b28/Cj4+Pj4+Pgo+
Pj4+Pgo+Pj4+PiBJIHRob3VnaHQgb2YgdGhpcyB0b28sIGJ1dCBzZWVtcyB0aGF0IGZvciBhIHJl
YXNvbiB0aGF0IEkgZG9uJ3QKPj4+Pj4gcmVtZW1iZXIsIHdlIGRvbid0IGNhbGwgZm9yIHNwaV9u
b3Jfd2FpdF91bnRpbF9yZWFkeSBhZnRlciB3ZQo+Pj4+PiB3cml0ZSB0aGUgb2N0YWwgRFRSIGJp
dC4gUHJhdHl1c2gsIGRvIHlvdSByZW1lbWJlciB3aHk/Cj4+Pj4KPj4+PiBXZSBhcmUgbm90IHN1
cmUgdGhlIHByb3RvY29sIGNoYW5nZWQgY29ycmVjdGx5IHNvIHdlIGNhbid0IHJlbHkgb24KPj4+
PiBzcGlfbm9yX3dhaXRfdW50aWxfcmVhZHkoKS4gV2UgcmVhZCB0aGUgSUQgaW5zdGVhZCB0byBi
ZSBzdXJlLgo+Pj4KPj4+IFNvIGJlc2lkZXMgdGhlIGZhY3QgdGhhdCB0aGUgd3JpdGVfcmVnIG9u
bHkgd29ya3Mgd2l0aCB0aGUgJ2NvcnJlY3QnCj4+PiBvcCBwYXJhbWV0ZXIsIGl0IGlzIGFsc28g
dGFpbG9yZWQgdG8gdGhlIHNwZWNpYWwgdXNlIGNhc2UuIEZvciByZWFsCj4+PiB3cml0ZV9yZWco
KSwgdGhlIHVzZXIgd291bGQgYWN0dWFsbHkgaGFzIHRvIHBvbGwgdGhlIHN0YXR1cyBiaXQKPj4+
IGFmdGVyd2FyZHM/IDooCj4+Pgo+PiBEb24ndCBiZSBzYWQgOkQuIEFyZSB0aGUgb2N0YWwgRFRS
IG1ldGhvZHMgYW4gZXhjZXB0aW9uPwo+PiBJZiB5ZXMsIGxldCdzIGFkZCB0aGUgY2FsbCB0byBz
cGlfbm9yX3dhaXRfdW50aWxfcmVhZHkoKSBpbiB0aGUKPj4gcmVhZC93cml0ZV9hbnlfcmVnKCkg
bWV0aG9kcywgYW5kIGxldCB0aGUgb2N0YWwgbWV0aG9kcyBoYW5kbGUKPj4gdGhlIHNwZWNpZmlj
IHdyaXRlIHRoZW1zZWx2ZXMsIHdpdGhvdXQgY2FsbGluZyBmb3IgcmVhZHkoKQo+IAo+IEl0IGhh
cyBiZWVuIGEgd2hpbGUsIGJ1dCBJSVJDIEkgYXNrZWQgQ3lwcmVzcyBhYm91dCB0aGlzLCBiZWNh
dXNlIEkgd2FzIAo+IHdvcnJpZWQgYWJvdXQgcmVhZGluZyBJRCB3aGlsZSB0aGUgc3dpdGNoIHRv
IDhEIG1vZGUgd2FzIHN0aWxsIGluIAo+IHByb2dyZXNzLiBUaGV5IHNhaWQgdGhhdCB2b2xhdGls
ZSByZWdpc3RlciB3cml0ZXMgYXJlIGluc3RhbnQgYW5kIGRvIG5vdCAKPiBuZWVkIGFueSBzdGF0
dXMgcG9sbGluZy4gU28gdGhlIHN3aXRjaCB0byA4RC04RC04RCBtb2RlIHdvdWxkIGJlIGluc3Rh
bnQgCj4gYW5kIHRoZXJlIGlzIG5vIG5lZWQgdG8gd2FpdCBmb3IgYW55dGhpbmcuCj4gClllcywg
aXQgaXMgY29ycmVjdC4KCj4gVGhlIEN5cHJlc3MgUzI4IGZsYXNoIGRhdGFzaGVldCBkb2VzIG5v
dCBzYXkgdGhpcyBleHBsaWNpdGx5LiBJdCBkb2VzIApJdCBpcyB3aGF0IHdlIChJbmZpbmVvbikg
bmVlZCB0byBzb2x2ZS4uLgoKPiBzYXkgdGhhdCB3cml0aW5nIHRvIG5vbi12b2xhdGlsZSByZWdp
c3RlcnMgdGFrZXMgdGltZSBhbmQgeW91IG5lZWQgdG8gCj4gd2FpdCBmb3IgcmVhZHkgZm9yIHRo
b3NlLCBidXQgbWFrZXMgbm8gbWVudGlvbiBvZiB2b2xhdGlsZSByZWdpc3RlcnMuIFdlIAo+IGRv
bid0IGV2ZXIgd2FudCB0byB3cml0ZSBub24tdm9sYXRpbGUgcmVnaXN0ZXJzIHNvIHdlIGNhbiBp
Z25vcmUgdGhhdCAKPiBwcm9ibGVtLgo+IAo+IEkgc2VlIHRoZSBNaWNyb24gTVQzNSBkYXRhc2hl
ZXQgc2F5IHRoaXMgZXhwbGljaXRseSwgdGhhdCBjaGFuZ2VzIHRvIAo+IHZvbGF0aWxlIHJlZ2lz
dGVycyBhcmUgaW5zdGFudC4KPiAKPiBTbyBJIHdvdWxkIHNheSB0aGF0IGJhc2VkIG9uIG15IGxp
bWl0ZWQgc2FtcGxlIHNpemUsIHZvbGF0aWxlIHJlZ2lzdGVyIAo+IHdyaXRlcyBmb3IgQ3lwcmVz
cyBhbmQgTWljcm9uIGZsYXNoZXMgZG8gX25vdF8gbmVlZCAKPiBzcGlfbm9yX3dhaXRfdW50aWxf
cmVhZHkoKS4KPiAKClRoYW5rcywKVGFrYWhpcm8gS3V3YW5vCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
