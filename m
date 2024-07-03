Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3308C2BD09
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jul 2024 06:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08rmZHWF6Rp211/06k8+mdoOE3Cw90pcGAssMOQNJ9s=; b=LjOZPIFiF80cWT
	1KVLvMUrQ11ggL5FQNsaljX4DswkEanPcA/ItD5uZZxHAVQlL2ssesDGj/oNPviwcuZrwN2XAcKk0
	Zu/qAfqUmWhz5k764tQqBHaEiyll95tACp2/ulmkNX4JDRmSs1p0raH1DBWfIbDKd2Z+hGgR5vXIv
	z0Y/PpUqRBbSgEFi8RWbAs3FJygrqgc1+MG2cyHJ9pYB3SJSVoI/9B6cVNzb9S9Z51ERCgQ4dSQ74
	bSxe8Kzb+oCm9MyNnhw6hwvTlGxREwLzgb/EUS3UZK3Zsyh/D/ObeA+DsbfV/XWUiyr1U8D+oPJof
	MlOteNCkiLVO7VzNE8Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOtBv-00000009B33-43MN;
	Wed, 03 Jul 2024 06:10:07 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOtBr-00000009B2a-26AV
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jul 2024 06:10:04 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-36dd56cf5f5so20192635ab.3
        for <linux-mtd@lists.infradead.org>; Tue, 02 Jul 2024 23:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719987002; x=1720591802; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c77AogHs5UjTLqFCfEnpEmIPWpc2YLbtORGmWy/mQxg=;
        b=WN9lCn6EoEwEv7f7928wyzuJzH2KPJXeQdVNFVlsaeTEM6Dzia3QLo96q/opJoD51Z
         Cjg3/+xO4Mely9DbrVKMsf0YgzSSBOBQLZA9TFBJx3ZV1UHYvDdDoOMLu77oaElbXCCn
         v+9djt2Om3aKgmKdff/2xayGByeRrT39jZ/B+obGtygJiG6Pc1sDWtbMeuW8OZbs8y7t
         u0oy8lVArtmk2F78iDsEjGV3S0DnfDq+FYjz5qryPCMoTiO6uggxs3NUzy2rNepiJO2H
         OXwkOjf5xNsa+d+2xnDKwyQnKUMVRl9wIK1iw85zw55VYyP0wVuVJ0l2aogwzPirrFPu
         JS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719987002; x=1720591802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c77AogHs5UjTLqFCfEnpEmIPWpc2YLbtORGmWy/mQxg=;
        b=ZZtvhdUjFEklF4gRnO+XC7e+9dLuCBpZ9jWl9U51fDqei96JtgdTCiFD0sqwmlI4Lj
         nvfJjkkyxK7L3K5Xm5zmCZQdpHjNWBvASQoecOPnfs16Flyr4qnit6xtJc/EYqa/d6dv
         DguIWATjXbDkd9wZbIthf3aoP5qw5pzIiVs0k5w9KSfXJzTdhDjgwzQtUac8ZVJjDyuj
         A8GTywYuZpaNs6mABS16ClE2DrRcLORRr+/3XSjmt9Me9XMjTTKRFWl5usCR11lRp3Ku
         aABik+MljyRggoSxiz7D9Iy/+MwwkE7ljDH8lTj9vLnw4DeWBLVoytWYZbeEZRqXsLcb
         B5Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUBy1A7jc/QwqvhX59hpv97ZJJxDJzv8eP6L0fubfPrDp6NqSPm/xilu7dunqhT7HnSCQtz9aAJ8yJJdCxj9omVK7rNelEi6iKr3YmQ7g==
X-Gm-Message-State: AOJu0Yz1gzn/QeuoFkTq6Ou9XkFINSCqFKdyTkXaIzmfsKXRezNCcHXS
	Lc+atzmYBmldiJbzD3aoX15Yi7I6r/3GSBI8GPl0aR0wQN/u0kqrqXo5JxnbGquVZmxywzC5gVV
	DdB96l3qclNp3W9agNxE2fSlFSP0=
X-Google-Smtp-Source: AGHT+IGB5A1N2ooKOuOsbWeCU8/C2XUVNfg4LwM4m/9DUVssS7oMz+HHSwbfGzEL+dNkVJnm8P49bnw2kOnmce8JAn0=
X-Received: by 2002:a05:6e02:b41:b0:376:1fae:463a with SMTP id
 e9e14a558f8ab-37cd377b7eemr123963465ab.32.1719986999604; Tue, 02 Jul 2024
 23:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240628085444.132714-1-linchengming884@gmail.com>
 <20240628085444.132714-2-linchengming884@gmail.com> <20240701114307.031005ce@xps-13>
In-Reply-To: <20240701114307.031005ce@xps-13>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Wed, 3 Jul 2024 14:09:17 +0800
Message-ID: <CAAyq3SYt_PvaE3ZvhcXY9ijgEvLiwxByHWS=ryPrBbWFBfrkdA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: spinand: Support serial NAND for reading two
 bytes ID
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, richard@nod.at, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_231003_568199_04368BF4 
X-CRM114-Status: GOOD (  18.72  )
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

SGksCgpNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiDmlrwgMjAyNOW5
tDfmnIgx5pelIOmAseS4gCDkuIvljYg1OjQz5a+r6YGT77yaCj4KPiBIaSwKPgo+IGxpbmNoZW5n
bWluZzg4NEBnbWFpbC5jb20gd3JvdGUgb24gRnJpLCAyOCBKdW4gMjAyNCAxNjo1NDo0MyArMDgw
MDoKPgo+ID4gRnJvbTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWluZ2xpbkBteGljLmNvbS50dz4K
PiA+Cj4gPiBBZGRpbmcgdGhlIERldmljZSBJRCAyIG9uIE1hY3Jvbml4IFNlcmlhbCBGbGFzaC4K
PiA+Cj4gPiBXaGVuIHRoZSBudW1iZXIgb2YgZmxhc2hlcyBpbmNyZWFzZXMsIHdlIG5lZWQgdG8g
dXRpbGl6ZQo+ID4gRGV2aWNlIElEIDIgdG8gZGlzdGluZ3Vpc2ggYmV0d2VlbiBkaWZmZXJlbnQg
Zmxhc2hlcy4KPiA+Cj4gPiBUaGVzZSBmbGFzaGVzIGhhdmUgYmVlbiB2YWxpZGF0ZWQgb24gWGls
aW54IHp5bnEtcGljb3plZAo+ID4gYm9hcmQgd2hpY2ggaW5jbHVkZWQgTWFjcm9uaXggU1BJIEhv
c3QuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWluZ2xpbkBt
eGljLmNvbS50dz4KPiA+IC0tLQo+Cj4gLi4uCj4KPiA+ICAgICAgIFNQSU5BTkRfSU5GTygiTVgz
NVVGMUdFNEFEIiwKPiA+IC0gICAgICAgICAgICAgICAgICBTUElOQU5EX0lEKFNQSU5BTkRfUkVB
RElEX01FVEhPRF9PUENPREVfRFVNTVksIDB4OTYpLAo+ID4gKyAgICAgICAgICAgICAgICAgIFNQ
SU5BTkRfSUQoU1BJTkFORF9SRUFESURfTUVUSE9EX09QQ09ERV9EVU1NWSwgMHg5NiwgMHgwMyks
Cj4gPiAgICAgICAgICAgICAgICAgICAgTkFORF9NRU1PUkcoMSwgMjA0OCwgMTI4LCA2NCwgMTAy
NCwgMjAsIDEsIDEsIDEpLAo+ID4gICAgICAgICAgICAgICAgICAgIE5BTkRfRUNDUkVRKDgsIDUx
MiksCj4gPiAgICAgICAgICAgICAgICAgICAgU1BJTkFORF9JTkZPX09QX1ZBUklBTlRTKCZyZWFk
X2NhY2hlX3ZhcmlhbnRzLAo+ID4gQEAgLTI4OSw3ICsyODgsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHNwaW5hbmRfaW5mbyBtYWNyb25peF9zcGluYW5kX3RhYmxlW10gPSB7Cj4gPiAgICAgICAg
ICAgICAgICAgICAgU1BJTkFORF9FQ0NJTkZPKCZteDM1bGZ4Z2U0YWJfb29ibGF5b3V0LAo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBteDM1bGYxZ2U0YWJfZWNjX2dldF9z
dGF0dXMpKSwKPiA+ICAgICAgIFNQSU5BTkRfSU5GTygiTVgzNVVGMUdFNEFDIiwKPiA+IC0gICAg
ICAgICAgICAgICAgICBTUElOQU5EX0lEKFNQSU5BTkRfUkVBRElEX01FVEhPRF9PUENPREVfRFVN
TVksIDB4OTIpLAo+ID4gKyAgICAgICAgICAgICAgICAgIFNQSU5BTkRfSUQoU1BJTkFORF9SRUFE
SURfTUVUSE9EX09QQ09ERV9EVU1NWSwgMHg5MiwgMHgwMSksCj4gPiAgICAgICAgICAgICAgICAg
ICAgTkFORF9NRU1PUkcoMSwgMjA0OCwgNjQsIDY0LCAxMDI0LCAyMCwgMSwgMSwgMSksCj4gPiAg
ICAgICAgICAgICAgICAgICAgTkFORF9FQ0NSRVEoNCwgNTEyKSwKPiA+ICAgICAgICAgICAgICAg
ICAgICBTUElOQU5EX0lORk9fT1BfVkFSSUFOVFMoJnJlYWRfY2FjaGVfdmFyaWFudHMsCj4gPiBA
QCAtMjk4LDcgKzI5Nyw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpbmFuZF9pbmZvIG1hY3Jv
bml4X3NwaW5hbmRfdGFibGVbXSA9IHsKPiA+ICAgICAgICAgICAgICAgICAgICBTUElOQU5EX0hB
U19RRV9CSVQsCj4gPiAgICAgICAgICAgICAgICAgICAgU1BJTkFORF9FQ0NJTkZPKCZteDM1bGZ4
Z2U0YWJfb29ibGF5b3V0LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBt
eDM1bGYxZ2U0YWJfZWNjX2dldF9zdGF0dXMpKSwKPiA+IC0KPgo+IFRoaXMgaXMgc3R5bGUsIGFu
ZCBpZiB5b3UgY2FyZSBzaG91bGQgYmUgaW4gYW5vdGhlciBwYXRjaC4KCk9rYXksIHdlIGN1cnJl
bnRseSBoYXZlIG5vIHBsYW5zIHRvIG1ha2UgdGhpcyBtb2RpZmljYXRpb24uCgo+Cj4gPiAgICAg
ICBTUElOQU5EX0lORk8oIk1YMzFMRjJHRTRCQyIsCj4gPiAgICAgICAgICAgICAgICAgICAgU1BJ
TkFORF9JRChTUElOQU5EX1JFQURJRF9NRVRIT0RfT1BDT0RFX0RVTU1ZLCAweDJlKSwKPiA+ICAg
ICAgICAgICAgICAgICAgICBOQU5EX01FTU9SRygxLCAyMDQ4LCA2NCwgNjQsIDIwNDgsIDQwLCAx
LCAxLCAxKSwKPiA+IEBAIC0zMDksNyArMzA3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzcGlu
YW5kX2luZm8gbWFjcm9uaXhfc3BpbmFuZF90YWJsZVtdID0gewo+ID4gICAgICAgICAgICAgICAg
ICAgIFNQSU5BTkRfSEFTX1FFX0JJVCwKPiA+ICAgICAgICAgICAgICAgICAgICBTUElOQU5EX0VD
Q0lORk8oJm14MzVsZnhnZTRhYl9vb2JsYXlvdXQsCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG14MzVsZjFnZTRhYl9lY2NfZ2V0X3N0YXR1cykpLAo+ID4gLSAgICAgU1BJ
TkFORF9JTkZPKCJNWDNVRjJHRTRCQyIsCj4gPiArICAgICBTUElOQU5EX0lORk8oIk1YMzFVRjJH
RTRCQyIsCj4KPiBUaGlzIGlzIGEgZml4IHRoYXQgc2hvdWxkIGhhdmUgdGhlIHJpZ2h0IHRhZ3Mg
KHN0YWJsZS9maXhlcykgYW5kIGJlIGluCj4gYW5vdGhlciBwYXRjaC4KPgo+IEFsc28sIG1heWJl
IHlvdSB3YW50IHRoaXMgcGF0Y2ggY29udGVudCB0byBiZSBiYWNrcG9ydGVkLiBJZiBpdCdzIHRo
ZQo+IGNhc2UsIHBsZWFzZSBhZGQgdGhlIG5lY2Vzc2FyeSB0YWdzIGhlcmUgYXMgd2VsbC4KPgoK
U3VyZSwgd2Ugd2lsbCBzZXBhcmF0ZSB0aGlzIG1vZGlmaWNhdGlvbiBmcm9tIHRoaXMgcGF0Y2gg
c2VyaWVzLgoKPiA+ICAgICAgICAgICAgICAgICAgICBTUElOQU5EX0lEKFNQSU5BTkRfUkVBRElE
X01FVEhPRF9PUENPREVfRFVNTVksIDB4YWUpLAo+ID4gICAgICAgICAgICAgICAgICAgIE5BTkRf
TUVNT1JHKDEsIDIwNDgsIDY0LCA2NCwgMjA0OCwgNDAsIDEsIDEsIDEpLAo+ID4gICAgICAgICAg
ICAgICAgICAgIE5BTkRfRUNDUkVRKDgsIDUxMiksCj4KPgo+IFRoYW5rcywKPiBNaXF1w6hsCgpU
aGFua3MsCkNoZW5nbWluZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
