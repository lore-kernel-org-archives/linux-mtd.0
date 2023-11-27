Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB43C0755A
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 09:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHGZj0AOilWCfHtwoQyQUNIJMHWVvgAuOptFPl/XaFM=; b=MbdF3zlbKSc+cn
	eJBH+TL3eIhtnms1RI6YgmseqUHZT0Ya59D9JRVnjXoEv6+5YNt4SerqttZvkp3UbdXmiV/Qh2g6m
	9Um6Y2oVeDSAEc+rRBgDDAONXVL9JLJaf7GZXUhbaOGpSrrvNrdH24HQ8FWkWpFxsw2E3lnNngpp4
	wllks8IjNBDYBSYQ8a8CQDjqkOAnU92l8aM1i/T5HkK94gOtiFkTm1Z4zcYbms7gh5mtrLO5E6H9D
	OGDEyAKQ9fZZvXlhwhjcJGta6YyRP6vskPOBerbZ8Xq/rM9WUKDO3ejJeSQAFgCGdFQxJ1w98t7wB
	77pTO7gu4wGjzicsm18g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7YKD-0020gX-10;
	Mon, 27 Nov 2023 09:54:45 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7YK8-0020ev-15
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 09:54:42 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c9a5d2e77bso5845291fa.2
        for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2023 01:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701078876; x=1701683676; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNDOSASSE348dJEzKnXhkJn3g9reCZ9RnDl2i4FVc3A=;
        b=IR4cf+Ia5kLWvdHVOTb6xWGWd4xMn8rfYAdiCcut8o2ct4+g2Mb82RpwGcFWjLHEJT
         b+Y8VSonQXyGw9nYEfZSzCpO/6Fjea1wVsJjjmbHwPAstuPT57YOYf0QCsmfNHLfhw3w
         xymv3/cJeg1YxXUMglvPebauAU1qtSfpJPGCMhSkbTnz9QAS04EtlxI+vzkfxawXk/AW
         RksCchoYsGuns9RYSOAbopUF/P9hqYTR6Lbe05Sm2jQOmjwMO5S3orMu9347/59Hl4fh
         B21CmM/y5XnKNJHUZWbhKOc6FqyLRv6TWG5Ad7/l6w8fcpznH2ZIsGot0h/gbIZW7/Zr
         fGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701078876; x=1701683676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNDOSASSE348dJEzKnXhkJn3g9reCZ9RnDl2i4FVc3A=;
        b=G22D5iHNT9inwx1WSJuJ7HssJo8Yv0Tr2I1GmasFm8pB9dNFkK11ZCri7kM1Er/Dyw
         KemmIexDu31EoR/YUcYqcskrxfkdmowcO3vYrzFK3qXrjguJOQVd7sWqC5eP/hptMnyZ
         OBS++tfCag3ciL91GK3PNzB3+blirJEPxUaedwSsKdWY/Q844iPCV8obhDC/i0lnpVEX
         Fc0Xj5OhVzwfVh5Rpr0GRuuvRSxkEYu1Fdxo0p4G8yX4FH9pQdBFB3L68I8Y0FSbGDq8
         bkNtLJCmq0oeHMJXgAGpHFjwbGSs5kzPwbLvlnrkJRq+L7RWT2ZejM9WiCZlE7vkUotg
         ieIg==
X-Gm-Message-State: AOJu0YzB9/dk6WE/uv3x8g1SkubV9TRaIConZSxcIWl1GjeeGTAvdibu
	aEvhp6AyJ70S7CX6oUo8x4TFl3ROzxPyqverpUwRDRSR21Q=
X-Google-Smtp-Source: AGHT+IHJBjZYtlBz4dUlfvOXi4CHPzLEsYxUwES/LSMBQr4rVHNeJKl88ZBGJFGa07ioaUs+Zb9L6sZ6edUcvMogxLk=
X-Received: by 2002:a2e:940e:0:b0:2c5:1d95:f7a1 with SMTP id
 i14-20020a2e940e000000b002c51d95f7a1mr6295382ljh.27.1701078875465; Mon, 27
 Nov 2023 01:54:35 -0800 (PST)
MIME-Version: 1.0
References: <CAFLxGvxiy9ofrNkfGmu4TvZgdZhdTbZBiK4pDmL8=8kjcPWO2g@mail.gmail.com>
 <ZWRTfaWFzgSfd9_Z@gardel-login>
In-Reply-To: <ZWRTfaWFzgSfd9_Z@gardel-login>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 27 Nov 2023 10:54:23 +0100
Message-ID: <CAFLxGvy69DhAZSOmBaOjxdz5H8Y2PMzCrbdhS2a9GKBswP=iOw@mail.gmail.com>
Subject: Re: [systemd-devel] How to properly wait for udev?
To: Lennart Poettering <lennart@poettering.net>
Cc: systemd-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org, 
	dxld@darkboxed.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_015440_394940_E7603737 
X-CRM114-Status: GOOD (  32.19  )
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

T24gTW9uLCBOb3YgMjcsIDIwMjMgYXQgOToyOeKAr0FNIExlbm5hcnQgUG9ldHRlcmluZwo8bGVu
bmFydEBwb2V0dGVyaW5nLm5ldD4gd3JvdGU6Cj4gT24gU28sIDI2LjExLjIzIDAwOjM5LCBSaWNo
YXJkIFdlaW5iZXJnZXIgKHJpY2hhcmQud2VpbmJlcmdlckBnbWFpbC5jb20pIHdyb3RlOgo+Cj4g
PiBIZWxsbyEKPiA+Cj4gPiBBZnRlciB1cGdyYWRpbmcgbXkgbWFpbiB0ZXN0IHdvcmtlciB0byBh
IHJlY2VudCBkaXN0cmlidXRpb24sIHRoZSBVQkkKPiA+IHRlc3Qgc3VpdGUgWzBdIGZhaWxzIGF0
IHZhcmlvdXMgcGxhY2VzIHdpdGggLUVCVVNZLgo+ID4gVGhlIHJlYXNvbiBpcyB0aGF0IHRoZXNl
IHRlc3RzIGNyZWF0ZSBhbmQgcmVtb3ZlIFVCSSB2b2x1bWVzIHJhcGlkbHkuCj4gPiBBIHR5cGlj
YWwgdGVzdCBzZXF1ZW5jZSBpcyBhcyBmb2xsb3dzOgo+ID4gMS4gY3JlYXRpb24gb2YgL2Rldi91
YmkwXzAKPiA+IDIuIHNvbWUgZXhjbHVzaXZlIG9wZXJhdGlvbiwgc3VjaCBhcyBhdG9taWMgdXBk
YXRlIG9yIHZvbHVtZSByZXNpemUgb24KPiA+IC9kZXYvdWJpMF8wCj4gPiAzLiByZW1vdmFsIG9m
IC9kZXYvdWJpMF8wCj4gPgo+ID4gQm90aCBzdGVwcyAyIGFuZCAzIGNhbiBmYWlsIHdpdGggLUVC
VVNZIGJlY2F1c2UgdGhlIHVkZXYgd29ya2VyIHN0aWxsCj4gPiBob2xkcyBhIGZpbGUgZGVzY3Jp
cHRvciB0byAvZGV2L3ViaTBfMC4KPgo+IEhtbSwgSSBoYXZlIG5vIGV4cGVyaWVuY2Ugd2l0aCBV
QkksIGJ1dCBhcmUgeW91IHN1cmUgd2Ugb3BlbiB0aGF0PyB3aHkKPiB3b3VsZCB3ZT8gYXJlIHN1
Y2ggZGV2aWNlcyBhbmFseXplZCBieSBibGtpZD8gV2UgZ2VuZXJhbGx5IGRvbid0IG9wZW4KPiBk
ZXZpY2Ugbm9kZXMgdW5sZXNzIHdlIGhhdmUgYSByZWFzb24gdG8sIHN1Y2ggYXMgZG9pbmcgYmxr
aWQgb24gaXQgb3IKPiBzby4KCkkgdGhpbmsgaXQgY2FtZSB2aWEgY29tbWl0OgpkYmJmNDI0Yzhi
NzcgKCJydWxlczogdWJpIG10ZCAtIGFkZCBsaW5rIHRvIG5hbWVkIHBhcnRpdGlvbnMgKCM2NzUw
KSIpCgpIZXJlIGlzIHRoZSBicGZ0cmFjZSBvdXRwdXQgb2YgYSBmYWlsZWQgbWt2b2xfYmFzaWMg
cnVuLgpUaGUgdGVzdCBjcmVhdGVkIGEgbmV3IHZvbHVtZSBhbmQgdHJpZWQgdG8gZGVsZXRlIGl0
IHZpYSBpb2N0bCgpLgpSaWdodCBhZnRlciBjcmVhdGluZyB0aGUgdm9sdW1lLCB1ZGV2IHN0YXJ0
ZWQgaW5zcGVjdGluZyBpdCBhbmQgbWt2b2xfYmFzaWMKd2FzIHVuYWJsZSB0byBkZWxldGUgaXQg
YmVjYXVzZSB0aGUgZGVsZXRlIG9wZXJhdGlvbiBuZWVkcyBleGNsdXNpdmUgb3duZXJzaGlwLgoK
bWt2b2xfYmFzaWMoNTMwKTogICAgICAgb3BlbigpID0gL2Rldi91YmkwCm1rdm9sX2Jhc2ljKDUz
MCk6ICAgICAgIGlvY3RsKGNtZDogMTA3NDAzMjM4NSkKKHVkZXYtd29ya2VyKSg1MzEpOiAgICAg
b3BlbiBVQkkgdm9sdW1lIDAgPSAweGZmZmY5NjY0NDUzM2FjODAKbWt2b2xfYmFzaWMoNTMwKTog
ICAgICAgb3BlbiBVQkkgdm9sdW1lIDAgPSAweGZmZmZmZmZmZmZmZmZmZjAKbWt2b2xfYmFzaWMo
NTMwKTogICAgICAgZmFpbGVkIGlvY3RsKCkgPSAtMTYKKHVkZXYtd29ya2VyKSg1MzEpOiAgICAg
Y2xvc2luZyBVQkkgdm9sdW1lIDB4ZmZmZjk2NjQ0NTMzYWM4MAoKPiBXaGF0IHByZWNpc2VseSBm
YWlscyBmb3IgeW91PyB0aGUgb3BlbigpPyBvciBzb21lIG9wZXJhdGlvbiBvbiB0aGUKPiBvcGVu
ZWQgZmQ/CgpBbGwgb2YgdGhhdC4gSSBkZXBlbmRzIG9uIHRoZSB0ZXN0LgpCYXNpY2FsbHkgZXZl
cnkgdGVzdCBhc3N1bWVzIHRoYXQgaXQgaGFzIHRoZSBmdWxsIG93bmVyc2hpcCBvZiBhCnZvbHVt
ZSBpdCBoYXMgY3JlYXRlZC4KCj4gPgo+ID4gRldJVywgdGhlIHByb2JsZW0gY2FuIGFsc28gZ2V0
IHRyaWdnZXJlZCB1c2luZyBVQkkncyBzaGVsbCB1dGlsaXRpZXMKPiA+IGlmIHRoZSBzeXN0ZW0g
aXMgZmFzdCBlbm91Z2gsIGUuZy4KPiA+ICMgdWJpbWt2b2wgLU4gdGVzdHYgLVMgNTAgLW4gMCAv
ZGV2L3ViaTAgJiYgdWJpcm12b2wgLW4gMCAvZGV2L3ViaTAKPiA+IFZvbHVtZSBJRCAwLCBzaXpl
IDUwIExFQnMgKDc5MzYwMCBieXRlcywgNzc1LjAgS2lCKSwgTEVCIHNpemUgMTU4NzIKPiA+IGJ5
dGVzICgxNS41IEtpQiksIGR5bmFtaWMsIG5hbWUgInRlc3R2IiwgYWxpZ25tZW50IDEKPiA+IHVi
aXJtdm9sOiBlcnJvciE6IGNhbm5vdCBVQkkgcmVtb3ZlIHZvbHVtZQo+ID4gICAgICAgICAgZXJy
b3IgMTYgKERldmljZSBvciByZXNvdXJjZSBidXN5KQo+ID4KPiA+IEluc3RlYWQgb2YgYWRkaW5n
IGEgcmV0cnkgbG9vcCBhcm91bmQgLUVCVVNZLCBJIGJlbGlldmUgdGhlIGJlc3QKPiA+IHNvbHV0
aW9uIGlzIHRvIGFkZCBjb2RlIHRvIHdhaXQgZm9yIHVkZXYuCj4gPiBGb3IgZXhhbXBsZSwgaGF2
aW5nIGEgdWRldiBiYXJyaWVyIGluIHViaV9ta3ZvbCgpIGFuZCB1Ymlfcm12b2woKSBbMV0KPiA+
IHNlZW1zIGxpa2UgYSBnb29kIGlkZWEgdG8gbWUuCj4KPiBGb3IgYmxvY2sgZGV2aWNlcyB3ZSBp
bXBsZW1lbnQgdGhpczoKPgo+IGh0dHBzOi8vc3lzdGVtZC5pby9CTE9DS19ERVZJQ0VfTE9DS0lO
Rwo+Cj4gSSB1bmRlcnN0YW5kIFVCSSBhcmVuJ3QgYmxvY2sgZGV2aWNlcyB0aG91Z2g/CgpFeGFj
dGx5LCBVQkkgdm9sdW1lcyBhcmUgY2hhcmFjdGVyIGRldmljZXMsIGp1c3QgbGlrZSBNVERzLgoK
PiBJZiB0aGV5IGNvbmNlcHR1YWxseSBzaG91bGQgYmUgY29uc2lkZXJlZCBibG9jayBkZXZpY2Ug
ZXF1aXZhbGVudHMsIHdlCj4gbWlnaHQgd2FudCB0byBleHRlbmQgdGhlIHVkZXYgbG9naWMgdG8g
c3VjaCBVQkkgZGV2aWNlcyB0b28uICBQYXRjaGVzCj4gd2VsY29tZS4KPgo+IFdlIHByb3ZpZGUg
InVkZXZhZG0gbG9jayIgdG8gbG9jayBhIGJsb2NrIGRldmljZSBhY2NvcmRpbmcgdG8gdGhpcwo+
IHNjaGVtZSBmcm9tIHNoZWxsIHNjcmlwdHMuCj4KPiA+IFdoYXQgZnVuY3Rpb24gZnJvbSBsaWJz
eXN0ZW1kIGRvIHlvdSBzdWdnZXN0IGZvciB3YWl0aW5nIHVudGlsIHVkZXYgaXMKPiA+IGRvbmUg
d2l0aCBydWxlIHByb2Nlc3Npbmc/Cj4gPiBNeSBuYWl2ZSBhcHByb2FjaCwgdXNpbmcgdWRldl9x
dWV1ZV9pc19lbXB0eSgpIGFuZAo+ID4gc2RfZGV2aWNlX2dldF9pc19pbml0aWFsaXplZCgpLCBk
b2VzIG5vdCByZXNvbHZlIGFsbCBmYWlsdXJlcyBzbyBmYXIuCj4gPiBGaXJzdGx5LCB1ZGV2X3F1
ZXVlX2lzX2VtcHR5KCkgZG9lc24ndCBzZWVtIHRvIGJlIGV4cG9ydGVkIGJ5Cj4gPiBsaWJzeXN0
ZW1kLiBJIGhhdmUgb3Blbi1jb2RlZCBpdCBhczoKPiA+IHN0YXRpYyBpbnQgdWRldl9xdWV1ZV9p
c19lbXB0eSh2b2lkKSB7Cj4gPiAgICAgICAgcmV0dXJuIGFjY2VzcygiL3J1bi91ZGV2L3F1ZXVl
IiwgRl9PSykgPCAwID8KPiA+ICAgICAgICAgICAgICAgIChlcnJubyA9PSBFTk9FTlQgPyB0cnVl
IDogLWVycm5vKSA6IGZhbHNlOwo+ID4gfQo+Cj4gVGhpcyBkb2Vzbid0IHJlYWxseSB3b3JrLiB1
ZGV2IG1pZ2h0IHN0aWxsIHByb2Nlc3MgdGhlIGRldmljZSBpbiB0aGUKPiBiYWNrZ3JvdW5kLgoK
SSBzZWUuCgotLSAKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
