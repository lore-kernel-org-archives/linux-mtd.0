Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F0CC61DC4
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Feb 2026 07:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RrFiOg9GBNfqsHP5B37lO84jscLoN2PiC9sRcPC2Mc8=; b=FI3nK+m/i28ia/
	XEh71q/KOQCTpxbqrnT0y6ZnV0+ajESmKt9q73l9GgiMUamdEY99pKAwN+0owok8ljLlvKior6/nf
	tYk11gqE7W8DdsnlJfpwhSVAqussu6FrXF36dbk1FVO3OtDT3UDOgybEoE1zuAMAXhYoekTqSmMX5
	MMiR5ulaErd2h6a6TLAYHuW+E2WWqJTrcZTfIgJFzH1xuI9rFdFwkSdalm0gbMr/wnvDHD5kE8ncw
	VSB1eVZGAaS/MExgoonAJIrrjLhcarufkt5io14mnUUPopelTUdYJujLKCTVn2/qW1WLMmYZoRvma
	rNBUcRedJWf6heKc7qqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtho3-0000000FuC7-0yOc;
	Sat, 21 Feb 2026 07:53:39 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtho0-0000000FuBl-0dMO
	for linux-mtd@lists.infradead.org;
	Sat, 21 Feb 2026 07:53:37 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4359228b7c6so2146048f8f.2
        for <linux-mtd@lists.infradead.org>; Fri, 20 Feb 2026 23:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771660414; x=1772265214; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7p/ouUALtspUzn2VeCUZNNF38MeWl1ZffACggh9o4dE=;
        b=RT5HfcVGE8Q9ORQ+9LjPo1WPWdlG40K8ycQmsUq3r4Op/17pwGiiCmx8oCGv1IHfLb
         8UBVGvIITXBgMKraLloV2tMUn2ti8heSg7ILIWY7EzSMYBlrNm7lUaymR8y1QydUP5zr
         KCRCOvLRq2exyRoch4QkPBpEUyJtLbATxkQ9XhfYBCdSBNg53CQ/8RDAtUW2aXMGH0w1
         QTE3Hh2SmracxcT17Uk9GG0L6pDXWaRFjwcsVS08vGYJmsT0dfwcZhOjys/KPuYwtFe+
         x5U9/rhcXAKwRe6xaYqlRdrAe8U086+wmJkUUfqNiflNrJ3ovwt4tgnWTDZisE/kzB2p
         40KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771660414; x=1772265214;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7p/ouUALtspUzn2VeCUZNNF38MeWl1ZffACggh9o4dE=;
        b=wdlbJirVyey5DNoJPYQ/CN653qR2WNdNKDllkyNkuLCxf2YL7rCR2rb6lmltH/Najq
         pjSq3lEd6JkJmtSfsRy04q4rhoHGpkpQh6JVQI7DmYN1rrpFBcIl8ZVsgQdqt6s2JCCs
         EkU7Jp6NoJab0x+zYvE7PEDso2uQXWU94AeGUg6NTSprF5nP217sUJIyXvpMe+aU4imD
         q/BonDDbyCvwnqh3lXaPzNEHUydw009PYJCPt1IbV7PTciO2jtbg1eh6yk/LWmz1fTi7
         IUSSucxt2TvXKyALz+UQCaDKPdC3eBolzHTWy5pQfIBn2FkdiMmmE4Bm7blB+cnd61Tg
         pMiA==
X-Forwarded-Encrypted: i=1; AJvYcCWcoYeJbU6HE0FMqga8ONn/llnHwjZnxGf4caLzODd+Vbq2rh8M1j6N1VkJbSeY91qGLlkFZaOdJbs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz522TGLICMTjUuBoYb0zEipf+y4R8aym2p5QqKNbJBO42Kz2M6
	ajgfXfBGrltLD8CmjFDB3KaiGXxboR7w3+LFEvNcKIio7w4B8h5p5sVS
X-Gm-Gg: AZuq6aLfTTIaUhxJGWDCSxzD/Cic3B1uBiTFMWxVUh/EPjH72MTjry7px+hxPo1dQ4V
	SuekK6lp7H/WCULsU7rItLtN25R5PL1TgfiWC0dXK1aB6Wdwk0ADJ51ccf1GVVTxzzMJZpSXg/H
	bCFLkzMJjWJWH+a/pElWev41aDJx0UXdKpsvB9QgyyqTYc7Dz8Qh6wvDbQx64LvkF/EzP1k/FyF
	FqHqJhkOql4v8lFMSrZbb84zQ4Z/lFBqg+u6i5VLrXUL0uONrq+df7euwa+OpQsu6GhXh/mjkil
	s1qb2gbP5R2PyE/4ab2ufSrR5KkR5uWfJOiwQZHFHxPZAB94HMxi82ozHd487TK53yRtRIUBHrN
	cf8wpO+/TSwYiA1iY3mRm3RHS8SCvGJ6Ct2fsbKPBvQfs9U0eCfdqWhXN63ONZZNQkl+0KERXh4
	FZP7YNi/eAmJUjaH/FkZdehWhU
X-Received: by 2002:a05:600c:c166:b0:477:7b16:5f9f with SMTP id 5b1f17b1804b1-483a9607d11mr35646195e9.31.1771660413411;
        Fri, 20 Feb 2026 23:53:33 -0800 (PST)
Received: from gmail.com ([51.154.249.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa1bdsm3189734f8f.3.2026.02.20.23.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 23:53:32 -0800 (PST)
Date: Sat, 21 Feb 2026 07:53:31 +0000
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mtd: rawnand: cafe: Use generic power management'
Message-ID: <aZlke_ij_MI9sPsi@gmail.com>
References: <20260216090415.675368-1-vaibhavgupta40@gmail.com>
 <20260217155525.GA3377374@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260217155525.GA3377374@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_235336_228344_BF037DD2 
X-CRM114-Status: GOOD (  26.62  )
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

T24gVHVlLCBGZWIgMTcsIDIwMjYgYXQgMDk6NTU6MjVBTSAtMDYwMCwgQmpvcm4gSGVsZ2FhcyB3
cm90ZToKPiBPbiBNb24sIEZlYiAxNiwgMjAyNiBhdCAwOTowMjo0NEFNICswMDAwLCBWYWliaGF2
IEd1cHRhIHdyb3RlOgo+ID4gU3dpdGNoIHRvIHRoZSBnZW5lcmljIFBDSSBwb3dlciBtYW5hZ2Vt
ZW50IGZyYW1ld29yayBhbmQgcmVtb3ZlIGxlZ2FjeQo+ID4gY2FsbGJhY2tzIGxpa2UgLnJlc3Vt
ZSgpLiBXaXRoIHRoZSBnZW5lcmljIGZyYW1ld29yaywgdGhlIHN0YW5kYXJkIFBDSQo+ID4gcmVs
YXRlZCB3b3JrIGxpa2U6Cj4gPiAJLSBwY2lfc2F2ZS9yZXN0b3JlX3N0YXRlKCkKPiA+IAktIHBj
aV9lbmFibGUvZGlzYWJsZV9kZXZpY2UoKQo+ID4gCS0gcGNpX3NldF9wb3dlcl9zdGF0ZSgpCj4g
PiBpcyBoYW5kbGVkIGJ5IHRoZSBQQ0kgY29yZS4KPiA+IAo+ID4gVGhpcyBkcml2ZXIgc2hvdWxk
IGltcGxlbWVudCBvbmx5IGNhZmVfbmFuZCBzcGVjaWZpYyBvcGVyYXRpb25zIGluIGl0cwo+ID4g
Y2FsbGJhY2sgZnVuY3Rpb24gZm9yIHJlc3VtZS4KPiAKPiBMb29rcyBnb29kIHRvIG1lLCB0aGFu
a3MgZm9yIGRvaW5nIHRoaXMhCj4gCj4gSSB0aGluayB0aGUgY29tbWl0IGxvZyBpcyBhIGJpdCBv
dmVybHkgc3BlY2lmaWMgc2luY2UgdGhpcyBkcml2ZXIKPiBuZXZlciBkaWQgYW55IG9mIHRoZSBQ
Q0ktcmVsYXRlZCB3b3JrIGl0IG1lbnRpb25zLiAgSU1PIHNvbWV0aGluZyBsaWtlCj4gdGhpcyB3
b3VsZCBiZSBzdWZmaWNpZW50Ogo+IAo+ICAgU3dpdGNoIGZyb20gUENJIHBvd2VyIG1hbmFnZW1l
bnQgdG8gdGhlIGdlbmVyaWMgcG93ZXIgbWFuYWdlbWVudAo+ICAgZnJhbWV3b3JrIHNvIHRoZSBw
Y2lfZHJpdmVyIGhvb2tzIGNhbiBldmVudHVhbGx5IGJlIHJldGlyZWQuCj4gCj4gUmV2aWV3ZWQt
Ynk6IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+Cj4gCkhleSBCam9ybiwKClRo
YW5rcyBmb3IgdGhlIHJldmlldy4gSSB3aWxsIHNlbmQgYSB2MiwgYW5kIEkgd2lsbCBhZGQgeW91
ciByZXZpZXcgdGFnIHRoZXJlLgoKVGhhbmtzIQoKLS0gVmFpYmhhdgo+ID4gU2lnbmVkLW9mZi1i
eTogVmFpYmhhdiBHdXB0YSA8dmFpYmhhdmd1cHRhNDBAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAg
ZHJpdmVycy9tdGQvbmFuZC9yYXcvY2FmZV9uYW5kLmMgfCA3ICsrKysrLS0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvY2FmZV9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9jYWZlX25hbmQuYwo+ID4gaW5kZXggNjYzODVjNGZiOTk0Li5hZjc3MWMzNzllYzEgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWZlX25hbmQuYwo+ID4gKysrIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvY2FmZV9uYW5kLmMKPiA+IEBAIC04MzcsOSArODM3LDEwIEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBjYWZlX25hbmRfdGJsW10gPSB7Cj4g
PiAgCj4gPiAgTU9EVUxFX0RFVklDRV9UQUJMRShwY2ksIGNhZmVfbmFuZF90YmwpOwo+ID4gIAo+
ID4gLXN0YXRpYyBpbnQgY2FmZV9uYW5kX3Jlc3VtZShzdHJ1Y3QgcGNpX2RldiAqcGRldikKPiA+
ICtzdGF0aWMgaW50IGNhZmVfbmFuZF9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQo+ID4gIHsK
PiA+ICAJdWludDMyX3QgY3RybDsKPiA+ICsJc3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lf
ZGV2KGRldik7Cj4gPiAgCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gcGNpX2dldF9kcnZkYXRhKHBk
ZXYpOwo+ID4gIAlzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwID0gbXRkX3RvX25hbmQobXRkKTsKPiA+
ICAJc3RydWN0IGNhZmVfcHJpdiAqY2FmZSA9IG5hbmRfZ2V0X2NvbnRyb2xsZXJfZGF0YShjaGlw
KTsKPiA+IEBAIC04NzcsMTIgKzg3OCwxNCBAQCBzdGF0aWMgaW50IGNhZmVfbmFuZF9yZXN1bWUo
c3RydWN0IHBjaV9kZXYgKnBkZXYpCj4gPiAgCXJldHVybiAwOwo+ID4gIH0KPiA+ICAKPiA+ICtz
dGF0aWMgREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTKGNhZmVfbmFuZF9vcHMsIE5VTEwsIGNhZmVf
bmFuZF9yZXN1bWUpOwo+ID4gKwo+ID4gIHN0YXRpYyBzdHJ1Y3QgcGNpX2RyaXZlciBjYWZlX25h
bmRfcGNpX2RyaXZlciA9IHsKPiA+ICAJLm5hbWUgPSAiQ0FGw4kgTkFORCIsCj4gPiAgCS5pZF90
YWJsZSA9IGNhZmVfbmFuZF90YmwsCj4gPiAgCS5wcm9iZSA9IGNhZmVfbmFuZF9wcm9iZSwKPiA+
ICAJLnJlbW92ZSA9IGNhZmVfbmFuZF9yZW1vdmUsCj4gPiAtCS5yZXN1bWUgPSBjYWZlX25hbmRf
cmVzdW1lLAo+ID4gKwkuZHJpdmVyLnBtID0gJmNhZmVfbmFuZF9vcHMsCj4gPiAgfTsKPiA+ICAK
PiA+ICBtb2R1bGVfcGNpX2RyaXZlcihjYWZlX25hbmRfcGNpX2RyaXZlcik7Cj4gPiAtLSAKPiA+
IDIuNTMuMAo+ID4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
