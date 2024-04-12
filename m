Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5263C4345F
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2024 15:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8QJUkDPC0QGemRID+3/HwnxKo3r6Boq0fl3+8ywdcY=; b=2V5pJW53zZUORl
	QD72A2VitS7m26li27lM8Rkatdpm6GcG1N7PVUt7D4p4uAZQhosA9z6Q7sBuepbZjflsywreVW98z
	Rt8jtXXlQGk/1B57Bfasz5IbMhlJNqpSQ95X5xLDSt7zrGylxCL31KxnqcWqMai/FeEJYNZtmKWAU
	0vQ6WMcjWzJt4cVEcxKRi+znwWPxtScQKOqnFWcrEcIwPNzz5dp9TL0kSWJcIskCjOSAb4jch9Fuo
	CVOvD/looa291gCfKpZ/s86tDZaZJIuvA4BT4P7IWhZEHwHgeuLstjSDgoQwkL63/Ly3wYwCI6dfl
	Fwc2Q/kZ66ABu1sfRVRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvIoX-00000000EUx-0XNq;
	Fri, 12 Apr 2024 15:27:41 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvIoU-00000000ETr-02Cb
	for linux-mtd@lists.infradead.org;
	Fri, 12 Apr 2024 15:27:39 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6964b1c529cso7280256d6.0
        for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2024 08:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712935654; x=1713540454; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbEJNdBEgg7zteIjPRT61BO8wQHmtBNPFF5TlQkKbKo=;
        b=YlNvrpz05u/BrrjzRjSoqYaDDZVfWUpAsrpyAZWkKlCwqyN3TAjcJ/AxPXSMYbY+PM
         O3vsyaHYXYU1RSVF9h9B9izgWTXuNtnrDvJ4CZFqbKCIbojY4/w9yVGw6ARu4yghU8mx
         19AJ7i8EwbVWVk32rLLwMuzFC8H/59WbcLKio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712935654; x=1713540454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SbEJNdBEgg7zteIjPRT61BO8wQHmtBNPFF5TlQkKbKo=;
        b=KuEyrdarb526AB/NnA4v066aZ2pQ8njfPcTwZBtWX/j6sOFYoWbcL3cSKszsd0DIUK
         93VANVY5EBml133EZ0DlyRTLITMxXMOaovdV5ImS90gzqCdik1N5/9FNiEBbOOrxlw7W
         B7n712fwxH/ojoim/E9mIcELbxbVlEev07qBjgcjSIFUzGECTAy4ZnlyoAKG+FSsplAX
         1XY6YYbw6aaHHqdWAwBSvYWAV2qe8FpBSecGEEMADSQGd5fQHkxxahA8s5xqNl+PQhYF
         GIhzESJa9E8/RPLeyKmwF8OUb/hhG7DuuNUrJrRqkIH5FT3al3BWQaTOIiPPDZfn6FIZ
         sufg==
X-Forwarded-Encrypted: i=1; AJvYcCWFuxfdV6uyfIfHRDehIBw94RNKWz9qdIRqPiaVMuXSadx09f8zJcaqdPacVfanIz22g13KAypnO8thVmMm0eErtI9s4rJq06jQWj7GLA==
X-Gm-Message-State: AOJu0YyFHsu/WmReu3p4pz6jvxs8Aj8DjWBk1wIOQpJOio8/MFJWVp7t
	dk8hF7Syq4ODPazGEjR8tXe/nHvsqfN0vfJ+ne+UfbK6EbL6r3in4VBAhhQscLGnN7wAoWT3+bu
	g481S1Z/LrzvswwEP5Z/0DQ9CUqzI3RQeprB5
X-Google-Smtp-Source: AGHT+IGJKQQefkr1OCMZT+YQUVp/D1HI8E8z4+jZz882PNsanR0PyfyPLE/FkkTXry1gEPywtXO+rLndVVy0mTpZQc0=
X-Received: by 2002:a05:6214:293:b0:69b:1323:5d12 with SMTP id
 l19-20020a056214029300b0069b13235d12mr3428619qvv.38.1712935654688; Fri, 12
 Apr 2024 08:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240326200645.1182803-1-sjg@chromium.org> <20240408151057.1d1fcfb3@xps-13>
In-Reply-To: <20240408151057.1d1fcfb3@xps-13>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 12 Apr 2024 09:27:23 -0600
Message-ID: <CAFLszTi1tp1-vdy2JLoarVxH_CWB8UMV+sHu=vrn4E7w62i6sw@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: mtd: fixed-partitions: Add alignment properties
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: devicetree@vger.kernel.org, Michael Walle <mwalle@kernel.org>, 
	U-Boot Mailing List <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>, Rob Herring <robh@kernel.org>, 
	linux-mtd@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_082738_253834_D7C8F19D 
X-CRM114-Status: GOOD (  42.67  )
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

SGkgTWlxdWVsLAoKT24gTW9uLCA4IEFwciAyMDI0IGF0IDA3OjExLCBNaXF1ZWwgUmF5bmFsIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIFNpbW9uLAo+Cj4gc2pnQGNo
cm9taXVtLm9yZyB3cm90ZSBvbiBUdWUsIDI2IE1hciAyMDI0IDE0OjA2OjQ0IC0wNjAwOgo+Cj4g
PiBBZGQgdGhyZWUgcHJvcGVydGllcyBmb3IgY29udHJvbGxpbmcgYWxpZ25tZW50IG9mIHBhcnRp
dGlvbnMsIGFrYQo+ID4gJ2VudHJpZXMnIGluIGZpeGVkLXBhcnRpdGlvbi4KPiA+Cj4gPiBGb3Ig
bm93IHRoZXJlIGlzIG5vIGV4cGxpY2l0IG1lbnRpb24gb2YgaGllcmFyY2h5LCBzbyBhICdzZWN0
aW9uJyBpcwo+ID4ganVzdCB0aGUgJ2ZpeGVkLXBhcnRpdGlvbnMnIG5vZGUuCj4gPgo+ID4gVGhl
c2UgbmV3IHByb3BlcnRpZXMgYXJlIGlucHV0cyB0byB0aGUgQmlubWFuIHBhY2thZ2luZyBwcm9j
ZXNzLCBidXQgYXJlCj4gPiBhbHNvIG5lZWRlZCBpZiB0aGUgZmlybXdhcmUgaXMgcmVwYWNrZWQs
IHRvIGVuc3VyZSB0aGF0IGFsaWdubWVudAo+ID4gY29uc3RyYWludHMgYXJlIG5vdCB2aW9sYXRl
ZC4gVGhlcmVmb3JlIHRoZXkgYXJlIHByb3ZpZGVkIGFzIHBhcnQgb2YKPiA+IHRoZSBzY2hlbWEu
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+Cj4g
PiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4K
PiA+IENoYW5nZXMgaW4gdjEwOgo+ID4gLSBVcGRhdGUgdGhlIG1pbmltdW0gdG8gMgo+ID4KPiA+
IENoYW5nZXMgaW4gdjk6Cj4gPiAtIE1vdmUgYmluZGluZyBleGFtcGxlIHRvIG5leHQgYmF0Y2gg
dG8gYXZvaWQgYnVpbGQgZXJyb3IKPiA+Cj4gPiBDaGFuZ2VzIGluIHY3Ogo+ID4gLSBEcm9wIHBh
dGNoICdBZGQgYmlubWFuIGNvbXBhdGlibGUnCj4gPiAtIFB1dCB0aGUgYWxpZ25tZW50IHByb3Bl
cnRpZXMgaW50byB0aGUgZml4ZWQtcGFydGl0aW9uIGJpbmRpbmcKPiA+Cj4gPiBDaGFuZ2VzIGlu
IHY2Ogo+ID4gLSBDb3JyZWN0IHNjaGVtYS12YWxpZGF0aW9uIGVycm9ycyBtaXNzZWQgZHVlIHRv
IG9sZGVyIGR0LXNjaGVtYQo+ID4gICAoZW51bSBmaXggYW5kIHJlZyBhZGRpdGlvbikKPiA+Cj4g
PiBDaGFuZ2VzIGluIHY1Ogo+ID4gLSBBZGQgdmFsdWUgcmFuZ2VzCj4gPiAtIENvbnNpc3RlbnRs
eSBtZW50aW9uIGFsaWdubWVudCBtdXN0IGJlIHBvd2VyLW9mLTIKPiA+IC0gTWVudGlvbiB0aGF0
IGFsaWdubWVudCByZWZlcnMgdG8gYnl0ZXMKPiA+Cj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gLSBG
aXggJ2EnIHR5cG8gaW4gY29tbWl0IG1lc3NhZ2UKPiA+Cj4gPiAgLi4uL2JpbmRpbmdzL210ZC9w
YXJ0aXRpb25zL3BhcnRpdGlvbi55YW1sICAgIHwgNTEgKysrKysrKysrKysrKysrKysrKwo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24u
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9w
YXJ0aXRpb24ueWFtbAo+ID4gaW5kZXggMWViZTllMjM0N2VhLi42NTZjYTNkYjE3NjIgMTAwNjQ0
Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlv
bnMvcGFydGl0aW9uLnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFtbAo+ID4gQEAgLTU3LDYgKzU3LDU3IEBA
IHByb3BlcnRpZXM6Cj4gPiAgICAgICAgdXNlciBzcGFjZSBmcm9tCj4gPiAgICAgIHR5cGU6IGJv
b2xlYW4KPiA+Cj4gPiArICBhbGlnbjoKPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFt
bCMvZGVmaW5pdGlvbnMvdWludDMyCj4gPiArICAgIG1pbmltdW06IDIKPiA+ICsgICAgbWF4aW11
bTogMHg4MDAwMDAwMAo+ID4gKyAgICBtdWx0aXBsZU9mOiAyCj4gPiArICAgIGRlc2NyaXB0aW9u
Ogo+ID4gKyAgICAgIFRoaXMgc2V0cyB0aGUgYWxpZ25tZW50IG9mIHRoZSBlbnRyeSBpbiBieXRl
cy4KPiA+ICsKPiA+ICsgICAgICBUaGUgZW50cnkgb2Zmc2V0IGlzIGFkanVzdGVkIHNvIHRoYXQg
dGhlIGVudHJ5IHN0YXJ0cyBvbiBhbiBhbGlnbmVkCj4gPiArICAgICAgYm91bmRhcnkgd2l0aGlu
IHRoZSBjb250YWluaW5nIHNlY3Rpb24gb3IgaW1hZ2UuIEZvciBleGFtcGxlIOKAmGFsaWduID0K
PiA+ICsgICAgICA8MTY+4oCZIG1lYW5zIHRoYXQgdGhlIGVudHJ5IHdpbGwgc3RhcnQgb24gYSAx
Ni1ieXRlIGJvdW5kYXJ5LiBUaGlzIG1heQo+ID4gKyAgICAgIG1lYW4gdGhhdCBwYWRkaW5nIGlz
IGFkZGVkIGJlZm9yZSB0aGUgZW50cnkuIFRoZSBwYWRkaW5nIGlzIHBhcnQgb2YKPiA+ICsgICAg
ICB0aGUgY29udGFpbmluZyBzZWN0aW9uIGJ1dCBpcyBub3QgaW5jbHVkZWQgaW4gdGhlIGVudHJ5
LCBtZWFuaW5nIHRoYXQKPiA+ICsgICAgICBhbiBlbXB0eSBzcGFjZSBtYXkgYmUgY3JlYXRlZCBi
ZWZvcmUgdGhlIGVudHJ5IHN0YXJ0cy4gQWxpZ25tZW50Cj4gPiArICAgICAgbXVzdCBiZSBhIHBv
d2VyIG9mIDIuIElmIOKAmGFsaWdu4oCZIGlzIG5vdCBwcm92aWRlZCwgbm8gYWxpZ25tZW50IGlz
Cj4gPiArICAgICAgcGVyZm9ybWVkLgo+ID4gKwo+ID4gKyAgYWxpZ24tc2l6ZToKPiA+ICsgICAg
JHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gPiArICAgIG1p
bmltdW06IDIKPiA+ICsgICAgbWF4aW11bTogMHg4MDAwMDAwMAo+ID4gKyAgICBtdWx0aXBsZU9m
OiAyCj4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAgICAgIFRoaXMgc2V0cyB0aGUgYWxpZ25t
ZW50IG9mIHRoZSBlbnRyeSBzaXplIGluIGJ5dGVzLiBJdCBtdXN0IGJlIGEgcG93ZXIKPiA+ICsg
ICAgICBvZiAyLgo+ID4gKwo+ID4gKyAgICAgIEZvciBleGFtcGxlLCB0byBlbnN1cmUgdGhhdCB0
aGUgc2l6ZSBvZiBhbiBlbnRyeSBpcyBhIG11bHRpcGxlIG9mIDY0Cj4gPiArICAgICAgYnl0ZXMs
IHNldCB0aGlzIHRvIDY0LiBXaGlsZSB0aGlzIGRvZXMgbm90IGFmZmVjdCB0aGUgY29udGVudHMg
b2YgdGhlCj4gPiArICAgICAgZW50cnkgd2l0aGluIGJpbm1hbiBpdHNlbGYgKHRoZSBwYWRkaW5n
IGlzIHBlcmZvcm1lZCBvbmx5IHdoZW4gaXRzCj4gPiArICAgICAgcGFyZW50IHNlY3Rpb24gaXMg
YXNzZW1ibGVkKSwgdGhlIGVuZCByZXN1bHQgaXMgdGhhdCB0aGUgZW50cnkgZW5kcwo+ID4gKyAg
ICAgIHdpdGggdGhlIHBhZGRpbmcgYnl0ZXMsIHNvIG1heSBncm93LiBJZiDigJhhbGlnbi1zaXpl
4oCZIGlzIG5vdCBwcm92aWRlZCwKPiA+ICsgICAgICBubyBhbGlnbm1lbnQgaXMgcGVyZm9ybWVk
Lgo+Cj4gSSBkb24ndCB0aGluayB3ZSBzaG91bGQgbWVudGlvbiBiaW5tYW4gaGVyZS4gQ2FuIHdl
IGhhdmUgYSBzb2Z0d2FyZQo+IGFnbm9zdGljIGRlc2NyaXB0aW9uPyBUaGlzIHNob3VsZCBiZSB1
bmRlcnN0YW5kYWJsZSBmcm9tIGFueW9uZSBwbGF5aW5nCj4gd2l0aCBtdGQgcGFydGl0aW9ucyBJ
IGd1ZXNzLgoKT0sKCj4KPiA+ICsKPiA+ICsgIGFsaWduLWVuZDoKPiA+ICsgICAgJHJlZjogL3Nj
aGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gPiArICAgIG1pbmltdW06IDIK
PiA+ICsgICAgbWF4aW11bTogMHg4MDAwMDAwMAo+ID4gKyAgICBtdWx0aXBsZU9mOiAyCj4KPiBz
ZWVtcyBub3QgdG8gcGVyZmVjdGx5IG1hdGNoIHRoZSBjb25zdHJhaW50LCBidXQgSSBkb24ndCBr
bm93IGlmIHRoZXJlCj4gaXMgYSBwb3dlck9mIGtleXdvcmQ/IChzYW1lIGFib3ZlKQoKSSBiZWxp
ZXZlIHRoaXMgd2FzIGRpc2N1c3NlZCBlYXJsaWVyLiBObyB0aGVyZSBpcyBubyBzdWNoIG9wdGlv
biEKCj4KPiA+ICsgICAgZGVzY3JpcHRpb246Cj4gPiArICAgICAgVGhpcyBzZXRzIHRoZSBhbGln
bm1lbnQgKGluIGJ5dGVzKSBvZiB0aGUgZW5kIG9mIGFuIGVudHJ5IHdpdGggcmVzcGVjdAo+ID4g
KyAgICAgIHRvIHRoZSBjb250YWluaW5nIHNlY3Rpb24uIEl0IG11c3QgYmUgYSBwb3dlciBvZiAy
Lgo+ID4gKwo+ID4gKyAgICAgIFNvbWUgZW50cmllcyByZXF1aXJlIHRoYXQgdGhleSBlbmQgb24g
YW4gYWxpZ25tZW50IGJvdW5kYXJ5LAo+ID4gKyAgICAgIHJlZ2FyZGxlc3Mgb2Ygd2hlcmUgdGhl
eSBzdGFydC4gVGhpcyBkb2VzIG5vdCBtb3ZlIHRoZSBzdGFydCBvZiB0aGUKPiA+ICsgICAgICBl
bnRyeSwgc28gdGhlIGNvbnRlbnRzIG9mIHRoZSBlbnRyeSB3aWxsIHN0aWxsIHN0YXJ0IGF0IHRo
ZSBiZWdpbm5pbmcuCj4gPiArICAgICAgQnV0IHRoZXJlIG1heSBiZSBwYWRkaW5nIGF0IHRoZSBl
bmQuIFdoaWxlIHRoaXMgZG9lcyBub3QgYWZmZWN0IHRoZQo+ID4gKyAgICAgIGNvbnRlbnRzIG9m
IHRoZSBlbnRyeSB3aXRoaW4gYmlubWFuIGl0c2VsZiAodGhlIHBhZGRpbmcgaXMgcGVyZm9ybWVk
Cj4KPiBjb250ZW50PyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2FtZSBjb21tZW50
IGFib3V0IGJpbm1hbj8KCk9LCgo+Cj4gPiArICAgICAgb25seSB3aGVuIGl0cyBwYXJlbnQgc2Vj
dGlvbiBpcyBhc3NlbWJsZWQpLCB0aGUgZW5kIHJlc3VsdCBpcyB0aGF0IHRoZQo+ID4gKyAgICAg
IGVudHJ5IGVuZHMgd2l0aCB0aGUgcGFkZGluZyBieXRlcywgc28gbWF5IGdyb3cuIElmIOKAmGFs
aWduLWVuZOKAmSBpcyBub3QKPiA+ICsgICAgICBwcm92aWRlZCwgbm8gYWxpZ25tZW50IGlzIHBl
cmZvcm1lZC4KPiA+ICsKPiA+ICBpZjoKPiA+ICAgIG5vdDoKPiA+ICAgICAgcmVxdWlyZWQ6IFsg
cmVnIF0KUmVnYXJkcywKU0ltb24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
