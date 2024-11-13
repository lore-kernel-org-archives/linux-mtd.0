Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DF9D597C5
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2024 02:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qeG6Rxv0+UGDJyYyFxS75YKj0jEX9oJR264ebt9XPUs=; b=InhaXnnWVaVa1I
	ZgUMItoEcMHr028m3teWY7lZox2tIlDmtM5ejBGUId62+ceaulv+BE/iDHTwZC6hyxzuH7HEigFr2
	3VwXZ4575ahdimHent9LM0QwqH+8/COmiO/Nb7ZUtgCFJSgiDmVDWs699fcwSJzMDc6ncAhBJhd2q
	Vhz6FkHimuj+oHBkgxt8t/B+EJwvtMQClUltcGuEg7nnspi9jIcfVHvvHl1ymosAxSB++k91/n4yR
	8uMR92Yc+VcYWmMhaMLlhp4H1g8GXL0RaoLG+yz3C4gkB/Q5EcLjK7QmDxh66Or7SZe+DQpbKeeef
	1zrN4gzZLn8zdGXFM7ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB2m6-00000005ZXJ-0Iqh;
	Wed, 13 Nov 2024 02:06:30 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB2m3-00000005ZWt-11JX
	for linux-mtd@lists.infradead.org;
	Wed, 13 Nov 2024 02:06:28 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-71e52582cf8so5087535b3a.2
        for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2024 18:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731463586; x=1732068386; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1irtfw9tpzz3Mtjfgfxz+mihqcjGrB5D0OgRFdzO7Ck=;
        b=XNtDz5W1ZjdDYxeLNu6sy0vPQdrJ6GiVojzaiBkl6i5xGyTv6KxZ0Hqocxu7p+Vsvx
         x0ZA0s/P55w46VvZSZOh89Yz8OwhknpGM9wcmAkRbMwmvtL4MOz2gaQbuqdtz5aPci5Z
         ISfUb/GyvYtjWoeL8K9CUAzMzYFFXC/ch4SlawyFKHf9oyNYJct7bEn2ccl2hw+eGkOE
         07HqSdXCWpoOiBHlJTPTJMR98Qqrmcs3sQ1ZEA90i/x47/veFaRvHh/CGyD2yfjFB0ti
         rpaFv5jLAgp5ayGrsxX9z8uKt3B/hxfIv5lySLK4N2KWK47QJA2DYah6QbO6lLG68MEy
         Y2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731463586; x=1732068386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1irtfw9tpzz3Mtjfgfxz+mihqcjGrB5D0OgRFdzO7Ck=;
        b=bDQyLDRyZnSK3ETdq8MwHo+leG9I9gp9Yviu2IwsliD9bljFkv53AN4FatmJlAQkfx
         S/vxen503NeucCuuMpyg/xgDmRZfolJQ41VXKOE9LJjAUTuuB6p80oX1V7Pe/HDnQunZ
         E4qh+Gg8z2qhku1hn7ErZvgWOFa8ZQWY7Zt7kHurZpOLN2f0C16FWDXmMlFXT8sVlFbY
         ucMYiwPhdAZyW3Ltn0eFioBFvViBiqXCQoNY9f7Vq3aHMVVukDJ4DnzIFlxzR2njMPEj
         EztIWEWe1q35flgFETljY0sTnLyc/RhtKwpu/swte3x912FhSyJ2ZYppJzx6PflUgJnQ
         SyWw==
X-Gm-Message-State: AOJu0Yyjpizrv46/PxE9fBbzwdngkkjmX+P9tA3EsYEBHdtA0Np+fZfh
	BYKaZIMHXemwvmGG4EeN6tBHYpP/OvHIYBavJ2LCA8J4BccGa8Ko
X-Google-Smtp-Source: AGHT+IEmtYoD1KY0RjcZLF7QyXEvuw4tYF7HTMbefttqN+jkhQ9M9SoAQuR4gyFPZw5eRDWWSPKjMQ==
X-Received: by 2002:a05:6a00:39a4:b0:71e:14c:8d31 with SMTP id d2e1a72fcca58-72413362f42mr26138753b3a.16.1731463585773;
        Tue, 12 Nov 2024 18:06:25 -0800 (PST)
Received: from [192.168.0.7] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a56a4asm12317556b3a.187.2024.11.12.18.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 18:06:25 -0800 (PST)
Message-ID: <baeab3bf-fedf-4258-84d6-a0c53cb59ef0@gmail.com>
Date: Wed, 13 Nov 2024 11:06:21 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mtd: spinand: Introduce a way to avoid raw access
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, richard@nod.at, vigneshr@ti.com,
 tudor.ambarus@linaro.org, pratyush@kernel.org, mwalle@kernel.org,
 kr.kim@skyhighmemory.com, zhi.feng@skyhighmemory.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1730340421.git.Takahiro.Kuwano@infineon.com>
 <81c9caf04c94cba1a5ae4ba79dd09e0789583fcd.1730340421.git.Takahiro.Kuwano@infineon.com>
 <87bjylsirs.fsf@bootlin.com>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <87bjylsirs.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_180627_306417_C0C38EDA 
X-CRM114-Status: GOOD (  18.93  )
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

SGksCgpPbiAxMS8xMi8yMDI0IDM6NTQgQU0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGksCj4g
Cj4gT24gMzEvMTAvMjAyNCBhdCAxMToyMTo1NCArMDksIHRrdXc1ODQ5MjRAZ21haWwuY29tIHdy
b3RlOgo+IAo+PiBGcm9tOiBUYWthaGlybyBLdXdhbm8gPFRha2FoaXJvLkt1d2Fub0BpbmZpbmVv
bi5jb20+Cj4+Cj4+IFNreUhpZ2ggc3BpbmFuZCBkZXZpY2UgaGFzIEVDQyBlbmFibGUgYml0IGlu
IGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXIgYnV0Cj4+IGl0IG11c3QgYmUgYWx3YXlzIGVuYWJsZWQu
IElmIEVDQyBpcyBkaXNhYmxlZCwgcmVhZCBhbmQgd3JpdGUgb3BzCj4+IHJlc3VsdHMgaW4gdW5k
ZXRlcm1pbmVkIHN0YXRlLiBGb3Igc3VjaCBkZXZpY2VzLCBhIHdheSB0byBhdm9pZCByYXcKPj4g
YWNjZXNzIGlzIG5lZWRlZC4KPj4KPj4gSW50cm9kdWNlIFNQSU5BTkRfTk9fUkFXX0FDQ0VTUyBm
bGFnIHRvIGFkdmVydGlzZSB0aGUgZGV2aWNlIGRvZXMgbm90Cj4+IHN1cHBvcnQgcmF3IGFjY2Vz
cy4gUmVhZCBhbmQgd3JpdGUgcGFnZSBpbiByYXcgbW9kZSBmb3IgdGhlIGRldmljZQo+PiByZXR1
cm5zIGVycm9yLgo+Pgo+PiBDaGVja2luZyBhbmQgbWFya2luZyBCQk0gbmVlZCB0byBiZSBwZXJm
b3JtZWQgd2l0aCBFQ0MgZW5hYmxlZCB0byByZWFkCj4+IGFuZCB3cml0ZSB0aGUgQkJNIGNvcnJl
Y3RseS4KPiAKPiBJIHNlZSB5b3VyIHBvaW50IGJ1dCBJJ20gYSBiaXQgcHV6emxlZCBieSBob3cg
aXQncyBiZWluZyBkb25lLgo+IAo+IEZpcnN0LCB5b3UgZGlzcmVnYXJkIGNvbXBsZXRlbHkgdGhl
IGlzYmFkKCkgYW5kIG1hcmtiYWQoKQo+IHNpdHVhdGlvbnMuIFBsZWFzZSBoYXZlIGxvb2sgaW50
byB0aGF0IGJlY2F1c2UgdGhlc2UgZnVuY3Rpb25zIGFyZQo+IGJyb2tlbiB3aXRoIHlvdXIgZGV2
aWNlcy4KPiAKWWVzLi4uIG5vdyBJIHVuZGVyc3RhbmQgaG93IHRoZXkgYXJlIGJyb2tlbi4KCj4g
U2Vjb25kLCB3aGF0IGFib3V0IGFkZGluZyB0aGlzIGRldGFpbCB0byB0aGUgb25kaWUgRUNDIGVu
Z2luZT8gWW91IGNvdWxkCj4gc2ltcGx5IHJldHVybiBhbiBlcnJvciBmcm9tIHRoZXJlLCBzbyBi
YXNpY2FsbHkgYSBzaW5nbGUgKG9yIG1heWJlIHR3bykKPiBjaGFuZ2VzIG92ZXJhbGwuCj4gClRo
YW5rIHlvdSBmb3IgdGhlIHN1Z2dlc3Rpb24uCkhvdyBhYm91dCBjaGFuZ2UgbGlrZSBiZWxvdyBp
biBwcmVwYXJlX2ZpbmlzaF9pb19yZXEoKT8KCnN0YXRpYyBpbnQgc3BpbmFuZF9vbmRpZV9lY2Nf
cHJlcGFyZV9pb19yZXEoc3RydWN0IG5hbmRfZGV2aWNlICpuYW5kLAoJCQkJCSAgICBzdHJ1Y3Qg
bmFuZF9wYWdlX2lvX3JlcSAqcmVxKQp7CglzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQg
PSBuYW5kX3RvX3NwaW5hbmQobmFuZCk7Cglib29sIGVuYWJsZSA9IChyZXEtPm1vZGUgIT0gTVRE
X09QU19SQVcpOwoKKwkvKgorCSAqIEZvciB0aGUgZGV2aWNlcyB0aGF0IHByb2hpYml0IHJhdyBh
Y2Nlc3MgKG9uLWRpZSBFQ0MgbXVzdCBiZSBhbHdheXMKKwkgKiBlbmFibGVkKSwgcmV0dXJuIGVy
cm9yIGluIGNhc2Ugb2YgcmF3IGRhdGEgYWNjZXNzLiBBY2Nlc3NpbmcgdG8gT09CCisJICogbmVl
ZHMgdG8gYmUgYWxsb3dlZCB3aXRoIG9uLWRpZSBFQ0MgZW5hYmxlZCB0byBzdXBwb3J0IEJCTSBj
aGVja2luZworCSAqIGFuZCBtYXJraW5nLgorCSAqLworCWlmICghZW5hYmxlICYmIHNwaW5hbmQt
PmZsYWdzICYgU1BJTkFORF9OT19SQVdfQUNDRVNTKSB7CisJCWlmIChyZXEtPmRhdGFsZW4pCisJ
CQlyZXR1cm4gLUVOT1RTVVBQOworCisJCWVuYWJsZSA9IHRydWU7CisJfQouLi4KCj4gVGhhbmtz
LAo+IE1pcXXDqGwKClRoYW5rcyEKVGFrYWhpcm8KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
