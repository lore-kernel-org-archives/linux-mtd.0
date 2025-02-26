Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B2AC19776
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2025 20:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+vGKBaIZ2ARUEgySAI/ru4zqVScSxTzTKe/9v4NhR0c=; b=445GvRMTQpQ3Lc
	eq9yDeeXhZsynCE/EIpol9pZjkxOm3lHi4hn3GY9OHWCC0sPFuklkP2Q2nrpFCh3lalHYZoi4Fhlk
	LQhmkcJi8GKcD5O0CnII7BbkI7A2azkvd1xGNzMFwclw02Rc26kHPw5FqTKRCbbnjEH78IbbZROTT
	A/Xxg6SfuydNNsVdVcEKmhTn144rF1x+vnYci3uz9JdYopZqxgDufnbKyxU4+fgXjgFNFn1w8pg11
	oaxkqVxfjgUUp06lnhcX0NzQ8mKlsVaeQn5VjZlIvUVWALJFeahXmseHFJAUxK9YInZX83JMaGpX4
	qV3xwh4Wj6IcYspRn1XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNoK-00000005Iqm-0f5x;
	Wed, 26 Feb 2025 20:15:16 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNn7-00000005IeQ-32GK
	for linux-mtd@lists.infradead.org;
	Wed, 26 Feb 2025 20:14:03 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3f3fa7ba7f4so756378b6e.0
        for <linux-mtd@lists.infradead.org>; Wed, 26 Feb 2025 12:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740600840; x=1741205640; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+a76YGb9n6V1x231V+uvhuSPDvoPsSGJTFdqdoIobYs=;
        b=Dm50vzbm3idfEcuTgmqhL28xLFPxDY/LuFqbxtW00m7sytL7QLmb6fyodUQiCJaXe0
         h0dOTbLXbotISyd342sbg+OEz7cU+bWfZVZ2yandXKnWtmbxUbg3xZdQsqiUeQwUe39R
         sPIpqvnV0g5bJAFFMBTfztFN0aaGTHHkTypB3AiGQF1dBu+3WDbtlsD6RInL4C6A0P3Q
         4abfYOzTFLcXFALK86KN+CIfDhYoKuDOUIvNNbbCI9P3QBG4a5xYhyX4mGFajfNb68pc
         j8fRp9zfkpBDcjddpaN9zZHCjtbSVQUwhNoKsEp8QyQHhz+waA/LzAIrFX+ljGmkZ2zM
         lEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740600840; x=1741205640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+a76YGb9n6V1x231V+uvhuSPDvoPsSGJTFdqdoIobYs=;
        b=YPNrS4J/mSJAr6+YVpMrm2tXaNjdDgWDrfmyStbYVCt+Em721IfKlvwMIXJcwIAvXJ
         Yn/QtEOMTkTGROcMF6b7wvUH0o55SeYrh+PbQEHKzsJ8bEbT/Zp04pzdkwSy1vkg9WQK
         TPejUWF5xYet0becguZQW7FdVwMVjeKpTRDmKBxnrjuvp6YflaMc1APQN0DOY6kn++FC
         sq/xU+DXCMVQTq5QeRVJN68imCudLccohyU6NpVTLAcnnE+aBYWRBLjdU7BU8wUBOd5O
         c2LmX7ThGojAorEnJFmvQH71drLrADZ9kwg6S6vLn20fVbSus2+rgnw1rNFtlkeMPhJH
         bTMw==
X-Forwarded-Encrypted: i=1; AJvYcCXqhgWiCOknkwAE/jz90HKfNWgjnBUQm66oWM4sgym3zWuhQNGorJGHEtZg1IQ+i19xNwLmUqJQbbU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwYh5EHRZyWhG9qfn4Qk/yHXZjrrFWZyGbUeCl11pG50U3XGse9
	CNp6sJt/F2LqCnlqdUfIS6ocvD4985kG/6lo3IAraf8/IKUngBS7H+Oxopl4wuCPQJUMZqcik+K
	IzUzSKUH3X76ZkXhz8iq7EqI4P2w=
X-Gm-Gg: ASbGncvhoumD3yptAJW2fjragM+R827f9VsCPvva0mryPpQdFFHMa+I1YvKv2/E4yta
	F9Gp6Cba5SWArh5tROAWQHqhb4QA5U0iD2gyzmZ/h2LKgrJbYuHx02HCGGkKr00v8b1G814qhuy
	J6lDarAayF2qcY5cP4pgBnLflp/7a6Bj4kZ5+4
X-Google-Smtp-Source: AGHT+IGJ2pG1AB+BHpik0ghQxWlcccDbcFiQZd5B688SC2b8YZkv/OibZLCE+GRS9ReZOnc2bhMwgM0jeeBDhrNue1o=
X-Received: by 2002:a05:6808:1a2a:b0:3f4:566:6847 with SMTP id
 5614622812f47-3f54eda4079mr422051b6e.16.1740600840347; Wed, 26 Feb 2025
 12:14:00 -0800 (PST)
MIME-Version: 1.0
References: <20250219130244.2119582-1-festevam@gmail.com> <20250219130244.2119582-3-festevam@gmail.com>
 <DF926CA1-3E9E-4823-A3BB-EFC15511B46F@arm.com>
In-Reply-To: <DF926CA1-3E9E-4823-A3BB-EFC15511B46F@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Feb 2025 12:13:34 -0800
X-Gm-Features: AQ5f1Joi6_fI0IL-SKrCvXWtS9a7cAbPv5HXIqJe9MR_FI79X30QIry6fLnNq-Q
Message-ID: <CAMKF1sqvWfsuvvTosGekvL50nfjauNFJLRBuqiFd_sp-08GxuQ@mail.gmail.com>
Subject: Re: [PATCH v4 mtd-utils 3/4] configure.ac: Add a check for execinfo
 and backtrace
To: Ross Burton <Ross.Burton@arm.com>
Cc: Fabio Estevam <festevam@gmail.com>, 
	"david.oberhollenzer@sigma-star.at" <david.oberhollenzer@sigma-star.at>, 
	"chengzhihao1@huawei.com" <chengzhihao1@huawei.com>, 
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_121401_760976_70BC3A71 
X-CRM114-Status: GOOD (  21.27  )
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

T24gV2VkLCBGZWIgMjYsIDIwMjUgYXQgMTA6MjPigK9BTSBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0
b25AYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiAxOSBGZWIgMjAyNSwgYXQgMTM6MDIsIEZhYmlvIEVz
dGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gbXVzbCByZWxpZXMgb24g
YW4gZXh0ZXJuYWwgZXhlY2luZm8gbGlicmFyeSB0byBwcm92aWRlIGJhY2t0cmFjZQo+ID4gZnVu
Y3Rpb25hbGl0eS4gSWYgbXVzbCBjYW5ub3QgbGluayB0byBsaWJleGVjaW5mbywgdGhlIGZvbGxv
d2luZyBsaW5rCj4gPiBlcnJvciBoYXBwZW5zOgo+ID4KPiA+IEZpeCB0aGUgcHJvYmxlbSBieSBj
aGVja2luZyBmb3IgYmFja3RyYWNlIHN1cHBvcnQgaW4gbGliYyBmaXJzdCBhbmQgaWYgbm90Cj4g
PiBmb3VuZCwgdGhlbiBjaGVjayBmb3IgYmFja3RyYWNlIHN1cHBvcnQgaW4gdGhlIGV4dGVybmFs
IGxpYmV4ZWNpbmZvLgo+Cj4gSWYgdGhpcyBpcyB0aGUgcmlnaHQgc29sdXRpb24sIGl04oCZcyBu
b3QgY29tcGxldGUuCj4KPiBtdGQtdXRpbHMgYWxyZWFkeSBjaGVja3MgZm9yIHRoZSBwcmVzZW5j
ZSBvZiBleGVjaW5mby5oIGFuZCB1c2VzIHRoYXQgd2hlbiBjcmVhdGluZyBsaWIvbGlibWlzc2lu
Zy5hLCB3aGljaCBpZiBleGVjaW5mby5oIGlzbuKAmXQgcHJlc2VudCB3aWxsIGNvbnRhaW4gYSBz
dHViIGJhY2t0cmFjZSgpIGltcGxlbWVudGF0aW9uIHRoYXQgc2ltcGx5IHJldHVybnMgMC4gIFRo
ZSB0ZXN0IHN1aXRlIGFscmVhZHkgdXNlcyB0aGlzIHNvIGl0IGNhbiBidWlsZCBvbiBzeXN0ZW1z
IHdpdGhvdXQgbXVzbCwgYnV0IHByZXN1bWFibHkgbm9ib2R5IHRlc3RlZCBtdGQtdXRpbHMgb24g
bXVzbCBhZnRlciAidWJpZnMtdXRpbHM6IEFkZCBpbXBsZW1lbnRhdGlvbnMgZm9yIGxpbnV4IGtl
cm5lbCBwcmludGluZyBmdW5jdGlvbnPigJ0gbGFuZGVkLCB3aGljaCBhZGRlZCBtb3JlIHVzZXJz
IG9mIGJhY2t0cmFjZSgpLgo+Cj4gSSB0aGluayBlaXRoZXIgbXRkLXV0aWxzIHNob3VsZCBoYXJk
LWRlcGVuZCBvbiBfc29tZXRoaW5nXyBwcm92aWRpbmcgYmFja3RyYWNlKCksIGJlIGl0IHRoZSBs
aWJjIG9yIGEgZHJvcC1pbiBsaWJyYXJ5LCBvciBpdCBzaG91bGQgdXNlIGJhY2t0cmFjZSgpIGlm
IHByZXNlbnQgYW5kIGdyYWNlZnVsbHkgZmFsbGJhY2sgb3RoZXJ3aXNlIChhcyBpdOKAmXMgYSBj
b252ZW5pZW5jZSBmZWF0dXJlKS4gIE5vdCBib3RoLCB3aGljaCBpcyB3aGF0IHRoaXMgcGF0Y2gg
YWNoaWV2ZXMuCj4KPiBJ4oCZbGwgc2VuZCBhbiBhbHRlcm5hdGl2ZSBwYXRjaCBpbiBhIG1vbWVu
dCB3aGljaCB1c2VzIGxpYm1pc3NpbmcuYSBpbnN0ZWFkIG9mIHJlbHlpbmcgb24gYW4gZXh0ZXJu
YWwgbGliZXhlY2luZm8uCj4KCkkgdGhpbmsgbG9va2luZyBmb3IgbGliZXhlY2luZm8gaXMgcGVy
aGFwcyBmaW5lLCBpdHMgdGhhdCB3aGVuCmJhY2t0cmFjZSBpcyBub3QgZm91bmQgaW4gbGliYyBh
bmQgaW4gbGliZXhlY2luZm8sIGl0IHNob3VsZCBzdGlsbAp3b3JrIGJ5IGZhbGxpbmcgYmFjayB0
byBzdHViLgoKPiBOb3RlIHRoYXQgdGhlIHJlc3Qgb2YgdGhlIHNlcmllcyBpcyBnb29kLCB0aGlz
IGlzIHRoZSBvbmx5IGNoYW5nZSBJIGhhdmUgY29tbWVudHMgb24uCj4KPiBSb3NzCj4gSU1QT1JU
QU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50
cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJl
IG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1t
ZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8gYW55IG90aGVyIHBl
cnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9zZSwgb3Igc3RvcmUgb3IgY29weSB0aGUgaW5mb3Jt
YXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsgeW91LgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
