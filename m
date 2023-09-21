Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF57E71094
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Sep 2023 17:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82cZwREun6KN9oNTOUgPRLQGV3sJavussqc60U6sL9o=; b=fmvuOHjUDERBn+
	LTIl+g8r+v2NjNo06fIn9ZjNqEEGDQpgAp97Q0EZ8xy8u2FMNJ+6/X++i4BFZglXE968iwyg/XJSN
	J4aYpqG4gnVyygRp1q3qwlwegtG6a7rK18HjX4GaXQbqSaYcW8vvxP2ZNciWjm+c3ltUwOeJ2ga1T
	qtMHjuFwgBpsmgCAFAhQgdvTSY7yI8yldW2yHMyE0bI0Td+7ZWE7ZVqvywTCii+k7VsYt0FHLloXU
	o0GzS40siUoPI+o22ghciZ1B47bG5PYW9iRPT/GombLaZTyvdRfnWiCsDR3iHY4PIVlj24iil1vco
	pzIcAcLJoZqv605klVAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjN3n-006a6x-0U;
	Thu, 21 Sep 2023 17:01:51 +0000
Received: from mail-yw1-f171.google.com ([209.85.128.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjN3k-006a5n-0x
	for linux-mtd@lists.infradead.org;
	Thu, 21 Sep 2023 17:01:49 +0000
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-58dce1f42d6so33388357b3.0
        for <linux-mtd@lists.infradead.org>; Thu, 21 Sep 2023 10:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695315706; x=1695920506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRwAkZSLNnOXU3DV95HgEKiIM/TzYZSIhKT8pNNff1w=;
        b=M1oUKudqj6aaseNz8Pp0CDYo0HmNj2L1jvv/2FEqkcHtf4oj2rR5O0YzrrpzxIvL4C
         P9hdE5vz4b/xsppyC97hoYQonhVzwUV4+4fGe7FTvvfRXV9vTVnXCGY1rqpKlGXXLwSU
         MEgULd2z6kDv8/dn0CweW6ZHCzypKn1uV7t+o11hyKFN3RvyWAmlRIsB/7f/Fqv0GdYp
         bJfiMCGSyuXU8wci3SaBW8XerDV+qqsilYhxWMlw6gUD163cQkZAqNCIo03P/RnrAfR/
         hHyYJxQkjfxfuaE06vYh8+ovvexKYvtcl7X5loelhgflRW+Nren1rnOklTJI3nZMNSaw
         rsGw==
X-Gm-Message-State: AOJu0YxExHunoV41I++6tSD1O0cWRaNR7Po2qmRR0YYoXS6fVq3k2S2d
	bjFu6GSqPsQ87t82BP/A7Dnbd+KY+kn+4XHV
X-Google-Smtp-Source: AGHT+IF6Yy0nGI6jMBK76Tsq1JQ3hoPh6wL2zYWIQZy3SS5rCo16ttKcO7qUp6s0GPt9g/95BBzfww==
X-Received: by 2002:a81:6d8d:0:b0:56f:fd0a:588d with SMTP id i135-20020a816d8d000000b0056ffd0a588dmr162160ywc.8.1695315705689;
        Thu, 21 Sep 2023 10:01:45 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id c7-20020a0dc107000000b0058e37788bf7sm422007ywd.72.2023.09.21.10.01.45
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 10:01:45 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-59e6ebdf949so16958927b3.0
        for <linux-mtd@lists.infradead.org>; Thu, 21 Sep 2023 10:01:45 -0700 (PDT)
X-Received: by 2002:a0d:e2c4:0:b0:59b:b9fe:1838 with SMTP id
 l187-20020a0de2c4000000b0059bb9fe1838mr164509ywe.1.1695315704940; Thu, 21 Sep
 2023 10:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <363186079b4269891073f620e3e2353cf7d2559a.1669988238.git.geert+renesas@glider.be>
 <1503a3857107e3a4f34e0c7fb5dada39@walle.cc> <CAMuHMdXN+HJb=zGeG=3t=Pie9cVpnBLYuEb_qX6=oSxG8eTkAw@mail.gmail.com>
 <20221205163306.GB2012644-robh@kernel.org> <CAMuHMdUcrh26MNYuiqiC0_FMkeHtq1YnJrZKHEV_WQm5Dgzoaw@mail.gmail.com>
 <ee03d150-51cf-4e12-ae2c-9475a192fb6c@linaro.org> <CAMuHMdW_-0f8DOmEzYb28XABqU3oFL4KXf9M-qKVyyrE_Lo+jQ@mail.gmail.com>
 <d4d998cff934328f58cec767f93a59b5@walle.cc>
In-Reply-To: <d4d998cff934328f58cec767f93a59b5@walle.cc>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Sep 2023 19:01:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUK=HvvjeTDefzX9sbY-vaRFVixcSvKVqDPgBpGVt2dQA@mail.gmail.com>
Message-ID: <CAMuHMdUK=HvvjeTDefzX9sbY-vaRFVixcSvKVqDPgBpGVt2dQA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document support for
 more MT25QU parts
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_100148_335591_3D552E4B 
X-CRM114-Status: GOOD (  27.49  )
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

SGkgTWljaGFlbCwKCk9uIFRodSwgU2VwIDIxLCAyMDIzIGF0IDY6MDHigK9QTSBNaWNoYWVsIFdh
bGxlIDxtaWNoYWVsQHdhbGxlLmNjPiB3cm90ZToKPiA+PiBXZSB3b24ndCBicmVhayBjb21wYXRp
YmlsaXR5IHdpdGggb2xkZXIgRFRCcyBpZiB3ZSB1c2UgYSBsaXN0IG9mCj4gPj4gY29tcGF0aWJs
ZXMuIEZpcnN0IHRoZSB2ZW5kb3Igc3BlY2lmaWMgb25lIHdoaWNoIHdpbGwgdXNlIHNvbWUgcXVp
cmtzLAo+ID4+IGFuZCBpZiB0aGF0J3Mgbm90IGF2YWlsYWJsZSwgaGF2ZSBhcyBzZWNvbmQgdGhl
IGdlbmVyaWMgamVkZWMsc3BpLW5vcgo+ID4+IHRvCj4gPj4gZmFsbGJhY2sgdG8uCj4gPgo+ID4g
U3VyZSwgeW91IHNob3VsZCB1c2UgYSBsaXN0Lgo+ID4KPiA+IEJ1dCB0aGUgY3VycmVudCByZWNv
bW1lbmRlZCBwcmFjdGljZSBpcyB0byBub3QgaGF2ZSBhIGxpc3QsCj4gPiBidXQganVzdCAiamVk
ZWMsc3BpLW5vciIgKHVzaW5nIGEgbGlzdCB3aXRoIGEgbmV3IEZMQVNIIHBhcnQgbmFtZQo+ID4g
Y2F1c2VzIGNoZWNrcGF0Y2ggYW5kIGR0YnNfY2hlY2sgd2FybmluZ3MpLiBIZW5jZSBpZiB5b3Ug
Zm9sbG93IHRoYXQKPiA+IHJlY29tbWVuZGF0aW9uLCB5b3Ugd2lsbCBydW4gaW50byBjb21wYXRp
YmlsaXR5IGlzc3VlcyB3aXRoIG9sZGVyIERUQnMKPiA+IHdoZW4geW91IGRpc2NvdmVyIHRoZSBx
dWlyayBsYXRlciwgYW5kIGRlY2lkZSB0byBhZGQgaXQgdG8gdGhlIGxpc3QuCj4KPiBUaGUgU1BJ
IE5PUiBmbGFzaGVzIHNob3VsZCBiZSBhdXRvIGRpc2NvdmVyYWJsZS4gV2h5IGRvIHlvdSBuZWVk
IGEKPiBjb21wYXRpYmxlIHN0cmluZz8gUXVpcmtzIGNhbiBiZSBhZGRlZCB0byB0aGUgZmxhc2hf
aW5mbyBkYXRhYmFzZS4KClRoaXMgYXNzdW1lcyB5b3UgZG9uJ3QgbmVlZCB0aGUgcXVpcmsgYmVm
b3JlIHlvdSBjYW4gaWRlbnRpZnkgdGhlIHBhcnQuCkknbSBub3Qgc3VyZSB0aGF0IGlzIGFsd2F5
cyB0aGUgY2FzZS4KClRoZXJlJ3MgYSBzaW1pbGFyIGlzc3VlIHdpdGggRXRoZXJuZXQgUEhZcyBv
biB0aGUgTURJTyBidXMsIHdoaWNoIGlzCndoeSB0aGV5IGFyZSBnYWluaW5nIHByb3BlciBjb21w
YXRpYmxlIHZhbHVlcyBpbiBtYW55IGJvYXJkIERUUyBmaWxlcy4KCj4gQWxzbyBub3RlLCB0aGF0
IG9uZSByZWFzb24gKm5vdCogdG8gYWRkIGEgcGFydGljdWxhciBmbGFzaCBjb21wYXRpYmxlCj4g
aXMgdGhhdCB0aGV5IGFyZSB1c3VhbGx5IGludGVyY2hhbmdlYWJsZSBhbmQgT0VNcyBkbyBzby4g
U28gYSB3aGVyZQo+IHRvZGF5IGEgYm9hcmQgbWlnaHQgaGF2ZSBhIG1hY3Jvbml4IGZsYXNoLCB0
b21vcnJvdyB0aGF0IGJvYXJkIG1pZ2h0Cj4gaGF2ZSBhIGdpZ2FkZXZpY2Ugb25lIGZvciBleGFt
cGxlLgoKWWVhaCwgdGhhdCdzIGluZGVlZCBoYXBwZW5pbmcsIGFuZCBpdCdzIGFscmVhZHkgYW4g
aXNzdWUuCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0
CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQg
aWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3
aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEkn
bSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0
aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMg
VG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
