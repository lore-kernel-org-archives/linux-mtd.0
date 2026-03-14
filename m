Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C9310854B3
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Mar 2026 22:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X0IvAOCo+/1hkcq20/3o7ZARMJZw5RcXjrWLJH1ueiY=; b=fb118Qz9HO0lUq
	rOzG8or4+egGwDHuLriNCapRCdwqpo6O6zYlL+qKcrbWCm70ttq09GVDB+cpiO+YUfmab+KAWkqxO
	jhXbWqY9vzuzy/B3mS+wBKFfUVaMpbPEDd5fP/Gq79Elev+cX9wp11x+EUclVF8m4s35xDSUw92eA
	cFONzCYJg2+qMAVmSKdTjfvNRstHDMC8CwusN8PQbS0qpnSDjWDR5ohlta1v1jud/KfUM0QnO2prm
	os2SgvFZdPPKZ1n5YovxqDve0KTDvx2bC83JDd9v+LFeqtnVGy6wigU840rcNXtqisGKXuEE5a0sm
	NgXZNBYRKwEcChm59Eiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1XYK-00000002DMv-2tgr;
	Sat, 14 Mar 2026 22:33:48 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1XYI-00000002DMV-0pvT
	for linux-mtd@lists.infradead.org;
	Sat, 14 Mar 2026 22:33:47 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-89a06bc2f1bso59583726d6.1
        for <linux-mtd@lists.infradead.org>; Sat, 14 Mar 2026 15:33:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773527624; cv=none;
        d=google.com; s=arc-20240605;
        b=Yj9iiM+j5FZeryXw09uwmyS3n53tjuEcRf9DIyHTci/Kpj1FhlXR2AbeKaSPHBpeIp
         nsHgxmjriG9rSgUZwfRD4bAXlHc+6d6ogEkpW8gzFPigGqWhLINN51kIPXdQvESShaIy
         ZhtMTCCZCaKTYTFAJL5BvqI7/bNqjJjkh3naVliMpW+pESKe/WLvorxdglzaTEkM/6E2
         edrKH1Jv5l/rJA0kknbr2aCDbJMlMwxCaip+nMOFgtpyqmHfLM2aoNYcHAcnCHlhbCbh
         bYms1APaJ0ieqy/59TqWWgEnD3L1CRp8DNtevKXls/ZyEcrv8mveSj0rCDJ3XH6gjdqa
         uolA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NCNelLc6J1xbQhY/ayfsJNvzCyqOjOrjb0ZeaC/VMlA=;
        fh=coygkkvTrIuvK9STaNXc7a6eyl33KxgGr1j04dqQcaM=;
        b=YU5PCoMsg7MEbef1rhXzAlVcsOFRkp+GZqMiDfsLvVMOBWIadsu0hovdApNQRpl25A
         3kvBffY8LunU8g5QNm4d3IOkzLs0WB4oyow5yJRuyKXLYHqkfE2EuFhws3Pp5FRIh8jy
         Pg2Xmd095olUBJschD/cmweJHLThr0D0c59F5PnZ7tM31V4bVueUQr/jsbNUewxhNcHt
         2Aq/atJYYwoPh8C3B1asgFKpeDDFv36v9K8SON6SDW72jRFkhqkNNA5paRXO4ML6sgDY
         rwNoeXTvbtDfXlpJvTtn2knGO3QkfaFRRpReuU2He0YodNb+ZfbNj08QxBOPreOtIE3g
         HKvA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773527624; x=1774132424; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCNelLc6J1xbQhY/ayfsJNvzCyqOjOrjb0ZeaC/VMlA=;
        b=enMI1R/eycqr/gbHqkm/vgbOrC37lONPYRisWQGinMEYlgaH0ECdSYHp+QM4VWXDhv
         y2vxLb39iss5p40PjL606HUKkAVNXe6adYoN6dzV66D/0mMI74fAieSibjq4BsV5zZva
         XLbE4o6/MSg7rlA95B+KGFratN9Ma+lVr9oRPD9uEh3So2PL0kGqFmt3tXQHfmeRZPQx
         56FMb41FAxTzPsFG2NhhJT7DMlcP5NUEPxRPJACw80Pr/9kLJixPzQKkGpjfrlgXzUNz
         mwgw9bIMqo3PTb1xper20jcWrcBFvCnJe+uU/EE6Q79K4marzz27V7jCOO8Kc+pi9EfI
         /DcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773527624; x=1774132424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NCNelLc6J1xbQhY/ayfsJNvzCyqOjOrjb0ZeaC/VMlA=;
        b=L6a53Bx62INNKjFZ+vIqgxCkReqES2FKVVK47nz1SDa9nAT63/3oBIeOSvODfKQRve
         eUZ0WeY+qfsiCnDWgo4MyBAOGn6axlQtqVFcqn0+xTFvhI6x2iPSrqlJLy6jwaNzedoF
         iPRyyGV1pRXMMzfo+02nkjBNOTP98hlU5/FG562dPrxh+I8o+oUShTcUL8opYcowSDMV
         xUitEZ/i1QPSdc7Sdxxojf++h4dNkhkv1+T3OX9FI9K+c68zZO3lp+tpf4MO7HbvRc0W
         dSGr8+Uo10oRx8SihrK6kuXFvTQDGfqrmkn5WWWp092q8x0fapdffdxEgz3GdqxbaFyN
         ZfkA==
X-Forwarded-Encrypted: i=1; AJvYcCW+MXkSfjszIUMRyxr54TWtBRvnSwGdWh9KqqK0D304XHzXiovnact9Swqp1E/aIs7j2znKM2th8w0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwcNRv7jyNGKTQ53/zMD3AYujL/sHh/NjRNDEHi6DrwMm5MbaM8
	YS9iSRMDAgszJ2cl4rwgfaznmatdAYmWSRbs2TEi8GEf1EF6cNHmG6phuoZeTElesF7HGF6uKiQ
	A06xP6E32tnzLOK/2INTTswXjm89S4Bs=
X-Gm-Gg: ATEYQzwhc2x1kaAtHALGklYdOVcc7dsreiAjBR8ArRiJpQ+VtcvdvOwUNJwTJ54s/U7
	1nrH0L/yxC0eDPr6OnrqzqNGmckYgSL4voH/v/bSP4sn0Iru6teiMfF7rWfDbjfp6eO+f+s5Aod
	ev9SEAQf42PVsXolgiiLl20270488gPwTK+imtZF9+SCpHqDm9Zyf8V2aQCclVOqoGzQtuSRZ50
	OjM1qrXm9D+iMHYoZLDCpMp2xGLtr3kLF9wi5XxLssjiCgg+WtfoOMiWmYV4wF8kKPzhEUKbrlh
	6v9sxoc=
X-Received: by 2002:a05:6214:27c3:b0:89a:1602:8b08 with SMTP id
 6a1803df08f44-89a81d32867mr127315796d6.10.1773527624493; Sat, 14 Mar 2026
 15:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260313222213.2181408-1-qguanni@gmail.com> <3fa4d791-4520-0e6d-d657-89d6fc4ba5cb@huawei.com>
In-Reply-To: <3fa4d791-4520-0e6d-d657-89d6fc4ba5cb@huawei.com>
From: Guanni Qu <qguanni@gmail.com>
Date: Sat, 14 Mar 2026 15:33:33 -0700
X-Gm-Features: AaiRm51WhLkj8IQ7YUk-SGqc370QxPvXR-qFKQBJ5dYZIpmiY-hghmWoD9buP08
Message-ID: <CAFzOa17BR=bYZNZnS6PmHcegWgzY0frVwfCaWsxrEG0aCmr+hw@mail.gmail.com>
Subject: Re: [PATCH] ubifs: fix out-of-bounds write in LPT commit padding
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: richard@nod.at, linux-mtd@lists.infradead.org, klaudia@vidocsecurity.com, 
	dawid@vidocsecurity.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_153346_251423_47F56142 
X-CRM114-Status: GOOD (  25.45  )
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

SGkgWmhpaGFvLAoKWW91J3JlIHJpZ2h0LiAnZnJvbScgaXMgYWx3YXlzIGVpdGhlciAwIG9yIGMt
Pm5oZWFkX29mZnMsIHdoaWNoIGlzCkFMSUdOKG9mZnMsIGMtPm1pbl9pb19zaXplKSAobGluZSA1
MjQpLiBTaW5jZSBsZWJfc2l6ZSBpcyBhbHNvIGEKbXVsdGlwbGUgb2YgbWluX2lvX3NpemUsIGZy
b20gKyBhbGVuIGNhbiBuZXZlciBleGNlZWQgbGViX3NpemUuCgpNeSB2YWxpZGF0aW9uIHVzZWQg
YXJ0aWZpY2lhbCB2YWx1ZXMgdGhhdCBkb24ndCBvY2N1ciBpbiByZWFsCmV4ZWN1dGlvbi4gSSds
bCB3aXRoZHJhdyB0aGlzIHBhdGNoLgoKQXBvbG9naWVzIGZvciB0aGUgbm9pc2UuCgpKZW5ueQoK
T24gRnJpLCBNYXIgMTMsIDIwMjYgYXQgNzoxNeKAr1BNIFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGlo
YW8xQGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4g5ZyoIDIwMjYvMy8xNCA2OjIyLCBKZW5ueSBHdWFu
bmkgUXUg5YaZ6YGTOgo+ID4gSW4gd3JpdGVfY25vZGVzKCksIHdoZW4gd3JpdGluZyBMUFQgZGF0
YSB0byBhIExFQiwgdGhlIGNvZGUgcGFkcyB0aGUKPiA+IHdyaXRlIGJ1ZmZlciB0byBtaW5faW9f
c2l6ZSBhbGlnbm1lbnQgdXNpbmc6Cj4gPgo+ID4gICAgICBtZW1zZXQoYnVmICsgb2ZmcywgMHhm
ZiwgYWxlbiAtIHdsZW4pCj4gPgo+ID4gd2hlcmUgd2xlbiA9IG9mZnMgLSBmcm9tIGFuZCBhbGVu
ID0gQUxJR04od2xlbiwgbWluX2lvX3NpemUpLiBUaGUKPiA+IGJ1ZmZlciAoYy0+bHB0X2J1Zikg
aXMgYWxsb2NhdGVkIHdpdGggc2l6ZSBjLT5sZWJfc2l6ZS4gV2hlbiBvZmZzIGlzCj4gPiBuZWFy
IGxlYl9zaXplIGFuZCBmcm9tIGlzIG5vbi16ZXJvLCB0aGUgYWxpZ25tZW50IHBhZGRpbmcgY2Fu
IHB1c2gKPiA+IHRoZSBtZW1zZXQgcGFzdCB0aGUgZW5kIG9mIHRoZSBidWZmZXIuCj4gPgo+ID4g
Rm9yIGV4YW1wbGUsIHdpdGggbGViX3NpemU9NDA5Niwgb2Zmcz00MDAwLCBmcm9tPTM1ODQsIG1p
bl9pb19zaXplPTEwMjQ6Cj4gPiAgICB3bGVuPTQxNiwgYWxlbj0xMDI0LCBwYWRkaW5nPTYwOCBi
eXRlcyBhdCBvZmZzZXQgNDAwMAo+ID4gICAgd3JpdGVzIHRvIG9mZnNldHMgNDAwMC4uNDYwNywg
NTEyIGJ5dGVzIHBhc3QgdGhlIDQwOTYtYnl0ZSBidWZmZXIKPiBIaSwgR3Vhbm5pCj4gSG93IGRv
ZXMgJ2Zyb20nIGJlY29tZSAnMzU4NCcod2hpY2ggaXMgbm90IGFsaWduZWQgd2l0aCBtaW5faW9f
c2l6ZVsxMDI0XSk/Cj4gQXMgZmFyIGFzIEkga25vdywgdGhlICdmcm9tJyBjb21lcyBmcm9tICdj
LT5uaGVhZF9vZmZzJywgd2hpY2ggaXMgYWx3YXlzCj4gYWxpZ25lZCB3aXRoIG1pbl9pb19zaXpl
Lgo+ID4KPiA+IENsYW1wIHRoZSBwYWRkaW5nIHNpemUgdG8gbm90IGV4Y2VlZCB0aGUgYnVmZmVy
IGJvdW5kYXJ5IGluIGFsbCA0Cj4gPiBpbnN0YW5jZXMgb2YgdGhpcyBwYXR0ZXJuLgo+ID4KPiA+
IFRoZSBPT0Igd3JpdGUgd2FzIGNvbmZpcm1lZCB3aXRoIEtBU0FOIHVzaW5nIGEgdGVzdCBtb2R1
bGUgdGhhdAo+ID4gcmVwcm9kdWNlcyB0aGUgYXJpdGhtZXRpYyB3aXRoIG1hdGNoaW5nIGJ1ZmZl
ciBhbmQgYWxpZ25tZW50IHZhbHVlcy4KPiA+Cj4gPiBGaXhlczogMWU1MTc2NGEzYzJhICgiVUJJ
RlM6IGFkZCBuZXcgZmxhc2ggZmlsZSBzeXN0ZW0iKQo+ID4gUmVwb3J0ZWQtYnk6IEtsYXVkaWEg
S2xvYyA8a2xhdWRpYUB2aWRvY3NlY3VyaXR5LmNvbT4KPiA+IFJlcG9ydGVkLWJ5OiBEYXdpZCBN
b2N6YWTFgm8gPGRhd2lkQHZpZG9jc2VjdXJpdHkuY29tPgo+ID4gVGVzdGVkLWJ5OiBKZW5ueSBH
dWFubmkgUXUgPHFndWFubmlAZ21haWwuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogSmVubnkgR3Vh
bm5pIFF1IDxxZ3Vhbm5pQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gICBmcy91Ymlmcy9scHRfY29t
bWl0LmMgfCA4ICsrKystLS0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL2xwdF9jb21taXQu
YyBiL2ZzL3ViaWZzL2xwdF9jb21taXQuYwo+ID4gaW5kZXggMDczNTFmZGNlNzIyLi43N2E3YTJj
ZDQxOGYgMTAwNjQ0Cj4gPiAtLS0gYS9mcy91Ymlmcy9scHRfY29tbWl0LmMKPiA+ICsrKyBiL2Zz
L3ViaWZzL2xwdF9jb21taXQuYwo+ID4gQEAgLTQwMiw3ICs0MDIsNyBAQCBzdGF0aWMgaW50IHdy
aXRlX2Nub2RlcyhzdHJ1Y3QgdWJpZnNfaW5mbyAqYykKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICB3bGVuID0gb2ZmcyAtIGZyb207Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgaWYgKHdsZW4p
IHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFsZW4gPSBBTElHTih3bGVuLCBj
LT5taW5faW9fc2l6ZSk7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtZW1zZXQo
YnVmICsgb2ZmcywgMHhmZiwgYWxlbiAtIHdsZW4pOwo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbWVtc2V0KGJ1ZiArIG9mZnMsIDB4ZmYsIG1pbl90KGludCwgYWxlbiAtIHdsZW4s
IGMtPmxlYl9zaXplIC0gb2ZmcykpOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZXJyID0gdWJpZnNfbGViX3dyaXRlKGMsIGxudW0sIGJ1ZiArIGZyb20sIGZyb20sCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFsZW4pOwo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGVycikKPiA+IEBAIC00NjEsNyAr
NDYxLDcgQEAgc3RhdGljIGludCB3cml0ZV9jbm9kZXMoc3RydWN0IHViaWZzX2luZm8gKmMpCj4g
PiAgICAgICAgICAgICAgIGlmIChvZmZzICsgYy0+bHNhdmVfc3ogPiBjLT5sZWJfc2l6ZSkgewo+
ID4gICAgICAgICAgICAgICAgICAgICAgIHdsZW4gPSBvZmZzIC0gZnJvbTsKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICBhbGVuID0gQUxJR04od2xlbiwgYy0+bWluX2lvX3NpemUpOwo+ID4gLSAg
ICAgICAgICAgICAgICAgICAgIG1lbXNldChidWYgKyBvZmZzLCAweGZmLCBhbGVuIC0gd2xlbik7
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgbWVtc2V0KGJ1ZiArIG9mZnMsIDB4ZmYsIG1pbl90
KGludCwgYWxlbiAtIHdsZW4sIGMtPmxlYl9zaXplIC0gb2ZmcykpOwo+ID4gICAgICAgICAgICAg
ICAgICAgICAgIGVyciA9IHViaWZzX2xlYl93cml0ZShjLCBsbnVtLCBidWYgKyBmcm9tLCBmcm9t
LCBhbGVuKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBpZiAoZXJyKQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGVycjsKPiA+IEBAIC00ODcsNyArNDg3LDcgQEAg
c3RhdGljIGludCB3cml0ZV9jbm9kZXMoc3RydWN0IHViaWZzX2luZm8gKmMpCj4gPiAgICAgICAg
ICAgICAgIGlmIChvZmZzICsgYy0+bHRhYl9zeiA+IGMtPmxlYl9zaXplKSB7Cj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgd2xlbiA9IG9mZnMgLSBmcm9tOwo+ID4gICAgICAgICAgICAgICAgICAg
ICAgIGFsZW4gPSBBTElHTih3bGVuLCBjLT5taW5faW9fc2l6ZSk7Cj4gPiAtICAgICAgICAgICAg
ICAgICAgICAgbWVtc2V0KGJ1ZiArIG9mZnMsIDB4ZmYsIGFsZW4gLSB3bGVuKTsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICBtZW1zZXQoYnVmICsgb2ZmcywgMHhmZiwgbWluX3QoaW50LCBhbGVu
IC0gd2xlbiwgYy0+bGViX3NpemUgLSBvZmZzKSk7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ZXJyID0gdWJpZnNfbGViX3dyaXRlKGMsIGxudW0sIGJ1ZiArIGZyb20sIGZyb20sIGFsZW4pOwo+
ID4gICAgICAgICAgICAgICAgICAgICAgIGlmIChlcnIpCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gZXJyOwo+ID4gQEAgLTUxMCw3ICs1MTAsNyBAQCBzdGF0aWMgaW50
IHdyaXRlX2Nub2RlcyhzdHJ1Y3QgdWJpZnNfaW5mbyAqYykKPiA+ICAgICAgIC8qIFdyaXRlIHJl
bWFpbmluZyBkYXRhIGluIGJ1ZmZlciAqLwo+ID4gICAgICAgd2xlbiA9IG9mZnMgLSBmcm9tOwo+
ID4gICAgICAgYWxlbiA9IEFMSUdOKHdsZW4sIGMtPm1pbl9pb19zaXplKTsKPiA+IC0gICAgIG1l
bXNldChidWYgKyBvZmZzLCAweGZmLCBhbGVuIC0gd2xlbik7Cj4gPiArICAgICBtZW1zZXQoYnVm
ICsgb2ZmcywgMHhmZiwgbWluX3QoaW50LCBhbGVuIC0gd2xlbiwgYy0+bGViX3NpemUgLSBvZmZz
KSk7Cj4gPiAgICAgICBlcnIgPSB1Ymlmc19sZWJfd3JpdGUoYywgbG51bSwgYnVmICsgZnJvbSwg
ZnJvbSwgYWxlbik7Cj4gPiAgICAgICBpZiAoZXJyKQo+ID4gICAgICAgICAgICAgICByZXR1cm4g
ZXJyOwo+ID4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
