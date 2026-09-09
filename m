Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D61C79F8C
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 05:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HY+4DBbH9gNE9yUinhAhKPkD1NKcrE3l/w0kHoqrBTU=; b=3XftzGMwRkUvBR
	X+fZxL9IwhFrKSZguDXdJ3wJj/jiOC8lvb27Ux4CmfQs8RRmucOPn+fvFx09If9hi0fkhCnCwXq7O
	PDnV8UwId49phw9KNyHATKnC5zFmigccaooXfSNnkZ14Zy/AnbGhUm1JUEF8axKGXBN+KKyAf0YFy
	EjWjZaBoaPLoZr5Etp9LR0BA4JADdfb8i3DoyuGkgxnrNDtTNS1JEzEm5F6M9mqtt82ZsK2TI34f4
	Rk0ek481XwdqwFqTN+I1j4+hc+DQA8n9sXxrpHadS3js4rGKD17LNWOZa8skgUFw0AYKS4rH5GejX
	1nDwpNabcARHQL4XYUvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4BLO-0000000Apas-1rdn;
	Wed, 09 Sep 2026 05:59:38 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4BLL-0000000Apa9-1k8e
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 05:59:37 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so3741186a12.3
        for <linux-mtd@lists.infradead.org>; Tue, 08 Sep 2026 22:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788933574; cv=none;
        d=google.com; s=arc-20260327;
        b=rTyxNWS2g1nNUOBuFf5ULsnwY528IobEqRvym28atQsiy3R4l7Ia+BYEFfS59lwiLx
         LZ8NyzjQTaEOyJpHFmbGZCe2oAtTTdwUMyU5WfNtMxjpFy5DEZLNqGr1ajo2L1D7aPp1
         Q1mgFJ/4k6oCIrGepmWg+ksVL9wYpd4HZnBYRtqXeHWDJds2zQVHgvg3Vpwm0GlieMGu
         pIast4T/chqSFot+NBPy38+6Jb7cn0CiY/NASZtrhVAWXrurGE457bDzQ4oPRhw7EQLI
         v06hQeTg5xlIOBRNjvfTPqDUbrX+tky6I7r8JFWPeGEQ/acNwtz+x2unE8US/VZfmFDl
         5fOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9GSCg78wW1G8krgkJKKdP4j/VSOgaR/2RT/HUeyVDN8=;
        fh=eloexjU0jsAJ+F9EaBUx9h/VN00c7cik9h2o4VpHflE=;
        b=WRX69dreI03ES0fOwbXxJGj8GUwy9bPMQFHnOjxYTiZ3McT/remYGn8DilkkRuzc5C
         A57IHZ36jqzNW5YeNc47y095ULxXRq3qGJz97EplSQwV0Nqltbh/7qA9EFFW6O0VM02J
         S9TVHKFXKa8SvPEFszP8Yk6fHaGYac+GKsMoWPJYCioIzefDYfvIs35dC+C7Z4Z7mPcH
         x3ZUqKgmqO+6eNdCYb4d/8B2EkfFlGjT6lLJEeyMYLgyEWb6hQzjRRFU5iC576RYJNT1
         Y+5jAJlq+E0MzgbjQrwXpAJl62iKgX4fjx6iA+qRcYAT2Hhy0FZvi6BYCWWe0hl6ZCAl
         rStQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788933574; x=1789538374; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9GSCg78wW1G8krgkJKKdP4j/VSOgaR/2RT/HUeyVDN8=;
        b=E9Idb+wDC69mVN/9+mbx4NVMYhykL2/mQTvc7Wr/oinw1pXWlFucTycJ0YqOgae343
         UM/7e2DVrymY0l/wMK5ecpZ+AohR3b1iRrv86SWLulXehx7fZtXnJbAJrhtPBnY287v8
         wcDCR7m2wSp8JzgM0DmhPDIRU5n8X8k+74TCXTjNvjR/H6jc7yX+0D1tES7kYDQ44W0Z
         mK2vnGfB2Rphgqjkl6+8IskNedGzyhCjRtlTCkG7QDkzW3Y7pPcDWXIiRN26sr/FUnKw
         5kqO4PdYwh4AeAw/Mx1GXGz6zjc1ApG1eT7o1dir+5oGmeaOU/kAdWyM+2MaQZqFjNnZ
         dHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788933574; x=1789538374;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9GSCg78wW1G8krgkJKKdP4j/VSOgaR/2RT/HUeyVDN8=;
        b=emYy5yX2n3l5nNORQWOz0LAILsoii7q0UyUqhwS+t8n9BOvHZ8Er256SAyef0Mk7Qr
         nv9F2fPeiNAkLNmOQ93irDf3ue2XTvVppP7bde+KIHcMPdwRFt5hso4ZDNPrGiY/ElUb
         wqporpIuEM6OVrZXCkDKij4pMKOxcq5E4XtIduu1yTj3Det3JktxM3ogYMUBAvW5oDrq
         cxYbZ5Yv8diI7X5b7xzSksVN72qS7n+/o4ydHe8P8q2w88R/fhXQF+nv7nwFeF5XylnE
         tNzIDzCd2VdLZwGTGo9//36F9KjjQPKjtl4XSeyvuK/VdO09yNNpWYjMAMS/RPBoMCJq
         VvQg==
X-Forwarded-Encrypted: i=1; AKwUvBwV5FhLdUl47lE7J1EYUJyh3gYKPnZ2oktCf5I5iQlXKXxRNx+/fSFaCI333LYEqRB1moy8Zp6BFDs=@lists.infradead.org
X-Gm-Message-State: AFuF++lZIXixcHOfcI/JhRBjN1AESJdOofBvZwHuSjBLerbU2gozvzWz
	G3EsEPfCEoW4FiEV4vzZmj8zMAl+3XxXb4JSYHlzsBKkgGKeIxgAZOUCT5paMH7wBGK3WD3vtIK
	7vIirr/bmAxxOHlqgZFZIOpa9LGDInmc=
X-Gm-Gg: AYBFou0HQg9eeW3sPt9bXUCex91C2x0r04er3PlT0oyC84QOvb8sqvYBx+hwWYWbK4z
	Hw+jFsbaHqSXweY4R98e8NwB8oUmWcXZzX1hsgu98h7dNEvkBHzd9xemXXm4DNNUTTa8FGcmVbg
	DKBKJyuNRGKAO0CSXEG0Pj0SqvAnjtw1MtxdIKayTdOMifkv3lxu9CiR3ByO1k5vnvOxlw5Q/wN
	2J8Ubev0xRrPI2ePeeUMyuwHvRzox16aB1mPfdOOhVtEa8go/sZyz6eIuF1D4GMJbnex83gulJx
	kUcAGxm8JZtjjogRVzrkQVvc5SpbxN+bgv22jy1uBAcGAn9xUI190XWcLEwx9y5DeJKv2HlnM+f
	mj3zjsUMTKD34mB2/3Pq+kgc=
X-Received: by 2002:a05:6a20:b418:b0:3d3:adbf:7777 with SMTP id
 adf61e73a8af0-3da3a066ef5mr53737139637.19.1788933574031; Tue, 08 Sep 2026
 22:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260819182805.4020838-1-jjy600901@snu.ac.kr> <849183271.921.1787173413104.JavaMail.zimbra@nod.at>
In-Reply-To: <849183271.921.1787173413104.JavaMail.zimbra@nod.at>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 9 Sep 2026 07:59:21 +0200
X-Gm-Features: AcwNN1WR-tbYe24I3uROA7Svs3FhGJH-BZThyVMmDLp6bN7W006NPhEgpxMl5DI
Message-ID: <CAFLxGvyZO_EDo-YM_EybZG3u7aNUoNiThhvbhQCrOPD7mPV6GA@mail.gmail.com>
Subject: Re: [BUG] general protection fault in jffs2_xattr_delete_inode
To: Richard Weinberger <richard@nod.at>
Cc: Jaeyoung Chung <jjy600901@snu.ac.kr>, David Woodhouse <dwmw2@infradead.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, Kees Cook <kees@kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, eulgyukim@snu.ac.kr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_225935_460129_BC7D18DD 
X-CRM114-Status: GOOD (  12.99  )
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

SmFleW91bmcgQ2h1bmcsCgoqcGluZyoKCk9uIFdlZCwgQXVnIDE5LCAyMDI2IGF0IDExOjAz4oCv
UE0gUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JvdGU6Cj4KPiAtLS0tLSBV
cnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gPiBWb246ICJKYWV5b3VuZyBDaHVuZyIgPGpqeTYw
MDkwMUBzbnUuYWMua3I+Cj4KPiBbLi4uXQo+Cj4gPiBSSVA6IDAwMTA6amZmczJfeGF0dHJfZGVs
ZXRlX2lub2RlKzB4MzgvMHgzMDAgZnMvamZmczIveGF0dHIuYzo2MDIKPiA+IENvZGU6IDQxIDU1
IDQxIDU0IDUzIDQ4IDgzIGVjIDUwIDQ4IDg5IDNjIDI0IDQ4IDg1IGY2IDc0IDJhIDQ5IDg5IGY2
IDQ5IGJkIDAwIDAwCj4gPiAwMCAwMCAwMCBmYyBmZiBkZiA0OCA4ZCA1ZSAyOCA0OCA4OSBkOCA0
OCBjMSBlOCAwMyA8NDI+IDBmIGI2IDA0IDI4IDg0IGMwIDBmIDg1Cj4gPiA5MCAwMiAwMCAwMCA4
MyAzYiAwMCA3NCAxNCA0OCA4MyBjNCA1MAo+ID4gUlNQOiAwMDE4OmZmZmY4ODgxMDRhZDc5MTgg
RUZMQUdTOiAwMDAxMDIwMwo+ID4gUkFYOiAwYzhjOGM4YzhjOGM4YzkxIFJCWDogNjQ2NDY0NjQ2
NDY0NjQ4YyBSQ1g6IDAwMDAwMDAwMDAwMDAwMDEKPiA+IFJEWDogMDAwMDAwMDAwMDAwMDAwMSBS
U0k6IDY0NjQ2NDY0NjQ2NDY0NjQgUkRJOiBmZmZmODg4MTA4MjYwMDAwCj4gPiBSQlA6IGRmZmZm
YzAwMDAwMDAwMDAgUjA4OiBmZmZmODg4MTA0YWQ3OTg3IFIwOTogMWZmZmYxMTAyMDk1YWYzMAo+
ID4gUjEwOiBkZmZmZmMwMDAwMDAwMDAwIFIxMTogZmZmZmVkMTAyMDk1YWYzMSBSMTI6IDFmZmZm
MTEwMjIzNDljZmMKPiA+IFIxMzogZGZmZmZjMDAwMDAwMDAwMCBSMTQ6IDY0NjQ2NDY0NjQ2NDY0
NjQgUjE1OiAxZmZmZjExMDIyMzQ5Y2U4Cj4gPiBGUzogIDAwMDA3ODYzNjI3MTg2YzAoMDAwMCkg
R1M6ZmZmZjg4ODE1ZThhYzAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwCj4gPiBDUzog
IDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzCj4gPiBDUjI6IDAw
MDA3ODYzNjI3MTdmNzggQ1IzOiAwMDAwMDAwMTA3OTVjMDAwIENSNDogMDAwMDAwMDAwMDAwMDZm
MAo+ID4gQ2FsbCBUcmFjZToKPiA+IDxUQVNLPgo+ID4gamZmczJfZG9fY2xlYXJfaW5vZGUrMHg0
ZC8weDJmMCBmcy9qZmZzMi9yZWFkaW5vZGUuYzoxNDE4Cj4gPiBldmljdCsweDM1My8weDcwMCBm
cy9pbm9kZS5jOjgyNQo+ID4gamZmczJfbmV3X2lub2RlKzB4NDQzLzB4Y2UwIGZzL2pmZnMyL2Zz
LmM6LTEKPiA+IGpmZnMyX2NyZWF0ZSsweDg3LzB4MzAwIGZzL2pmZnMyL2Rpci5jOjE4Mgo+ID4g
bG9va3VwX29wZW4gZnMvbmFtZWkuYzo0NTA4IFtpbmxpbmVdCj4gPiBvcGVuX2xhc3RfbG9va3Vw
cyBmcy9uYW1laS5jOjQ2MDggW2lubGluZV0KPiA+IHBhdGhfb3BlbmF0KzB4ZTNjLzB4MjliMCBm
cy9uYW1laS5jOjQ4NjAKPiA+IGRvX2ZpbGVfb3BlbisweDE5ZC8weDM2MCBmcy9uYW1laS5jOjQ4
OTIKPiA+IGRvX3N5c19vcGVuYXQyKzB4OWEvMHgxMDAgZnMvb3Blbi5jOjEzNjgKPiA+IGRvX3N5
c19vcGVuIGZzL29wZW4uYzoxMzc0IFtpbmxpbmVdCj4gPiBfX2RvX3N5c19vcGVuYXQgZnMvb3Bl
bi5jOjEzOTAgW2lubGluZV0KPiA+IF9fc2Vfc3lzX29wZW5hdCBmcy9vcGVuLmM6MTM4NSBbaW5s
aW5lXQo+ID4gX194NjRfc3lzX29wZW5hdCsweGY4LzB4MTMwIGZzL29wZW4uYzoxMzg1Cj4gPiBk
b19zeXNjYWxsX3g2NCBhcmNoL3g4Ni9lbnRyeS9zeXNjYWxsXzY0LmM6NjMgW2lubGluZV0KPiA+
IGRvX3N5c2NhbGxfNjQrMHhmNy8weDM3MCBhcmNoL3g4Ni9lbnRyeS9zeXNjYWxsXzY0LmM6OTQK
PiA+IGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc2LzB4N2UKPiA+IFJJUDogMDAz
MzoweDc4NjM2MzAxZTgyOQo+Cj4gU28sIHRoZSBwYXJ0aWFsbHkgY3JlYXRlZCBpbm9kZSBpcyBl
dmljdGVkIGluIHRoZSBjcmVhdGUgcGF0aC4KPiBEb2VzIHRoaXMgY2hhbmdlIGhlbHA/Cj4KPiBk
aWZmIC0tZ2l0IGEvZnMvamZmczIvb3MtbGludXguaCBiL2ZzL2pmZnMyL29zLWxpbnV4LmgKPiBp
bmRleCA4NmFiMDE0YTM0OWMuLmE5OTA2ZjllMzYzOCAxMDA2NDQKPiAtLS0gYS9mcy9qZmZzMi9v
cy1saW51eC5oCj4gKysrIGIvZnMvamZmczIvb3MtbGludXguaAo+IEBAIC01Nyw2ICs1Nyw3IEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBqZmZzMl9pbml0X2lub2RlX2luZm8oc3RydWN0IGpmZnMyX2lu
b2RlX2luZm8gKmYpCj4gICAgICAgICBmLT50YXJnZXQgPSBOVUxMOwo+ICAgICAgICAgZi0+Zmxh
Z3MgPSAwOwo+ICAgICAgICAgZi0+dXNlcmNvbXByID0gMDsKPiArICAgICAgIGYtPmlub2NhY2hl
ID0gTlVMTDsKPiAgfQoKLS0gClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
