Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CBCCA0EEB
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Aug 2025 22:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q9WKPkrMurlsRYuxQftGimEHGzHBOEGV1L3mvkBMVCA=; b=OVJ0dStZzM+c0U
	47n/oBlKUYpFN1I+AbCwsB06CnLHNUFQ0nWJHlJoIV2Fgx6D8z7sqE0WRKTmTvFAPaciorvdw9fji
	jSEArRguSSnCyeZcxopSiD26JFvZj7f3TxdbEqJHOy8ddg4iEjsRLDUUqqEXqVWSblMAn3S9GoIX2
	yrY6bTolmu0FL0H1qpIJo4Tsv8mwpYzo8acGbFvWiOUDkS7qR9vORGnqDn++/8DVxzeW9H7h/ewPA
	coLLMoWe43w2SSfpsaUBvlVauq61gKUjUqpcmolElHy4bqMD3bRX7I19lS1DeygqdrVrKXDrTGP//
	apy/2MlmKVoEru2eHDoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoV26-0000000Bl4K-3Bzg;
	Tue, 19 Aug 2025 22:42:22 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoTEe-0000000BaYX-3hzW
	for linux-mtd@lists.infradead.org;
	Tue, 19 Aug 2025 20:47:14 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4b109c62817so1268961cf.3
        for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2025 13:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755636431; x=1756241231; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CVZla1Amx81Jj4BMjLcKa0fUKigweYAFG3TWZCEowk=;
        b=YJ4ISqIeGLkBcYhwhBV52kRZV9K6hEyjMtunu3Xe6V3H+9buYsXfyVEfTxTUl/wfnG
         W4ectGOXWPB2igUcIllUuWQVVeuROBhiD9l1U+a922Vt5hk/w9cgqcdTi7jMRqVpU6yP
         rS0xdTuyjRrUKRY56D5ijDi61oLkPLJJGrTragMOA9Zx2Vlfkqcw1AYtoJS9E/K/2fL+
         Jv2FjlxVqTTKrN5Oi5yqf/yjHSIDv58pkjj0Cc3NyL/3VKQDy4v++luZxipIZ2wZrX6k
         Xb/M5S2o3tCJYRzf0kD1IGvmnAp+T4KX/BD2jJhA8sw5wjxlZ4up9M/2f3ICGhuhidjg
         rQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755636431; x=1756241231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3CVZla1Amx81Jj4BMjLcKa0fUKigweYAFG3TWZCEowk=;
        b=mKqeBtxKZC0PulSo3C76aTkms3YMgkBpC6jXThgSLrNxuCt28SwPX0Blpocyu3Ffos
         4rKMUL24RPLC+oDRN0FA3WAo0nxXTxCTYH1qWmxL4pxlnlDrtsA5CQ6B/PWT8s1JwIOa
         /veSWuvedgjQVH6UnPMC43bVOfx69Xk3V+DQT6AeLlo4IoeJwLfa0N4FAZk9c6dI92vN
         mildqse8k5uRC/WcnhsU86DJKnm2tFyZBWQM083afA5U3kmUePqqN9QNkAElxArBBxOb
         1T0oNGRwhMQsYRadprghvyny9ZBjsPYl5jC7rzV34kEfaIRCF5ublA1P6PTl23Z06vIu
         6Omg==
X-Forwarded-Encrypted: i=1; AJvYcCVWdN2O286wzY4KlN/NSx7jbfHg+eEM1eseDYGxyouX7spnmKnsQo0Q3gtpj8FvghgeqFjqVZV1XLw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSqkQNnXe+kZHHN/QHCwX8y61NpJINprllqg9lWe7/9A7NidOk
	AY8I6d56N1/go4DrfC3A2LqaSX8dtFFVkghENeVOM3lk6TfqqDaqFaxO2fDWVtzvDt/xQVRMmwe
	pzKWQVnC2OE9GGhpciwJ35Kp/nwx5n3M=
X-Gm-Gg: ASbGncuqr11iyrX+gMddExY7aTMkpHu8H3WvgE4SGrNF9ZniYk1yPq8f1Un7vaijRx9
	+1YXWbxXSic8u/15q4R/pQJV9L4VFGMxSXqXW0YgnTPZSMrf41GEcV1iv3RRPTMtLut8EKywA18
	fcLcMXkxGDq2osSOtHm5jihQHyPneUBKEtShqH/e9gDmu6KDpg/9k7f65YWdXLmuVagn0sFARzS
	Sk6Eg==
X-Google-Smtp-Source: AGHT+IGizR9tAqGN0a9BKirrP1Gq/TZtzmYxUjt2HrNyAFG6baaw1liHtBpUlnC4i1gvgHaPjDn8zqqJOR2nMxzOD0E=
X-Received: by 2002:ac8:5ad5:0:b0:4a9:e326:277a with SMTP id
 d75a77b69052e-4b291a44033mr4971821cf.5.1755636431058; Tue, 19 Aug 2025
 13:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250811120912.144720-1-miguelgarciaroman8@gmail.com> <1786903963.99788.1754916389068.JavaMail.zimbra@nod.at>
In-Reply-To: <1786903963.99788.1754916389068.JavaMail.zimbra@nod.at>
From: =?UTF-8?B?TWlndWVsIEdhcmPDrWEgUm9tw6Fu?= <miguelgarciaroman8@gmail.com>
Date: Tue, 19 Aug 2025 22:46:59 +0200
X-Gm-Features: Ac12FXye0SBJkc3pjlzx5bI4TLAbd2lVqY8mN5J-XFFy6LnzUflPjIW-IhMiHpc
Message-ID: <CABKbRo+3fA0gBuJg+J_fnNvnjkb-0QxZtxCUQ5BDAFV6VsTRaA@mail.gmail.com>
Subject: Re: [PATCH] mtd: ubi: replace strcpy with strscpy in mtd parameter parser
To: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	chengzhihao1 <chengzhihao1@huawei.com>, linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_134712_949778_E3C44EEC 
X-CRM114-Status: GOOD (  12.60  )
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

RWwgbHVuLCAxMSBhZ28gMjAyNSBhIGxhcyAxNDo0NiwgUmljaGFyZCBXZWluYmVyZ2VyICg8cmlj
aGFyZEBub2QuYXQ+KSBlc2NyaWJpw7M6Cj4KPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0t
LS0tCj4gPiBWb246ICJNaWd1ZWwgR2FyY8OtYSIgPG1pZ3VlbGdhcmNpYXJvbWFuOEBnbWFpbC5j
b20+Cj4gPiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJNaXF1ZWwgUmF5bmFsIiA8
bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4sICJWaWduZXNoIFJhZ2hhdmVuZHJhIiA8dmlnbmVz
aHJAdGkuY29tPgo+ID4gQ0M6ICJjaGVuZ3poaWhhbzEiIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNv
bT4sICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJsaW51eC1r
ZXJuZWwiCj4gPiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4sICJTaHVhaCBLaGFuIiA8
c2toYW5AbGludXhmb3VuZGF0aW9uLm9yZz4sICJNaWd1ZWwgR2FyY8OtYSIKPiA+IDxtaWd1ZWxn
YXJjaWFyb21hbjhAZ21haWwuY29tPgo+ID4gR2VzZW5kZXQ6IE1vbnRhZywgMTEuIEF1Z3VzdCAy
MDI1IDE0OjA5OjEyCj4gPiBCZXRyZWZmOiBbUEFUQ0hdIG10ZDogdWJpOiByZXBsYWNlIHN0cmNw
eSB3aXRoIHN0cnNjcHkgaW4gbXRkIHBhcmFtZXRlciBwYXJzZXIKPgo+ID4gUmVwbGFjZSB0aGUg
c3RyY3B5KCkgY2FsbHMgdXNlZCB0byBjb3B5IHRoZSAnbXRkPScgcGFyYW1ldGVyIGludG8gbG9j
YWwKPiA+IGJ1ZmZlcnMgd2l0aCBzdHJzY3B5KCkgdG8gYXZvaWQgcG90ZW50aWFsIG92ZXJmbG93
IGFuZCBndWFyYW50ZWUgTlVMCj4gPiB0ZXJtaW5hdGlvbi4gRGVzdGluYXRpb25zIGFyZSBmaXhl
ZC1zaXplIGFycmF5cyAoYnVmIGFuZCBwLT5uYW1lKSwgc28KPiA+IHVzZSBzaXplb2YoKS4KPiA+
Cj4gPiBXaGlsZSB0aGlzIGNvZGUgaXMgY3VycmVudGx5IHNhZmUgZHVlIHRvIHByaW9yIGxlbmd0
aCBjaGVja3MKPiA+IChzdHJubGVuKHZhbCwgTVREX1BBUkFNX0xFTl9NQVgpIGFuZCBlYXJseSBy
ZXR1cm4gb24gb3ZlcmZsb3cpLAo+ID4gcmVwbGFjaW5nIHN0cmNweSgpIHdpdGggc3Ryc2NweSgp
IGZvbGxvd3MgY3VycmVudCBrZXJuZWwgYmVzdCBwcmFjdGljZXMKPiA+IGFuZCBtYWtlcyB0aGUg
Y29kZSBtb3JlIHJvYnVzdCB0byBmdXR1cmUgY2hhbmdlcy4gVGhlIHNpemVvZigpIGNhbGxzCj4g
PiBjb3JyZWN0bHkgY29tcHV0ZSB0aGUgYnVmZmVyIHNpemVzLCBtYXRjaGluZyBNVERfUEFSQU1f
TEVOX01BWC4KPgo+IFRCSCwgSSdtIG5vdCBjb252aW5jZWQuIFdlJ3JlIHRhbGtpbmcgYWJvdXQg
a2VybmVsIG1vZHVsZSBwYXJhbWV0ZXJzLAo+IG5vdCBob3N0aWxlIHVzZXIgaW5wdXQsIGV0Yy4u
Lgo+Cj4gQnkgYWRkaW5nIHNpemVvZigpIHlvdSdyZSByZXBsYWNpbmcgb25lIGZvb2RndW4gd2l0
aCBhbm90aGVyIG9uZS4KVGhhdCdzIHRydWUKPiBJZiBidWYgaXMgaW4gZnV0dXJlIGNoYW5nZWQg
dG8gYSBwb2ludGVyLCBzaXplb2YoYnVmKSBuZWVkcyBhIGZpeHVwIHRvby4Kd2hhdCBhYm91dCB1
c2luZyB0aGUgdHdvLXBhcmFtZXRlcnMgdmVyc2lvbiBvZiBzdHJzY3B5Pwo+Cj4gVGhhbmtzLAo+
IC8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
