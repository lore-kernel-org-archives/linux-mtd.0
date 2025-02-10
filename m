Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44C3C0219B
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 03:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mFGpaReGRnQLOFqY5SAUa00cGGt444xBAA0zLb/GB8A=; b=BlA36mt7ug3Wvv
	ff3a843J1BP3VoWjCfWwf4gXRIrgBVqx4HfzEQtYos/BvG/9a6dtcdJp4Ex6KrcLNbWCtJhsPPmnY
	B7GYVTQl+asOwpiyZ3juFwoppeFfSHjpyd5Gy1prIcdreLtXk55tOT9sgbj5Vt2oZDycD2iKX3pRR
	DTWiLIlua3j8gmiWJOiQXxNBnjHCrTved9+0vWrJJTFc2YEdpph567wc/caVCusD53qKZBHuEvkbW
	BZrBTvQjgxynoan1/M+6S56ucQAr/Kiqr0cNPJ4ps5yEpsRbIJBH/e5fqvHDw1rUeklsbBOWADz8M
	wFzDR36soosw6KdTltTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thKMB-0000000G3sq-13MO;
	Mon, 10 Feb 2025 03:21:11 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thKM8-0000000G3sB-1g8x
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 03:21:09 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21f92258aa6so12846235ad.3
        for <linux-mtd@lists.infradead.org>; Sun, 09 Feb 2025 19:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739157667; x=1739762467; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ierXgC96hwGdKlwsBqeSKwlRoTpZuq9z1RYQs90fMjI=;
        b=i5YTANoQLgcHOK4xWrMjv43ioQgmVqXo5uqTrDNstjp6ln3/hOGff0wFFYMliz4TAo
         By0a6T3/HNfciUnt7AEo17KJvdTn9oB59hTqhFM6wvMTZ0YqkKwqETuYAkOAoiISvdQf
         7/aYu2Ez3UDJAgYnLnFyS3AEOcDcs90RO8JdoPvg4XtOOiHvHt6X5sUyZUVPXaIVAFqZ
         FLvL4j+70FNc+uDboANRq+gXXe6TQkwKnNeZ5wBuZhPXBVUfc80J0NaqJ4AbNUX48Nnf
         lSOsezBLgcdaKuA/L66hUdeDaK/rOfNWQngx4kC1YS4yYJxu28R7Xb6sQY86Zpfs61ZG
         /LZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739157667; x=1739762467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ierXgC96hwGdKlwsBqeSKwlRoTpZuq9z1RYQs90fMjI=;
        b=IFxu6SOs2tnZOTu2gxohE9XPzAhe/FBjxf8d9CCg4mg9azAU5zHYbQ0CRmRsA3sX0r
         puYy5TInDmh5L8AWX6lq8UbFOlWHC5eBX1zLdFjE9TlDVjxp0/cGAp/Zw37dRYCQv6Cb
         98Ojgw/s3VmpHF45V7OuEqc/AUBMQWtUMYO5Q+ph5UG6qAMJJF3OQ1tHfqKqyfIxGevv
         OJlntoEOwiTw3UC+MDV+noNzhSU7P9EMZzQaOT7dFmpD1lNoFQwlcxuR2aA7F84S8Mxu
         OQFpi6y+gOQHgGW5hLL0qlDcLmz4UxT8UN+ZSIjB7ofVDyfTRfhBn2VVjVCAtx1VlOa7
         6auw==
X-Forwarded-Encrypted: i=1; AJvYcCW8SsT5ycCv3E6jpU+7ziuOr+L/v0mQXZ3XVs8YdrorCXZEL0HFs7NKb310QUKsvD5NFs1Owtpr9DM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzK73QoorpbPT8tDnNZOJCAHINPWTVSEus6Zls7ZJYj90ZPy2IR
	YItMZtDfjqMBVP6QYYLMtzWC7Kbfi60RZgKlanSnkTw05hJ3RVkck7dyTjszU6aL6kc4uFjuJQl
	HXlJg4FID6V4FOE8FwnR3+7BqtOk=
X-Gm-Gg: ASbGnctJb6FUkKtBbfHURxZZtk837H9sY+VnNOkV+GF3DfYtPvcy8U3Hr78YU3DslIB
	bjUORcLtf5hXSSEt7r/IKFxDHEb+M3DET/1E78lCHNLCURX+EmsVnFeBIH7DJfHLtQjM3zPYj
X-Google-Smtp-Source: AGHT+IEQdsXoQkr/8P/JCKHQ1Pe+5J9t9y5juRQZBtj9v/sbkI4O0dhjFDP+QIhNW2wXaeDS6/bsbf1EwjVMaxrQNzM=
X-Received: by 2002:a17:902:c94a:b0:21f:8099:72d9 with SMTP id
 d9443c01a7336-21f8099743emr68916965ad.27.1739157667431; Sun, 09 Feb 2025
 19:21:07 -0800 (PST)
MIME-Version: 1.0
References: <20250207081846.362919-1-linchengming884@gmail.com>
 <20250207081846.362919-2-linchengming884@gmail.com> <8901dcd481a2185ad34fa7dd09997b38@kernel.org>
In-Reply-To: <8901dcd481a2185ad34fa7dd09997b38@kernel.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Mon, 10 Feb 2025 11:16:57 +0800
X-Gm-Features: AWEUYZmVVv-4Y0evT9hlqj0Kh75MksKOXechWJSVFw8tDvCu3HhcMQIdiq_TQWg
Message-ID: <CAAyq3SbnX8WgN9U=YbJ465q6SBWz6GMuykC4svd9jzjnC3EVFQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for Quad
 Input Page Program
To: Michael Walle <mwalle@kernel.org>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_192108_442417_58196F4A 
X-CRM114-Status: GOOD (  19.91  )
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

SGkgTWljaGFlbCwKCk1pY2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3JnPiDmlrwgMjAyNeW5
tDLmnIg35pelIOmAseS6lCDkuIvljYg0OjM25a+r6YGT77yaCj4KPiBIaSBDaGVuZywKPgo+ID4g
QWx0aG91Z2ggY2VydGFpbiBNYWNyb25peCBOT1IgZmxhc2ggc3VwcG9ydCB0aGUgUXVhZCBJbnB1
dCBQYWdlIFByb2dyYW0KPiA+IGZlYXR1cmUsIHRoZSBjb3JyZXNwb25kaW5nIGluZm9ybWF0aW9u
IGluIHRoZSA0LWJ5dGUgQWRkcmVzcwo+ID4gSW5zdHJ1Y3Rpb24KPiA+IFRhYmxlIG9mIHRoZXNl
IGZsYXNoIGlzIG5vdCBwcm9wZXJseSBmaWxsZWQuIEFzIGEgcmVzdWx0LCB0aGlzIGZlYXR1cmUK
PiA+IGNhbm5vdCBiZSBlbmFibGVkIGFzIGV4cGVjdGVkLgo+ID4KPiA+IFRvIGFkZHJlc3MgdGhp
cyBpc3N1ZSwgYSBwb3N0X3NmZHAgZml4dXBzIGltcGxlbWVudGF0aW9uIGlzIHJlcXVpcmVkIHRv
Cj4gPiBjb3JyZWN0IHRoZSBtaXNzaW5nIGluZm9ybWF0aW9uLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IENoZW5nIE1pbmcgTGluIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4gPiAtLS0KPiA+
ICBkcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMgfCAyMyArKysrKysrKysrKysrKysrKysr
KysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYwo+ID4gYi9kcml2ZXJzL210ZC9z
cGktbm9yL21hY3Jvbml4LmMKPiA+IGluZGV4IDgzMGRhMjFlZWEwOC4uYWRhMTc5OTljY2JiIDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25peC5jCj4gPiArKysgYi9k
cml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMKPiA+IEBAIC00NSw4ICs0NSwyNiBAQCBteDI1
bDI1NjM1X3Bvc3RfYmZwdF9maXh1cHMoc3RydWN0IHNwaV9ub3IgKm5vciwKPiA+ICAgICAgIHJl
dHVybiAwOwo+ID4gIH0KPiA+Cj4gPiArc3RhdGljIGludAo+ID4gK21hY3Jvbml4X3FwcDRiX3Bv
c3Rfc2ZkcF9maXh1cHMoc3RydWN0IHNwaV9ub3IgKm5vcikKPiA+ICt7Cj4gPiArICAgICAvKiBQ
UF8xXzFfNF80QiBpcyBzdXBwb3J0ZWQgYnV0IG1pc3NpbmcgaW4gNEJBSVQuICovCj4gPiArICAg
ICBzdHJ1Y3Qgc3BpX25vcl9mbGFzaF9wYXJhbWV0ZXIgKnBhcmFtcyA9IG5vci0+cGFyYW1zOwo+
ID4gKwo+ID4gKyAgICAgcGFyYW1zLT5od2NhcHMubWFzayB8PSBTTk9SX0hXQ0FQU19QUF8xXzFf
NDsKPiA+ICsgICAgIHNwaV9ub3Jfc2V0X3BwX3NldHRpbmdzKCZwYXJhbXMtPnBhZ2VfcHJvZ3Jh
bXNbU05PUl9DTURfUFBfMV8xXzRdLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgIFNQSU5PUl9P
UF9QUF8xXzFfNF80QiwgU05PUl9QUk9UT18xXzFfNCk7Cj4gPiArCj4gPiArICAgICByZXR1cm4g
MDsKPiA+ICt9Cj4gPiArCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBzcGlfbm9yX2ZpeHVwcyBt
eDI1bDI1NjM1X2ZpeHVwcyA9IHsKPiA+ICAgICAgIC5wb3N0X2JmcHQgPSBteDI1bDI1NjM1X3Bv
c3RfYmZwdF9maXh1cHMsCj4gPiArICAgICAucG9zdF9zZmRwID0gbWFjcm9uaXhfcXBwNGJfcG9z
dF9zZmRwX2ZpeHVwcywKPiA+ICt9Owo+ID4gKwo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc3Bp
X25vcl9maXh1cHMgbWFjcm9uaXhfcXBwNGJfZml4dXBzID0gewo+ID4gKyAgICAgLnBvc3Rfc2Zk
cCA9IG1hY3Jvbml4X3FwcDRiX3Bvc3Rfc2ZkcF9maXh1cHMsCj4gPiAgfTsKPiA+Cj4gPiAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIG1hY3Jvbml4X25vcl9wYXJ0c1tdID0gewo+ID4g
QEAgLTEwMiwxMSArMTIwLDEzIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbwo+ID4g
bWFjcm9uaXhfbm9yX3BhcnRzW10gPSB7Cj4gPiAgICAgICAgICAgICAgIC5zaXplID0gU1pfNjRN
LAo+ID4gICAgICAgICAgICAgICAubm9fc2ZkcF9mbGFncyA9IFNQSV9OT1JfRFVBTF9SRUFEIHwg
U1BJX05PUl9RVUFEX1JFQUQsCj4gPiAgICAgICAgICAgICAgIC5maXh1cF9mbGFncyA9IFNQSV9O
T1JfNEJfT1BDT0RFUywKPiA+ICsgICAgICAgICAgICAgLmZpeHVwcyA9ICZtYWNyb25peF9xcHA0
Yl9maXh1cHMsCj4gPiAgICAgICB9LCB7Cj4gPiAgICAgICAgICAgICAgIC5pZCA9IFNOT1JfSUQo
MHhjMiwgMHgyMCwgMHgxYiksCj4gPiAgICAgICAgICAgICAgIC5uYW1lID0gIm14NjZsMWc0NWci
LAo+ID4gICAgICAgICAgICAgICAuc2l6ZSA9IFNaXzEyOE0sCj4gPiAgICAgICAgICAgICAgIC5u
b19zZmRwX2ZsYWdzID0gU0VDVF80SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFE
X1JFQUQsCj4gPiArICAgICAgICAgICAgIC5maXh1cHMgPSAmbWFjcm9uaXhfcXBwNGJfZml4dXBz
LAo+ID4gICAgICAgfSwgewo+ID4gICAgICAgICAgICAgICAuaWQgPSBTTk9SX0lEKDB4YzIsIDB4
MjMsIDB4MTQpLAo+ID4gICAgICAgICAgICAgICAubmFtZSA9ICJteDI1djgwMzVmIiwKPiA+IEBA
IC0xNTQsMTggKzE3NCwyMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8KPiA+IG1h
Y3Jvbml4X25vcl9wYXJ0c1tdID0gewo+ID4gICAgICAgICAgICAgICAuc2l6ZSA9IFNaXzY0TSwK
PiA+ICAgICAgICAgICAgICAgLm5vX3NmZHBfZmxhZ3MgPSBTRUNUXzRLIHwgU1BJX05PUl9EVUFM
X1JFQUQgfCBTUElfTk9SX1FVQURfUkVBRCwKPiA+ICAgICAgICAgICAgICAgLmZpeHVwX2ZsYWdz
ID0gU1BJX05PUl80Ql9PUENPREVTLAo+ID4gKyAgICAgICAgICAgICAuZml4dXBzID0gJm1hY3Jv
bml4X3FwcDRiX2ZpeHVwcywKPiA+ICAgICAgIH0sIHsKPiA+ICAgICAgICAgICAgICAgLmlkID0g
U05PUl9JRCgweGMyLCAweDI1LCAweDNhKSwKPiA+ICAgICAgICAgICAgICAgLm5hbWUgPSAibXg2
NnU1MTIzNWYiLAo+ID4gICAgICAgICAgICAgICAuc2l6ZSA9IFNaXzY0TSwKPiA+ICAgICAgICAg
ICAgICAgLm5vX3NmZHBfZmxhZ3MgPSBTRUNUXzRLIHwgU1BJX05PUl9EVUFMX1JFQUQgfCBTUElf
Tk9SX1FVQURfUkVBRCwKPiA+ICAgICAgICAgICAgICAgLmZpeHVwX2ZsYWdzID0gU1BJX05PUl80
Ql9PUENPREVTLAo+ID4gKyAgICAgICAgICAgICAuZml4dXBzID0gJm1hY3Jvbml4X3FwcDRiX2Zp
eHVwcywKPiA+ICAgICAgIH0sIHsKPiA+ICAgICAgICAgICAgICAgLmlkID0gU05PUl9JRCgweGMy
LCAweDI1LCAweDNjKSwKPiA+ICAgICAgICAgICAgICAgLm5hbWUgPSAibXg2NnUyZzQ1ZyIsCj4g
PiAgICAgICAgICAgICAgIC5zaXplID0gU1pfMjU2TSwKPiA+ICAgICAgICAgICAgICAgLm5vX3Nm
ZHBfZmxhZ3MgPSBTRUNUXzRLIHwgU1BJX05PUl9EVUFMX1JFQUQgfCBTUElfTk9SX1FVQURfUkVB
RCwKPiA+ICAgICAgICAgICAgICAgLmZpeHVwX2ZsYWdzID0gU1BJX05PUl80Ql9PUENPREVTLAo+
ID4gKyAgICAgICAgICAgICAuZml4dXBzID0gJm1hY3Jvbml4X3FwcDRiX2ZpeHVwcywKPiA+ICAg
ICAgIH0sIHsKPiA+ICAgICAgICAgICAgICAgLmlkID0gU05PUl9JRCgweGMyLCAweDI2LCAweDE4
KSwKPiA+ICAgICAgICAgICAgICAgLm5hbWUgPSAibXgyNWwxMjg1NWUiLAo+Cj4gQ291bGQgeW91
IGFsc28gcGxlYXNlIHNoYXJlIHRoZSBTRkRQIGR1bXBzIG9mIHRoZXNlIGZsYXNoZXMgd2l0aCB1
cz8KCkNlcnRhaW5seSwgSSBjYW4gc2hhcmUgdGhlIFNGRFAgZHVtcHMgb2YgdGhlc2UgZmxhc2hl
cyB3aXRoIHlvdS4KSSB3aWxsIHNlbmQgdGhlbSBvdmVyIHNob3J0bHkuCgo+Cj4gVGhhbmtzLAo+
IC1taWNoYWVsCgpUaGFua3MsCkNoZW5nIE1pbmcgTGluCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
