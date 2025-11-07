Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D812CCCFA05
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Nov 2025 06:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OxryXPzBU+jDkOpclceSBNEAz1ZvMYdVNCewS/felzE=; b=ccpgMk3/Nvpi8g
	ShHuMQTopECix7+ZsmJ1f9oH17wLV3zNZz4usbYNb336uSmUGj7A0kwUM2Ny2O4U9pBIFLarX3IQJ
	e4XxuypXXhO7JhNkXVPwUs8GlKKa60JnRhdf1Criuh8nABwxs1RQR+aGvmulyHU1N501qBwnRyfZQ
	oxRLDWeIlPpoRK6zaScLoLHVOfe2q5+68/3T4DmF2etu0RsvlpkRflZzCWjS3wZkGNzrERKjeNL4P
	8SMc62ogLrBsHsNitTpF9sF6V0xlv78LW8gFSV21J1F59faW7oE105GvwK+fTEzGduZ83lkbC54KQ
	im48ujrsmbbzaC1SGkfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHG4f-0000000Gk8M-29gC;
	Fri, 07 Nov 2025 06:35:53 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHG4c-0000000Gk7x-2rso
	for linux-mtd@lists.infradead.org;
	Fri, 07 Nov 2025 06:35:51 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b55517e74e3so377923a12.2
        for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2025 22:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762497349; x=1763102149; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUsFzqUXQZz1n2RuQCKkvAwHBLrARb82AaIwq1mZYBk=;
        b=iDzZAiilet/bb4vw5bwm8S+fgsonqp89uHVRvT1AkGSCJ91zN3AZczCxIvaROAwcfb
         UMIYs3awF8SW+4kWKo/9rP+1fjYk7zBUIfTbVI2b+rNH16FJGg1010iWQszPALikYCSf
         y3Em88QzsxDdfVoibvFH+SHTKt8fG2aC62NGhdKQu6wt0FcOEEHX76qplQ838zO3j16I
         /8nSE9Phk/3StA00+7zA36cui03coK7CHkcX2kotH+kf3pUHQ1fGpHQij5mXYaHiqL3Q
         GKucKanuEuKwslbKst1uLfLf+xM/WZc7HDj9flh0cHnliq/a6BTFCStqwgsuavhsBeEo
         vusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762497349; x=1763102149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rUsFzqUXQZz1n2RuQCKkvAwHBLrARb82AaIwq1mZYBk=;
        b=JC+9dUkNfj4jhxiyhyne2HOzZFPSIx1X64NRRGcVAdFcTPh3y0c5tQrVturDvWCII8
         YUpos1JkWB/zLhxPXU5ByLdJQOhOxe9Ipi2MUIgWCJhm3SeT2Ze4NXKfGwaslfhA9N68
         nzp+CfHQbL1HxjeJobHIvgUT0ZkMQdA2XfxWZlUyqGXsmyZrj8ypQ5ILdYgeJu38KmV/
         CQcLEoAE+/2FbslYB3k0exYytYmd4oTsx1XrBnJO6M8G5J9/KOHDUPyDLvgqwysLOM/u
         NX0L9FAoESiPlwDIB3DUt5rDxHpCBw4JP+OFL9VUeacVY8iLV0aPLkKcJ8mlOpJ0FlFT
         zIUA==
X-Forwarded-Encrypted: i=1; AJvYcCWN7SxqfbEtraDoH+jZr7zE8MYsjqqR3MRuYEqh1Z6Xidx1d1ANeQIegcBzP0d7KmnNFg15skBbSjg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+GWXlW+cy3KOq8L9lUbkaneikZVXGkPioJc53TO5BBrFmTaID
	9cZJ2SlZO8l5xX/3Eg6Acpp2yOSF3+f/fJKNXEFvKzXuFqTp+1WG2BY3huR+0jgR1xs6tEAY7ng
	zVjeS4khuBTZ6cBlm2zkhQnqQVzvZo+s=
X-Gm-Gg: ASbGncu60gLsJF4+wTgGzpd6af8e8j7NogQq0x9Rvpw/VRh0eFF36y1++ofOCkejjSd
	D72+fp5V4t6m4r88bQPeGSE+9r/bpZktgWPa6/UTydgw+gmpIKj7w9B8vh07cY4kmyz6x8WNZr1
	0qYu9dxkQKXpIotfuNdYrFnOjDFHPWXuHEZ7GFidP0Klay/352l7I1zyg7+SgfIKpyYq6XveRuI
	3WJH7fdwp7chwelHV3UPLHbisZIVyS5BndNiIa1IMHmoGu2j4uDhPglCB7A9KJ6E7oM9Ho=
X-Google-Smtp-Source: AGHT+IHD2sHQ2JhFDIByYNzUhLLxTgE7g7W06cDQM3CbAV75SFpIeVUjbC/8/8que3hL5Hq3pg8yZ5zHUKC4nw41vng=
X-Received: by 2002:a17:903:3888:b0:24b:24dc:91a7 with SMTP id
 d9443c01a7336-297c046688fmr31835145ad.45.1762497349496; Thu, 06 Nov 2025
 22:35:49 -0800 (PST)
MIME-Version: 1.0
References: <20251106054940.2728641-1-linchengming884@gmail.com>
 <20251106054940.2728641-2-linchengming884@gmail.com> <87o6pf8r24.fsf@bootlin.com>
In-Reply-To: <87o6pf8r24.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Fri, 7 Nov 2025 14:31:12 +0800
X-Gm-Features: AWmQ_bnGg-3AHA9qjsaSFvGn8ogxToPDDBGmH9VNNkzQziibC95PuHQBA82OM_4
Message-ID: <CAAyq3Sb8-FRC+bZt_bEvOdBNVSN4xa5F_TpBbKF__HzhVPEpTw@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: ubi: skip programming unused bits in ubi headers
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, chengzhihao1@huawei.com, vigneshr@ti.com, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_223550_742797_292840DE 
X-CRM114-Status: GOOD (  32.98  )
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
IDIwMjXlubQxMeaciDbml6Ug6YCx5ZubIOS4i+WNiDU6MTDlr6vpgZPvvJoKPgo+IEhlbGxvLAo+
Cj4gT24gMDYvMTEvMjAyNSBhdCAxMzo0OTo0MCArMDgsIENoZW5nIE1pbmcgTGluIDxsaW5jaGVu
Z21pbmc4ODRAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gRnJvbTogQ2hlbmcgTWluZyBMaW4gPGNo
ZW5nbWluZ2xpbkBteGljLmNvbS50dz4KPiA+Cj4gPiBUaGlzIHBhdGNoIHByZXZlbnRzIHVubmVj
ZXNzYXJ5IHByb2dyYW1taW5nIG9mIGJpdHMgaW4gZWNfaGRyIGFuZAo+ID4gdmlkX2hkciB0aGF0
IGFyZSBub3QgdXNlZCBvciByZWFkIGR1cmluZyBub3JtYWwgVUJJIG9wZXJhdGlvbi4gVGhlc2UK
PiA+IHVudXNlZCBiaXRzIGFyZSB0eXBjaWFsbHkgYWxyZWFkeSBzZXQgdG8gMSBpbiBlcmFzZWQg
Zmxhc2ggYW5kIGRvIG5vdAo+ID4gbmVlZCB0byBiZSBleHBsaWNpdGx5IHByb2dyYW1tZWQgdG8g
MCBpZiB0aGV5IGFyZSBub3QgdXNlZC4KPiA+Cj4gPiBQcm9ncmFtbWluZyBzdWNoIHVudXNlZCBh
cmVhcyBvZmZlcnMgbm8gZnVuY3Rpb25hbCBiZW5lZml0IGFuZCBtYXkKPiA+IHJlc3VsdCBpbiB1
bm5lY2Vzc2FyeSBmbGFzaCB3ZWFyLCByZWR1Y2luZyB0aGUgb3ZlcmFsbCBsaWZldGltZSBvZiB0
aGUKPiA+IGRldmljZS4gQnkgc2tpcHBpbmcgdGhlc2Ugd3JpdGVzLCB3ZSBwcmVzZXJ2ZSB0aGUg
Zmxhc2ggc3RhdGUgYXMgbXVjaCBhcwo+ID4gcG9zc2libGUgYW5kIG1pbmltaXplIHdlYXIgY2F1
c2VkIGJ5IHJlZHVuZGFudCBvcGVyYXRpb25zLgo+ID4KPiA+IFRoaXMgY2hhbmdlIGVuc3VyZXMg
dGhhdCBvbmx5IG5lY2Vzc2FyeSBmaWVsZHMgYXJlIHdyaXR0ZW4gd2hlbiBwcmVwYXJpbmcKPiA+
IFVCSSBoZWFkZXJzLCBpbXByb3ZpbmcgZmxhc2ggZWZmaWNpZW5jeSB3aXRob3V0IGFmZmVjdGlu
ZyBmdW5jdGlvbmFsaXR5Lgo+ID4KPiA+IEFkZGl0aW9uYWxseSwgdGhlIEtpb3hpYSBUQzU4TlZH
MVMzSFRBMDAgZGF0YXNoZWV0IChwYWdlIDYzKSBhbHNvIG5vdGVzCj4gPiB0aGF0IGNvbnRpbnVv
dXMgcHJvZ3JhbS9lcmFzZSBjeWNsaW5nIHdpdGggYSBoaWdoIHBlcmNlbnRhZ2Ugb2YgJzAnIGJp
dHMKPiA+IGluIHRoZSBkYXRhIHBhdHRlcm4gY2FuIGFjY2VsZXJhdGUgYmxvY2sgZW5kdXJhbmNl
IGRlZ3JhZGF0aW9uLgo+ID4gVGhpcyBmdXJ0aGVyIHN1cHBvcnRzIGF2b2lkaW5nIGxhcmdlIDB4
MDAgcGF0dGVybnMuCj4gPgo+ID4gTGluazogaHR0cHM6Ly9ldXJvcGUua2lveGlhLmNvbS9jb250
ZW50L2RhbS9raW94aWEvbmV3aWRyL3Byb2R1Y3RpbmZvL2RhdGFzaGVldC8yMDE5MTAvRFNUX1RD
NThOVkcxUzNIVEEwMC1UREVfRU5fMzE0NDIucGRmCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hl
bmcgTWluZyBMaW4gPGNoZW5nbWluZ2xpbkBteGljLmNvbS50dz4KPgo+IFRoYW5rcyBmb3IgdGhp
cyB2ZXJ5IGNsZWFyIGFuZCBkZXRhaWxlZCBjb21taXQgbG9nLCBhcyB3ZWxsIGFzIGZvciB0aGUK
PiB3ZWxsIHdyaXR0ZW4gY292ZXIgbGV0dGVyLiBJIGFtIHBlcnNvbmFsbHkgZmluZSB3aXRoIHRo
ZSBvdmVyYWxsIGlkZWEgb2YKPiBjbGVhcmluZyB0aGVzZSB1bnVzZWQgYml0cyB0byAxLiBZZXQs
IEkgaGF2ZSBvbmUgY29uY2VybiByZWdhcmRpbmcgdGhlCj4gaW1wbGVtZW50YXRpb24sIHBsZWFz
ZSBzZWUgYmVsb3cuCj4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbXRkL3ViaS9pby5jIHwgNyArKysr
KysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC91YmkvaW8uYyBiL2RyaXZlcnMvbXRkL3ViaS9pby5jCj4gPiBpbmRl
eCBhNDk5OWJjZTQuLmMyMTI0MmExNCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS9p
by5jCj4gPiArKysgYi9kcml2ZXJzL210ZC91YmkvaW8uYwo+ID4gQEAgLTg2OCw2ICs4NjgsOCBA
QCBpbnQgdWJpX2lvX3dyaXRlX2VjX2hkcihzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBpbnQgcG51
bSwKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FUk9GUzsKPiA+ICAgICAgIH0KPiA+Cj4gPiAr
ICAgICBtZW1zZXQoKGNoYXIgKillY19oZHIgKyBVQklfRUNfSERSX1NJWkUsIDB4RkYsIHViaS0+
ZWNfaGRyX2Fsc2l6ZSAtIFVCSV9FQ19IRFJfU0laRSk7Cj4gPiArCj4gPiAgICAgICBlcnIgPSB1
YmlfaW9fd3JpdGUodWJpLCBlY19oZHIsIHBudW0sIDAsIHViaS0+ZWNfaGRyX2Fsc2l6ZSk7Cj4g
PiAgICAgICByZXR1cm4gZXJyOwo+ID4gIH0KPiA+IEBAIC0xMTUwLDYgKzExNTIsMTEgQEAgaW50
IHViaV9pb193cml0ZV92aWRfaGRyKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIGludCBwbnVtLAo+
ID4gICAgICAgICAgICAgICByZXR1cm4gLUVST0ZTOwo+ID4gICAgICAgfQo+ID4KPiA+ICsgICAg
IGlmICh1YmktPnZpZF9oZHJfc2hpZnQpCj4gPiArICAgICAgICAgICAgIG1lbXNldCgoY2hhciAq
KXAsIDB4RkYsIHViaS0+dmlkX2hkcl9hbHNpemUgLSBVQklfVklEX0hEUl9TSVpFKTsKPiA+ICsg
ICAgIGVsc2UKPiA+ICsgICAgICAgICAgICAgbWVtc2V0KChjaGFyICopcCArIFVCSV9WSURfSERS
X1NJWkUsIDB4RkYsIHViaS0+dmlkX2hkcl9hbHNpemUgLSBVQklfVklEX0hEUl9TSVpFKTsKPgo+
IEhlcmUgSSBhbSByZWFjaGluZyB0aGUgbGltaXRzIG9mIG15IFVCSSBrbm93bGVkZ2UsIHNvIEkg
d291bGQgcHJlZmVyCj4gUmljaGFyZCB0byAoaW4pdmFsaWRhdGUgd2hhdCBJIGFtIHNheWluZywg
YnV0IEFGQUlVLCB0aGUgVklEIGhlYWRlciBjYW4KPiBiZSBsaXRlcmFsbHkgYW55d2hlcmUgaW4g
dGhlIHBhZ2UsIG5vdCBqdXN0IGF0IHRoZSBzdGFydCBvciBlbmQgb2YgYQo+IHN1YnBhZ2UsIHNv
IGluIHRoZSB2aWRfaGRyX3NoaWZ0IEkgd291bGQgZXhwZWN0IHNvbWUgZXh0cmEgbWF0aHMgdG8K
PiBoYXBwZW4sIG5vPwoKSSB1bmRlcnN0YW5kIHlvdXIgcG9pbnQgbm93LiBJZiB0aGUgVklEIGhl
YWRlciBpcyBub3QgZ3VhcmFudGVlZCB0byBiZQphdCB0aGUgc3RhcnQgb3IgZW5kIG9mIGEgc3Vi
cGFnZSwgdGhlbiB5ZXMsIG15IGN1cnJlbnQgbG9naWMgbmVlZHMgdG8gYmUKcmV3b3JrZWQgdG8g
Y292ZXIgdGhhdCBjYXNlLgoKPgo+IEhlcmUgaXMgYW4gZXhjZXJwdCBvZiB0aGUgbWFpbiBjb21t
ZW50IGF0IHRoZSB0b3Agb2YgdGhlIGlvLmMgZmlsZToKPgo+ICAgICAqIEFzIGl0IHdhcyBub3Rl
ZCBhYm92ZSwgdGhlIFZJRCBoZWFkZXIgbWF5IHN0YXJ0IGF0IGEgbm9uLWFsaWduZWQKPiAgICAg
KiBvZmZzZXQuIEZvciBleGFtcGxlLCBpbiBjYXNlIG9mIGEgMktpQiBwYWdlIE5BTkQgZmxhc2gg
d2l0aCBhIDUxMgo+ICAgICAqIGJ5dGVzIHN1Yi1wYWdlLCB0aGUgVklEIGhlYWRlciBtYXkgcmVz
aWRlIGF0IG9mZnNldCAxOTg0IHdoaWNoIGlzCj4gICAgICogdGhlIGxhc3QgNjQgYnl0ZXMgb2Yg
dGhlICogbGFzdCBzdWItcGFnZSAoRUMgaGVhZGVyIGlzIGFsd2F5cyBhdAo+ICAgICAqIG9mZnNl
dCB6ZXJvKS4KPgo+IEkgYW0gbm90IHN1cmUgdGhpcyBpcyBzdXBlciBjb21tb24gdG9kYXkgdGhv
dWdoLgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKClRoYW5rcywKQ2hlbmcgTWluZyBMaW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
