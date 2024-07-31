Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15997C3DA64
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2024 17:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqmbWlu3PhUbeTNNLbJtPRhsjB2wU2CPiNG+V8cmZg8=; b=ZUACD5vAzP5JJf
	1fOM6jZLyLYG8k6LI9O2CPHO4RzfmS22NIlTdIUG/b3vo36N7AnFoYswonEJW7HinXybk+n5oXeCH
	tRH8kpYMNGyInajUE02pVE2Ki7o8wHQKgGsHyritS5LqarHijaGktUUn2r8qoOHVr1JxH1Sn+R8th
	gcmHT19MwE85gfVhl+4fRCrmKPcMtBdK6c19aBCJx+tLiQ13zmASTzGQXA2CyQqgJB3pPEqariBW5
	Bbw5i21//eZ5wQ1RekgCKQR+RSDspnv1P8sdmXRL2Tioi67RbWpQwMxaEjEvCA0+MjzTIlygGuSRI
	PA4jvxAEMNvHJFKBkHhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZDBH-00000002263-2VXb;
	Wed, 31 Jul 2024 17:32:07 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZDBE-0000000225a-135a
	for linux-mtd@lists.infradead.org;
	Wed, 31 Jul 2024 17:32:05 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-6659e81bc68so51670927b3.0
        for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2024 10:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722447122; x=1723051922; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5yEPEFi0771LNvWvwfF5uf7i2xAcrMIY+6UjeN6hRQ=;
        b=DRMnQIa6Owgy/pW7g6SdLbYF9fnQ838eyPXnWkrAun7K8UKwxklrL4wISEJv1mj8WR
         iHPeSlgBt29BuPcRCQLzuFMTwlPio+AsVVdSv5feovT7wEM22zgnkqPP4gewzsG0F3Dr
         u1O9YisJ5LD6k1oJ0vrwBMy+IdBoC2jz/g7LwjBQG1SS1uaop7+u1z52/bpPAjfxuBYU
         cWr4mbecegI/+20QWucKpglvvtehIn4CPkmw3d3T7SxirK9o1FY0b3Wm2IceHEMAvyeR
         WPyj03yanuHgDSwZB8981NPA8AAijaIhQ5nO2wR4xkHMLFQAbJZxOIAZqRtzH2xVCImp
         K8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722447122; x=1723051922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s5yEPEFi0771LNvWvwfF5uf7i2xAcrMIY+6UjeN6hRQ=;
        b=OgshFPwr0jOknSFurO/8LXrpZal639KdzK8K/0ywURfdfp9vLw7FZ6ngFgb0bGzf4L
         01EQq01ULC32KO4Iia2N0DrkXFnd67SxtOJQHmveEo+Q8HVRBsD8GUYhXcKQQ8BuqZjv
         t8AjNlh6zlqbcm2x6jaUYUzAMSxWg/rP3EVOQR3kZMUZpzOZos4O2iRk7P1QTjnMVQJR
         hIREYfE7oebXfESVz/eEhfDU6QODZSdHE1hJE29TrDOjRMF7YInRpghdy4LVi/0jBxMZ
         TFxMI/6gUOB1OSmULE2ApPZpsFORIAXMVSJWgVYllsiWUW7Q1/ONP8EOOmEZfwXq41AA
         FwJw==
X-Forwarded-Encrypted: i=1; AJvYcCXFCMEJooqG9AYap30/ekwTrlxisKzf0YMk0KjTduR4sVqYba/MGqU6Owy6Sjuy2oQKSki+dzC0neTOGGXlNnPUBfHvAmwb6B1Ho9yvvQ==
X-Gm-Message-State: AOJu0YzE5uk80pvxVTV6Li3lC5u2kXi+b2znMDYpFQQYF9gZZk8NtzUl
	+tZ3lnG3SI/aTNvqs6HDFo+3O9U5ZA6u218ddXLXfZdN+hwjHrGdwtF2bU0f68Ybcg8vHNqgcli
	l2YRjYxRm2771t7SBgPfGyNLSSq0=
X-Google-Smtp-Source: AGHT+IHREKEBLETzlSSNNUjWa05uR1EOp3Lh5JtkMmDDyFsY+27U15bTMNBGSGZx4dmyeGsFt62jaaL9uQJjqGL2/D0=
X-Received: by 2002:a81:c30c:0:b0:649:8f00:5254 with SMTP id
 00721157ae682-67a055ca39emr184757507b3.1.1722447122438; Wed, 31 Jul 2024
 10:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240726185825.142733-1-computersforpeace@gmail.com>
 <D32OADQF733D.3CVS3ZRPEBL2O@kernel.org> <454deacb-88cc-4ab0-80b4-006d863a56d2@linaro.org>
 <CAN8TOE8-9=P7p8Tkc+5kG5Sqan+RAWAc7k2VH-p5W9hR-bb_Xg@mail.gmail.com>
 <0685ef1b-b0e1-4c53-94dc-4d5de5be8e94@linaro.org> <D33LRTJ8BE0T.2EQJ1MGLG2NUS@kernel.org>
In-Reply-To: <D33LRTJ8BE0T.2EQJ1MGLG2NUS@kernel.org>
From: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 31 Jul 2024 10:31:50 -0700
Message-ID: <CAN8TOE--TYg8r8qCd_HAZ_w2+wRSPF6RUAuK3g-Po5QPVXdRLQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add n25q064a WP support
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_103204_314282_C93ED00F 
X-CRM114-Status: GOOD (  21.17  )
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

T24gV2VkLCBKdWwgMzEsIDIwMjQgYXQgMjowNeKAr0FNIE1pY2hhZWwgV2FsbGUgPG13YWxsZUBr
ZXJuZWwub3JnPiB3cm90ZToKPiBXZSByZWFsbHkgbmVlZCBzb21lIGtpbmQgb2YgZHVtcCB0aGUg
cmVsZXZhbnQgcmVnaXN0ZXJzIGhlcmUuIEkgaGF2ZQo+IHNvbWUgdmVyeSBvbGQgcGF0Y2gsIHdo
aWNoIGR1bXBzIHRoZSBzdGF0dXMgcmVnaXN0ZXIsIGJ1dCBpcyBoYXMKPiBpdCdzIG93biBxdWly
a3MuIEJ1dCBJTUhPIHdlIHNob3VsZCAobWF5YmUgYWRkaXRpb25hbCB0byB0aGUKPiBmdW5jdGlv
bmFsIHRlc3RzKSBsb29rIGF0IHRoZSBsb2NraW5nIGJpdHMgaW4gdGhlIGNvcnJlc3BvbmRpbmcK
PiByZWdpc3RlcnMuIEkuZS4KPiAgZmxhc2hfbG9jayBmb29iYXIKPiAgPHZlcmlmeSB0aGUgc3Rh
dHVzIHJlZ2lzdGVyPgo+ICBmbGFzaF91bmxvY2sgZm9vYmFyCj4gIDx2ZXJpZnkgdGhlIHN0YXR1
cyByZWdpc3Rlcj4KPiAgZmxhc2hfbG9jayBiYXJmb28KPiAgPHZlcmlmeSB0aGUgc3RhdHVzIHJl
Z2lzdGVyPgo+ICBldGMuCgpJIGRvbid0IGFjdHVhbGx5IHRoaW5rIHRoYXQgd291bGQgYmUgYSB2
ZXJ5IGdvb2QgdGVzdC4gSXQgd291bGQgYmUKdGVzdGluZyB0aGUgaW1wbGVtZW50YXRpb24gbW9y
ZSB0aGFuIHRoZSBmdW5jdGlvbmFsaXR5LiBXaGF0IGRvIHlvdQoidmVyaWZ5IiBpbiB0aGUgc3Rh
dHVzIHJlZ2lzdGVyPyBXb3VsZCB0aGUgdGVzdCBqdXN0IHJlLWltcGxlbWVudCB0aGUKc3dwLmMg
cHJvdGVjdGlvbi1yYW5nZSBsb2dpYz8gQW5kIG5vdGFibHksIHRoaXMgb21pdHMgKmFsbCogY2hl
Y2tzCnRoYXQgdGhlIHByb3RlY3Rpb24gcmVnaXN0ZXIgYWN0dWFsbHkgcHJvdGVjdHMgZnJvbSBh
bnl0aGluZyAod3JpdGUsCmVyYXNlKS4KCk9yIG1heWJlIEknbSBtaXNpbnRlcnByZXRpbmcgd2hh
dCB5b3UgbWVhbi4KCj4gSnVzdCBpbmZlcnJpbmcgdGhlIGNvcnJlY3RuZXNzIGZyb20gYmVoYXZp
b3IgKGV4ZXJjaXNlZCBieSB3cml0aW5nCj4gdG8gdGhlIGZsYXNoIGFuZCB2ZXJpZnlpbmcgaXQp
IHdpbGwgbGVhZCB0byBlcnJvcnMgYXMgaXQgaXMgaGFyZCB0bwo+IGNhdGNoIGFsbCB0aGUgY29y
bmVyIGNhc2VzLgoKV2h5IHdvdWxkIHRoYXQgbGVhZCB0byBlcnJvcnM/IEl0IHNob3VsZCBiZSBy
ZWxhdGl2ZWx5IGVhc3kgdG86CgoxLiBlbnVtZXJhdGUgdGhlIHN1cHBvcnRlZCBwcm90ZWN0aW9u
IHJhbmdlcyAoTUVNTE9DSyAvIE1FTVVOTE9DSwppb2N0bHMgb24ga25vd24tbGlrZWx5IHJhbmdl
cywgbG9va2luZyBmb3IgRUlOVkFMIHJldHVybiBjb2RlcykKMi4gaXRlcmF0ZSB0aHJvdWdoIGFs
bCBzdWNoIHJhbmdlczsgZm9yIGEgZ2l2ZW4gcmFuZ2U6CjIoYSkuIGVyYXNlIHRoZSB3aG9sZSBm
bGFzaAoyKGIpLiB3cml0ZSB0aGUgd2hvbGUgZmxhc2ggd2l0aCBhIGtub3duIHBhdHRlcm4KMihj
KS4gcmVhZCB0aGUgd2hvbGUgZmxhc2gKMihkKS4gZW5zdXJlIHRoYXQgdGhlIGV4cGVjdGVkLXBy
b3RlY3RlZCByYW5nZSByZW1haW5zIDB4ZmYKMihlKS4gZW5zdXJlIHRoYXQgdGhlIGV4cGVjdGVk
LXVucHJvdGVjdGVkIHJhbmdlIGNvbnRhaW5zIHRoZSBrbm93biBwYXR0ZXJuCgpJIHN1cHBvc2Ug
c3RlcCAjMSBjYW4gYmUgdG91Z2gsIGJlY2F1c2UgdGhlIGZ1bGwgc2xhdGUgb2YgcG9zc2libGUK
cHJvdGVjdGlvbiByYW5nZXMgaXMgdGVjaG5pY2FsbHkgLi4uIGVub3Jtb3VzLiBCdXQgImxpa2Vs
eSIgcmFuZ2VzIGFyZQptdWNoIGZld2VyLCB3aXRoIGEgZmV3IHBvd2VyLW9mLTIgcGF0dGVybnMs
IHRvcC9ib3R0b20sIGFuZCBtYXliZSBzb21lCiJib3RoIHRvcCBhbmQgYm90dG9tIiByYW5nZXMg
b24gc29tZSBmbGFzaGVzPyBBbnl3YXksIGxpa2UgSSBzYWlkIGluCm15IG90aGVyIHJlcGx5LCB0
aGlzIHNob3VsZCB0YWtlIG9uIHRoZSBvcmRlciBvZiA2MCBtaW51dGVzIG9uIHNvbWUKZmxhc2hl
cywgd2hpY2ggaXMgZXhwZW5zaXZlIGJ1dCBub3QgcHJvaGliaXRpdmUuCgo+IEZyb20gd2hhdCBJ
IHJlbWVtYmVyLCBmbGFzaHJvbSBoYXMgaXQncyBvd24gZHJpdmVycyBpbiB1c2Vyc3BhY2UsCj4g
bm8/CgpZZXMsIGFuZCB0aGF0J3MgYWxsIHJhdGhlciB1Z2x5LiBCdXQgaXQgYWxzbyBoYXMgYSBs
aW51eF9tdGQgYmFja2VuZApzaW5jZSBhIGZldyB5ZWFycyBiYWNrOgoKaHR0cHM6Ly9yZXZpZXcu
Y29yZWJvb3Qub3JnL3BsdWdpbnMvZ2l0aWxlcy9mbGFzaHJvbS8rL0hFQUQvbGludXhfbXRkLmMK
CkJyaWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
