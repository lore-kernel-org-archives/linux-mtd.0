Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED1BD2444F
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 01:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ff6zEwVuGEBPJBlDQs7MonjkElsnfRcSHpnGlFKX5bA=; b=wBY7hGByoNbH04
	12RuyfK+CPaBDxSuW5ynLtk+hg0YwNIP+BOhRA3ZgirVpN3s8Wug2slEmDB+45X6u3214kTCtuW7/
	aYxoGWljqG9AOIhHIaTA8oBreHRY8wE6sPPhsWbX006RTINDg1qLdmYvm3gbQ0wnSY8ID/7AWP9GG
	CxZqaWQM1TDSInhnvGboMG2kCKCnufa+b3ehcuiMYFa2mEA4d+/gYarFQIVVYw4ATH55jHa+rQHsq
	M+mOl5i7s2I12jYVVrT9Fj3ig84BGre++4qjwKFNSggBELA53i2NJgTRQifPT3zTnIklTNw8GrO0G
	TfZhh7oMGpfuUR4Sq8Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz4NV-0000000EuT8-43T2;
	Fri, 11 Oct 2024 01:23:37 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz4NT-0000000EuS0-1CXy
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 01:23:36 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2e2ab5bbc01so261018a91.2
        for <linux-mtd@lists.infradead.org>; Thu, 10 Oct 2024 18:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728609813; x=1729214613; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SF/7zdQkBGcnAqqkS5uW12uxOFdbOISK7h5UIJigtJk=;
        b=OCqzeBdB66hd7TL8utanet/TuHvweCwtAeKGP3zp/y7SRzxYvP/GI1NnFwlhO46Uck
         qCO0RFS2XwQ1zYZVyT0qOTWduUELXAQdl8uYVjafCJ9dY40OkV0H1dG+hQr6+3vp/trW
         u41iPhY9Or1mnNXiggVfQIMN2Dha5IPhR+FTbeEeY6zVGY4f/MmsMXGUu/07VTeRdMMx
         /XFQNF6lA+6dc0r1y5HHyXUSZ24sRBLJq1tMYF+8WfNzktAP9b7TTDJE7V9+9uIH97fV
         dlxPmD2633iYJgi/fszNknzTozsblPt2C1G1f05krKcWCskdYd+wL4PEDvTsmKltsZQV
         h2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728609813; x=1729214613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SF/7zdQkBGcnAqqkS5uW12uxOFdbOISK7h5UIJigtJk=;
        b=j5qbn4WOD04+gbBTnKcXQmkh3Ay3yG1rx+EGXitTQqzcWejSB6Hkos89y8Z4ZNp8U/
         q0I60g3vjrCW7V87B39gTgjSLgB9g9rH2OJ6hCAG49meOo4/lArk38hGgsY5DzLvHMQH
         oSXeRjrTYz/jBszGAG+1dQ8arOFHAKXyF5D53mNfsW1RIugcyQ3fw5V6BN60NJ6Sdd1+
         A8N9niatl8PFcnjol/5SaRJfJApDVWjcpu3RAYwotN5KUHpsSKTZNLfj++VBrJxr7SoI
         raLODQS168UltoSLDaopBLJFVx5Zdr/BeuyEA417tvQmqZME96a+qg/qzFUkVNvjd3bx
         Hecw==
X-Gm-Message-State: AOJu0YxG4s1MBznTbCft5Idzx/JyyZ2h762lUAOrUa/0hCO7Y5tmQf4a
	ZUNuweGVQ8rL5BUSa5mzYPUDrYk2rgUCe721qDCdq4yP7lxXZ1HfUb+nshWQFZ+uqHG6ekaLgcF
	5i6lHyBKrmHPND7hW+F9downFfyKKSNw=
X-Google-Smtp-Source: AGHT+IFJTubenTa8XXbwlIGgoarsbABBYObeRlyo4i+DqWIv/1pxoVQ9UTlMygtrZ4XLsyZkhM6t72B608ORuvlAg24=
X-Received: by 2002:a05:6a20:6a0f:b0:1cf:4bd8:3a02 with SMTP id
 adf61e73a8af0-1d8bcf63271mr698504637.3.1728609813520; Thu, 10 Oct 2024
 18:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <CALGdzuo8_EXr4aUAw6X9S+yzMPi25Y82netPLWsd+3n-Ov9Pnw@mail.gmail.com>
 <10779b09-3413-6374-b4a1-1efd8821c5f2@huawei.com> <CALGdzuryBbCqGAhox9ZWaQHD5dSQNApfGmCP+rYZ7O4MCRH+rw@mail.gmail.com>
 <7138a98c-1562-3059-07b6-4d918bec9d1a@huawei.com> <CALGdzuokUpWhUk7uvWcDT2tXRRMk07dmKGS-rFANOE6ZwZZW8w@mail.gmail.com>
 <0171b6cc-95ee-3538-913b-65a391a446b3@huawei.com>
In-Reply-To: <0171b6cc-95ee-3538-913b-65a391a446b3@huawei.com>
From: Chenyuan Yang <chenyuan0y@gmail.com>
Date: Thu, 10 Oct 2024 20:23:22 -0500
Message-ID: <CALGdzuoWvy5WvpttC1pab309kZ9cUyfT5O7JB8VjsqwU2HD0Xg@mail.gmail.com>
Subject: Re: [Linux Kernel Bug] memory leak in ubi_attach
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at, miquel.raynal@bootlin.com, 
	Zhihao Cheng <chengzhihao1@huawei.com>, vigneshr@ti.com, linux-kernel@vger.kernel.org, 
	syzkaller@googlegroups.com, Zijie Zhao <zzjas98@gmail.com>, gregkh@linuxfoundation.org, 
	rafael@kernel.org, akpm@linux-foundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_182335_423226_AA5097B1 
X-CRM114-Status: GOOD (  26.52  )
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

RGVhciBMaW51eCBLZXJuZWwgRGV2ZWxvcGVycyBmb3IgVUJJIGFuZCBLZXJuZWwgT2JqZWN0LAoK
SSBhbSB3cml0aW5nIHRvIGlucXVpcmUgaWYgdGhlcmUgaGF2ZSBiZWVuIGFueSB1cGRhdGVzIHJl
Z2FyZGluZyB0aGlzCm1lbW9yeSBsZWFrIGlzc3VlLiBUaGlzIGlzc3VlIHJlbWFpbnMgcmVwcm9k
dWNpYmxlIG9uIHRoZSBsYXRlc3QKTGludXggdmVyc2lvbiAoNi4xMi1yYzIsIGNvbW1pdAo4Y2Yw
YjkzOTE5ZTEzZDFlOGQ0NDY2ZWI0MDgwYTRjNGQ5ZDY2ZDdiKS4KClRoYW5rIHlvdSBmb3IgeW91
ciBhdHRlbnRpb24gdG8gdGhpcyBtYXR0ZXIuCgpCZXN0LApDaGVueXVhbgoKT24gTW9uLCBKYW4g
MjksIDIwMjQgYXQgNTo1MeKAr0FNICdaaGloYW8gQ2hlbmcnIHZpYSBzeXprYWxsZXIKPHN5emth
bGxlckBnb29nbGVncm91cHMuY29tPiB3cm90ZToKPgo+IOWcqCAyMDI0LzEvMjQgMjI6NDEsIENo
ZW55dWFuIFlhbmcg5YaZ6YGTOgo+ID4gSGkgWmhpaGFvLAo+ID4KPiA+IFRoYW5rcyB2ZXJ5IG11
Y2ggZm9yIHlvdXIgcmVwbHkgYW5kIGZ1cnRoZXIgZXhwbG9yYXRpb24gb2YgdGhpcyBjcmFzaCEK
PiA+Cj4gPiBJIGhhdmUgYXR0YWNoZWQgdGhlIGNvbmZpZyB0byByZXByb2R1Y2UgdGhpcyBtZW1v
cnkgbGVhay4gRm9yIHRoZQo+ID4gY29tbWFuZCBsaW5lLCB5b3UgY2FuIHVzZSBxZW11IHRvIGJv
b3QgdGhlIGtlcm5lbCAoWW91IG5lZWQgdG8gYnVpbGQKPiA+IHRoZSBidWxsc2V5ZS1pbWFnZSBm
aXJzdCkuCj4gPiBgYGAKPiA+IG1rZGlyIC1wIGxvZ3MKPiA+IHFlbXUtc3lzdGVtLXg4Nl82NCBc
Cj4gPiAtbSAyRyBcCj4gPiAtc21wIDIgXAo+ID4gLWtlcm5lbCBsaW51eC9hcmNoL3g4Ni9ib290
L2J6SW1hZ2UgXAo+ID4gLWFwcGVuZCAiY29uc29sZT10dHlTMCByb290PS9kZXYvc2RhIGVhcmx5
cHJpbnRrPXNlcmlhbCBuZXQuaWZuYW1lcz0wIiBcCj4gPiAtZHJpdmUgZmlsZT1pbWFnZS9idWxs
c2V5ZS1xZW11LmltZyxmb3JtYXQ9cmF3IFwKPiA+IC1uZXQgdXNlcixob3N0PTEwLjAuMi4xMCxo
b3N0ZndkPXRjcDoxMjcuMC4wLjE6MTAwMjEtOjIyIFwKPiA+IC1uZXQgbmljLG1vZGVsPWUxMDAw
IFwKPiA+IC1lbmFibGUta3ZtIFwKPiA+IC1ub2dyYXBoaWMgXAo+ID4gLXBpZGZpbGUgdm0ucGlk
IFwKPiA+IGBgYAo+ID4KPiA+IEluIHFlbXUsIHlvdSBjYW4gcnVuCj4gPiBgYGAKPiA+IGdjYyAt
cHRocmVhZCByZXByby5jIC1vIGV4ZQo+ID4gLi9leGUKPiA+IGBgYAo+ID4gdG8gcmVwcm9kdWNl
IHRoZSBtZW1vcnkgbGVhay4KPiA+Cj4KPiBUaGUgYmFkIG5ld3MgaXMgdGhhdCBJIGNhbid0IHJl
cHJvZHVjZSB0aGUgcHJvYmxlbSB3aXRoIHlvdXIga2VybmVsCj4gY29uZmlnLiBUaGUgZ29vZCBu
ZXdzIGlzIHRoYXQgSSBzZWVtIHRvIGZpbmQgdGhlIGNhdXNlIG9mIHRoZSBwcm9ibGVtIGJ5Cj4g
Y29kZSByZXZpZXdpbmc6Cj4gYWxsb2NfYWkgLT4ga21lbV9jYWNoZV9jcmVhdGUgLT4ga21lbV9j
YWNoZV9jcmVhdGVfdXNlcmNvcHk6Cj4gICBzID0gX19rbWVtX2NhY2hlX2FsaWFzCj4gICAgcyA9
IGZpbmRfbWVyZ2VhYmxlIC8vIGNhbm5vdCBmaW5kIG1lcmdlYWJsZSBrbWVtX2NhY2hlLCBzID0g
TlVMTAo+ICAgY3JlYXRlX2NhY2hlCj4gICAgcyA9IGttZW1fY2FjaGVfemFsbG9jCj4gICAgX19r
bWVtX2NhY2hlX2NyZWF0ZShzKQo+ICAgICBzeXNmc19zbGFiX2FkZAo+ICAgICAga29iamVjdF9p
bml0X2FuZF9hZGQoJnMtPmtvYmopCj4gICAgICAga29iamVjdF9pbml0KGtvYmopIC8vIGtvYmot
PmtyZWYgPSAxCj4gICAgICAga29iamVjdF9hZGRfdmFyZwo+ICAgICAgICBrb2JqZWN0X3NldF9u
YW1lX3ZhcmdzCj4gICAgICAgICBrdmFzcHJpbnRmX2NvbnN0Cj4gICAgICAgICAga3N0cmR1cF9j
b25zdAo+ICAgICAgICAgICBrc3RyZHVwCj4gICAgICAgICAgICBrbWFsbG9jX3RyYWNrX2NhbGxl
ciAvLyBhbGxvY2F0ZWQgbWVtb3J5Cj4gICAgICAgICBrb2JqLT5uYW1lID0gcyAgLy8gYXNzaWdu
IGFsbG9jYXRlZCBtZW1vcnkgdG8ga29iai0+bmFtZQo+ICAgICAgICBrb2JqZWN0X2FkZF9pbnRl
cm5hbAo+ICAgICAgICAgY3JlYXRlX2RpciAvLyBmYWlsZWQgY2F1c2VkIGJ5IEVOT01FTQo+ICAg
ICAgICAgLy8ga29iai0+bmFtZSB3b24ndCBiZSByZWxlYXNlZCBldmVuICdzJyBpcyByZWxlYXNl
ZAo+Cj4gWW91IGNhbiByZXByb2R1Y2UgaXQgYnkgZXhlY3V0aW5nIHViaWF0dGFjaCAtbTAgd2l0
aCByZXByb2R1Y2UuZGlmZiBhcHBsaWVkOgo+IFtyb290QGxvY2FsaG9zdCB+XSMgY2F0IC9zeXMv
a2VybmVsL2RlYnVnL2ttZW1sZWFrCj4gdW5yZWZlcmVuY2VkIG9iamVjdCAweGZmZmY4ODgxM2I0
ODgwODAgKHNpemUgMTYpOgo+ICAgIGNvbW0gInViaWF0dGFjaCIsIHBpZCA5NTM1LCBqaWZmaWVz
IDQyOTQ5NDMwOTUKPiAgICBoZXggZHVtcCAoZmlyc3QgMTYgYnl0ZXMpOgo+ICAgICAgM2EgMzAg
MzAgMzAgMzAgMzAgMzUgMzYgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIDowMDAwMDU2Li4uLi4u
Li4KPiAgICBiYWNrdHJhY2UgKGNyYyA4YTExN2FiOSk6Cj4gICAgICBbPGZmZmZmZmZmODE1Zjkx
YzI+XSBfX2ttYWxsb2Nfbm9kZV90cmFja19jYWxsZXIrMHgzMjIvMHg0MjAKPiAgICAgIFs8ZmZm
ZmZmZmY4MTU3NWVmYz5dIGtzdHJkdXArMHgzYy8weDcwCj4gICAgICBbPGZmZmZmZmZmODE1NzVm
OGY+XSBrc3RyZHVwX2NvbnN0KzB4NWYvMHg3MAo+ICAgICAgWzxmZmZmZmZmZjgyNTM1NDI2Pl0g
a3Zhc3ByaW50Zl9jb25zdCsweGM2LzB4MTEwCj4gICAgICBbPGZmZmZmZmZmODRiODhjYjA+XSBr
b2JqZWN0X3NldF9uYW1lX3ZhcmdzKzB4NDAvMHhkMAo+ICAgICAgWzxmZmZmZmZmZjg0Yjg5MTFi
Pl0ga29iamVjdF9pbml0X2FuZF9hZGQrMHg4Yi8weGYwCj4gICAgICBbPGZmZmZmZmZmODE1ZmFi
YTk+XSBzeXNmc19zbGFiX2FkZCsweDExOS8weDFlMAo+ICAgICAgWzxmZmZmZmZmZjgxNWZjMmRj
Pl0gX19rbWVtX2NhY2hlX2NyZWF0ZSsweDQxYy8weDU5MAo+ICAgICAgWzxmZmZmZmZmZjgxNTg2
MDE5Pl0ga21lbV9jYWNoZV9jcmVhdGVfdXNlcmNvcHkrMHgxNjkvMHgzMDAKPiAgICAgIFs8ZmZm
ZmZmZmY4MTU4NjFjMT5dIGttZW1fY2FjaGVfY3JlYXRlKzB4MTEvMHgyMAo+ICAgICAgWzxmZmZm
ZmZmZjgyZWM4ODk2Pl0gdWJpX2F0dGFjaCsweGM2LzB4MWRlMAo+ICAgICAgWzxmZmZmZmZmZjgy
ZWI3N2EzPl0gdWJpX2F0dGFjaF9tdGRfZGV2KzB4OGEzLzB4MTEyMAo+ICAgICAgWzxmZmZmZmZm
ZjgyZWI4YmZjPl0gY3RybF9jZGV2X2lvY3RsKzB4MWZjLzB4MjcwCj4gICAgICBbPGZmZmZmZmZm
ODE2Y2EzMTI+XSBfX3g2NF9zeXNfaW9jdGwrMHhmMi8weDE0MAo+ICAgICAgWzxmZmZmZmZmZjg0
YmMzOTcwPl0gZG9fc3lzY2FsbF82NCsweDUwLzB4MTQwCj4gICAgICBbPGZmZmZmZmZmODRjMDAw
OGI+XSBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg2My8weDZiCj4KPiBUaGVyZSBh
cmUgdHdvIHdheXMgdG8gZml4IGl0Ogo+IDEuIFJlbGVhc2Uga29iai0+bmFtZSBkaXJlY3RseSBp
biB0aGUgZXJyb3IgYmFyYW5jaCBvZgo+IGtvYmplY3RfYWRkX2ludGVybmFsKCkgYWZ0ZXIgY2Fs
bGluZyBjcmVhdGVfZGlyKCkuCj4gMi4gUHV0IGtvYmoncyByZWZjbnQgaW4gdGhlIGVycm9yIGJh
cmFuY2ggb2Yga29iamVjdF9hZGRfaW50ZXJuYWwoKQo+IGFmdGVyIGNhbGxpbmcgY3JlYXRlX2Rp
cigpLgo+IEknbSBub3Qgc3VyZSB3aGljaCBvbmUgaXMgYmV0dGVyIG9yIHdoZXRoZXIgdGhlcmUg
YXJlIG90aGVyIGZpeCBtZXRob2RzLAo+IG1heWJlIHlvdSBjYW4gc2VuZCBhbiBlbWFpbCBpbiBr
b2JqIHJlbGF0ZWQgbWFpbGlpbmcgbGlzdHMgdG8gY29uZmlybQo+IHRoZSBwcm9ibGVtLgo+Cj4g
LS0KPiBZb3UgcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGJlY2F1c2UgeW91IGFyZSBzdWJzY3JpYmVk
IHRvIHRoZSBHb29nbGUgR3JvdXBzICJzeXprYWxsZXIiIGdyb3VwLgo+IFRvIHVuc3Vic2NyaWJl
IGZyb20gdGhpcyBncm91cCBhbmQgc3RvcCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQsIHNlbmQg
YW4gZW1haWwgdG8gc3l6a2FsbGVyK3Vuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20uCj4gVG8g
dmlldyB0aGlzIGRpc2N1c3Npb24gb24gdGhlIHdlYiB2aXNpdCBodHRwczovL2dyb3Vwcy5nb29n
bGUuY29tL2QvbXNnaWQvc3l6a2FsbGVyLzAxNzFiNmNjLTk1ZWUtMzUzOC05MTNiLTY1YTM5MWE0
NDZiMyU0MGh1YXdlaS5jb20uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
