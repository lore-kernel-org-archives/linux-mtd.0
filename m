Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB37C3DA4A
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2024 05:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UJI5u1TOGnDc2Mzf7r/QOYK8tKddnjGsBtDASuDVkz4=; b=paqtSJGfZHRKL4
	XnvNggAp+2KKsOOAeHHbVNkC/90VF+C2CluL0W20uNAUq/cheH8DXOQhVdC1EQynm5RDKV+MKLSAC
	1w6VW1sIKGK6IYyCRlO8RCRHWT8t6YFpw/9Q6a3o44IwmSurPmu6u8MdvhO4APKJNlqyobHt6IYbg
	8Axrw8Hb4v0+h6CxyMWL8zyUhPed6MY6hPfqWJj4Q6/q7NnGgbMuZFTag5vYA1LQuNYVg9uDHsYlX
	3+geCiVLptBS2jwxYceHHL9utbolhJwNHFMr9yJ5T3n0rzckLthX1DHoIbD3mhNiqu1HzgvI7+Frp
	N1j7428qHaCg0aIjSjWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgHXV-00000003t0h-0IUb;
	Tue, 20 Aug 2024 05:36:17 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgHWm-00000003svc-2GxV;
	Tue, 20 Aug 2024 05:35:33 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-26ff21d8382so3326272fac.1;
        Mon, 19 Aug 2024 22:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724132131; x=1724736931; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ndtfIALYxvSwyfZwUZk30HMSZOs/3lo4XrgNJ0/XS/Y=;
        b=dF+wMYM2sR4PPvmtUd7d2CbZk+xAkSKnYWLEufLtSTYvASKqhrLmDLtXQ2CVl3R2PL
         Lp2R1X63vDZPI6N68Ed7F3n+vjDietgUjFgcWbXIc1AD/jtPPEQ2DbQrRfmqNc4RCslK
         4gdsucJBdxZsSKTTk0MU4cX2bqnk2Ev1MueHQ0ga77Z7poH8bIceVkvHmtTk5AncpzOo
         BLas/FNQXBaxE/941Jc/L6aSK6EtzPNnC/GZxYqye/X5iVNfMYGyA3A+Kg1RHcR15KcY
         vg80Ap5Sroy75Kxz7kLrO7L3Afg9vYAP0h8KxmyJ5XN3ImMMxCuGtiypWlc1jJ2kK1LI
         4oMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724132131; x=1724736931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ndtfIALYxvSwyfZwUZk30HMSZOs/3lo4XrgNJ0/XS/Y=;
        b=SBFpCMauxBEgR64Azijj9jQIPKEYAyaFiGyAuidenpo1PF3hEQp8FaKqL4qpgYlYva
         0KQmDaLXsXaqK7I9hGgKsOjSDwmkwu1RRaR1rHsp9oahYd7f3rkIp8VsCHSlOcJhyW7e
         5GmQG+zPWAs4axzYBKL9nbT20dJHk+tEA7wVeTkwAaQFYsj2UfTfoQcsG+3sk32Icwuh
         Ccvt8ARFwoYRGbLSaP7oBlfaMX/657zjyq4tmshxJ4LucY+pFdUwYtLbkmU48ta6mcdt
         SoWBTMHOiIOeE5rwOUaFGnfOmzzTqaeOLHvRm0j8r3I4d+5ifHw7bViD+BZ7Md6tJFJ0
         ARVA==
X-Forwarded-Encrypted: i=1; AJvYcCU6Xe0BVGAXL2uYEZAFo9gHGoPrULzEWBXoNyKC+IY3vpjD+DN5KxVAHgzRLqltql0z8CofH72axHQt03ILI9KG@lists.infradead.org, AJvYcCVtUDHW0tp9ZWOdQDg8pPMiHBiA0L7J9l8rU4OLHI0XZLfI9lEXUPdEjBbm9nSnELv+pWJrA99Lfbg/@lists.infradead.org
X-Gm-Message-State: AOJu0YyF81T+Xfm9BNHsyFf/hnb++ajHQvqWErjrcR9H3XaBKX1Z1kat
	Lo6Te4B899BqaiPtYmi9Dx/BCYR5OX6jmdh+VJbci8TVxp7dQMsv
X-Google-Smtp-Source: AGHT+IFtEn8H0UZ4sEWSOI7G4y4Mo1XLRTZ28Kau1HwcAHNrGsrgcbQQoKbgrUrFfpCGq+Yq/fxnrQ==
X-Received: by 2002:a05:6870:224e:b0:268:a074:39cf with SMTP id 586e51a60fabf-2701c349599mr11711600fac.8.1724132130748;
        Mon, 19 Aug 2024 22:35:30 -0700 (PDT)
Received: from [172.19.1.53] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127aef5431sm7461828b3a.109.2024.08.19.22.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 22:35:30 -0700 (PDT)
Message-ID: <fe56d8be-9c75-48d5-bc2c-76a79e5d7843@gmail.com>
Date: Tue, 20 Aug 2024 13:35:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, esben@geanix.com,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240819092037.110260-1-hpchen0nvt@gmail.com>
 <20240819092037.110260-3-hpchen0nvt@gmail.com>
 <t7igmxzylpem6qbasb2esnren743m4dnzw6j3i7vn3dveubu5n@4sy6mmmlhtw3>
Content-Language: en-US
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
In-Reply-To: <t7igmxzylpem6qbasb2esnren743m4dnzw6j3i7vn3dveubu5n@4sy6mmmlhtw3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_223532_607188_8EA17B91 
X-CRM114-Status: GOOD (  21.94  )
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

RGVhciBLcnp5c3p0b2YsCgpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCgoKCk9uIDIwMjQvOC8x
OSDkuIvljYggMDc6MTksIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gT24gTW9uLCBBdWcg
MTksIDIwMjQgYXQgMDk6MjA6MzdBTSArMDAwMCwgSHVpLVBpbmcgQ2hlbiB3cm90ZToKPj4gTnV2
b3RvbiBNQTM1IFNvQ3MgTkFORCBGbGFzaCBJbnRlcmZhY2UgQ29udHJvbGxlcgo+PiBzdXBwb3J0
cyAyS0IsIDRLQiBhbmQgOEtCIHBhZ2Ugc2l6ZSwgYW5kIHVwIHRvIDgtYml0LAo+PiAxMi1iaXQs
IGFuZCAyNC1iaXQgaGFyZHdhcmUgRUNDIGNhbGN1bGF0aW9uIGNpcmN1aXQKPj4gdG8gcHJvdGVj
dCBkYXRhIGNvbW11bmljYXRpb24uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEh1aS1QaW5nIENoZW4g
PGhwY2hlbjBudnRAZ21haWwuY29tPgo+IC4uLgo+Cj4+ICtzdGF0aWMgaW50IG1hMzVfbmFuZF9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+PiArewo+PiArCXN0cnVjdCBtYTM1
X25hbmRfaW5mbyAqbmFuZDsKPj4gKwlzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwOwo+PiArCXN0cnVj
dCBtdGRfaW5mbyAqbXRkOwo+PiArCWludCByZXR2YWwgPSAwOwo+PiArCj4+ICsJbmFuZCA9IGRl
dm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKm5hbmQpLCBHRlBfS0VSTkVMKTsKPj4gKwlp
ZiAoIW5hbmQpCj4+ICsJCXJldHVybiAtRU5PTUVNOwo+PiArCj4+ICsJbmFuZF9jb250cm9sbGVy
X2luaXQoJm5hbmQtPmNvbnRyb2xsZXIpOwo+PiArCj4+ICsJbmFuZC0+cmVncyA9IGRldm1fcGxh
dGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsKPj4gKwlpZiAoSVNfRVJSKG5hbmQtPnJl
Z3MpKQo+PiArCQlyZXR1cm4gUFRSX0VSUihuYW5kLT5yZWdzKTsKPj4gKwo+PiArCW5hbmQtPmRl
diA9ICZwZGV2LT5kZXY7Cj4+ICsJY2hpcCA9ICZuYW5kLT5jaGlwOwo+PiArCW10ZCA9IG5hbmRf
dG9fbXRkKGNoaXApOwo+PiArCW5hbmRfc2V0X2NvbnRyb2xsZXJfZGF0YShjaGlwLCBuYW5kKTsK
Pj4gKwluYW5kX3NldF9mbGFzaF9ub2RlKGNoaXAsIHBkZXYtPmRldi5vZl9ub2RlKTsKPj4gKwo+
PiArCW10ZC0+cHJpdiA9IGNoaXA7Cj4+ICsJbXRkLT5vd25lciA9IFRISVNfTU9EVUxFOwo+PiAr
CW10ZC0+ZGV2LnBhcmVudCA9ICZwZGV2LT5kZXY7Cj4+ICsKPj4gKwluYW5kLT5jbGsgPSBkZXZt
X2Nsa19nZXQoJnBkZXYtPmRldiwgIm5hbmRfZ2F0ZSIpOwo+PiArCWlmIChJU19FUlIobmFuZC0+
Y2xrKSkKPj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgUFRSX0VSUihuYW5k
LT5jbGspLAo+PiArCQkJCSAgICAgImZhaWxlZCB0byBmaW5kIG5hbmQgY2xvY2tcbiIpOwo+PiAr
Cj4+ICsJcmV0dmFsID0gY2xrX3ByZXBhcmVfZW5hYmxlKG5hbmQtPmNsayk7Cj4+ICsJaWYgKHJl
dHZhbCA8IDApIHsKPj4gKwkJZGV2X2VycigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIGVuYWJsZSBj
bG9ja1xuIik7Cj4+ICsJCXJldHZhbCA9IC1FTlhJTzsKPj4gKwl9Cj4+ICsKPj4gKwluYW5kLT5j
aGlwLmNvbnRyb2xsZXIgICAgPSAmbmFuZC0+Y29udHJvbGxlcjsKPj4gKwo+PiArCWNoaXAtPmxl
Z2FjeS5jbWRmdW5jICAgICA9IG1hMzVfbmFuZF9jb21tYW5kOwo+PiArCWNoaXAtPmxlZ2FjeS53
YWl0ZnVuYyAgICA9IG1hMzVfd2FpdGZ1bmM7Cj4+ICsJY2hpcC0+bGVnYWN5LnJlYWRfYnl0ZSAg
ID0gbWEzNV9uYW5kX3JlYWRfYnl0ZTsKPj4gKwljaGlwLT5sZWdhY3kuc2VsZWN0X2NoaXAgPSBt
YTM1X25hbmRfc2VsZWN0X2NoaXA7Cj4+ICsJY2hpcC0+bGVnYWN5LnJlYWRfYnVmICAgID0gbWEz
NV9yZWFkX2J1Zl9kbWE7Cj4+ICsJY2hpcC0+bGVnYWN5LndyaXRlX2J1ZiAgID0gbWEzNV93cml0
ZV9idWZfZG1hOwo+PiArCWNoaXAtPmxlZ2FjeS5kZXZfcmVhZHkgICA9IG1hMzVfbmFuZF9kZXZy
ZWFkeTsKPj4gKwljaGlwLT5sZWdhY3kuY2hpcF9kZWxheSAgPSAyNTsgLyogdXMgKi8KPj4gKwo+
PiArCS8qIFJlYWQgT09CIGRhdGEgZmlyc3QsIHRoZW4gSFcgcmVhZCBwYWdlICovCj4+ICsJY2hp
cC0+ZWNjLmh3Y3RsICAgICAgPSBtYTM1X25hbmRfZW5hYmxlX2h3ZWNjOwo+PiArCWNoaXAtPmVj
Yy5jYWxjdWxhdGUgID0gbWEzNV9uYW5kX2NhbGN1bGF0ZV9lY2M7Cj4+ICsJY2hpcC0+ZWNjLmNv
cnJlY3QgICAgPSBtYTM1X25hbmRfY29ycmVjdF9kYXRhOwo+PiArCWNoaXAtPmVjYy53cml0ZV9w
YWdlID0gbWEzNV9uYW5kX3dyaXRlX3BhZ2VfaHdlY2M7Cj4+ICsJY2hpcC0+ZWNjLnJlYWRfcGFn
ZSAgPSBtYTM1X25hbmRfcmVhZF9wYWdlX2h3ZWNjX29vYl9maXJzdDsKPj4gKwljaGlwLT5lY2Mu
cmVhZF9vb2IgICA9IG1hMzVfbmFuZF9yZWFkX29vYl9od2VjYzsKPj4gKwljaGlwLT5vcHRpb25z
IHw9IChOQU5EX05PX1NVQlBBR0VfV1JJVEUgfCBOQU5EX1VTRVNfRE1BKTsKPj4gKwo+PiArCW1h
MzVfbmFuZF9pbml0aWFsaXplKG5hbmQpOwo+PiArCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYs
IG5hbmQpOwo+PiArCj4+ICsJbmFuZC0+Y29udHJvbGxlci5vcHMgPSAmbWEzNV9uYW5kX2NvbnRy
b2xsZXJfb3BzOwo+PiArCj4+ICsJbmFuZC0+aXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAw
KTsKPj4gKwlpZiAobmFuZC0+aXJxIDwgMCkKPj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBk
ZXYtPmRldiwgbmFuZC0+aXJxLAo+PiArCQkJCSAgICAgImZhaWxlZCB0byBnZXQgcGxhdGZvcm0g
aXJxXG4iKTsKPj4gKwo+PiArCWlmIChyZXF1ZXN0X2lycShuYW5kLT5pcnEsIG1hMzVfbmFuZF9p
cnEsIElSUUZfVFJJR0dFUl9ISUdILCAibWEzNWQxLW5hbmQiLCBuYW5kKSkgewo+PiArCQlkZXZf
ZXJyKCZwZGV2LT5kZXYsICJFcnJvciByZXF1ZXN0aW5nIE5BTkQgSVJRXG4iKTsKPj4gKwkJcmV0
dXJuIC1FTlhJTzsKPj4gKwl9Cj4+ICsKPj4gKwlyZXR2YWwgPSBuYW5kX3NjYW4oY2hpcCwgMSk7
Cj4+ICsJaWYgKHJldHZhbCkKPj4gKwkJcmV0dXJuIHJldHZhbDsKPj4gKwo+PiArCWlmIChtdGRf
ZGV2aWNlX3JlZ2lzdGVyKG10ZCwgbmFuZC0+cGFydHMsIG5hbmQtPm5yX3BhcnRzKSkgewo+PiAr
CQluYW5kX2NsZWFudXAoY2hpcCk7Cj4+ICsJCWRldm1fa2ZyZWUoJnBkZXYtPmRldiwgbmFuZCk7
Cj4+ICsJCXJldHVybiByZXR2YWw7Cj4+ICsJfQo+PiArCj4+ICsJcmV0dXJuIHJldHZhbDsKPj4g
K30KPj4gKwo+PiArc3RhdGljIHZvaWQgbWEzNV9uYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQo+PiArewo+PiArCXN0cnVjdCBtYTM1X25hbmRfaW5mbyAqbmFuZCA9IHBs
YXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwo+PiArCXN0cnVjdCBuYW5kX2NoaXAgKmNoaXAgPSAm
bmFuZC0+Y2hpcDsKPj4gKwlpbnQgcmV0Owo+PiArCj4gV2hlcmUgZG8geW91IHJlbGVhc2UgSVJR
IGhhbmRsZXI/CgpJIHdpbGwgYWRkIGEgcmVsZWFzZSBJUlEgaGFuZGxlciB0byB0aGlzIGZ1bmN0
aW9uLgoKCgo+PiArCXJldCA9IG10ZF9kZXZpY2VfdW5yZWdpc3RlcihuYW5kX3RvX210ZChjaGlw
KSk7Cj4+ICsJV0FSTl9PTihyZXQpOwo+PiArCW5hbmRfY2xlYW51cChjaGlwKTsKPj4gKwo+PiAr
CWNsa19kaXNhYmxlX3VucHJlcGFyZShuYW5kLT5jbGspOwo+PiArCj4+ICsJa2ZyZWUobmFuZCk7
Cj4gTkFLLCB5b3UgbmV2ZXIgdGVzdGVkIHlvdXIgY29kZS4KCkkgd2lsbCBzdHJlbmd0aGVuIHRo
ZSB0ZXN0aW5nIG9mIHRoaXMgZnVuY3Rpb24uCgoKCj4+ICsJcGxhdGZvcm1fc2V0X2RydmRhdGEo
cGRldiwgTlVMTCk7Cj4gV2h5PyBEcm9wLgoKSSB3aWxsIHJlbW92ZSBpdC4KCgoKPj4gK30KPj4g
Kwo+PiArLyogUE0gU3VwcG9ydCAqLwo+PiArI2lmZGVmIENPTkZJR19QTQo+PiArc3RhdGljIGlu
dCBtYTM1X25hbmRfc3VzcGVuZChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LCBwbV9tZXNz
YWdlX3QgcG0pCj4+ICt7Cj4+ICsJc3RydWN0IG1hMzVfbmFuZF9pbmZvICpuYW5kID0gcGxhdGZv
cm1fZ2V0X2RydmRhdGEocGRldik7Cj4+ICsJdW5zaWduZWQgbG9uZyB0aW1lbyA9IGppZmZpZXMg
KyBIWi8yOwo+PiArCj4+ICsJLyogd2FpdCBETUFDIHRvIHJlYWR5ICovCj4+ICsJd2hpbGUgKDEp
IHsKPj4gKwkJaWYgKChyZWFkbChuYW5kLT5yZWdzICsgTUEzNV9ORklfUkVHX0RNQUNUTCkgJiBE
TUFfQlVTWSkgPT0gMCkKPj4gKwkJCWJyZWFrOwo+PiArCQlpZiAodGltZV9hZnRlcihqaWZmaWVz
LCB0aW1lbykpCj4+ICsJCQlyZXR1cm4gLUVUSU1FRE9VVDsKPj4gKwl9Cj4+ICsKPj4gKwljbGtf
ZGlzYWJsZShuYW5kLT5jbGspOwo+PiArCj4+ICsJcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gK3N0
YXRpYyBpbnQgbWEzNV9uYW5kX3Jlc3VtZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+
PiArewo+PiArCXN0cnVjdCBtYTM1X25hbmRfaW5mbyAqbmFuZCA9IHBsYXRmb3JtX2dldF9kcnZk
YXRhKHBkZXYpOwo+PiArCj4+ICsJY2xrX2VuYWJsZShuYW5kLT5jbGspOwo+PiArCW1hMzVfbmFu
ZF9od2VjY19pbml0KG5hbmQpOwo+PiArCW1hMzVfbmFuZF9kbWFjX2luaXQobmFuZCk7Cj4+ICsK
Pj4gKwlyZXR1cm4gMDsKPj4gK30KPj4gKwo+PiArI2Vsc2UKPj4gKyNkZWZpbmUgbWEzNV9uYW5k
X3N1c3BlbmQgTlVMTAo+PiArI2RlZmluZSBtYTM1X25hbmRfcmVzdW1lIE5VTEwKPj4gKyNlbmRp
Zgo+PiArCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtYTM1X25maV9vZl9t
YXRjaFtdID0gewo+PiArCXsgLmNvbXBhdGlibGUgPSAibnV2b3RvbixtYTM1ZDEtbmFuZCIgfSwK
Pj4gKwl7fSwKPj4gK307Cj4+ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtYTM1X25maV9vZl9t
YXRjaCk7Cj4+ICsKPj4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG1hMzVfbmFuZF9k
cml2ZXIgPSB7Cj4+ICsJCS5kcml2ZXIgPSB7Cj4gTWVzc2VkIGluZGVudGF0aW9uLgoKSSB3aWxs
IGZpeCBpdC4KCgoKPj4gKwkJLm5hbWUgICA9ICJtYTM1ZDEtbmFuZCIsCj4+ICsJCS5vd25lciAg
PSBUSElTX01PRFVMRSwKPiBEcm9wLiBQbGVhc2UgZG8gbm90IHVwc3RyZWFtIHNvbWUgMTAgeWVh
ciBvbGQgY29kZS4uLiBVc2UgcmVjZW50IGNvZGUgYXMKPiB0ZW1wbGF0ZSwgbm90IDEweW8gc3R1
ZmYuLi4KCkkgd2lsbCByZWZlciB0byB0aGUgbmV3IGRyaXZlciBpbXBsZW1lbnRhdGlvbi4KCgoK
PiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCgoKQmVzdCByZWdhcmRzLAoKSHVpLVBpbmcgQ2hl
bgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
