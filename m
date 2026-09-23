Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B03C982FA
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2026 11:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fuysKAbKJdbZDS9Bzht2JayE2+ARmSSa8I9MJL3yguk=; b=yJX5oKoXzU4qIR
	cFpJG4vB6Xy5lGQEFvFo+dbXlnHNixRpgeI2a7qH96Rxe5sh4kQTvU0a/dvBQvt83i4u+KlpSwwee
	ELFXEG4AyhbzBpaQ/AnZC4SwqYHxXvPWXJjRMJzVVmfRRBvQ2HOx5vKgRxR2UpZ3i+8kXgWBKTcrc
	3koODqe829A+TvRCuomLvt00p+yzcc5ISa5vVOQaAZL9kDJ2regWdSO70Y+m0YjOJVwuFFwJESOET
	nz1aJBOnIjULwp3MizbzZNxICO7Ncs9LzyPAXuobULNMKeiTGbPwgwI7Qjjl8dJT+b5RNzkWMfyF4
	fu72VI4eYPTXwom8QdoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LbC-000000089wU-13bo;
	Wed, 23 Sep 2026 11:57:18 +0000
Received: from mail-lf2-x10.google.com ([2a00:1450:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lb9-000000089uh-2L97
	for linux-mtd@lists.infradead.org;
	Wed, 23 Sep 2026 11:57:17 +0000
Received: by mail-lf2-x10.google.com with SMTP id 2adb3069b0e04-5b5e4f17452so662726e87.3
        for <linux-mtd@lists.infradead.org>; Wed, 23 Sep 2026 04:57:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790164633; cv=none;
        d=google.com; s=arc-20260327;
        b=sCwj/xiPE6inTgb1WhUckx+w11Vbvr0MD0BU8G++YRlT5rigVfiSZGqygCSv1lgF0U
         DIOOMCs0PnohRozXC50N46pygHY7kwttfGtQXYzN2fD5deuXm1qdasLjesCnsJkBr8pf
         hUWqq7Pwc1LnCKYCxqR+ZhwvZ2MAK21E9b8MRGt5OKmHh+4jrl/wPL9NZ9CMP/kvBBzh
         9Oe+QwLxXovlrsEZmmDaPknUYM4406VA7h3tBcTPYzYSBvRCJiBn4dCL9ve3WtA4H7MQ
         LgUmoT+fCAbM514cmjcZBzv5xk1VPoqJY24XuxNKuKV+vHaAIfcor4vvV2pp3oCTCKaH
         KqdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D20TpGH49qOv9/0QKKs9pgkC9gvT+RAFw0ynQyUTh4c=;
        fh=LurvqkyHfbugGG7TvbGP+3ajYP8m5w7mjQCQwC86IXk=;
        b=mfDk3qx4oW79kgxhPdKQBzp/NkRIDYwzD2ZqbKbu0gvHLCYgFZ9AoIhqxgCmhSdoo6
         +HrIP1YrFyNToL3k5DjcaLXMGo5/Y3Blh8+VyeOgNnLzbmw3H92gpq/oeQRidph7kfPw
         Or2BKXJQ1FHymh38sQTxBmy8xK28kz0zSrejAiD0ndeyN8T7jDmlTqt/fPrsmNvUbdii
         ozsAh2Yk9sOCiNYEBP8KnIy03qUIpv4n697BQb05+/5RR0IW6BgwmJ/bJCxUNClOCcnp
         xQJ25wh47dnw0P0n/87vFGSj5v8GpGIdodPR9siLwV3K2BZhLOCuI+hORuPjNR2ZMh14
         yXnA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790164633; x=1790769433; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D20TpGH49qOv9/0QKKs9pgkC9gvT+RAFw0ynQyUTh4c=;
        b=dTb+7J+Kma34LzzpBvgBMWlVS6Cgu4DHR+0FrukOR17NWGJTIdfxiqwFnIJnLSyXO8
         GLuQXIGLMNJQZ/p8hyXZ8v+n+TE2hqDdx2fjDhSVvUa4QDV1EHojftnggdCD5qu9Vxiv
         GRx+hfhSaY3RRopF2uT0GThoztBBJshGjRhJ8TFdwSKHXZGiB3pkQ1mYUzkBaan+9y9j
         ZUrKnbR8VXiUbFGWgePoG8UuvUaSGQAD6ToweM+xFQUuzKsM64t68tebDBPP0D+tMQiz
         xb9CXHXQCQzFpQam8F4qvZpD6Syq1LQ8uHBWdJT4nhrOEA2R+w6WE10ovpljUo2R6dnR
         7YEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164633; x=1790769433;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D20TpGH49qOv9/0QKKs9pgkC9gvT+RAFw0ynQyUTh4c=;
        b=RhfwEosVFWGZQp9NlJKoTfHzYF/OwvF3tbWGwp1v4VERs7ZsU9pA2jwdYcgbH70VXJ
         uxN8JR1+3/kSUALgWpSIiZizyNcCxbwfl4jImap2P5cxoifyFPluNii+ZTDsbPoDkqAw
         ohE2HVzlBecOzRNNKQ/6HL5IjVEit4bCZictf2bcyYngpfVy4JvJCpMM2ogY+SmSIKmN
         alcqPojF8l53jbxf68f9SkckZHjgVqKEdMz5a41BOLifl0j1XKBpp1nJQ3Ayvst3NBlf
         yTB0kccFio6KSSBXubd/2sJZ9RdxvRVOfrm5BmwWzEaOjRouuoEdJTF03XN6uG3Sufy2
         monA==
X-Gm-Message-State: AFuF++llx787J+s1EM8E16SPdt6d8KSqRVUyVGBgzB1wNrHXkh9SNKUW
	nFCqP2bg8JSM4dZENwCcdVpgbtE9hmrq2bDwbfZ9mGqAvIuTPFUffkQknywiSg1nvPVPpLh7dMG
	XrfHjMA/mqFKz6F16+NBbnNX1ttoUE1Bkm5cGIQbNQw==
X-Gm-Gg: AYBFou2hMndB0gyOy7sMkXNwMlfgDmX+yd8KQHzzNd3d84NBtJGqhY4mlaf47gWQRvr
	UkhjQjjUGgechhLYIEgzMkWhkuCoteFX5C55ZwNaMvruvem8cjHss0iqag5Cr5QFG3omf1ByCXV
	PVqLTlR+K7e+r/uk7YypQ5OVTXLdcJTIkZGJltarFnbrmIGqZ7m2s21oZyz4SmJZsBD744yi2/I
	/3EcWF9BvRbE/R9kBBBmZSbXoitt9jAXr73iDh68661l9HCzJGLWo9SgYlSdb0LdlFmgtpbrnKa
	JEGX7tfXNJesmXS0LWbFchKyX4Pl9H3Qu29aYdZkvLtm+a5vCQJopSOiykmZimsEafVJEicCBsh
	tcL4j7ubcUapz
X-Received: by 2002:a05:6512:3b1e:b0:5b8:999f:718b with SMTP id
 2adb3069b0e04-5b8d89529a8mr775837e87.12.1790164632483; Wed, 23 Sep 2026
 04:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260921021459.283023-1-stevereaver@gmail.com>
 <20260923092626.873202-1-stevereaver@gmail.com> <20260923094144.E723B1F00893@smtp.kernel.org>
In-Reply-To: <20260923094144.E723B1F00893@smtp.kernel.org>
From: Steve Reaver <stevereaver@gmail.com>
Date: Wed, 23 Sep 2026 21:57:00 +1000
X-Gm-Features: AcwNN1Vz4ppQFb3PfMiYiHwl33Vcr8dKREmMuo6U_3H7qEGvy_Pm4z2nh8h_0rk
Message-ID: <CA+sfT55QcfAGP=ttb-YNvR85ggCyfmgBp9YJ4853KGg0da1aDQ@mail.gmail.com>
Subject: Re: [PATCH v4] mtd: maps: add INT0800 firmware-flash map driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, 
	linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_045715_630150_E24C5A8E 
X-CRM114-Status: GOOD (  23.17  )
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

VGhlIHJlbWFpbmluZyByZW1vdmFsIHBhdGhzIGRvbid0IGFwcGx5IHRvIHRoaXMgZGV2aWNlLiBU
aGUgcGxhdGZvcm0KZGV2aWNlIGlzIG9ubHkgdW5yZWdpc3RlcmVkIHZpYSBBQ1BJX1JFQ09ORklH
X0RFVklDRV9SRU1PVkUsIHdoaWNoCnJlcXVpcmVzIHRoZSBJTlQwODAwIEFDUEkgbm9kZSB0byBs
ZWF2ZSB0aGUgbmFtZXNwYWNlLiBJTlQwODAwIGlzIGEKc3RhdGljIERTRFQgZGV2aWNlOiBpdCBo
YXMgbm8gX0VKMCAodGhlIGVqZWN0IHN5c2ZzIGF0dHJpYnV0ZSBpcyBuZXZlcgpjcmVhdGVkIGZv
ciBpdCksIGNhbm5vdCBsaXZlIGluIGFuIHVubG9hZGFibGUgU1NEVCBvdmVybGF5LCBhbmQgaGFz
IG5vCmhvdHBsdWcgbm90aWZ5IHNvdXJjZS4gVW5iaW5kaW5nIGEgcGFyZW50IGRldmljZS9kcml2
ZXIgZG9lcyBub3QKaW52b2tlIGEgY2hpbGQncyByZW1vdmUoKS4gV2l0aCAuc3VwcHJlc3NfYmlu
ZF9hdHRycyB0aGUgc3lzZnMgdW5iaW5kCmlzIGdvbmUsIGFuZCBtb2R1bGUgdW5sb2FkIGlzIGJs
b2NrZWQgYnkgb3BlbiBmZHMgdmlhIG10ZC0+b3duZXIuIFRoZQpyZXNpZHVhbCAicm1tb2QgLWYg
d2l0aCBDT05GSUdfTU9EVUxFX0ZPUkNFX1VOTE9BRCIgYnlwYXNzZXMKcmVmY291bnRpbmcgZm9y
IGV2ZXJ5IGRyaXZlci4gRldJVywgdGhlIHVuZGVybHlpbmcgbGltaXRhdGlvbiDigJQgbWFwCnBy
b3ZpZGVycyBmcmVlaW5nIG10ZF9pbmZvIHdoaWxlIHRoZSBjb3JlIGNhbm5vdCB3YWl0IGZvciBv
cGVuIGZkcyDigJQKaXMgc2hhcmVkIGJ5IGFsbCBleGlzdGluZyBkcml2ZXJzL210ZC9tYXBzIHVz
ZXJzOyBhZGRyZXNzaW5nIGl0IHdvdWxkCmJlIGFuIE1URCBjb3JlIGxpZmV0aW1lIGNoYW5nZSBi
ZXlvbmQgdGhpcyBkcml2ZXIuCgpPbiBXZWQsIDIzIFNlcHQgMjAyNiBhdCAxOTo0MSwgPHNhc2hp
a28tYm90QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1
dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29u
c2lkZXI6Cj4gLSBbSGlnaF0gbXRkOiBtYXBzOiBVQUYgb2YgbXRkX2luZm8gYW5kIEkvTyBtZW1v
cnkgb24gZGV2aWNlIHVucmVnaXN0cmF0aW9uCj4gLS0KPgo+IGNvbW1pdCBhZDMwMTZmZTM4OTNi
MjNmNjFhY2Y5Zjk2OTEzZmY1MTcyNmFjM2EwCj4gQXV0aG9yOiBTdGVwaGVuIEJhbmNyb2Z0IDxz
dGV2ZXJlYXZlckBnbWFpbC5jb20+Cj4KPiBtdGQ6IG1hcHM6IGFkZCBJTlQwODAwIGZpcm13YXJl
LWZsYXNoIG1hcCBkcml2ZXIKPgo+IEFkZCBhIHJlYWQtb25seSBtYXBwaW5nIGRyaXZlciB0aGF0
IGJpbmRzIHRoZSBBQ1BJIElOVDA4MDAgIkludGVsCj4gODI4MDIgZmlybXdhcmUgaHViIiBkZXZp
Y2UgYW5kIGV4cG9zZXMgdGhlIHN5c3RlbSBmaXJtd2FyZSBmbGFzaCBhcyBhbgo+IE1URCBST00g
ZGV2aWNlLgo+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbWFwcy9pbnQwODAwLmMgYi9k
cml2ZXJzL210ZC9tYXBzL2ludDA4MDAuYwo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGlu
ZGV4IDAwMDAwMDAwMDAwMDAuLmM1ZjEwOGFhMzQ3OTcKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsr
KyBiL2RyaXZlcnMvbXRkL21hcHMvaW50MDgwMC5jCj4KPiBbIC4uLiBdCj4KPiA+ICtzdGF0aWMg
dm9pZCBpbnQwODAwX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gK3sK
PiA+ICsgICAgIHN0cnVjdCBpbnQwODAwICpmdyA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYp
Owo+ID4gKwo+ID4gKyAgICAgbXRkX2RldmljZV91bnJlZ2lzdGVyKGZ3LT5tdGQpOwo+ID4gKyAg
ICAgbWFwX2Rlc3Ryb3koZnctPm10ZCk7Cj4KPiBbU2V2ZXJpdHk6IEhpZ2hdCj4gRG9lcyB0aGlz
IHRlYXJkb3duIHBhdGggZm9yY2UgYSB1c2UtYWZ0ZXItZnJlZSBpZiB0aGUgZGV2aWNlIGlzIHJl
bW92ZWQKPiB3aGlsZSBhIGZpbGUgZGVzY3JpcHRvciBpcyBvcGVuPwo+Cj4gV2hpbGUgdGhlIGRy
aXZlciBzZXRzIC5zdXBwcmVzc19iaW5kX2F0dHJzID0gdHJ1ZSB0byBwcmV2ZW50IG1hbnVhbCBz
eXNmcwo+IHVuYmluZHMsIHRoZSBkcml2ZXIgY29yZSBjYW4gc3RpbGwgaW52b2tlIHJlbW92ZSgp
IHdoZW4gdGhlIHVuZGVybHlpbmcKPiBkZXZpY2UgaXMgdW5yZWdpc3RlcmVkLiBUaGlzIGNhbiBo
YXBwZW4gaWYgcm9vdCB1bmJpbmRzIHRoZSBwYXJlbnQgYnJpZGdlCj4gaW4gc3lzZnMsIG9yIHZp
YSBBQ1BJIFNTRFQgdW5sb2FkaW5nLgo+Cj4gSWYgaW50MDgwMF9yZW1vdmUoKSBpcyBpbnZva2Vk
IHdoaWxlIHVzZXJzcGFjZSBob2xkcyBhbiBvcGVuIGZpbGUKPiBkZXNjcmlwdG9yLCBtdGRfZGV2
aWNlX3VucmVnaXN0ZXIoKSBwdXRzIHRoZSBrcmVmIGJ1dCBkb2VzIG5vdCByZWxlYXNlCj4gdGhl
IHN0cnVjdCBkZXZpY2UgYmVjYXVzZSB0aGUgY2hhcmFjdGVyIGRldmljZSByZXRhaW5zIGFuIGFj
dGl2ZSByZWZlcmVuY2UuCj4KPiBVbmNvbmRpdGlvbmFsbHkgY2FsbGluZyBtYXBfZGVzdHJveShm
dy0+bXRkKSB0aGVuIGZyZWVzIHRoZSBtdGRfaW5mbwo+IHN0cnVjdHVyZS4gQ291bGQgc3Vic2Vx
dWVudCAvZGV2L210ZDAgcmVhZHMgb3Igc3lzZnMgYWNjZXNzZXMgZGVyZWZlcmVuY2UKPiB0aGlz
IGZyZWVkIG1lbW9yeSBhbmQgYWNjZXNzIHVubWFwcGVkIGRldm0gSS9PIG1lbW9yeT8KPgo+ID4g
K30KPgo+IC0tCj4gU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3Bh
dGNoc2V0LzIwMjYwOTIzMDkyNjI2Ljg3MzIwMi0xLXN0ZXZlcmVhdmVyQGdtYWlsLmNvbT9wYXJ0
PTEKCgoKLS0gClN0ZXZlIFJlYXZlcgpodHRwOi8vd3d3LnN0ZXZlcmVhdmVyLmNvbS8KRWxlY3Ry
b25pYyBNdXNpYyBQcm9kdWN0aW9uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
