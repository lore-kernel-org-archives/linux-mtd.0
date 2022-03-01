Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF544C433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 14:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aF5y94wqtAiHj98IdklP0OVy/ehvGkl5vUDGJt7RBSY=; b=l8OiDHysNEKJLn
	XYRK3RCVcGvZuevgKGUxWSa2ZGm0c2b6SwXFHVJh9K+THEgtWdcNACz0n63CDDSYCG81dB0TAbp1S
	TQ+NkA5s3f4C9vq4qrOSqssZCitMsOORfdcEtb1BGHBQIZGr75aI7u+uIUna3cSqgCIFlpwIZ5jUY
	VpGLHp3T5pHwgdCeGRyM9ixH+EHpnW3e/gCylYv7wahI6zH3U9JL6fIcXcdwgzyXxkmLIANvub4Z1
	awhbwu45KpJlB9izdh6oPjTH/kPZNLViIE6+QkRPs0hEYQG9Qqr5peiq0blgz/aAG7yOTdAnhBPh1
	GtEDMGBxT0e3SkjtaDZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP3Q7-00H36R-KA; Tue, 01 Mar 2022 14:24:07 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP3Ps-00H31L-U2; Tue, 01 Mar 2022 14:23:54 +0000
Received: by mail-wr1-x42e.google.com with SMTP id p9so20753195wra.12;
 Tue, 01 Mar 2022 06:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DE2oltsGAHw+m+b0ty3cQqbagXy7CI0IKF+e82MrgCw=;
 b=l95mwMxrrbPkX327ACqMLl1MMEKywZ30ENTDLhHVwFD3hAdIGGzQoWlLhV/cfh8fM9
 X+JdgfDA4CYyC9gQG+XwGA7glO6p5LauYxt5Uc6/s8Xpma+rxEzfI+JJwXA3ZpnZZq+P
 rMlU+IkIV5fquGA3zLRbqE2kA1IU26Z+iNBaeoxAI+MmnEvNvlwDLXa/9ynmIBnzPAIR
 l9mWc4McHwCH5Xuh0RAxIQDVHhj/0G9Cv+UTm4jdbtc3EMfd408+xikolbZyRGdA8AEI
 CVyJve0dJPCZxqQ8GeIeufZK1oEZR/vpdfdFi3aUUY2awrDNF/7LewCRIJGLbQqfmpm+
 zPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DE2oltsGAHw+m+b0ty3cQqbagXy7CI0IKF+e82MrgCw=;
 b=a9V/HB+smVFFgAIzkHMW0lpMwUn05xKOSL5YlxKX4O3E4aN1SLyc7VoAko4IZ3C3Kw
 +Egllj/nkbLFpjYm0Ukte7D4Rzh4estkXgbjG/ZYbCOT4fAibcJarZh2vxUxBtxPVOjY
 LY/YFeW1n/P9PZlgA2BYvWmAzoC6OldatgDApIs///qMMfE1Mt6d5A5G//lbZiG20jzY
 SXaZ/HlcAf7tUv94PD4B256GD3a2bH4aCGa5dGAcTJcry3FlegKjtoRvmm+hm1JeYLOm
 F7mMVUS2i2hDPgVa7jaqQH5LzI+gpD+GYRe6pIjhTztNb35x4kiBa18/CXHHI0P+N07G
 fUhg==
X-Gm-Message-State: AOAM532kjgLBzunPj8fKIDGHPD4K2pyWBHF7VQpqxjjoB+jFMX2It9VJ
 S2xJLyCsJffZpQTTKMaKLfgyMzobGYsVuEdVcRY=
X-Google-Smtp-Source: ABdhPJyF0Sw0VHAeYLxHH/3wYfJGR8x696j6aQ7NxudB6SS74RZir+/Jbxtwd2jFmEmqMUFxFniuNvDLZDxaI3slK4Y=
X-Received: by 2002:a5d:650d:0:b0:1f0:19c:a066 with SMTP id
 x13-20020a5d650d000000b001f0019ca066mr3220718wru.149.1646144631018; Tue, 01
 Mar 2022 06:23:51 -0800 (PST)
MIME-Version: 1.0
References: <20220301095640.313852-1-tudor.ambarus@microchip.com>
 <CAEyMn7aWroFEzo9yPfbwQy3g5iwasuWOQvcHhkRA6Nrga-WRTg@mail.gmail.com>
 <afb8df98-e9c9-1cf8-9e82-9c06e131eee8@microchip.com>
 <6dec5259-ccef-6803-bd28-80f7b07a131a@microchip.com>
In-Reply-To: <6dec5259-ccef-6803-bd28-80f7b07a131a@microchip.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 1 Mar 2022 15:23:39 +0100
Message-ID: <CAEyMn7ZTp6xm8vXZ_nSkGs=hoQZVeCQ-w_qzAH0epxOPNaF8LA@mail.gmail.com>
Subject: Re: [PATCH 0/2] mtd: spi-nor: Fix Quad Enable method for MX25L12835F
To: Tudor.Ambarus@microchip.com
Cc: p.yadav@ti.com, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Nicolas.Ferre@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_062353_016526_AEA37864 
X-CRM114-Status: GOOD (  15.05  )
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

SGkgVHVkb3IsCgpBbSBEaS4sIDEuIE3DpHJ6IDIwMjIgdW0gMTE6NTYgVWhyIHNjaHJpZWIgPFR1
ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbT46Cj4KPiBPbiAzLzEvMjIgMTI6NTQsIFR1ZG9yIEFt
YmFydXMgd3JvdGU6Cj4gPiBPbiAzLzEvMjIgMTI6MjksIEhlaWtvIFRoaWVyeSB3cm90ZToKPiA+
PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMg
dW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUKPiA+Pgo+ID4+IEhpIFR1ZG9yLAo+
ID4+Cj4gPj4gQW0gRGkuLCAxLiBNw6RyeiAyMDIyIHVtIDEwOjU2IFVociBzY2hyaWViIFR1ZG9y
IEFtYmFydXMKPiA+PiA8dHVkb3IuYW1iYXJ1c0BtaWNyb2NoaXAuY29tPjoKPiA+Pj4KPiA+Pj4g
SGksIEhlaWtvLAo+ID4+Pgo+ID4+PiBXb3VsZCB5b3UgcGxlYXNlIGFwcGx5IHRoaXMgcGF0Y2gg
c2V0IG9uIHRvcCBvZjoKPiA+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIw
MjIwMjI4MTM0NTA1LjIwMzI3MC0xLXR1ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNvbS8KPiA+Pgo+
ID4+IFdoZW4gYXBwbHlpbmcgdGhhdCBzZXJpZXMgdGhlIGZsYXNoIHdpbGwgYmUgcHJvcGVybHkg
ZGV0ZWN0ZWQuCj4gPj4KPiA+PiBbICAgIDEuMzIyNjU1XSBzcGktbm9yIHNwaTAuMDogbXgyNWwx
MjgzNWYgKDE2Mzg0IEtieXRlcykKPiA+Pgo+ID4KPiA+IENvb2wuIEknbGwgcmVzdWJtaXQgYSBu
ZXcgc2VyaWVzIHdoZXJlIEknbGwgYWRkIHlvdXIgdGVzdGVkIGJ5IHRhZy4gSSdsbCBhbHNvCj4g
PiByZXdvcmQgdGhlIGNvbW1pdCBtZXNzYWdlcy4KPiA+Cj4gPiBBbHNvLCBjYW4geW91IHJ1biBz
dWNoIGEgc2NyaXB0IHRvIHZlcmlmeSBlcmFzZS13cml0ZS1yZWFkPwo+ID4gIyEvYmluL3NoCj4g
Pgo+ID4gZGQgaWY9L2Rldi91cmFuZG9tIG9mPS4vcXNwaV90ZXN0IGJzPTFNIGNvdW50PTYKPiA+
IG10ZF9kZWJ1ZyBlcmFzZSAvZGV2L210ZDUgMCA2MjkxNDU2Cj4gPiBtdGRfZGVidWcgd3JpdGUg
L2Rldi9tdGQ1IDAgNjI5MTQ1NiBxc3BpX3Rlc3QKPiA+IG10ZF9kZWJ1ZyByZWFkIC9kZXYvbXRk
NSAwIDYyOTE0NTYgcXNwaV9yZWFkCj4gPiBzaGExc3VtIHFzcGlfdGVzdCBxc3BpX3JlYWQKPiA+
Cj4KPiBBbHNvLCB3b3VsZCBiZSBnb29kIHRvIGR1bXAgYWxsIHRoZSBzeXNmcyBlbnRyaWVzLCBJ
IGhhdmUganVzdCB0aGUgU0ZEUCBvbmUuCj4gSSBwcm9taXNlIHRoaXMgaXMgdGhlIGxhc3QgcmVx
dWVzdCA6KS4gSGVyZSdzIGFuIGV4YW1wbGU6CgpUaGVuIEkgYW0gY3VyaW91cyBpZiB0aGlzIGlz
IHRoZSBsYXN0IHJlcXVlc3QgOy0pCgo+ICMgIGNhdCAvc3lzL2RldmljZXMvcGxhdGZvcm0vYWhi
L2FoYjphcGIvZjAwMjAwMDAuc3BpL3NwaV9tYXN0ZXIvc3BpMS9zcGkxLjAvc3BpLW5vci9qZWRl
Y19pZAo+IGMyMjAxNgo+ICMgY2F0IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9haGIvYWhiOmFwYi9m
MDAyMDAwMC5zcGkvc3BpX21hc3Rlci9zcGkxL3NwaTEuMC9zcGktbm9yL21hbnVmYWN0dXJlcgo+
IG1hY3Jvbml4Cj4gIyBjYXQgL3N5cy9kZXZpY2VzL3BsYXRmb3JtL2FoYi9haGI6YXBiL2YwMDIw
MDAwLnNwaS9zcGlfbWFzdGVyL3NwaTEvc3BpMS4wL3NwaS1ub3IvcGFydG5hbWUKPiBteDI1bDMy
MzNmCj4gIyBjYXQgL3N5cy9kZXZpY2VzL3BsYXRmb3JtL2FoYi9haGI6YXBiL2YwMDIwMDAwLnNw
aS9zcGlfbWFzdGVyL3NwaTEvc3BpMS4wL3NwaS1ub3Ivc2ZkcCA+IG14MjVsMzIzM2Ytc2ZkcAo+
Cj4KPiAjIHh4ZCAtcCBteDI1bDMyMzNmLXNmZHAKPiA1MzQ2NDQ1MDAwMDEwMWZmMDAwMDAxMDkz
MDAwMDBmZmMyMDAwMTA0NjAwMDAwZmZmZmZmZmZmZmZmZmYKPiBmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZlNTIwZjFmZmZmZmZmZjAxNDRlYjA4NmIKPiAwODNiMDRiYmVlZmZm
ZmZmZmZmZjAwZmZmZmZmMDBmZjBjMjAwZjUyMTBkODAwZmZmZmZmZmZmZmZmZmYKPiBmZmZmZmZm
ZmZmZmYwMDM2NTAyNjljZjk3NzY0ZmVjZmZmZmZmZmZmZmZmZgo+Cj4gIyBzaGExc3VtIG14MjVs
MzIzM2Ytc2ZkcAo+IDFiNmUwZjc1YjRhNmQwOGQ1NzAwODI5OTI0NTVhZmZhNzJiMmRjODEgIG14
MjVsMzIzM2Ytc2ZkcAo+CgphbmQgaGVyZSB5b3UncmU6CgojIGNhdCAvc3lzL2RldmljZXMvcGxh
dGZvcm0vc29jQDAvMzA4MDAwMDAuYnVzLzMwYmIwMDAwLnNwaS9zcGlfbWFzdGVyL3NwaTAvc3Bp
MC4wL3NwaS1ub3IvamVkZWNfaWQKYzIyMDE4CiMgY2F0IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9z
b2NAMC8zMDgwMDAwMC5idXMvMzBiYjAwMDAuc3BpL3NwaV9tYXN0ZXIvc3BpMC9zcGkwLjAvc3Bp
LW5vci9tYW51ZmFjdHVyZXIKbWFjcm9uaXgKIyBjYXQgL3N5cy9kZXZpY2VzL3BsYXRmb3JtL3Nv
Y0AwLzMwODAwMDAwLmJ1cy8zMGJiMDAwMC5zcGkvc3BpX21hc3Rlci9zcGkwL3NwaTAuMC9zcGkt
bm9yL3BhcnRuYW1lCm14MjVsMTI4MzVmCiMgeHhkIC1wIC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9z
b2NAMC8zMDgwMDAwMC5idXMvMzBiYjAwMDAuc3BpL3NwaV9tYXN0ZXIvc3BpMC9zcGkwLjAvc3Bp
LW5vci9zZmRwCjUzNDY0NDUwMDAwMTAxZmYwMDAwMDEwOTMwMDAwMGZmYzIwMDAxMDQ2MDAwMDBm
ZmZmZmZmZmZmZmZmZgpmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZlNTIwZjFm
ZmZmZmZmZjA3NDRlYjA4NmIKMDgzYjA0YmJmZWZmZmZmZmZmZmYwMGZmZmZmZjQ0ZWIwYzIwMGY1
MjEwZDgwMGZmZmZmZmZmZmZmZmZmCmZmZmZmZmZmZmZmZjAwMzYwMDI3OWRmOWMwNjQ4NWNiZmZm
ZmZmZmZmZmZmCiMgc2hhMXN1bSAgL3N5cy9kZXZpY2VzL3BsYXRmb3JtL3NvY0AwLzMwODAwMDAw
LmJ1cy8zMGJiMDAwMC5zcGkvc3BpX21hc3Rlci9zcGkwL3NwaTAuMC9zcGktbm9yL3NmZHAKYzVl
NWFiZTZjNTY1MGE5ZDljNDQ4NjkwYjFlZWViZGY1YmZlNTdkNAovc3lzL2RldmljZXMvcGxhdGZv
cm0vc29jQDAvMzA4MDAwMDAuYnVzLzMwYmIwMDAwLnNwaS9zcGlfbWFzdGVyL3NwaTAvc3BpMC4w
L3NwaS1ub3Ivc2ZkcAoKLS0gCkhlaWtvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
