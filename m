Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFAAC83F10
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Aug 2023 11:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ataMwkn7x1GBTNVJp+ij4YrFieRZmx7qwnwDdHbNLI4=; b=iHZ8uXleGoCf8Y
	PecNbVyfjRjDRgOQMq60XIPfcVf06rXfmxUUFAIkfONEiHhHIJzsywN9aN8icHFC7Ub2LNN4wjNTO
	H41gvHk1WRJV22TDCP2hCi98w7VSoK8lilQAwXXeUh7lhqh6fCuMcmvpYgHWuZZIMymemwzmsNDoG
	SbkqPEJ1EQgWGIrSiYnccohEAiMdHRcoaWyZk2Aq21DZ4oTkHhSRPf6HJp6pZPjwdtk6mD+ygGpLX
	gdFiyI6VWJNoAJ5b12u3nNa25pyJ4j3MNDGx/pP/DFGzKraMN2t9LXRgzQaozSIljqB2fiK+JrrLG
	eBnCcQODzXSJxS9bwYMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbfif-00FC5M-0K;
	Thu, 31 Aug 2023 11:20:13 +0000
Received: from mail-yb1-f182.google.com ([209.85.219.182])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbfib-00FC4Q-2Y;
	Thu, 31 Aug 2023 11:20:11 +0000
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d776e1f181bso458725276.3;
        Thu, 31 Aug 2023 04:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693480807; x=1694085607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tvSk/EJ3+mJV+DI450j6sRHdpmwF+1NljqzK7MsmgH4=;
        b=Ja5y45jW6zH+K/WVxVJmmWnlP5t1d774gB3f7SR8EPXeCQn2yq03R9aOKxcJelV8r8
         Gbo1sFamxdAYKe2JHIvqDoGSFEAV6VoqeDPWxqzCj11d1IlccOlIX1zhYBXuAvZCzCI6
         zM7PFt489p7BtPMaamIHLadEtbW+uCCwQLB4E+98rIy5bmOfWs3F0gX8WvWhsypQUlag
         JysOanfINaLpNvt6J3/Bi0LZZ7fmcVkYOHN/A9bBEj3hsSYQz/WilO0JItiPZUBb9Tnm
         mvu/cQk+E/DeXMtFRsRLz7YZRjPxN/tM7jlTvc2hHP1c1gdMZFxdgUKPxblYV3XcZoS/
         mxCw==
X-Gm-Message-State: AOJu0Yw907m4Hf59Pq1PXtJ9MiILXxr+Tt2UMSlGp1RHWgE5lGbxmbKD
	p7OQpLCWeyqlstCJH1PvYXaxzLawDPywKg==
X-Google-Smtp-Source: AGHT+IFjVl8XYky/wCy8hKFBxsUjgwGswVe0ab2caJX3qORcLSRDlbZdSQZ3R9uAEEb9mjjtCbOOLw==
X-Received: by 2002:a25:2d0a:0:b0:d19:40c2:eb03 with SMTP id t10-20020a252d0a000000b00d1940c2eb03mr4873461ybt.54.1693480807155;
        Thu, 31 Aug 2023 04:20:07 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id g18-20020a256b12000000b00d7473b81a2csm238467ybc.26.2023.08.31.04.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 04:20:06 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d7d50ba994eso462909276.1;
        Thu, 31 Aug 2023 04:20:06 -0700 (PDT)
X-Received: by 2002:a25:2e4d:0:b0:d78:2ca3:b664 with SMTP id
 b13-20020a252e4d000000b00d782ca3b664mr4852412ybn.51.1693480806388; Thu, 31
 Aug 2023 04:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <07cf5e2b466f3ba217403afc66a8246460609e09.1679330105.git.geert+renesas@glider.be>
 <4afd79ba-215d-8b33-4999-4afaa88ae051@linaro.org> <CAMuHMdXE=jvjKTekRgWpYRPa7_T51qRdTXTgB3nQn5Dcjjg7bA@mail.gmail.com>
 <CAMuHMdVsbcuH+UYKb2be34LAk=gu8GMOQ+5+uxk_O585X4rWBg@mail.gmail.com>
 <CAMuHMdWvVmQ6ZuYAs2z9xAJ9y82UNAckXDmkSQSXxGY_KyT4tg@mail.gmail.com>
 <8dc85429-5e04-96b6-4e54-85cc823cbe5a@linaro.org> <CAMuHMdV0WqD1FGccKCm9pZQK9MukD3yfsr2krg9dD2D_i=2KXA@mail.gmail.com>
In-Reply-To: <CAMuHMdV0WqD1FGccKCm9pZQK9MukD3yfsr2krg9dD2D_i=2KXA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 31 Aug 2023 13:19:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU6cLnaxU3z5fMAc+JwXB8z531tN4YXzTYoUwWWyT3jNA@mail.gmail.com>
Message-ID: <CAMuHMdU6cLnaxU3z5fMAc+JwXB8z531tN4YXzTYoUwWWyT3jNA@mail.gmail.com>
Subject: Re: [PATCH/RFC] ARM: dts: marzen: Add FLASH node
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_042009_828566_C5E25B80 
X-CRM114-Status: GOOD (  47.45  )
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

T24gTW9uLCBBcHIgMTAsIDIwMjMgYXQgMTE6MjXigK9BTSBHZWVydCBVeXR0ZXJob2V2ZW4KPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPiBPbiBGcmksIEFwciA3LCAyMDIzIGF0IDk6MTbi
gK9BTSBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4g
T24gNC8zLzIzIDE3OjI5LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gPiA+IE9uIFR1ZSwg
TWFyIDIxLCAyMDIzIGF0IDQ6MDHigK9QTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4
LW02OGsub3JnPiB3cm90ZToKPiA+ID4+IE9uIE1vbiwgTWFyIDIwLCAyMDIzIGF0IDc6NTfigK9Q
TSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPiA+ID4+
PiBPbiBNb24sIE1hciAyMCwgMjAyMyBhdCA2OjA04oCvUE0gVHVkb3IgQW1iYXJ1cyA8dHVkb3Iu
YW1iYXJ1c0BsaW5hcm8ub3JnPiB3cm90ZToKPiA+ID4+Pj4gVmlnbmVzaCB1c2VkIHRvIHJldmll
dyBDRkkgY29kZSwgbWF5YmUgaGUgY2FuIGludGVydmVuZS4gSSd2ZSBuZXZlcgo+ID4gPj4+PiB3
b3JrZWQgd2l0aCBDRkksIGJ1dCBJIGNhbiB0cnkgdG8gaGVscC4gSSdsbCBuZWVkIG1vcmUgZGVi
dWcgZGF0YSB0aG91Z2guCj4gPiA+Pj4+Cj4gPiA+Pj4+IE9uIDMvMjAvMjMgMTY6NDMsIEdlZXJ0
IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+ID4+Pj4+IEFkZCBhIGRldmljZSBub2RlIGZvciB0aGUg
U3BhbnNpb24gUzI5R0w1MTJOIE5PUiBGTEFTSCBvbiB0aGUgTWFyemVuCj4gPiA+Pj4+PiBkZXZl
bG9wbWVudCBib2FyZC4KPiA+ID4+Pj4+Cj4gPiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+ID4gPj4+Pj4gLS0tCj4gPiA+
Pj4+PiBBbHRob3VnaCB0aGUgUzI5R0w1MTJOIGlzIGEgQ0ZJIEZMQVNILCB1c2luZyAiY2ZpLWZs
YXNoIiBpbnN0ZWFkIG9mCj4gPiA+Pj4+PiAibXRkLXJvbSIgZG9lcyBub3Qgd29yazoKPiA+ID4+
Pj4+ICAgMS4gUHJvYmluZyBmYWlscyB3aXRoICJwaHlzbWFwLWZsYXNoIDAuZmxhc2g6IG1hcF9w
cm9iZSBmYWlsZWQiLAo+ID4gPj4+Pgo+ID4gPj4+PiBJIHdvdWxkIGZpcnN0IHRyeSB0byB1bmRl
cnN0YW5kIHdoeSB0aGUgcHJvYmUgZmFpbHMuCj4gPiA+Cj4gPiA+PiBJIHN1ZGRlbmx5IHJlbWVt
YmVyZWQgSSBoYXZlIGEgZGlmZmVyZW50IGJvYXJkIChBUEU2LUVWTSksIHdoZXJlCj4gPiA+PiB0
aGUgQ0ZJLUZMQVNIIHN0b3BwZWQgd29ya2luZyBhZnRlciBhZGRpbmcgc3VwcG9ydCBmb3Igc2Vj
b25kYXJ5Cj4gPiA+PiBDUFVzLiBJIGFsd2F5cyB0aG91Z2h0IHRoYXQgd2FzIGEgaGFyZHdhcmUg
cXVpcmsuLi4KPiA+ID4+Cj4gPiA+PiBUdXJucyBvdXQgdGhlIENGSS1GTEFTSCBvbiBNYXJ6ZW4g
KHF1YWQgQ29ydGV4LUE5KSBpcyBkZXRlY3RlZCB3aGVuCj4gPiA+PiBib290aW5nIHdpdGggIm5v
c21wIjoKPiA+ID4KPiA+ID4+IE15IGZpcnN0IGd1ZXNzIHdhcyB0aGF0IHRoZSBwcm9iaW5nIHBy
b2Nlc3MgaXMgbWlncmF0ZWQgdG8gYSBkaWZmZXJlbnQKPiA+ID4+IENQVSBjb3JlIGR1cmluZyBw
cm9iaW5nLCBidXQgcHJpbnRpbmcgc21wX3Byb2Nlc3Nvcl9pZCgpIGRpZG4ndAo+ID4gPj4gY29u
ZmlybSB0aGF0OyBpdCdzIGp1c3QgcnVubmluZyBvbiBhIGRpZmZlcmVudCBDUFUgY29yZSB0aGFu
IENQVTAuCj4gPiA+PiBXcmFwcGluZyB0aGUgYm9keSBvZiBjZmlfcXJ5X21vZGVfb24oKSBpbnNp
ZGUgYSBnZXRfY3B1KCkvcHV0X2NwdSgpCj4gPiA+PiBwYWlyIHRvIHByZXZlbnQgbWlncmF0aW9u
IGFsc28gZGlkbid0IGZpeCBpdC4KPiA+ID4+Cj4gPiA+PiBJcyBDRkktRkxBU0gga25vd24tYnJv
a2VuIG9uIFNNUD8KPiA+ID4KPiA+ID4gQWZ0ZXIgYWN0aXZlbHkgbG9va2luZyBmb3IgbW9yZSBi
b2FyZHMgd2l0aCBDRkkgRkxBU0hlcywgYW5kIGZpbmRpbmcgb25lCj4gPiA+IG1vcmUgYm9hcmQg
d2hlcmUgRkxBU0ggcHJvYmluZyBmYWlscyBvbiBTTVAsIEkgZHVnIGRlZXBlci4KPiA+ID4gVHVy
bnMgb3V0IHRoZXkgYWxsIGhhdmUgaW4gY29tbW9uIHRoYXQgKGEpIHRoZSBDRkkgRkxBU0ggaXMg
bG9jYXRlZCBhdAo+ID4gPiBwaHlzaWNhbCBhZGRyZXNzIHplcm8sIGFuZCAoYikgdGhlIHNlY29u
ZGFyeSBDUFUgYnJpbmd1cCBjb2RlIHJlbGllcwo+ID4gPiBvbiBtYXBwaW5nIChieSBzcGVjaWFs
IGhhcmR3YXJlKSB0aGUgcmVnaW9uIGF0IGFkZHJlc3MgemVybyB0byB0aGUKPiA+ID4gQ1BVIGJv
b3QgY29kZS4uLgo+ID4gPgo+ID4gPiBIZW5jZSBmaXhpbmcgdGhpcyBpbnZvbHZlcyBtYWtpbmcg
c3VyZSB0aGF0IGFjY2Vzc2luZyBGTEFTSCBhbmQgYnJpbmdpbmcKPiA+ID4gQ1BVIGNvcmVzIG9u
bGluZSBkbyBub3QgaGFwcGVuIGNvbmN1cnJlbnRseS4uLgo+ID4KPiA+IFdvdWxkIGRlZmVycmlu
ZyBwcm9iZSBmb3IgQ0ZJIHdvcms/Cj4KPiBQcm9iZSBkZWZlcnJhbCBvZiBDRkkgRkxBU0ggd291
bGQgbm90IGhlbHAsIGFzIHRoZSBGTEFTSCBpcyBhbHJlYWR5Cj4gcHJvYmVkIGFmdGVyIHNlY29u
ZGFyeSBDUFUgc3RhcnR1cC4KPgo+IFNlcXVlbmNlIG9mIG9wZXJhdGlvbnMgaXM6Cj4gICAxLiBN
YXAgZmlyc3QgcGFnZShzKSBvZiBwaHlzaWNhbCBhZGRyZXNzIHNwYWNlIHRvIFJBTSBjb250YWlu
aW5nCj4gICAgICBDUFUgc3RhcnR1cCBjb2RlIChub3QgdXNpbmcgdGhlIE1NVSwgYnV0IHVzaW5n
IGEgc3BlY2lhbAo+ICAgICAgcmVnaXN0ZXIgaW4gdGhlIFNvQyksCj4gICAyLiBCb290IHNlY29u
ZGFyeSBDUFUgY29yZXMsCj4gICAzLiBQcm9iZSBDRkktRkxBU0g6IGZhaWxzLCBhcyBhY2Nlc3Nl
cyB0byB0aGUgZmlyc3QgcGFnZShzKSBvZgo+ICAgICAgcGh5c2ljYWwgYWRkcmVzcyBzcGFjZSBk
byBub3QgYWRkcmVzcyB0aGUgRkxBU0gsIGJ1dCB0aGUgQ1BVCj4gICAgICBzdGFydHVwIGNvZGUg
aW4gUkFNLgo+ICAgNC4gQWZ0ZXIgYm9vdCwgQ1BVIGNvcmVzIGNhbiBiZSBvZmZsaW5lZCBhbmQg
b25saW5lZCB1c2luZyBDUFUKPiAgICAgICBob3RwbHVnIHRocm91Z2ggc3lzZnMuCj4KPiBXaGVu
IHVzaW5nICJtdGQtcm9tIiBpbnN0ZWFkIG9mICJjZmktZmxhc2giLCB0aGUgc3lzdGVtIGJvb3Rz
IGZpbmUsCj4gYnV0IHRoZSBmaXJzdCBwYWdlIG9mIC9kZXYvbXRkMCBkb2VzIG5vdCBjb250YWlu
IHRoZSBGTEFTSCBjb250ZW50cywKPiBidXQgdGhlIENQVSBzdGFydHVwIGNvZGUsIHdoaWNoIEkg
aGFkbid0IG5vdGljZWQgb3JpZ2luYWxseS4uLgo+Cj4gRGlzYWJsaW5nIHRoZSBzcGVjaWFsIG1h
cHBpbmcgZm9yIHRoZSBDUFUgc3RhcnR1cCBjb2RlIGFmdGVyIGFsbCBjb3Jlcwo+IGhhdmUgYmVl
biBicm91Z2h0IHVwIChpbiBiZXR3ZWVuIHN0ZXBzIDIgYW5kIDMpIGZpeGVzIHRoZSBDRkktRkxB
U0guCj4gSG93ZXZlciwgaWYgYSBDUFUgY29yZSBpcyBvZmZsaW5lZCBhbmQgb25saW5lZCBhdCBy
dW4tdGltZSwgdGhlIHNwZWNpYWwKPiBtYXBwaW5nIGhhcyB0byBiZSByZWluc3RhbnRpYXRlZCB0
ZW1wb3JhcmlseSBhZ2FpbiwgdGh1cyBhbnkgRkxBU0gKPiBhY2Nlc3NlcyAoYnkgb3RoZXIgQ1BV
cykgbXVzdCBiZSBwcmV2ZW50ZWQgdGVtcG9yYXJpbHksIHRvby4KPgo+IFRoaXMgaXNzdWUgaXMg
cHJlc2VudCBvbiBhbGwgUmVuZXNhcyBTSC9SLU1vYmlsZSBhbmQgUi1DYXIgU29Dcwo+IHRoYXQg
c3VwcG9ydCBTTVAuIEkgYW0gd29uZGVyaW5nIGlmIHRoZXJlIGFyZSBhbnkgb3RoZXIgU01QIFNv
Q1MgdGhhdAo+IHN1ZmZlciBmcm9tIHNpbWlsYXIgaXNzdWVzLCBhbmQgdGhhdCBoYXZlIHNvbHZl
ZCB0aGVtPyBJIGNvdWxkbid0IGZpbmQKPiBhbnkgaW4tdHJlZSBEVFMgZm9yIGEgYm9hcmQgd2l0
aCBDRkktRkxBU0ggb3IgbXRkLXJvbSBhdCBhZGRyZXNzIHplcm8KPiB1c2luZyBhbiBTTVAgQVJN
IFNvQy4uLgo+Cj4gSSBndWVzcyB0aGUgc2ltcGxlc3QgInNvbHV0aW9uIiBpcyB0byBkaXNhYmxl
IGluIERUIGFueSBkZXZpY2UgYXQgYWRkcmVzcyB6ZXJvCj4gd2hlbiBTTVAgaXMgdXNlZCAod2hl
biBzdGVwIDEgaXMgZXhlY3V0ZWQpLi4uCgpPciByZXNlcnZlIHRoZSBib290IGFyZWEgdXNpbmcg
cmVxdWVzdF9tZW1fcmVnaW9uKCkuCkkgaGF2ZSBwb3N0ZWQgYW4gUkZDIHBhdGNoIHNlcmllcyBk
b2luZyB0aGF0OgoiW1BBVENIL1JGQyAwLzRdIEFSTTogc2htb2JpbGU6IFJlc2VydmUgYm9vdCBh
cmVhIHdoZW4gU01QIGlzIGVuYWJsZWQiCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9jb3Zl
ci4xNjkzNDA5MTg0LmdpdC5nZWVydCtyZW5lc2FzQGdsaWRlci5iZQoKR3J7b2V0amUsZWV0aW5n
fXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZl
biAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4
ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJ
IGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0
cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
