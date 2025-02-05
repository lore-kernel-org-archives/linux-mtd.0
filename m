Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8C6C02197
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2025 03:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eylAoz0XNW5LY2M+LNrlQbqM97E6Q3qp3h0xMMU4BBQ=; b=lttXak5Vwg8E//
	5yZAnbHIC79cCWbB0E+LB+gx3dOyDw3NZap1NPw+u2HSY/qdNEsr4dSRW6heo2AcyAYI2YEIuGsCE
	3OKXU5xgm8R42He99iKXxo1ScM840RyRxapsmG9HX8K7yab4qnWPXj7Ofqn9eVxN0YAb2Hi+wpOnp
	guWbTBfC5pQ7nMLU2e7YGhlJ+lBb//y/IiNjfgl4JUOMrixOD1VubNPndg0J+MTQobrYlvpf9n/Qj
	+4Cx9AGqRHXu/nGMcp8lc9T3uK0+XUKbhEuPh7WSNPFZhWAjwC1hLKkXFf2fe82ergT5Kl85M8kQ0
	xHLRvitWbkgmQZqLk3Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfWMY-00000002Eza-2ZJE;
	Wed, 05 Feb 2025 03:46:06 +0000
Received: from mail-qt1-f178.google.com ([209.85.160.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVGJ-000000029zW-27CE
	for linux-mtd@lists.infradead.org;
	Wed, 05 Feb 2025 02:35:36 +0000
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4678cd314b6so58874271cf.3
        for <linux-mtd@lists.infradead.org>; Tue, 04 Feb 2025 18:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738722932; x=1739327732; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1N+4rW3SsekYEUc8nzCVlrVQkaioSvtxJiN6kI5HrK0=;
        b=FI0fzfS6nikqszz0A57nMw8irDXDepzATQRjfXEny9jfO15JGadlu+zigP1tbuec1k
         S88gQKED+Woqse5IFzZNQTJCIRCsMksKl3+EApMNIuKUbjIEn3esDLP6kLDetwBLh20R
         +kKyXx6BiAxm5Xf5tjGTkeWzOMMznyO5gtPPRFubEHEqGT3b3Y/F4T98Av2mBspjGnGr
         DylC0iqddl4xhVmGdhAYuGXX2X67YNzXlkLS+Ehnljb2fq701OkmCaoThTMtVbbypsf9
         Iec0Dt5THJtV4Jpc4IPrjmEPD7Tqfb5tenIyLnWf6gmEXND09r3FsCuQJ/GChn/dOiE0
         z8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738722932; x=1739327732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1N+4rW3SsekYEUc8nzCVlrVQkaioSvtxJiN6kI5HrK0=;
        b=w1Jdywig44fl+vwr/LzBruumUJIsfL1qcyK9NYswKi1zlTtNpyUN1u+cIR1SBA6RDC
         okGAVijZoN5rml63bZv1HCSU6ZbH3OcSXm/Vv799GlNmqR9l0cyHLt9XwdfdfAZrtr9j
         OEVwY/HjNSriYeBL6sNfv9XxBdU9gZMsHTHjIo9EVPjP3F8GwsUtz1orL9tJl1Iu/3Oy
         q+9oZ/xBduER3gPPRFH03aihgdEg8dDwC28kncsDlbo0dAEgVBdi5dqzPkdwrenDDsTO
         qmtUqcBJfkcHgfjct3uCXZXFpFceRJfNT52u772o2WfVDRgO/xUC/eN+dhRB40H5Khrv
         YbVw==
X-Forwarded-Encrypted: i=1; AJvYcCV5LgSp9Kh0h50VeXSjKY3Yt9pY2il8uxR0BIiiFl4gAFBXzioEHyRUGEx1leoU9FaFd+7OED+TdBo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzSFMG5tsCk7nE2MbQL/iiKDUVDWZa4yWKH5YyS3CF8HBafyHsA
	DfNXdXDU1LmdF2gPB7fzO/sBxqsDxNtyvsUgH79Os+GaM6YB3RG3nqb73fjySyEOL/Ohtnn1UWi
	nZWC36j847DA0yo/Ebr1DEQUEdlw=
X-Gm-Gg: ASbGncvxmAVO74/RlXRX+/VZ8YT0JwWvM1uWzpjUn7QY244/95rDWhWhRnn9kOOgnPS
	SsnhJZu8sqreWO9QFwessNsumvC+iFopzEFVm/XKi+6BAL6Nl/ynqXf/BVpUfTNVcNJOT7VB6
X-Google-Smtp-Source: AGHT+IE063EYM4tWEE7WYPrDhbceSvU1oIFvALHqQjqTvkhDse0m/DanubcApO0WLJidamuFwaSloVjnb4AUFeQhGIE=
X-Received: by 2002:a05:622a:1a9a:b0:462:e827:c11a with SMTP id
 d75a77b69052e-470281ba564mr19695661cf.19.1738722932180; Tue, 04 Feb 2025
 18:35:32 -0800 (PST)
MIME-Version: 1.0
References: <30ad77af-4a7b-4a15-9c0b-b0c70d9e1643@wanadoo.fr>
 <20250204023323.14213-1-jiashengjiangcool@gmail.com> <e41d9378-e5e5-478d-bead-aa50a9f79d4d@wanadoo.fr>
 <48ad8f05-a90b-499d-9e73-8e5ff032824a@kernel.org> <f9a35a4f-b774-4480-910a-cdcf926df41b@wanadoo.fr>
In-Reply-To: <f9a35a4f-b774-4480-910a-cdcf926df41b@wanadoo.fr>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Tue, 4 Feb 2025 21:35:21 -0500
X-Gm-Features: AWEUYZkirK4j39ugQSeyxuqN18Ew0eSAiZ7kK5iwAMUijihh2awqnAb3jDJsyJM
Message-ID: <CANeGvZUzHVnQdwTkam4HE9EVfEf8xY4L7Y20vj5v_N-vbD9kzQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: Add check and kfree() for kcalloc()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jiri Slaby <jirislaby@kernel.org>, gmpy.liaowx@gmail.com, kees@kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_183535_540387_B2E700FB 
X-CRM114-Status: GOOD (  25.38  )
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

SGkgQ2hyaXN0b3BoZSwKCk9uIFR1ZSwgRmViIDQsIDIwMjUgYXQgMzo1MOKAr1BNIENocmlzdG9w
aGUgSkFJTExFVAo8Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI+IHdyb3RlOgo+Cj4gTGUg
MDQvMDIvMjAyNSDDoCAwNzozNiwgSmlyaSBTbGFieSBhIMOpY3JpdCA6Cj4gPiBPbiAwNC4gMDIu
IDI1LCA3OjE3LCBDaHJpc3RvcGhlIEpBSUxMRVQgd3JvdGU6Cj4gPj4gTGUgMDQvMDIvMjAyNSDD
oCAwMzozMywgSmlhc2hlbmcgSmlhbmcgYSDDqWNyaXQgOgo+ID4+PiBBZGQgYSBjaGVjayBmb3Ig
a2NhbGxvYygpIHRvIGVuc3VyZSBzdWNjZXNzZnVsIGFsbG9jYXRpb24uCj4gPj4+IE1vcmVvdmVy
LCBhZGQga2ZyZWUoKSBpbiB0aGUgZXJyb3ItaGFuZGxpbmcgcGF0aCB0byBwcmV2ZW50IG1lbW9y
eQo+ID4+PiBsZWFrcy4KPiA+Pj4KPiA+Pj4gRml4ZXM6IDc4YzA4MjQ3YjlkMyAoIm10ZDogU3Vw
cG9ydCBrbXNnIGR1bXBlciBiYXNlZCBvbiBwc3RvcmUvYmxrIikKPiA+Pj4gQ2M6IDxzdGFibGVA
dmdlci5rZXJuZWwub3JnPiAjIHY1LjEwKwo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBKaWFzaGVuZyBK
aWFuZyA8amlhc2hlbmdqaWFuZ2Nvb2xAZ21haWwuY29tPgo+ID4+PiAtLS0KPiA+Pj4gQ2hhbmdl
bG9nOgo+ID4+Pgo+ID4+PiB2MSAtPiB2MjoKPiA+Pj4KPiA+Pj4gMS4gUmVtb3ZlIHJlZHVuZGFu
dCBsb2dnaW5nLgo+ID4+PiAyLiBBZGQga2ZyZWUoKSBpbiB0aGUgZXJyb3ItaGFuZGxpbmcgcGF0
aC4KPiA+Pj4gLS0tCj4gPj4+ICAgZHJpdmVycy9tdGQvbXRkcHN0b3JlLmMgfCAxOSArKysrKysr
KysrKysrKysrKystCj4gPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZHBzdG9y
ZS5jIGIvZHJpdmVycy9tdGQvbXRkcHN0b3JlLmMKPiA+Pj4gaW5kZXggN2FjOGFjOTAxMzA2Li4y
ZDhlMzMwZGQyMTUgMTAwNjQ0Cj4gPj4+IC0tLSBhL2RyaXZlcnMvbXRkL210ZHBzdG9yZS5jCj4g
Pj4+ICsrKyBiL2RyaXZlcnMvbXRkL210ZHBzdG9yZS5jCj4gPj4+IEBAIC00MTgsMTAgKzQxOCwx
NyBAQCBzdGF0aWMgdm9pZCBtdGRwc3RvcmVfbm90aWZ5X2FkZChzdHJ1Y3QKPiA+Pj4gbXRkX2lu
Zm8gKm10ZCkKPiA+Pj4gICAgICAgbG9uZ2NudCA9IEJJVFNfVE9fTE9OR1MoZGl2X3U2NChtdGQt
PnNpemUsIGluZm8tPmttc2dfc2l6ZSkpOwo+ID4+PiAgICAgICBjeHQtPnJtbWFwID0ga2NhbGxv
Yyhsb25nY250LCBzaXplb2YobG9uZyksIEdGUF9LRVJORUwpOwo+ID4+PiArICAgIGlmICghY3h0
LT5ybW1hcCkKPiA+Pj4gKyAgICAgICAgZ290byBlbmQ7Cj4gPj4KPiA+PiBOaXRwaWNrOiBDb3Vs
ZCBiZSBhIGRpcmVjdCByZXR1cm4uCj4gPj4KPiA+Pj4gKwo+ID4+PiAgICAgICBjeHQtPnVzZWRt
YXAgPSBrY2FsbG9jKGxvbmdjbnQsIHNpemVvZihsb25nKSwgR0ZQX0tFUk5FTCk7Cj4gPj4+ICsg
ICAgaWYgKCFjeHQtPnVzZWRtYXApCj4gPj4+ICsgICAgICAgIGdvdG8gZnJlZV9ybW1hcDsKPiA+
Pj4gICAgICAgbG9uZ2NudCA9IEJJVFNfVE9fTE9OR1MoZGl2X3U2NChtdGQtPnNpemUsIG10ZC0+
ZXJhc2VzaXplKSk7Cj4gPj4+ICAgICAgIGN4dC0+YmFkbWFwID0ga2NhbGxvYyhsb25nY250LCBz
aXplb2YobG9uZyksIEdGUF9LRVJORUwpOwo+ID4+PiArICAgIGlmICghY3h0LT5iYWRtYXApCj4g
Pj4+ICsgICAgICAgIGdvdG8gZnJlZV91c2VkbWFwOwo+ID4+PiAgICAgICAvKiBqdXN0IHN1cHBv
cnQgZG1lc2cgcmlnaHQgbm93ICovCj4gPj4+ICAgICAgIGN4dC0+ZGV2LmZsYWdzID0gUFNUT1JF
X0ZMQUdTX0RNRVNHOwo+ID4+PiBAQCAtNDM1LDEwICs0NDIsMjAgQEAgc3RhdGljIHZvaWQgbXRk
cHN0b3JlX25vdGlmeV9hZGQoc3RydWN0Cj4gPj4+IG10ZF9pbmZvICptdGQpCj4gPj4+ICAgICAg
IGlmIChyZXQpIHsKPiA+Pj4gICAgICAgICAgIGRldl9lcnIoJm10ZC0+ZGV2LCAibXRkJWQgcmVn
aXN0ZXIgdG8gcHNibGsgZmFpbGVkXG4iLAo+ID4+PiAgICAgICAgICAgICAgICAgICBtdGQtPmlu
ZGV4KTsKPiA+Pj4gLSAgICAgICAgcmV0dXJuOwo+ID4+PiArICAgICAgICBnb3RvIGZyZWVfYmFk
bWFwOwo+ID4+PiAgICAgICB9Cj4gPj4+ICAgICAgIGN4dC0+bXRkID0gbXRkOwo+ID4+PiAgICAg
ICBkZXZfaW5mbygmbXRkLT5kZXYsICJBdHRhY2hlZCB0byBNVEQgZGV2aWNlICVkXG4iLCBtdGQt
PmluZGV4KTsKPiA+Pj4gKyAgICBnb3RvIGVuZDsKPiA+Pgo+ID4+IE1hdGVyIG9mIHRhc3RlLCBi
dXQgSSB0aGluayB0aGF0IGhhdmluZyBhbiBleHBsaWNpdCByZXR1cm4gaGVyZSB3b3VsZAo+ID4+
IGJlIGNsZWFyZXIgdGhhdCBhIGdvdG8gZW5kOwo+ID4KPiA+IFllcywgZHJvcCB0aGUgd2hvbGUg
ZW5kLgo+ID4KPiA+Pj4gK2ZyZWVfYmFkbWFwOgo+ID4+PiArICAgIGtmcmVlKGN4dC0+YmFkbWFw
KTsKPiA+Pj4gK2ZyZWVfdXNlZG1hcDoKPiA+Pj4gKyAgICBrZnJlZShjeHQtPnVzZWRtYXApOwo+
ID4+PiArZnJlZV9ybW1hcDoKPiA+Pj4gKyAgICBrZnJlZShjeHQtPnJtbWFwKTsKPiA+Pgo+ID4+
IEkgdGhpbmsgdGhhdCBpbiBhbGwgdGhlc2UgcGF0aHMsIHlvdSBzaG91bGQgYWxzbyBoYXZlCj4g
Pj4gICAgICBjeHQtPlhYWG1hcCA9IE5VTEw7Cj4gPj4gYWZ0ZXIgdGhlIGtmcmVlKCkuCj4gPj4K
PiA+PiBvdGhlcndpc2Ugd2hlbiBtdGRwc3RvcmVfbm90aWZ5X3JlbW92ZSgpIGlzIGNhbGxlZCwg
eW91IGNvdWxkIGhhdmUgYQo+ID4+IGRvdWJsZSBmcmVlLgo+ID4KPiA+IFJpZ2h0LCBhbmQgdGhp
cyBpcyBhbHJlYWR5IGEgcHJvYmxlbSBmb3IgZmFpbGluZwo+ID4gcmVnaXN0ZXJfcHN0b3JlX2Rl
dmljZSgpIGluIF9hZGQoKSAtLSB0aGVyZSBpcyB1bmNvbmRpdGlvbmFsCj4gPiB1bnJlZ2lzdGVy
X3BzdG9yZV9kZXZpY2UoKSBpbiBfcmVtb3ZlKCkuIFNob3VsZCBfcmVtb3ZlKCkgY2hlY2sgY3h0
LT5tdGQKPiA+IGZpcnN0Pwo+Cj4gTm90IHN1cmUgaXQgaXMgbmVlZGVkLgo+IElJVUMsIFsxXSB3
b3VsZCBub3QgbWF0Y2ggaW4gdGhpcyBjYXNlLCBiZWNhdXNlIFsyXSB3b3VsZCBub3QgaGF2ZSBi
ZWVuCj4gZXhlY3V0ZWQuIEFncmVlZD8KClRoYW5rcyBmb3IgeW91ciBhZHZpY2UuCkkgaGF2ZSBz
dWJtaXR0ZWQgYSB2MyB0byByZXBsYWNlIGtjYWxsb2MoKSB3aXRoIGRldm1fa2NhbGxvYygpIHRv
CnByZXZlbnQgbWVtb3J5IGxlYWtzLgpNb3Jlb3ZlciwgSSBtb3ZlZCB0aGUgcmV0dXJuIHZhbHVl
IGNoZWNrIHRvIGFub3RoZXIgcGF0Y2gsIHNvIHRoYXQKZWFjaCBwYXRjaCBkb2VzIG9ubHkgb25l
IHRoaW5nLgoKLUppYXNoZW5nCgo+Cj4gQ0oKPgo+Cj4gWzFdOiBodHRwczovL2VsaXhpci5ib290
bGluLmNvbS9saW51eC92Ni4xMy9zb3VyY2UvZnMvcHN0b3JlL2Jsay5jI0wxNjkKPiBbMl06IGh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjEzL3NvdXJjZS9mcy9wc3RvcmUvYmxr
LmMjTDE0MQo+Cj4gPgo+ID4gdGhhbmtzLAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
