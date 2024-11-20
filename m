Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33F9D6E2C9
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Nov 2024 07:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3pv2iCkqJNKbDxy2WgLlB19/5WUQrZIq+vLDZ1kb+tI=; b=jY+mpk5EgTIhAT
	ht4OJE7XhPksaNHQ0GK7POQh0/fTKDxdu3K3IeO5xlCZfgAvWDiBr0Ic5b9nqxDMxmzRe/m5EIJVV
	YWsDiMFjbedByNndxHoTl+YEWAixt7WWkISavnTiu608lUcE3DXTbiPdblxXM8sGGSD7FlOQgQP7Z
	dffploON5AVhJI3+hryiNkz6aOWtF4f5TD4cmqINtBaRKuDkQVB5KTbp0H3RaHa2udzxaDq26w7Xc
	fH1z9+qifFNPWJqf5/4peI6nwmHMuSGr1RJCizl97Lsx61BmBySUMnsjsqOSunp1ou6D1M6LmYgqJ
	gyQZJqAv3B5T9oJ2qtrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDenk-0000000EZm7-0NSv;
	Wed, 20 Nov 2024 07:07:00 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDen0-0000000EZbx-3ag3
	for linux-mtd@lists.infradead.org;
	Wed, 20 Nov 2024 07:06:15 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-71e52582cf8so2972212b3a.2
        for <linux-mtd@lists.infradead.org>; Tue, 19 Nov 2024 23:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732086374; x=1732691174; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xlckAjenAV33rPr5YF519n7jq2uOFDgePjeaHrWm9Hg=;
        b=wSr/ypZN3OEkuAehHSxvDnH1wQUlcgOsLQMlAzd8CM54b0ZPsE2rQYi4pAS/Q7qMUT
         zo3UCYD9jznPEiykvJos+8mnZybjhg832/XSEuJP9dnO/WAUISRCgyNAdGuzSPpahbJC
         YeZMkUIv10pzsIORaNXbGZKHRhlobDGpP/TtgC0jMvFWLdNmJRfV6cYXLcqM0AosKnDe
         liXTH/H1JydUGgnwcQphW92ojSuvx+jVPH70ITH5TU2iue/Pk70j5FM0R6euA7y2S+/c
         WDTlZs9yb+VlH0XGKNZk1UGmDGIRDgzhkDUMeZzgFjXhtuXGOfSEnLqCUFlo7AkzSVXp
         Xcsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732086374; x=1732691174;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xlckAjenAV33rPr5YF519n7jq2uOFDgePjeaHrWm9Hg=;
        b=ABfWh7FZrKnlldJWu5d6XOT+stMCqFzw8prDBSMs7IJ3KraiDnl6IjwMYlHl7YGE7A
         g6/Jlb0tG5jxmOraE1WaZg1PnKANVyHDSU2X6DmGCKaTCW8idA+ok7C8fCq6CkY06jb8
         vl5WXvo/XNWBVj56cemcFeWoGmMzlFwGA2Y9aLOS2UYnk377QF3AKWUO2sr/Ezf7x6IK
         pT26DelYA+HkRd1BTAlfo5TDvazTdQ1klpQWUbnjVDQtm46jXtg8bRvyesVFvQKyFHet
         yfqpMYzY2Gs+TkX/vWx7EgYf3ylHHZ41Ogy+SQaGn0TKYy1M3TA7/VTe1echn6/4FeJe
         xUWA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ7hhTWLOlZQ610nrisim/KoGHdhLFX3Pez/K3yxk2QboMHH9nuD3+epiLowIqqNRgkOFLJCKa2I4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJY2T8mPgGXvxaPVM/E2TEoqJnBPnoeJBRvjhvZrtN/GIjhw4g
	pcFI9lxRjXjJbsQzMUU8S0gV4fVX7js5WX2IVPFHpkKaBSFc78vmPp8o17eOng==
X-Google-Smtp-Source: AGHT+IGSkaeCqxZh6I0KH/lMTfLgGDtX5lRLGmOyj6/PpDk//NzNcx/J304/S7fAeqjaH7OiB7Kb9Q==
X-Received: by 2002:a05:6a00:1311:b0:724:5aac:1687 with SMTP id d2e1a72fcca58-724bed54e77mr2782307b3a.20.1732086373854;
        Tue, 19 Nov 2024 23:06:13 -0800 (PST)
Received: from thinkpad ([120.60.129.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724bef9142dsm901174b3a.100.2024.11.19.23.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 23:06:13 -0800 (PST)
Date: Wed, 20 Nov 2024 12:36:09 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_srichara@quicinc.com,
	quic_nainmeht@quicinc.com, quic_laksd@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [PATCH 2/2] mtd: rawnand: qcom: Fix onfi param page read
Message-ID: <20241120070609.u2nzofwnupyqnjqp@thinkpad>
References: <20241119092058.480363-1-quic_mdalam@quicinc.com>
 <20241119092058.480363-3-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241119092058.480363-3-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_230614_905918_C2CF8CC5 
X-CRM114-Status: GOOD (  25.35  )
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

T24gVHVlLCBOb3YgMTksIDIwMjQgYXQgMDI6NTA6NThQTSArMDUzMCwgTWQgU2FkcmUgQWxhbSB3
cm90ZToKPiBGb3IgUVBJQyBWMiBvbndhcmRzIHRoZXJlIGlzIGEgc2VwYXJhdGUgcmVnaXN0ZXIg
dG8gcmVhZAo+IGxhc3QgY29kZSB3b3JkICJRUElDX05BTkRfUkVBRF9MT0NBVElPTl9MQVNUX0NX
X24iLgo+IAo+IHFjb21fcGFyYW1fcGFnZV90eXBlX2V4ZWMoKSBpcyB1c2VkIHRvIHJlYWQgb25s
eSBvbmUgY29kZSB3b3JkCj4gSWYgd2Ugd2lsbCBjb25maWd1cmUgbnVtYmVyIG9mIGNvZGUgd29y
ZHMgdG8gMSBpbiBRUElDX05BTkRfREVWMF9DRkcwCgpObyAnd2UnIGluIGNvbW1pdCBtZXNzYWdl
LiBBbHNvIHVzZSBpbXBlcmF0aXZlIHRvbmUuCgo+IHJlZ2lzdGVyIHRoZW4gUVBJQyBjb250cm9s
bGVyIHRoaW5rcyBpdHMgcmVhZGluZyB0aGUgbGFzdCBjb2RlIHdvcmQsCj4gc2luY2Ugd2UgYXJl
IGhhdmluZyBzZXBhcmF0ZSByZWdpc3RlciB0byByZWFkIHRoZSBsYXN0IGNvZGUgd29yZCwKPiB3
ZSBoYXZlIHRvIGNvbmZpZ3VyZSAiUVBJQ19OQU5EX1JFQURfTE9DQVRJT05fTEFTVF9DV19uIiBy
ZWdpc3Rlcgo+IHRvIGZldGNoIGRhdGEgZnJvbSBRUElDIGJ1ZmZlciB0byBzeXN0ZW0gbWVtb3J5
Lgo+IAo+IEFsc28gdGhlcmUgaXMgbWluaW11bSBzaXplIHRvIGZldGNoIHRoZSBkYXRhIGZyb20g
ZGV2aWNlIHRvIFFQSUMgYnVmZmVyCj4gaXMgNTEyLWJ5dGVzLiBJZiBzaXplIGlzIGxlc3MgdGhh
biA1MTItYnl0ZXMgdGhlIGRhdGEgd2lsbCBub3QgYmUKPiBwcm90ZWN0ZWQgYnkgRUNDIGFzIHBl
ciBRUElDIHN0YW5kYXJkLiBTbyB3aGlsZSByZWFkaW5nIG9uZmkgcGFyYW1ldGVyCj4gcGFnZSBm
cm9tIE5BTkQgZGV2aWNlIHNldHRpbmcgbmFuZGMtPmJ1Zl9jb3VudCA9IDUxMi4KPiAKClRoaXMg
aXMgYSBzZXBhcmF0ZSBmaXggYW5kIHNob3VsZCBiZSBpbiBhIHNlcGFyYXRlIHBhdGNoLgoKPiBG
aXhlczogODk1NTBiZWIwOThlICgibXRkOiByYXduYW5kOiBxY29tOiBJbXBsZW1lbnQgZXhlY19v
cCgpIikKClBsZWFzZSBkZXNjcmliZSB0aGUgaW1wYWN0IG9mIHRoZSBpc3N1ZS4gQWRkIHJlbGV2
YW50IGZhaWx1cmUgbWVzc2FnZXMsIGFmZmVjdGVkClNvQyBuYW1lcyBldGMuLi4KCkZpbmFsbHks
IHlvdSBzaG91bGQgYWxzbyBDQyBzdGFibGUgbGlzdCB0byBiYWNrcG9ydCB0aGUgZml4ZXMuCgot
IE1hbmkKCj4gU2lnbmVkLW9mZi1ieTogTWQgU2FkcmUgQWxhbSA8cXVpY19tZGFsYW1AcXVpY2lu
Yy5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyB8IDE0ICsr
KysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRj
LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiBpbmRleCAzNGVlODU1NWZi
OGEuLjY0ODdmMjEyNjgzMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29t
X25hbmRjLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiBAQCAt
Mjg1OSw3ICsyODU5LDEyIEBAIHN0YXRpYyBpbnQgcWNvbV9wYXJhbV9wYWdlX3R5cGVfZXhlYyhz
dHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCAgY29uc3Qgc3RydWN0IG5hbmRfCj4gIAljb25zdCBzdHJ1
Y3QgbmFuZF9vcF9pbnN0ciAqaW5zdHIgPSBOVUxMOwo+ICAJdW5zaWduZWQgaW50IG9wX2lkID0g
MDsKPiAgCXVuc2lnbmVkIGludCBsZW4gPSAwOwo+IC0JaW50IHJldDsKPiArCWludCByZXQsIHJl
Z19iYXNlOwo+ICsKPiArCXJlZ19iYXNlID0gTkFORF9SRUFEX0xPQ0FUSU9OXzA7Cj4gKwo+ICsJ
aWYgKG5hbmRjLT5wcm9wcy0+cXBpY192MikKPiArCQlyZWdfYmFzZSA9IE5BTkRfUkVBRF9MT0NB
VElPTl9MQVNUX0NXXzA7Cj4gIAo+ICAJcmV0ID0gcWNvbV9wYXJzZV9pbnN0cnVjdGlvbnMoY2hp
cCwgc3Vib3AsICZxX29wKTsKPiAgCWlmIChyZXQpCj4gQEAgLTI5MTEsMTQgKzI5MTYsMTcgQEAg
c3RhdGljIGludCBxY29tX3BhcmFtX3BhZ2VfdHlwZV9leGVjKHN0cnVjdCBuYW5kX2NoaXAgKmNo
aXAsICBjb25zdCBzdHJ1Y3QgbmFuZF8KPiAgCW9wX2lkID0gcV9vcC5kYXRhX2luc3RyX2lkeDsK
PiAgCWxlbiA9IG5hbmRfc3Vib3BfZ2V0X2RhdGFfbGVuKHN1Ym9wLCBvcF9pZCk7Cj4gIAo+IC0J
bmFuZGNfc2V0X3JlYWRfbG9jKGNoaXAsIDAsIDAsIDAsIGxlbiwgMSk7Cj4gKwlpZiAobmFuZGMt
PnByb3BzLT5xcGljX3YyKQo+ICsJCW5hbmRjX3NldF9yZWFkX2xvY19sYXN0KGNoaXAsIHJlZ19i
YXNlLCAwLCBsZW4sIDEpOwo+ICsJZWxzZQo+ICsJCW5hbmRjX3NldF9yZWFkX2xvY19maXJzdChj
aGlwLCByZWdfYmFzZSwgMCwgbGVuLCAxKTsKPiAgCj4gIAlpZiAoIW5hbmRjLT5wcm9wcy0+cXBp
Y192Mikgewo+ICAJCXdyaXRlX3JlZ19kbWEobmFuZGMsIE5BTkRfREVWX0NNRF9WTEQsIDEsIDAp
Owo+ICAJCXdyaXRlX3JlZ19kbWEobmFuZGMsIE5BTkRfREVWX0NNRDEsIDEsIE5BTkRfQkFNX05F
WFRfU0dMKTsKPiAgCX0KPiAgCj4gLQluYW5kYy0+YnVmX2NvdW50ID0gbGVuOwo+ICsJbmFuZGMt
PmJ1Zl9jb3VudCA9IDUxMjsKPiAgCW1lbXNldChuYW5kYy0+ZGF0YV9idWZmZXIsIDB4ZmYsIG5h
bmRjLT5idWZfY291bnQpOwo+ICAKPiAgCWNvbmZpZ19uYW5kX3NpbmdsZV9jd19wYWdlX3JlYWQo
Y2hpcCwgZmFsc2UsIDApOwo+IC0tIAo+IDIuMzQuMQo+IAoKLS0gCuCuruCuo+Cuv+CuteCuo+Cv
jeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
