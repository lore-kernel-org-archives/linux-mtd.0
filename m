Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409EACAC583
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Sep 2025 05:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3FhkPPYmC6JSe46DSfZXWQhWHO2J1FCf+4ooz1DfCf4=; b=y1WwPSSqBPu5AZ
	Q0W4PmUArRSGBuWxBtmLRMi4Fygk6Jjk3KODLpo2jj70ApeMwqFIWdndhVo11tMComQRD26pipC7h
	ImqzFf0f5JtjMCqGeHnA1v7mj0qlyWBywrttn+QniSVy9j5QpCKz9qdPypRFaQlJCu4OjbkPLkwyl
	D+BiG3PdUBTdq1FNzcGOWs3u052QG/+S3/ZTHQOxotmgvOTtjZPCP1HDkAkk6VI0Mf2lpsp0wYKQV
	lVx/rOECqmTo05sEkHE1zKuK1k1fB5AjEXBrzSCzgaIxKPquXYLwvUlsZd1Q+Dwyy9kHiIwLH2GqF
	v7q996ZvMMZ8WdXv8djw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwZhz-00000000yir-2ERV;
	Thu, 11 Sep 2025 05:18:59 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwZhx-00000000yiU-2Z6s
	for linux-mtd@lists.infradead.org;
	Thu, 11 Sep 2025 05:18:58 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-77269d19280so283769b3a.3
        for <linux-mtd@lists.infradead.org>; Wed, 10 Sep 2025 22:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757567936; x=1758172736; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ob6veE5AGYLeWVGWkM6V6DpcVgdW5QlZW6WW97o1lOQ=;
        b=FnZFM6H+E4LFLuzEg/dDLNe5YBFWdq84hEjIKpnSnVcNU6NNMHQo4N+WmSat41UgEZ
         sJ2FDeHAyUYMhHPy8UD7/NOGALQ1Ll12KNeo0NqDnHZWmq1CNwFdG4o866frAzz5i7eM
         JhlNb7Ff0z5DQlCaI2Ux+Y8S9PS0ydWSDiMPRdvJme0st4pUoSndT3GaS5mR7Gm9WONR
         uYYV+poJERWePdPTPYbFJu2NS5JG+DysNlHmPLF+UBwaU6qmZVNMuyCBKrcUwcpL7e5W
         TvDU8m3XR/fSTx+bseQJTZpsJL+H7O3oeTSO9FLG2QVDratd3YBeOLaXJFEnkbRwGs0x
         hAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757567936; x=1758172736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ob6veE5AGYLeWVGWkM6V6DpcVgdW5QlZW6WW97o1lOQ=;
        b=Bm/Onp8voBtXd/R40IvkA0CJaa+Qavzt3y82wxq5cVCBtMsNifmFgIbMeegamLPuYe
         pVNDXAzd3TyUiAZUOHO2d4NMlylKSfB266+MqVHmRAy3j53c78KE8AphpfSdtGhOskQ2
         3SvVmP2goOHYcYPN0d8NObIkXNyLTcaoeEoVu0ZBUHtoUr+zjb4RJbwh7ZQg+MkXYZwc
         77OTKkCXRJHKAZ2Xfa/XTROS06i5zPQqu8Eey/5fl5eF/QWnYqUz9gDqN5Bf+ki9Whl1
         CoSjlOIX8buuesD0YFcugZCP9YBXEKBVc7xtuPVCQf7uXAVBT9O6vacE6YhYJbSP12pI
         oK2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMrylcmmp8VPAfk0ccg3tT36qi83MJZ2ITq9qvMnAfcv+33RXtAqymOTQOoYj4l/cpwIjrZ5KOk94=@lists.infradead.org
X-Gm-Message-State: AOJu0YyOhsP5x0+8kpflemlSG/AJ8HugJGXsolJUDBvO5eOZbxg/QBI1
	eUkAKIqHg6G8QifI/ZzRP12Z+DKLVYs8bTbjmu4/8LFGmZdF4yJWAad0sxmFeU+P09hT+yyWyN2
	8FmKKKP8A6pKdVajXR6yedzFR56b2WfI=
X-Gm-Gg: ASbGncvs7cZ/L/MdUKCiwlNF8SSUz50K3+vHIF0zD6LTJ/yIsZcN7tvzSRPvMOyWXyz
	wmjvO7zG7J9YE/KcRE5j/wbcL1odyoxc/D38zjt7+6T3kBMRv2oLLJxYsUTMJdGspjHcMCJDmhw
	KjgvGj/yGI7jc/z2Ru7iuJ09WZhybOoTPvyhamZQaqCLrjFGxFIR2KAmSepSDPCGIfC370LHG4o
	VmQDwNUxX1AOwS6wrj7phFYRpHU9Rjm01gvgTeA/+EGwO1Z78z/NZkKjTQ5KXXy/srHBoWxu3o1
	NVujIw==
X-Google-Smtp-Source: AGHT+IFvk+5T2h+j0r3gYLbnPHEWNcHciv2c0Ary9jQiIrzK99D3uAB1gqkge8gs1Y0+2mp/CMujlAyHzCr0gEm6ljk=
X-Received: by 2002:a05:6a20:9146:b0:251:9f29:455d with SMTP id
 adf61e73a8af0-253446fd00amr25949069637.31.1757567936500; Wed, 10 Sep 2025
 22:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250910030301.1368372-1-linchengming884@gmail.com>
 <20250910030301.1368372-4-linchengming884@gmail.com> <87qzwed62q.fsf@bootlin.com>
 <CAAyq3SamY9vjQubd0BjpLb7J_W6JfKyyd987y+UioMV7UQ=94Q@mail.gmail.com> <87ldmmd4nh.fsf@bootlin.com>
In-Reply-To: <87ldmmd4nh.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Thu, 11 Sep 2025 13:15:53 +0800
X-Gm-Features: Ac12FXz7DjlstwmB7-EknEMwItQfSh6GLg3EVSPmH1V6HHVJA8K5qegErBCwtnQ
Message-ID: <CAAyq3SbX-gBH2vVrMnxDqvf_g4nt5CcT0Dcv9a1cx0Jw-CusSg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mtd: spi-nand: macronix: Add randomizer support
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tudor.ambarus@linaro.org, mmkurbanov@salutedevices.com, 
	Takahiro.Kuwano@infineon.com, pratyush@kernel.org, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_221857_653836_519ED172 
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

SGkgTWlxdWVsLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8
IDIwMjXlubQ55pyIMTDml6Ug6YCx5LiJIOS4i+WNiDU6NDPlr6vpgZPvvJoKPgo+IE9uIDEwLzA5
LzIwMjUgYXQgMTc6MjY6MTMgKzA4LCBDaGVuZyBNaW5nIExpbiA8bGluY2hlbmdtaW5nODg0QGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiA+IEhpIE1pcXVlbCwKPiA+Cj4gPiBNaXF1ZWwgUmF5bmFsIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiDmlrwgMjAyNeW5tDnmnIgxMOaXpSDpgLHkuIkg5LiL
5Y2INToxMuWvq+mBk++8mgo+ID4+Cj4gPj4KPiA+PiA+ICtzdGF0aWMgaW50IG1hY3Jvbml4X3Nl
dF9yYW5kb21pemVyKHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCkKPiA+PiA+ICt7Cj4g
Pj4gPiArICAgICBzdHJ1Y3Qgc3BpX21lbV9vcCBleGVjX29wID0gU1BJTkFORF9QUk9HX0VYRUNf
MVNfMVNfMF9PUCgwKTsKPiA+PiA+ICsgICAgIHN0cnVjdCBuYW5kX2RldmljZSAqbmFuZCA9IHNw
aW5hbmRfdG9fbmFuZChzcGluYW5kKTsKPiA+PiA+ICsgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAq
ZG4gPSBuYW5kZGV2X2dldF9vZl9ub2RlKG5hbmQpOwo+ID4+ID4gKyAgICAgaW50IHJhbmRvcHQs
IHJldDsKPiA+PiA+ICsgICAgIHU4IGNmZywgc3RhdHVzOwo+ID4+ID4gKwo+ID4+ID4gKyAgICAg
cmV0ID0gc3BpbmFuZF9yZWFkX3JlZ19vcChzcGluYW5kLCBNQUNST05JWF9GRUFUVVJFX0FERFJf
UkFORE9NSVpFUiwgJmNmZyk7Cj4gPj4gPiArICAgICBpZiAocmV0KQo+ID4+ID4gKyAgICAgICAg
ICAgICByZXR1cm4gcmV0Owo+ID4+ID4gKyAgICAgaWYgKGNmZykKPiA+PiA+ICsgICAgICAgICAg
ICAgcmV0dXJuIDA7Cj4gPj4gPiArCj4gPj4gPiArICAgICBjZmcgPSBNQUNST05JWF9DRkdfRU5Q
R00gfCBNQUNST05JWF9DRkdfUkFOREVOOwo+ID4+ID4gKyAgICAgcmFuZG9wdCA9IG9mX3Byb3Bl
cnR5X3JlYWRfYm9vbChkbiwgIm14aWMscmFuZG9wdCIpOwo+ID4+Cj4gPj4gSXNuJ3QgdGhhdCBh
IGxlZnRvdmVyPwo+ID4KPiA+IFRoZSBwcm9wZXJ0eSAibXhpYyxyYW5kb3B0IiBjb3JyZXNwb25k
cyB0byBiaXQyIG9mIHRoZSBjb25maWd1cmF0aW9uCj4gPiByZWdpc3RlciAweDEwLiBJdHMgcHVy
cG9zZSBpcyB0byBjb250cm9sIHdoZXRoZXIgdGhlIHJhbmRvbWl6ZXIgYWxzbwo+ID4gY292ZXJz
IHRoZSBpbml0aWFsIHBvcnRpb24gb2YgdGhlIHNwYXJlIGFyZWEuCj4KPiBEbyB3ZSBuZWVkIGEg
RFQgcHJvcGVydHkgZm9yIHRoYXQ/Cj4KPiBJbiBhbnkgY2FzZSwgaXQgbXVzdCBiZSBkZWNsYXJl
ZCBpbiB0aGUgYmluZGluZ3MgKHdoaWNoIEkgZG8gbm90IHRoaW5rCj4gaXQgaXM/KS4KPgo+ID4g
U2luY2UgdGhlIHJhbmRvbWl6ZXIgZmVhdHVyZSBpcyBvbmx5IGRvY3VtZW50ZWQgaW4gTWFjcm9u
aXggZGF0YXNoZWV0cywKPiA+IGl0IGlzIG5vdCBjbGVhciB3aGV0aGVyIHRoZSAicmFuZG9wdCIg
Yml0IGlzIHVzZWQgYnkgYWxsIHZlbmRvcnMuIEZvcgo+ID4gdGhpcyByZWFzb24sIHRoZSBoYW5k
bGluZyBpcyBwbGFjZWQgaW5zaWRlIG1hY3Jvbml4LmMuCj4KPiBEaWRuJ3Qgd2UgZGlzY3VzcyBp
biB0aGUgcGFzdCBvZiBhIHZvbGF0aWxlIHZlcnNpb24gZm9yIFNQSSBOQU5ECj4gZGV2aWNlcz8g
SSB0aG91Z2h0IHdlIGNvdWxkIHVzZSBhIHZvbGF0aWxlIGFwcHJvYWNoIGluc3RlYWQuCgpJIHRo
aW5rIGEgRFQgcHJvcGVydHkgbWFrZXMgc2Vuc2UgaGVyZS4gT25jZSB0aGUgcmFuZG9taXplciBm
ZWF0dXJlIGlzCmVuYWJsZWQsIHRoZSByYW5nZSBpdCBjb3ZlcnMgbXVzdCBiZSBkZWZpbmVkIGFz
IHdlbGwuIElmIHdlIHJlbHkgb24gYQp2b2xhdGlsZSBhcHByb2FjaCwgdGhlIHJhbmRvbWl6ZXIg
Y292ZXJhZ2UgbWlnaHQgY2hhbmdlIGR5bmFtaWNhbGx5LAp3aGljaCBJIGJlbGlldmUgaXMgbGVz
cyBzYWZlIGFuZCBoYXJkZXIgdG8gZ3VhcmFudGVlIGNvbnNpc3RlbmN5LgoKPgo+IFRoYW5rcywK
PiBNaXF1w6hsCgpUaGFua3MsCkNoZW5nIE1pbmcgTGluCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
