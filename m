Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E05D116E2
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Nov 2025 20:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4EUoJ7ydzgJKt3QzoCERL4Csmf0/b5JHC9OvYEJezbk=; b=IMjQWxNnobP+60
	+hoWe4EZyA+bUtUEQZab86VEJljgALInQgL/Jod4c6r2CTTzRlsPBGugLVN+v8FK8iGycs9ymW3Yd
	+uYSXIVFg2riO+gb9T9lYpxoj/2oZQ8XgI4IRTMt5/ZZBAB+9k3/lqS0xbYzQp8gbGQ4VYIKYGn69
	YBrpAXQWWeDopcc7K+IjnKyYZKXEP9yLfH9b3M68WbBHjP1f0C/NBj8/Yh8NgNdk0cAFslA2MV3x3
	UBaPv67FIuBifnJQlXGM2gNzayxAut45vkl4qjO6QT+2zd0z3ba+/rhl9DECIrmvvrjoKi2VhkIhu
	2NNqX2VAmiawOwk8D6Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP5QV-00000000uhQ-3Vn0;
	Fri, 28 Nov 2025 20:50:47 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP5QT-00000000uh2-2m3e
	for linux-mtd@lists.infradead.org;
	Fri, 28 Nov 2025 20:50:46 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-64166a57f3bso3607506a12.1
        for <linux-mtd@lists.infradead.org>; Fri, 28 Nov 2025 12:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764363043; x=1764967843; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/+vXFQWDRf0wQTz2ArcAn2PzdQvSTpTymvsyJiYJUg=;
        b=XNE0drfcjtaW9/VqKsO/qvfzn2w0wPWe7UU54a6agUvur8UY5reEbnayOjfOrhnbB1
         jAcQXWFGo+jwvf9AxbrbIWTonUzh1Bry62rzzYj7UmZldldLrbQ4U4s4WI5WwpILeSty
         G1/G85FN8C/NZFJ6Nu++MfAQE4ax0hdqQQsJsq9F+kzCYw6eA2TFjddBv/y8/+BaH5f9
         Tx1/agbno6+uKY1t7qT8z3pJktMVgGxuU3HqxFMswq+1eDPN2uXzzNLA0H7Sh3gA0qw8
         zYml9Ia3f4dSbMl50jzdXm1iB2bN517fi3thuIqR9x2YhPh0NV19w0AiTzrV3poOde+Y
         N4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764363043; x=1764967843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C/+vXFQWDRf0wQTz2ArcAn2PzdQvSTpTymvsyJiYJUg=;
        b=hpniF61BP0pMe/O8VwpSAvm5rzAG3ObsWEwux9wAkK6B1jVfKHt7TTvVZecVY0kf4j
         uTRna/XXAs65vua8AxrZQjSsLb7kcW1kdIlIj3f5p7Fjzcp5GVPYOKAlKA1cSFDCgFtM
         qiK8Z2h7jUdCk0bJaQd2iWbcJf5BV226CCNTIQSPvuWQhTRJvN1dxZ6qmoQmGR6mqJeu
         xGNuOSZ3xoGi/3yHPQ+hhtvytX+FhbeBY50n4Jvne6odjLWH26klTI3c+knrFA9kAQbX
         c4RytOsWCB8GhQiQNsY0QgLhC3wHo2bM3M1HTY1I0UI3En8z7InXcRayLJH+lTOAhZhQ
         6h9g==
X-Gm-Message-State: AOJu0Yzky/WrzbOl/DLV+VlNawvwQMgHr3Y2Uj+TcoqOTeu+3/WAoDCa
	7LVmOtXIGU0xXRY9IU3l2KnWLfJ26DBR6NeU9icDvFj1TQkbKKdLVaIuu2ylXQZ5KGsxrK6xZsn
	OGOFvFOD6wmZWMFpu/Mfx2Fqw+uU3C3Q=
X-Gm-Gg: ASbGnctRy3oJ71V9o4reP0C20RI2trvQQtCCGb/WC07z4hl2rI+btSMMJ7xctBPc1kA
	LurWsqxeB+HyUa3+vqOybY6Qo2tCI5NQrNP9u2HBoFhIXVO8RZZwwWveF8mxbeGhjvkbgv4Xdf0
	IdFVC565wzrkUIF2p4EXn/aGqZrpbrrNQ0gkF2gK9v5q3jqQtaWB1rzabeuTReEYaTnfz1fortC
	ahO/1Y22bPWvV5BK0PhEyX2XXEGJjmDQdyrtoKdDTOOgQz92clfYsWdHCF+k008M4YWakLWqsef
	vs4TsXSc
X-Google-Smtp-Source: AGHT+IH3+6pzs/THXxZuObchk1pSg2ZI+FZ6pPVsNmkA1Tn+v49aOz8b2m/3ukODW4nkZB1IznzuCamXTnM0ZgmL0Ik=
X-Received: by 2002:a05:6402:1441:b0:640:e78f:f347 with SMTP id
 4fb4d7f45d1cf-645eb2968ffmr15779926a12.22.1764363043223; Fri, 28 Nov 2025
 12:50:43 -0800 (PST)
MIME-Version: 1.0
References: <20251026200049.25152-1-rosenp@gmail.com> <20251026200049.25152-5-rosenp@gmail.com>
 <58d2e5b6-f809-4059-a331-d92ccd75d47d@sigma-star.at>
In-Reply-To: <58d2e5b6-f809-4059-a331-d92ccd75d47d@sigma-star.at>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 28 Nov 2025 12:50:32 -0800
X-Gm-Features: AWmQ_bk12XqPNRmSFhV6DdRMCPF1XK6cJi8TkutNj-Dpy-Rbmpfee5zK-AGSGAQ
Message-ID: <CAKxU2N9D7yn_PfE+-mAXEk4G-KZFo0FEHggP-i8kCv6NWWS5cg@mail.gmail.com>
Subject: Re: [PATCH 5/5] mtd-utils: add GNU_SOURCE define to c files
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_125045_712291_F3DCEB52 
X-CRM114-Status: GOOD (  19.76  )
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

T24gRnJpLCBOb3YgMjgsIDIwMjUgYXQgMTI6NDPigK9QTSBEYXZpZCBPYmVyaG9sbGVuemVyCjxk
YXZpZC5vYmVyaG9sbGVuemVyQHNpZ21hLXN0YXIuYXQ+IHdyb3RlOgo+Cj4gSGksCj4KPiB5b3Vy
IF9HTlVfU09VUkNFIGNvbW1pdCBicmVha3MgdGhlIGJ1aWxkICh5b3UgcmVtb3ZlZCBsaW1pdHMu
aAo+IGZyb20gbGlibXRkX2xlZ2FjeS5jKS4gQmVzaWRlcyB0aGF0LCBJJ20gcmVsdWN0YW50IHRv
IHJlbW92ZQo+IHRoZSBnbG9iYWwgX0dOVV9TT1VSQ0UgZGVmaW5lLCB3ZSBtaWdodCBoYXZlIGEg
bnVtYmVyIG9mIGltcGxpY2l0Cj4gdXNlcnMgYWNyb3NzIHRoZSBzb3VyY2UgYW5kIHRoZSBleHRl
bnNpb25zIHdlIHVzZSBhcmUgZ2VuZXJhbGx5Cj4gdXNlZnVsLgpZZWFoIHRoaXMgd2FzIG5vdCBj
b3JyZWN0Lgo+Cj4gV2hpbGUgSSB0aGluayBpdCdzIGEgdmFsdWFibGUgZ29hbCB0byBiZSBjb21w
YXRpYmxlIHdpdGggbm9uLUdOVQo+IGxpYmMgaW1wbGVtZW50YXRpb25zIGxpa2UgTXVzbCwgb3Ig
a2xpYmMuIExpYnJhcmllcyBsaWtlIE11c2wKPiBpbXBsZW1lbnQgYSBnb29kIGNodW5rIGFueXdh
eSBhbmQgZm9yIHN0dWZmIHRoYXQncyByZWFsbHkgbWlzc2luZywKPiB3ZSBoYXZlIGEgbGlibWlz
c2luZy5hLgpTb21lIG9mIHRoZXNlIGhlYWRlciByZW1vdmFscyBhcmUgZm9yIGNvbXBhdGliaWxp
dHkgd2l0aCBtYWNPUywgbGlrZQp3aXRoIGZlYXR1cmVzLmguCj4KPiBSZWdhcmRpbmcgdGhlIExp
bnV4IGhlYWRlciBpbmNsdXNpb25zIGFjcm9zcyB0aGUgY29kZSwgdGhvc2UKPiBwYXJ0cyAoZS5n
LiByYi10cmVlKSBoYXZlIHByb2JhYmx5IGJlZW4gbGlmdGVkIGRpcmVjdGx5IGZyb20KPiB0aGUg
TGludXgga2VybmVsIHRyZWUuIEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIHRyeSB0byBpbnRlbnRp
b25hbGx5Cj4gdHJ5IHRvIGRpdmVyZ2UgZnJvbSB0aGUgdXBzdHJlYW0gdmVyc2lvbi4KSXQncyBh
IHBhdGNoIGNhcnJpZWQgYnkgT3BlbldydCB0byBnZXQgY29tcGlsYXRpb24gb24gbWFjT1Mgd29y
a2luZy4KSSdsbCBzZWUgd2hhdCBJIGNhbiBkbyBhYm91dCB0aGlzLgo+Cj4gQWxzbywgd2hhdCB3
b3VsZCB3ZSBnYWluIGZyb20gcG9ydGFiaWxpdHkgaGVyZT8gUG9ydGFiaWxpdHkgdG8KPiBub24t
TGludXggYmFzZWQsIG5vbi1HTlUsIFVuaXgtbGlrZSBzeXN0ZW1zPyBXaGF0IHVzZSB3b3VsZCB0
aG9zZQo+IGhhdmUgZm9yIG10ZC11dGlscz8KU29tZSBPcGVuV3J0IGRldmVsb3BlcnMgZGV2ZWxv
cCBvbiBtYWNPUy4gVGhhdCdzIGFib3V0IGl0Lgo+Cj4KPiBBbnl3YXksIEkgY2hlcnJ5LXBpY2tl
ZCBhbmQgYXBwbGllZCB0aGUgX1BPU0lYX0NfU09VUkNFIHBhdGNoIHRvCj4gbXRkLXV0aWxzLmdp
dCBtYXN0ZXIuCkludGVyZXN0aW5nbHkgZW5vdWdoIEkgZm91bmQgdGhpcyBpc3N1ZSB3aGlsZSB0
cnlpbmcgdG8gcmVtb3ZlCl9HTlVfU09VUkNFLiBNYXliZSB0aGVyZSBhcmUgc29tZSBtb3JlLgo+
Cj4gVGhhbmtzLAo+Cj4gRGF2aWQKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
