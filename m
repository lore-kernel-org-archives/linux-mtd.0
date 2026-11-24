Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1475B606A682
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2026 16:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VeKUeAI/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Xv7VcA5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h6N6LrS5Ch+My1L3ZpiL5pjMvSphXuz8V8e3ka6iUxc=; b=VeKUeAI/dJckiX44ZIoN+jD5tI
	AYxAVQ803IYZRd1xGl38d1t1A6y69qgxyqd2bEvZNMcOPPM/XeDdNqjAlqJKZlyy+i+eMb7HiuQKM
	hz03dQvYXYMwvoOispKmOQOgrBFaOp3hHOOFeRQIk3PXhjJHF6sGVVvMguWvks/KyyVbH3ohFrFEJ
	j8rgRAequBPIsBry8rl96a3byPjAADdRRNmg6i1XBo23alcHJDCocIXdwaeo5GBwouysg577dRq0p
	isvdciuqnrDzyiN1+X2AsTvYFiuIM06wcbNV3FLc483XxlizSCYgdhqK2xPTRxFgIIK2DvwoGCD0A
	eKR8w4sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtQT-000000077QM-0vxz;
	Tue, 24 Nov 2026 16:31:25 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtQO-000000077OV-0u0c
	for linux-mtd@lists.infradead.org;
	Tue, 24 Nov 2026 16:31:24 +0000
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-7d2da1667b2so2920479137.2
        for <linux-mtd@lists.infradead.org>; Tue, 24 Nov 2026 08:31:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795537878; cv=none;
        d=google.com; s=arc-20260327;
        b=gxT8IYGP8Pievo5JzjgSS92ZDHGsb6zCqpazeZN2N7gPU3ktEUOo+tGMzcxHIOmjNF
         wTQwbGzkgWKHJP3UuekfAyzURQ8Nnu8wbeEOShknXUQE1/JEbycE5EAwsah5x38GRvg3
         ZH9X7bOTQmEzK68Y/5ULg4ccmPtqiTa/4m2fVB3XKeaj/hKAUSmzPw7d3SSOswdx5y7L
         6BJwiL4TPIrnacV8tktBJKNuL6DpIsmpGtqWUvR00boWO6B5+U0ZkUQSgRU5KP8jnj7B
         fr63QBJQwrv28s59UNkumL5AcnKUnUQ2BzxpD95C8D5+Fq25NG/bjzPpRlUgTW/x+ERM
         FM3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wbz5MHgrotvmvS234Ul0ZoF8Ky6iZRkQglERKXzkxJE=;
        fh=raXexZi+pRy4glLZnpm22yTVATncUrRCrK5adLsY4eY=;
        b=ejkKr8aVpbmuFqGDqaMm1cZtJDyHNNjio+IMeOU6L6YpV3M6Avf7OT+rKny/C0WcCh
         Gtg4TwAa43HBv9oY6z4Z4abCaS4fQZUICkKLHG1SkIV38YIuXvahA6VIeO1fj01iJDTn
         NXqXb3mtp0cE3jE5E4gAyePH8du9ddTEwOTUJCyxjnHg6tph7ETBQQhiqwVkwh5+6M/e
         I3cn8HxyeG6nhRxj/rc/x7BNne1Y3EhbjiEF5wCFRkw+Ul3V8bQI4cn6Ne+DPEGpOn1C
         WfIQs8lXMZy18E+Vp/3JO7XBKfszSQwRj18IZDDVbfVeZ2FZXgK7CWIu8e9+V8n5ZbUF
         YspA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795537878; x=1796142678; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wbz5MHgrotvmvS234Ul0ZoF8Ky6iZRkQglERKXzkxJE=;
        b=0Xv7VcA5aZWVHugnue3UBzcw3IwQoyfCfjsT/yG1cORaZJDbzzkmwAp/WGdSL/X1p6
         oyJYYoi4t2amGI5VEV5xE/DaFln9gebkcO6J4lsUkWMe4vQRJIrgkP1p32l9HcxyysIc
         TTB04LcInvyLZzcizapletAZDYnLvI9a/3oJvl3gVtZ/ZrZ4e9SJ11zAjvzU/JTFt1EM
         sIT4E56oBLgyqm8TuFluROmo/scZP93N4ofm/TV8Pn5VWZcssxkPI3KliYjOXhUFn8eR
         r/7HKb8min6jeZpQWNvOcTFjTCitNdy9rfvaLj7LFtwETb3g8/nW/D7ksxCAz9o10vnx
         uZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795537878; x=1796142678;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wbz5MHgrotvmvS234Ul0ZoF8Ky6iZRkQglERKXzkxJE=;
        b=hI+4dhOFVoxVcsa7nQC6nnlICmFNdXFQigekzto6yIrjUWOwhl1Cw8erunvZjSYXe3
         vut2lbF8FBBLWuM5Cypp5itzW2TnLwPdxzpIu7p0I+UKWLj/dhbEQbNwu3J1J1Y69ZVx
         UU97TmsW67WGTT8dPAKkNlMWx54A0LCp7YKE6RLFRL1N9TajOBTL0wTXtaSaYcvlU6v7
         m0i3n8HGMVkAHy33vfXpb12khxY7uNDXTwgr/KhCLhNhhBocO5W/Gpw/tk8rqce5S4M/
         JW6ILLjuYpbU9oYSXQXBhKkglpTClJxTTZX80TfQlN5+3L6m48o5YUa5yV7Qx8JWK8lx
         VItg==
X-Forwarded-Encrypted: i=1; AL+hErE6gXusbLAVAaYYlMXelXUMEhndQnB59Vg6DbkagvN17X8QSglbdAmeuFDKLTE0+SVHQIqqw6ff3fs=@lists.infradead.org
X-Gm-Message-State: APuU4Z9294Mq7+pySzgqE36A4IhWW61AaAsiUgvQNa0R9UYpgKo952Cs
	9CjnhBG7JUCP5fOZEh7uIw9qE8AMjl/FtcsaoGqXgAFkP6BO+39YJ7S/juugIl4jC71oh/BXUpO
	J3pLF8G1ZTYKrMRHNbyLEc40eCZiNDr8=
X-Gm-Gg: AZFdTZfd2oVSRnlTQeryfVG1uP5iQpjJASJC7Tszs8dxmh0JUAISrh8YqrelmSMGj66
	Vvaw3YJ0Nas5r7D3qOx496M22gTMOKaMz6AuakMPlbNrLb3Ja+kWTaUkIbir+4PMjQcqhWdr74i
	knFlhFe+/+ucfGIU1KMGTRGmhjHYxZusnB6yxizVsrOy8pTxURWqgo8bR9aEEIi4llkVY25/PkO
	Mu5LIfrS3GFx+V3PXBVdLVjp5ob1yF7A6jlNkLVXcbu8cIKnhcd6B4rk4RWdpQtLLHyryUb4RKD
	5mZdvQFTCZ0euQdjXKplEz774mHgI6U/th7YfiqPmHltdBRd4EDgYiX/mfDFcWvQyYJcQ4vWIZm
	50+Evh3Awc5FwQ8tNprfqZnIlUVKUktiyIQu3CeUH3Qv+zQhNjp7N1P2ZroRY+bk12pi2my88cb
	nBtq64BM7pokhmUS/Do2oHWcM66KNtcxDn6rVJkNmrwdMiJC0TmSVMdpCsbNozY/qnOfmPnjDOT
	0JO9028I1F83D7lpt95Hr/+Mvj3gA==
X-Received: by 2002:a05:6102:f11:b0:7d0:6cf3:d8f0 with SMTP id
 ada2fe7eead31-7d7393ff876mr9420859137.18.1795537876719; Tue, 24 Nov 2026
 08:31:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120-submit-mtd-partition-publication-v1-v2-1-8098cde01961@gmail.com>
 <87bj7ettng.fsf@bootlin.com>
In-Reply-To: <87bj7ettng.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 24 Nov 2026 09:31:05 -0700
X-Gm-Features: Aa3M54okleW4Lj0RRelpnmYTI5rOyLuDyszpkPnhLAOeuLzYyHg1VmfHbZ2XORk
Message-ID: <CADvTj4qup+jzmE++MiDEXfwEUcAMXDrsaM3+T+qX_Yoa+==W4Q@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: serialize dynamic partition registration with removal
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_083120_333427_0A9559F1 
X-CRM114-Status: GOOD (  45.87  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBOb3YgMjQsIDIwMjYgYXQgMzoyM+KAr0FNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gMjAvMTEvMjAyNiBhdCAwOTowMjowNiAt
MDcsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPgo+
ID4gSWYgYSBmbGFzaCBkcml2ZXIgaXMgdW5ib3VuZCB3aGlsZSB1c2Vyc3BhY2UgYWRkcyBhIHBh
cnRpdGlvbiwgcmVtb3ZhbAo+ID4gY2FuIGZpbmQgdGhlIG5ldyBwYXJ0aXRpb24gYmVmb3JlIGl0
IGlzIHJlZ2lzdGVyZWQgb3IgcmVsZWFzZSBpdCBiZWZvcmUKPiA+IGl0cyBzeXNmcyBhdHRyaWJ1
dGVzIGFyZSBhZGRlZC4gSWYgcmVtb3ZhbCBmaW5pc2hlcyBmaXJzdCwgdGhlIGlvY3RsIGNhbgo+
ID4gZXZlbiByZWdpc3RlciBhIG5ldyBwYXJ0aXRpb24gb24gYSBtYXN0ZXIgdGhhdCBoYXMgYmVl
biB1bnJlZ2lzdGVyZWQuCj4gPgo+ID4gSG9sZCBwYXJ0aXRpb25zX2xvY2sgZnJvbSB0aGUgc3Rh
cnQgb2YgcGFydGl0aW9uIGFsbG9jYXRpb24gdW50aWwgdGhlCj4gPiBkZXZpY2UgYW5kIGl0cyBh
dHRyaWJ1dGVzIGFyZSByZWdpc3RlcmVkLiBNYXJrIHRoZSBtYXN0ZXIgYXMgYmVpbmcKPiA+IHVu
cmVnaXN0ZXJlZCB1bmRlciB0aGUgc2FtZSBsb2NrIHNvIGEgbGF0ZXIgaW9jdGwgZmFpbHMgYmVm
b3JlIGFsbG9jYXRpb24KPiA+IGNhbiByZWFkIGJhZC1ibG9jayBtYXJrZXJzLiBDbGVhciB0aGUg
ZmxhZyB3aGVuIHJlZ2lzdGVyaW5nIHRoZSBtYXN0ZXIuCj4gPgo+ID4gRml4ZXM6IDVkYWE3YjIx
NDk2YSAoIm10ZDogcHJlcGFyZSBwYXJ0aXRpb24gYWRkIGFuZCBkZWwgZnVuY3Rpb25zIGZvciBp
b2N0bCByZXF1ZXN0cyIpCj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gU2lnbmVk
LW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gPiAt
LS0KPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiAtIFVzZSBtdXRleCBndWFyZHMgdG8ga2VlcCBwdWJs
aWNhdGlvbiBhbmQgdGVhcmRvd24gbG9jayBzY29wZXMgZXhwbGljaXQuCj4gPiAtIExpbmsgdG8g
djE6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MTEwOC1zdWJtaXQtbXRkLXBhcnRpdGlv
bi1wdWJsaWNhdGlvbi12MS12MS0xLWNiZmYyMGIxMzUxZUBnbWFpbC5jb20KPiA+IC0tLQo+ID4g
IGRyaXZlcnMvbXRkL210ZGNvcmUuYyAgIHwgNCArKysrCj4gPiAgZHJpdmVycy9tdGQvbXRkcGFy
dC5jICAgfCA5ICsrKystLS0tLQo+ID4gIGluY2x1ZGUvbGludXgvbXRkL210ZC5oIHwgMiArKwo+
ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkY29yZS5jIGIvZHJpdmVycy9tdGQvbXRk
Y29yZS5jCj4gPiBpbmRleCBiMTcwYzMxNDRjYTguLjVlZTFlYjI5ZmMxYSAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbXRkY29yZS5j
Cj4gPiBAQCAtOTE4LDYgKzkxOCw3IEBAIHN0YXRpYyB2b2lkIG10ZF9zZXRfZGV2X2RlZmF1bHRz
KHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+ID4gICAgICAgSU5JVF9MSVNUX0hFQUQoJm10ZC0+cGFy
dGl0aW9ucyk7Cj4gPiAgICAgICBtdXRleF9pbml0KCZtdGQtPm1hc3Rlci5wYXJ0aXRpb25zX2xv
Y2spOwo+ID4gICAgICAgbXV0ZXhfaW5pdCgmbXRkLT5tYXN0ZXIuY2hyZGV2X2xvY2spOwo+ID4g
KyAgICAgbXRkLT5tYXN0ZXIudW5yZWdpc3RlcmluZyA9IGZhbHNlOwo+Cj4gTWF5YmUgdGhpcyBp
cyB3b3J0aCBhIFdSSVRFX09OQ0UoKSB0byB0ZWxsIHJvYm90cyB0aGF0IHRoZXJlIGlzIG5vCj4g
cG9zc2libGUgY29uZmxpY3Qgb24gdGhpcyBhY2Nlc3M/CgpUaGlzIGluaXRpYWxpemVzIHRoZSBm
bGFnIGFsb25nc2lkZSB0aGUgdHdvIG11dGV4ZXMsIGJlZm9yZSB0aGUgbWFzdGVyCmlzIHB1Ymxp
c2hlZC4gQSBwbGFpbiBzdG9yZSBzaG91bGQgYmUgZW5vdWdoIGhlcmUuIEFmdGVyIHB1YmxpY2F0
aW9uLAp0aGUgYWRkIGFuZCB1bnJlZ2lzdGVyIHBhdGhzIGFjY2VzcyB0aGUgZmxhZyB1bmRlciB0
aGUgc2FtZSBtdXRleC4KCj4KPiA+ICB9Cj4gPgo+ID4gIHN0YXRpYyBzc2l6ZV90IG10ZF9vdHBf
c2l6ZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgYm9vbCBpc191c2VyKQo+ID4gQEAgLTEyMDYsNiAr
MTIwNyw5IEBAIGludCBtdGRfZGV2aWNlX3VucmVnaXN0ZXIoc3RydWN0IG10ZF9pbmZvICptYXN0
ZXIpCj4gPiAgewo+ID4gICAgICAgaW50IGVycjsKPiA+Cj4gPiArICAgICBzY29wZWRfZ3VhcmQo
bXV0ZXgsICZtYXN0ZXItPm1hc3Rlci5wYXJ0aXRpb25zX2xvY2spCj4gPiArICAgICAgICAgICAg
IG1hc3Rlci0+bWFzdGVyLnVucmVnaXN0ZXJpbmcgPSB0cnVlOwo+ID4gKwo+Cj4gQWN0dWFsbHkg
SSdtIG5vdCBzdXJlIG15IHByb3Bvc2FsIGFjdHVhbGx5IGZpdHMuIEl0IGRvZXMgbm90IG1ha2Ug
dGhlCj4gbG9naWMgY2xlYXJlci4gQXQgbGVhc3Qgbm90IGltcGxlbWVudGVkIGxpa2UgdGhhdCAo
YW5kIGJlbG93KS4KPgo+ID4gICAgICAgaWYgKG1hc3Rlci0+X3JlYm9vdCkgewo+ID4gICAgICAg
ICAgICAgICB1bnJlZ2lzdGVyX3JlYm9vdF9ub3RpZmllcigmbWFzdGVyLT5yZWJvb3Rfbm90aWZp
ZXIpOwo+ID4gICAgICAgICAgICAgICBtZW1zZXQoJm1hc3Rlci0+cmVib290X25vdGlmaWVyLCAw
LCBzaXplb2YobWFzdGVyLT5yZWJvb3Rfbm90aWZpZXIpKTsKPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9tdGRwYXJ0LmMgYi9kcml2ZXJzL210ZC9tdGRwYXJ0LmMKPiA+IGluZGV4IGRkZGVk
MGRiZTc3ZS4uYjIwZmE0MzA5MDg0IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbXRkcGFy
dC5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9tdGRwYXJ0LmMKPiA+IEBAIC0yNzgsMTMgKzI3OCwx
NSBAQCBpbnQgbXRkX2FkZF9wYXJ0aXRpb24oc3RydWN0IG10ZF9pbmZvICpwYXJlbnQsIGNvbnN0
IGNoYXIgKm5hbWUsCj4gPiAgICAgICBwYXJ0LnNpemUgPSBsZW5ndGg7Cj4gPiAgICAgICBwYXJ0
Lm9mZnNldCA9IG9mZnNldDsKPiA+Cj4gPiArICAgICBndWFyZChtdXRleCkoJm1hc3Rlci0+bWFz
dGVyLnBhcnRpdGlvbnNfbG9jayk7Cj4gPiArICAgICBpZiAobWFzdGVyLT5tYXN0ZXIudW5yZWdp
c3RlcmluZykKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4gPiArCj4gPiAgICAg
ICBjaGlsZCA9IGFsbG9jYXRlX3BhcnRpdGlvbihwYXJlbnQsICZwYXJ0LCAtMSwgb2Zmc2V0KTsK
PiA+ICAgICAgIGlmIChJU19FUlIoY2hpbGQpKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gUFRS
X0VSUihjaGlsZCk7Cj4gPgo+ID4gLSAgICAgbXV0ZXhfbG9jaygmbWFzdGVyLT5tYXN0ZXIucGFy
dGl0aW9uc19sb2NrKTsKPiA+ICAgICAgIGxpc3RfYWRkX3RhaWwoJmNoaWxkLT5wYXJ0Lm5vZGUs
ICZwYXJlbnQtPnBhcnRpdGlvbnMpOwo+ID4gLSAgICAgbXV0ZXhfdW5sb2NrKCZtYXN0ZXItPm1h
c3Rlci5wYXJ0aXRpb25zX2xvY2spOwo+Cj4gVGhhdCBtdXRleCBiZWNvbWVzIHN1cGVyIHdpZGUu
IEknbSBub3QgYSBzdXBlciBiaWcgZmFuIG9mIGl0LiBJc24ndAo+IHRoZXJlIGEgcG9zc2liaWxp
dHkgb2YgZGVhZGxvY2sgd2l0aCB0aGUgbm90aWZpZXJzIG9yIGFueSBvdGhlciBsb2NrCj4gaW5z
aWRlPyBXb3VsZCB0aGVyZSBhbiBhbHRlcm5hdGl2ZT8KCkkgaGF2ZW4ndCBmb3VuZCBhIHNwZWNp
ZmljIGRlYWRsb2NrLCBidXQgdjIgZG9lcyBjYWxsIHRoZSBNVEQgYWRkCm5vdGlmaWVycyB3aXRo
IGJvdGggcGFydGl0aW9uc19sb2NrIGFuZCBtdGRfdGFibGVfbXV0ZXggaGVsZC4KCkNvdWxkIHdl
IHVzZSB0aGUgbG9jayB0aGF0IGFscmVhZHkgY292ZXJzIEJMS1BHIGluc3RlYWQ/IEJvdGggdGhl
Cm5hdGl2ZSBhbmQgY29tcGF0IGlvY3RscyBob2xkIHRoZSBtYXN0ZXIncyBjaHJkZXZfbG9jayB1
bnRpbCB0aGUgYWRkCnJldHVybnMuIFVucmVnaXN0ZXIgY291bGQgdGFrZSB0aGF0IGxvY2sgdG8g
c2V0IHRoZSBmbGFnIGFuZCByZWxlYXNlCml0IGJlZm9yZSBzdGFydGluZyB0ZWFyZG93bi4gSWYg
dGhlIGFkZCBnZXRzIHRoZXJlIGZpcnN0LCBpdCBmaW5pc2hlcwpzZXR0aW5nIHVwIHRoZSBjaGls
ZCdzIHN5c2ZzIGZpbGVzIGJlZm9yZSByZW1vdmFsIHN0YXJ0cy4gSWYgdW5yZWdpc3RlcgpnZXRz
IHRoZXJlIGZpcnN0LCB0aGUgYWRkIHJldHVybnMgLUVOT0RFViBiZWZvcmUgc2Nhbm5pbmcgZm9y
IGJhZCBibG9ja3MuCgpUaGF0IGtlZXBzIHBhcnRpdGlvbnNfbG9jayBvdXQgb2YgdGhlIGFkZCBu
b3RpZmllcnMuIFRoZSBleHBvcnRlZApoZWxwZXJzIHdvdWxkIG5lZWQgdGhlIHNhbWUgcHJvdGVj
dGlvbiBmb3IgZGlyZWN0IGNhbGxlcnMsIHdpdGhvdXQKdGFraW5nIGNocmRldl9sb2NrIHR3aWNl
IGZyb20gQkxLUEcuIE9uZSB0cmFkZW9mZiBpcyB0aGF0IHVucmVnaXN0ZXIKd291bGQgYWxzbyB3
YWl0IGZvciB1bnJlbGF0ZWQgaW9jdGxzIG9uIHRoYXQgbWFzdGVyLCBzbyB0aGUgbG9jayBvcmRl
cgpvbiB0aGUgdW5yZWdpc3RlciBzaWRlIHdvdWxkIHN0aWxsIG5lZWQgY2hlY2tpbmcuCgo+Cj4g
Pgo+ID4gICAgICAgcmV0ID0gYWRkX210ZF9kZXZpY2UoY2hpbGQpOwo+ID4gICAgICAgaWYgKHJl
dCkKPgo+IEluIGNhc2Ugb2YgZmFpbHVyZSwgc2hvdWxkIHdlIGNsZWFyIHRoZSBib29sZWFuPwoK
Tm90IHdoZW4gYWRkX210ZF9kZXZpY2UoY2hpbGQpIGZhaWxzLiBPbmx5IG1hc3RlciByZW1vdmFs
IHNldHMgdGhlCmZsYWc7IGEgZmFpbGVkIGFkZCBqdXN0IHJlbW92ZXMgaXRzIGxpc3QgZW50cnkg
YW5kIGZyZWVzIHRoZSBjaGlsZC4KSWYgbWFzdGVyIHJlbW92YWwgaXRzZWxmIGZhaWxzLCBzb21l
IHBhcnRpdGlvbnMgb3IgT1RQIHByb3ZpZGVycyBtYXkKYWxyZWFkeSBiZSBnb25lLCBzbyBpdCB3
b3VsZG4ndCBiZSBzYWZlIHRvIGFsbG93IG5ldyBhZGRzIGFnYWluLgoKPgo+ID4gQEAgLTI5NSwx
MCArMjk3LDcgQEAgaW50IG10ZF9hZGRfcGFydGl0aW9uKHN0cnVjdCBtdGRfaW5mbyAqcGFyZW50
LCBjb25zdCBjaGFyICpuYW1lLAo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPgo+ID4gIGVycl9yZW1v
dmVfcGFydDoKPiA+IC0gICAgIG11dGV4X2xvY2soJm1hc3Rlci0+bWFzdGVyLnBhcnRpdGlvbnNf
bG9jayk7Cj4gPiAgICAgICBsaXN0X2RlbCgmY2hpbGQtPnBhcnQubm9kZSk7Cj4gPiAtICAgICBt
dXRleF91bmxvY2soJm1hc3Rlci0+bWFzdGVyLnBhcnRpdGlvbnNfbG9jayk7Cj4gPiAtCj4KPiBJ
IHRoaW5rIHRoZXJlIGlzIGEgcnVsZSB3aGVyZSB3ZSBzaG91bGQgbm90IHVzZSB0aG9zZSBndWFy
ZHMgd2l0aCBnb3RvCj4gc3RhdGVtZW50cy4KClVzaW5nIGV4cGxpY2l0IGxvY2svdW5sb2NrIGZv
ciB0aGUgbGlzdCB1cGRhdGVzIHdvdWxkIGxldCB1cyBrZWVwIHRoZQpleGlzdGluZyBlcnJvciBs
YWJlbCB3aXRob3V0IG1peGluZyB0aGUgdHdvIGNsZWFudXAgc3R5bGVzLgoKPgo+ID4gICAgICAg
ZnJlZV9wYXJ0aXRpb24oY2hpbGQpOwo+ID4KPiA+ICAgICAgIHJldHVybiByZXQ7Cj4gPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tdGQvbXRkLmggYi9pbmNsdWRlL2xpbnV4L210ZC9tdGQu
aAo+ID4gaW5kZXggOGQxMGQ5ZDJlODMwLi5jZDdiNDY3MWM0NTYgMTAwNjQ0Cj4gPiAtLS0gYS9p
bmNsdWRlL2xpbnV4L210ZC9tdGQuaAo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9tdGQvbXRkLmgK
PiA+IEBAIC0yMjQsNiArMjI0LDcgQEAgc3RydWN0IG10ZF9wYXJ0IHsKPiA+ICAgKiAgICAgICAg
ICAgICAgICBub3Qgb25seSB0aGUgbWFzdGVyIHBhcnRpdGlvbiBsaXN0LCBidXQgYWxzbyBhbGwK
PiA+ICAgKiAgICAgICAgICAgICAgICBzdWItcGFydGl0aW9ucy4KPiA+ICAgKiBAc3VzcGVuZGVk
OiBzZXQgdG8gMSB3aGVuIHRoZSBkZXZpY2UgaXMgc3VzcGVuZGVkLCAwIG90aGVyd2lzZQo+ID4g
KyAqIEB1bnJlZ2lzdGVyaW5nOiByZW1vdmFsIGhhcyBzdGFydGVkOyBwcm90ZWN0ZWQgYnkgcGFy
dGl0aW9uc19sb2NrCj4gPiAgICoKPiA+ICAgKiBUaGlzIHN0cnVjdCBpcyBlbWJlZGRlZCBpbiBt
dGRfaW5mbyBhbmQgY29udGFpbnMgbWFzdGVyLXNwZWNpZmljCj4gPiAgICogcHJvcGVydGllcy9m
aWVsZHMuIFRoZSBtYXN0ZXIgaXMgdGhlIHJvb3QgTVREIGRldmljZSBmcm9tIHRoZSBNVEQgcGFy
dGl0aW9uCj4gPiBAQCAtMjMzLDYgKzIzNCw3IEBAIHN0cnVjdCBtdGRfbWFzdGVyIHsKPiA+ICAg
ICAgIHN0cnVjdCBtdXRleCBwYXJ0aXRpb25zX2xvY2s7Cj4gPiAgICAgICBzdHJ1Y3QgbXV0ZXgg
Y2hyZGV2X2xvY2s7Cj4gPiAgICAgICB1bnNpZ25lZCBpbnQgc3VzcGVuZGVkIDogMTsKPiA+ICsg
ICAgIGJvb2wgdW5yZWdpc3RlcmluZzsKPgo+IE1heWJlIHVuc2lnbmVkIGludCB4eHggOiAxIHRv
IGJlIGNvbnNpc3RlbnQ/CgpUaGUgYWRqYWNlbnQgc3VzcGVuZGVkIGJpdCBpcyBjaGFuZ2VkIGJ5
IG10ZF9zdXNwZW5kKCkgYW5kIG10ZF9yZXN1bWUoKQp3aXRob3V0IHRha2luZyB0aGUgc2FtZSBt
dXRleC4gV2l0aCBhZGphY2VudCBiaXRmaWVsZHMsIHNldHRpbmcgb25lIGNhbgp3cml0ZSBiYWNr
IHRoZSBieXRlIGNvbnRhaW5pbmcgYm90aC4gQSBzZXBhcmF0ZSBib29sIGF2b2lkcyB0aGF0LgoK
Pgo+ID4gIH07Cj4gPgo+ID4gIHN0cnVjdCBtdGRfaW5mbyB7Cj4gPgo+ID4gLS0tCj4gPiBiYXNl
LWNvbW1pdDogMTRiNjgzMDMzNWViNmQ3MGRlYzdhMjM1MDk0ZDY2YzIyZDM4ZWIwNwo+ID4gYmFz
ZS10cmVlOiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRk
L2xpbnV4LmdpdCBtdGQvZml4ZXMKPiA+IGNoYW5nZS1pZDogMjAyNjExMDgtc3VibWl0LW10ZC1w
YXJ0aXRpb24tcHVibGljYXRpb24tdjEtNDYyOWJlOTRkN2U2Cj4gPgo+ID4gQmVzdCByZWdhcmRz
LAo+Cj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
