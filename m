Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63706C43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 06:58:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FA732085A
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 06:58:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hvl2+GNw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Te96iaoU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FA732085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=21VsVSHPPOO+41WbK6W5J6zZ0uyKG2ZwypKfaXyAXrA=; b=Hvl2+GNwxQldoc
	gziNYVzXEQsF+zM546B9JIsRDOXalSWe+ht5ubeWQ01Ue5/34ikQS/TRve2f6hR+381IHdb57N+yK
	RL4opBCF5+5mizbGOqUQKq2Jt6b6VlOPU0jBt7XwIkOhYvWSYImZjNkfBnAZSzMlt/+LlOSXECKS8
	5gIkNzApCK8zGO0pD+f18+8bZAqtNsa1W5X9R8cEnVO2GyHZqD5+gWigyNdj9IhE077pG4+JYNDnV
	LDrFpPaAKc+nKkvGC3Fx0o9NtL9WyIc6ijiQxLme+tjQgFH1lygmfzOvh9rmaKk/uTIGVMnCv3Gj4
	U5RzEtpU37EdBLBSEu+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hM5fz-0006p2-5o; Thu, 02 May 2019 06:58:39 +0000
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hM5fv-0006og-PJ
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 06:58:37 +0000
Received: by mail-it1-x141.google.com with SMTP id i131so1511147itf.5
 for <linux-mtd@lists.infradead.org>; Wed, 01 May 2019 23:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EnR/15GUzu6OTQgIg7gqJkufZbbnK4uQAt2gU+Gztq8=;
 b=Te96iaoUhdYXTuqFtiB8ysa5TLrj0t5fKBni1++y5Eod1/Ooah8G+r/UA3yaKUMJ2i
 snPVnHhahoRol0awHyaVb9504oJPwQx4IW0k3Fly3rm8PsVT4Q7Z5SjUJghmO9RWWizH
 S61GTBmB7+4UVFiYn68GXjwwGiU+WphtPZhQ5uLZRZxBkVVEvUG0u2FK5xXjE6Mrd5fl
 EPwxcFCDRnOoxbDXbIBqHZGCGiOVGI+B7gYQQ2HXk+GCd04/Ya5xzfBDVhMTPgV+oKBB
 r4G3ntyM8yvpej6uurUnF/9fjmAyMNrxDzWzo6Tht9rjoIfBMdrW0h150oxbxNjCCqmL
 vIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EnR/15GUzu6OTQgIg7gqJkufZbbnK4uQAt2gU+Gztq8=;
 b=C6aDuC+qPG57fsr2MyIuL1lSaZRz6dclDlVL+M0EJB+TL0P5hzjMWWRN97z8H4GcBR
 zAeR/3E7Bgu9cGVll3/bikkTSrVXDyknEebNXEAAY7saVlBy9h2/ggVy46u2WjKZ39AL
 VxNEsqUQfhFAO7aYnmrBckUs2tJ2/74XCrtOrVyBvC3x9vQJdmsh8IY5ptqnEd/TMuc5
 0eNWyPasH33L/WtjfrdVeZJOZbgnl4DJlAYKN+kraLOILubV1PzRlufGvuz8CI4t3TTI
 i2WTv6CaqmUunw1wyYcK+iXHl8h9RhTUVmr7dbAUXJnRlJB/ZqvVtmDpYwtlZJ8XjD5T
 +4gQ==
X-Gm-Message-State: APjAAAUXzvc4et/nznkZa6Pa18JAPEbgZpUP3gECN53hZMICAXzSmZ0a
 pgEFz5UyHxkIMEt4w/GpI1er4TGOF0AVCz/ad1A=
X-Google-Smtp-Source: APXvYqxGbhVpVlFc8rov0FPctiHE03qgmpZ2PnNy5V+tKo+Vs9IhUeDL3rzXZ63FEcFpgxRBxgyqean9YdwuFqY1AFU=
X-Received: by 2002:a24:c488:: with SMTP id v130mr1356394itf.96.1556780314685; 
 Wed, 01 May 2019 23:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
 <20190426164224.11327-5-pawel.mikolaj.chmiel@gmail.com>
 <20190502015408.GA11612@bogus>
 <CA+Ln22HLqnbbY37FG6CwjZvZH7G35Z+0kNq7XFU4WtZyk_EqZQ@mail.gmail.com>
 <20190502083632.0ec0fb4e@collabora.com>
 <CA+Ln22H4ua9Zuh4eKaWfHtqh8DieyiS=5s7wS6-TbmA5Dsop4A@mail.gmail.com>
 <20190502085518.5d248167@collabora.com>
In-Reply-To: <20190502085518.5d248167@collabora.com>
From: Tomasz Figa <tomasz.figa@gmail.com>
Date: Thu, 2 May 2019 15:58:24 +0900
Message-ID: <CA+Ln22EJ3G9ez4XZ3ysZBt6thsqDYDtik8fw-gfExR9Y7wFN9A@mail.gmail.com>
Subject: Re: [PATCH 4/5] dt-binding: mtd: onenand/samsung: Add device tree
 support
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190501_235835_849923_740D0A77 
X-CRM114-Status: GOOD (  33.17  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 bbrezillon@kernel.org, richard@nod.at,
 linux-kernel <linux-kernel@vger.kernel.org>, marek.vasut@gmail.com,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com,
 David Woodhouse <dwmw2@infradead.org>, devicetree <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

MjAxOeW5tDXmnIgy5pelKOacqCkgMTU6NTUgQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxs
b25AY29sbGFib3JhLmNvbT46Cj4KPiBPbiBUaHUsIDIgTWF5IDIwMTkgMTU6NDI6NTkgKzA5MDAK
PiBUb21hc3ogRmlnYSA8dG9tYXN6LmZpZ2FAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gMjAxOeW5
tDXmnIgy5pelKOacqCkgMTU6MzYgQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29s
bGFib3JhLmNvbT46Cj4gPiA+Cj4gPiA+IEhpIFRvbWFzeiwKPiA+ID4KPiA+ID4gT24gVGh1LCAy
IE1heSAyMDE5IDE1OjIzOjMzICswOTAwCj4gPiA+IFRvbWFzeiBGaWdhIDx0b21hc3ouZmlnYUBn
bWFpbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiA+IDIwMTnlubQ15pyIMuaXpSjmnKgpIDEwOjU0
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ogo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIEZy
aSwgQXByIDI2LCAyMDE5IGF0IDA2OjQyOjIzUE0gKzAyMDAsIFBhd2XFgiBDaG1pZWwgd3JvdGU6
Cj4gPiA+ID4gPiA+IEZyb206IFRvbWFzeiBGaWdhIDx0b21hc3ouZmlnYUBnbWFpbC5jb20+Cj4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoaXMgcGF0Y2ggYWRkcyBkdC1iaW5kaW5ncyBmb3IgU2Ft
c3VuZyBPbmVOQU5EIGRyaXZlci4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogVG9tYXN6IEZpZ2EgPHRvbWFzei5maWdhQGdtYWlsLmNvbT4KPiA+ID4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogUGF3ZcWCIENobWllbCA8cGF3ZWwubWlrb2xhai5jaG1pZWxAZ21haWwuY29tPgo+
ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gIC4uLi9iaW5kaW5ncy9tdGQvc2Ftc3VuZy1vbmVu
YW5kLnR4dCAgICAgICAgICB8IDQ2ICsrKysrKysrKysrKysrKysrKysKPiA+ID4gPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspCj4gPiA+ID4gPiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zYW1zdW5nLW9uZW5h
bmQudHh0Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3NhbXN1bmctb25lbmFuZC50eHQgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3NhbXN1bmctb25lbmFuZC50eHQKPiA+ID4gPiA+
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4z
NDFkOTdjYzE1MTMKPiA+ID4gPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiA+ID4gPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3NhbXN1bmctb25lbmFuZC50eHQK
PiA+ID4gPiA+ID4gQEAgLTAsMCArMSw0NiBAQAo+ID4gPiA+ID4gPiArRGV2aWNlIHRyZWUgYmlu
ZGluZ3MgZm9yIFNhbXN1bmcgU29DIE9uZU5BTkQgY29udHJvbGxlcgo+ID4gPiA+ID4gPiArCj4g
PiA+ID4gPiA+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ID4gPiA+ID4gPiArIC0gY29tcGF0aWJs
ZSA6IHZhbHVlIHNob3VsZCBiZSBlaXRoZXIgb2YgdGhlIGZvbGxvd2luZy4KPiA+ID4gPiA+ID4g
KyAgIChhKSAic2Ftc3VuZyxzM2M2NDAwLW9uZW5hbmQiIC0gZm9yIG9uZW5hbmQgY29udHJvbGxl
ciBjb21wYXRpYmxlIHdpdGgKPiA+ID4gPiA+ID4gKyAgICAgICBTM0M2NDAwIFNvQywKPiA+ID4g
PiA+ID4gKyAgIChiKSAic2Ftc3VuZyxzM2M2NDEwLW9uZW5hbmQiIC0gZm9yIG9uZW5hbmQgY29u
dHJvbGxlciBjb21wYXRpYmxlIHdpdGgKPiA+ID4gPiA+ID4gKyAgICAgICBTM0M2NDEwIFNvQywK
PiA+ID4gPiA+ID4gKyAgIChjKSAic2Ftc3VuZyxzNXBjMTAwLW9uZW5hbmQiIC0gZm9yIG9uZW5h
bmQgY29udHJvbGxlciBjb21wYXRpYmxlIHdpdGgKPiA+ID4gPiA+ID4gKyAgICAgICBTNVBDMTAw
IFNvQywKPiA+ID4gPiA+ID4gKyAgIChkKSAic2Ftc3VuZyxzNXB2MjEwLW9uZW5hbmQiIC0gZm9y
IG9uZW5hbmQgY29udHJvbGxlciBjb21wYXRpYmxlIHdpdGgKPiA+ID4gPiA+ID4gKyAgICAgICBT
NVBDMTEwL1M1UFYyMTAgU29Dcy4KPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiArIC0gcmVnIDog
dHdvIG1lbW9yeSBtYXBwZWQgcmVnaXN0ZXIgcmVnaW9uczoKPiA+ID4gPiA+ID4gKyAgIC0gZmly
c3QgZW50cnk6IGNvbnRyb2wgcmVnaXN0ZXJzLgo+ID4gPiA+ID4gPiArICAgLSBzZWNvbmQgYW5k
IG5leHQgZW50cmllczogbWVtb3J5IHdpbmRvd3Mgb2YgcGFydGljdWxhciBPbmVOQU5EIGNoaXBz
Owo+ID4gPiA+ID4gPiArICAgICBmb3IgdmFyaWFudHMgYSksIGIpIGFuZCBjKSBvbmx5IG9uZSBp
cyBhbGxvd2VkLCBpbiBjYXNlIG9mIGQpIHVwIHRvCj4gPiA+ID4gPiA+ICsgICAgIHR3byBjaGlw
cyBjYW4gYmUgc3VwcG9ydGVkLgo+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ICsgLSBpbnRlcnJ1
cHQtcGFyZW50IDogcGhhbmRsZSBvZiBpbnRlcnJ1cHQgY29udHJvbGxlciB0byB3aGljaCB0aGUg
T25lTkFORAo+ID4gPiA+ID4gPiArICAgY29udHJvbGxlciBpcyB3aXJlZCwKPiA+ID4gPiA+Cj4g
PiA+ID4gPiBUaGlzIGlzIGltcGxpZWQgYW5kIGNhbiBiZSByZW1vdmVkLgo+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gKyAtIGludGVycnVwdHMgOiBzcGVjaWZpZXIgb2YgaW50ZXJydXB0IHNpZ25hbCB0
byB3aGljaCB0aGUgT25lTkFORCBjb250cm9sbGVyCj4gPiA+ID4gPiA+ICsgICBpcyB3aXJlZDsg
c2hvdWxkIGNvbnRhaW4ganVzdCBvbmUgZW50cnkuCj4gPiA+ID4gPiA+ICsgLSBjbG9jay1uYW1l
cyA6IHNob3VsZCBjb250YWluIHR3byBlbnRyaWVzOgo+ID4gPiA+ID4gPiArICAgLSAiYnVzIiAt
IGJ1cyBjbG9jayBvZiB0aGUgY29udHJvbGxlciwKPiA+ID4gPiA+ID4gKyAgIC0gIm9uZW5hbmQi
IC0gY2xvY2sgc3VwcGxpZWQgdG8gT25lTkFORCBtZW1vcnkuCj4gPiA+ID4gPgo+ID4gPiA+ID4g
SWYgdGhlIGNsb2NrIGp1c3QgZ29lcyB0byB0aGUgT25lTkFORCBkZXZpY2UsIHRoZW4gaXQgc2hv
dWxkIGJlIGluIHRoZQo+ID4gPiA+ID4gbmFuZCBkZXZpY2Ugbm9kZSByYXRoZXIgdGhhbiB0aGUg
Y29udHJvbGxlciBub2RlLgo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IChUcnlpbmcgaGFyZCB0
byByZWNhbGwgdGhlIGRldGFpbHMgYWJvdXQgdGhpcyBoYXJkd2FyZS4pCj4gPiA+ID4gQUZBSVIg
dGhlIGNsb2NrIGdvZXMgdG8gdGhlIGNvbnRyb2xsZXIgYW5kIHRoZSBjb250cm9sbGVyIHRoZW4g
ZmVlZHMKPiA+ID4gPiBpdCB0byB0aGUgbWVtb3J5IGNoaXBzLgo+ID4gPiA+Cj4gPiA+ID4gQWxz
byBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBoYXZlIGFueSBuYW5kIGRldmljZSBub2RlcyBoZXJl
LCBzaW5jZQo+ID4gPiA+IHRoZSBtZW1vcnkgaXRzZWxmIGlzIG9ubHkgZXhwb3NlZCB2aWEgdGhl
IGNvbnRyb2xsZXIsIHdoaWNoIG9mZmVycwo+ID4gPiA+IHZhcmlvdXMgcXVlcmllcyB0byBwcm9i
ZSB0aGUgbWVtb3J5IGF0IHJ1bnRpbWUsIHNvIHRoZXJlIGlzIG5vIG5lZWQgdG8KPiA+ID4gPiBk
ZXNjcmliZSBpdCBpbiBEVC4KPiA+ID4KPiA+ID4gSXQncyBwcm9iYWJseSB0cnVlLCB0aG91Z2gg
bm90IHByb3ZpZGluZyB0aGlzIGNvbnRyb2xsZXIvZGV2aWNlCj4gPiA+IHNlcGFyYXRpb24gZm9y
IE5BTkQgY29udHJvbGxlci9kZXZpY2VzIGhhcyBwcm92ZW4gdG8gYmUgYSBtaXN0YWtlIGZvcgo+
ID4gPiByYXcgTkFORCBjb250cm9sbGVycyAoc29tZSBwcm9wcyBhcHBseSB0byB0aGUgY29udHJv
bGxlcnMgYW5kIG90aGVycyB0bwo+ID4gPiB0aGUgTkFORCBkZXZpY2UsIG5vdCB0byBtZW50aW9u
IHRoYXQgc29tZSBjb250cm9sbGVycyBzdXBwb3J0Cj4gPiA+IGludGVyYWN0aW5nIHdpdGggc2V2
ZXJhbCBjaGlwcyksIHNvLCBpZiB0aGF0J3MgYSBuZXcgYmluZGluZywgSSdkCj4gPiA+IHJlY29t
bWVuZCBoYXZpbmcgdGhpcyBzZXBhcmF0aW9uIGV2ZW4gaWYgaXQncyBub3Qgc3RyaWN0bHkgcmVx
dWlyZWQuCj4gPiA+Cj4gPgo+ID4gTm90ZSB0aGF0IE9uZU5BTkQgaXMgYSB0b3RhbGx5IGRpZmZl
cmVudCB0aGluZyB0aGFuIHRoZSB0eXBpY2FsIE5BTkQKPiA+IG1lbW9yeSB3aXRoIE5BTkQgaW50
ZXJmYWNlLiBPbmVOQU5EIGNoaXBzIGhhdmUgYSBOT1ItbGlrZSBpbnRlcmZhY2UsCj4gPiB3aXRo
IGludGVybmFsIGNvbnRyb2xsZXIgYW5kIGJ1ZmZlcnMgaW5zaWRlLCBzbyB0ZWNobmljYWxseSB0
aGV5IGNhbgo+ID4gYmUgZXZlbiB1c2VkIHdpdGhvdXQgYW55IHNwZWNpYWwgY29udHJvbGxlciBv
biB0aGUgU29DLCB2aWEgYSBnZW5lcmljCj4gPiBwYXJhbGxlbCBob3N0IGludGVyZmFjZSBhbmQg
cG9zc2libHkgc29tZSByZWd1bGFyIERNQSBlbmdpbmUgZm9yIENQVQo+ID4gb2ZmbG9hZC4KPgo+
IFllcywgSSBrbm93IHRoYXQuCj4KPiA+Cj4gPiBUaGUgY29udHJvbGxlciBkZXNpZ24gb2YgdGhl
IFNvQ3MgaW4gcXVlc3Rpb24gZnVydGhlciBhYnN0cmFjdHMgdGhlCj4gPiBPbmVOQU5EJ3MgcHJv
Z3JhbW1pbmcgaW50ZXJmYWNlIGludG8gYSBudW1iZXIgb2YgaGlnaCBsZXZlbCBvcGVyYXRpb25z
Cj4gPiBhbmQgYXR0ZW1wdHMgdG8gaGlkZSB0aGUgZGV0YWlscyBvZiB0aGUgdW5kZXJseWluZyBt
ZW1vcnksIHNvIEkgZG9uJ3QKPiA+IHNlZSB0aGUgcG9pbnQgb2YgZGVzY3JpYmluZyB0aGUgbWVt
b3J5IGluIERUIGhlcmUsIGl0IHdvdWxkIGFjdHVhbGx5Cj4gPiBkZWZlYXQgdGhlIHB1cnBvc2Ug
b2YgdGhpcyBjb250cm9sbGVyLgo+Cj4gSSBkb24ndCBzZWUgaG93IGhhdmluZyBhIHN1Ym5vZGUg
Zm9yIHRoZSBOQU5EIGNoaXAgd291bGQgY2hhbmdlCj4gYW55dGhpbmcgb24gaG93IHRoZSBjb250
cm9sbGVyIGludGVyYWN0cyB3aXRoIHRoZSBOQU5EIGRldmljZS4gTXkgcG9pbnQKPiBpcywgaWYg
d2UgZXZlciBuZWVkIHRvIGFkZCBwcm9wcyB0aGF0IGFwcGx5IHRvIHRoZSBkZXZpY2UgcmF0aGVy
IHRoYW4KPiB0aGUgY29udHJvbGxlciBpdHNlbGYsIGhhdmluZyBhIHNpbmdsZSBub2RlIHRvIHJl
cHJlc2VudCBib3RoIGVsZW1lbnRzCj4gaXMgbm90IHRoYXQgZ3JlYXQuCgpZb3UgbWVhbiwganVz
dCBoYXZpbmcgYSB2ZXJ5IGdlbmVyaWMgb25lbmFuZEAwIG5vZGUgdGhhdCBkb2Vzbid0CnJlYWxs
eSBpbmNsdWRlIGFueSBpbmZvcm1hdGlvbiwgZXhjZXB0IG1heWJlIHRoZSBwYXJ0aXRpb24gdGFi
bGU/IEkKZ3Vlc3MgdGhhdCB3b3VsZG4ndCBoYXZlIGFueSBuZWdhdGl2ZSBzaWRlIGVmZmVjdHMg
aW5kZWVkLgoKTXkgcG9pbnQgd2FzIHRoYXQgd2UgZG9uJ3Qgd2FudCB0byBwdXQgdGhpbmdzIGxp
a2UgY2hpcCB2ZW5kb3IsIHNpemUsCmV0Yy4gaW4gRFQsIHNpbmNlIHRoYXQncyBlbnVtZXJhYmxl
LgoKQmVzdCByZWdhcmRzLApUb21hc3oKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
