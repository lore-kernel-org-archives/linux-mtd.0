Return-Path: <SRS0=RgZt=UU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE887C43613
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 19:17:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86D9D2083B
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 19:17:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k4AIrL3b";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fy3L0DQ5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86D9D2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=skDwyymMnx2ComXnK9Qtd5Z1JhBiyS0J4fCebycDptk=; b=k4AIrL3bAfy1fR
	JkAkczmGU6DPFLH+noc4BrlsyudzuNoxMF7epc9px9/YbDB5vykJB7A0ipl7Oy36Sm+rDRfZva7Yz
	rIEbiIiRQuyKIn1idmRnu+UTvPFdCguj2BMOAQXtQ6EeMvxy9FV2LmI4Y6VsZjMhpvUp1/QG7DA1E
	FkSfQIMW07hcXWGRIMdhh3tYAIv8+td8HxJ48P8Eq3r6zECiVPVuJ5JAJbc7O2hLt0dqVFtdbIUuo
	pXrNC6xqvX+Odq3+pD/sfYwpjy9TLXpO4LmPbwFQNxyDhE9phMIjD7H0pSEUzaJyxCps8fZpKVOXr
	OsTda2V/Oy+Umm8sAvvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1heP1z-0008NX-9w; Fri, 21 Jun 2019 19:17:03 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heP1v-0008Mo-Q3
 for linux-mtd@lists.infradead.org; Fri, 21 Jun 2019 19:17:01 +0000
Received: by mail-lj1-x244.google.com with SMTP id i21so6924753ljj.3
 for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2019 12:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sOM817Rc6sDz7iUK1A7M36zxi/WwYhtQiFkLcVpKKik=;
 b=fy3L0DQ52O3VTAvuScy7UNF89barlSp5CF6L6NAaW/SUIX/xheIkVz5oEpHw4QgIiK
 9t0vkzHsDI1P2ia17srV6Ad0OnD5akG4ABLIlA+UdtB46WLDWUnFlIsPxwivzTbto1xv
 IH1izVEdPcm0c4xD3I97Fy9FzkOoAkUSioW4XLD5Y9nrLe6p7YD3pHg4aW3gy8VP32V7
 9spmaBVYlZLNIiuO+bja0rraaEv2TnmFIXb1IlYuayREfMu7AA9pL8YP8CscGcHgsJl7
 8SdcHHIgiz24FsmbMJymIK+ynLwh7NYmPw0WggIiCAfj1M7ZIiCnLSTXQhuW52PRM9sf
 4M0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sOM817Rc6sDz7iUK1A7M36zxi/WwYhtQiFkLcVpKKik=;
 b=jit+b64Vs3CGwcfUqBoGkB+K+zvof6+f1aRsmAg0FcbvJcuN5oIKpzC33Vt0nJRp8V
 G2eDDwoVhK8cqVPKG9viVM5rRN0pjV+/GpYeGqqj8FlRjcVjg4rtjsyFTi6yRhkuDgDO
 W0QFfI76V2mCsYcROyf96QgJyeII/lRcXBOlttrWfH2GB5Vn6jIdNj8+9rt7F8i22HNU
 JV/2trXtznPfoU6goK/Awv8/M1D4Dr8Vg1554lrbUonTuPtLs+W8VLTtxxtIvAQE470H
 lxfCX+vfi9B+H/R3vNUNLnPKtKsfo/cRn8EOpoqFPAoJYBWNB2rC4Q+KLGV6A6bcQlF2
 5x9g==
X-Gm-Message-State: APjAAAWzMO30DFEQwLH/3Pj9cVsldhdMEYap7pwVBhSiDi5VWtI1mxvv
 nwsNJJasCE34piavLvUye0jQwMOYz8U=
X-Google-Smtp-Source: APXvYqzp7pinrUIbF3PFjTgMiK7FEEAhYRBmVST7N2Ct/F5qnMecsIibwtQluLqK5msCUmn4jbMf1Q==
X-Received: by 2002:a2e:9858:: with SMTP id e24mr11341124ljj.91.1561144618254; 
 Fri, 21 Jun 2019 12:16:58 -0700 (PDT)
Received: from laska.lan ([93.185.27.99])
 by smtp.gmail.com with ESMTPSA id y15sm512590lfg.43.2019.06.21.12.16.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 12:16:57 -0700 (PDT)
Date: Fri, 21 Jun 2019 22:16:54 +0300
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd/ubi: fix initialization order of ubi subsystems
Message-ID: <20190621221654.0960977c@laska.lan>
In-Reply-To: <561004432.13649.1561142870072.JavaMail.zimbra@nod.at>
References: <20190620132753.19538-1-mikhail.kshevetskiy@gmail.com>
 <CAFLxGvyvFL6iHOgQzw2wqpTYOTY8eW57ORuVQnkjn+Gmub=cbQ@mail.gmail.com>
 <20190621213914.5b0023fd@laska.lan>
 <561004432.13649.1561142870072.JavaMail.zimbra@nod.at>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190621_121659_842697_3D8C7AB1 
X-CRM114-Status: GOOD (  15.17  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyMSBKdW4gMjAxOSAyMDo0Nzo1MCArMDIwMCAoQ0VTVCkKUmljaGFyZCBXZWluYmVy
Z2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JvdGU6Cgo+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwg
LS0tLS0KPiA+PiBDYW4geW91IHBsZWFzZSBzaGFyZSBhIGxpdHRsZSBtb3JlIGFib3V0IHRoZSBw
cm9ibGVtIHlvdSBhcmUgZmFjaW5nPwo+ID4+IEFsc28gcHJvZHVjZV9mcmVlX3BlYigpIHNob3Vs
ZCBub3QgZ2V0IGNhbGxlZCBhdCB0aGlzIHBvaW50Lgo+ID4+IFNvIGJlZm9yZSB3ZSBmbGlwIHRo
ZSBvcmRlciBvZiBpbml0aWFsaXphdGlvbiBJJ2QgbGlrZSB0byB1bmRlcnN0YW5kIHRoZQo+ID4+
IHByb2JsZW0gYmV0dGVyLgo+ID4gCj4gPiBXZSBmYWNlZCBhIGN5Y2xlIHJlYm9vdGluZyBpbiB1
LWJvb3QgZHVyaW5nIHViaSBpbml0aWFsaXphdGlvbi4gVGhlIHByb2JsZW0KPiA+IGFwcGVhcnMg
YXBwcm94aW1hdGVseSBvbmNlIHBlciB3ZWVrIG9uIGEgcmFuZG9tIHJvdXRlciBmcm9tIG91ciB0
ZXN0IGZhcm0uCj4gPiBXZSBuZXZlciB0cmlnZ2VyIHRoaXMgcHJvYmxlbSBpbiBsaW51eCAob25s
eSBpbiB1LWJvb3QpLgo+ID4gCj4gPiBGcm9tIHRoZSBvdGhlciBzaWRlIHViaSBjb2RlIGluIHUt
Ym9vdCBpcyBhbG1vc3QgdGhlIHNhbWUgYXMgdWJpIGNvZGUgaW4KPiA+IGxpbnV4IGtlcm5lbCAo
aXQgYmFja3BvcnRlZCBmcm9tIGxpbnV4IHBlcmlvZGljYWxseSksIHNvIGl0IG1ha2Ugc2Vuc2Ug
dG8KPiA+IGZpeCBpdCBpbiBsaW51eCBhcyB3ZWxsIHRvIGhlbHAgd2l0aCBmdXR1cmUgcG9ydGlu
Zy4KPiA+IAo+ID4gUFMgd2Ugc2VuZCB0aGUgc2FtZSBwYXRjaCB0byB1LWJvb3QuCj4gCj4gSW4g
dS1ib290IHRoZSBzdG9yeSBpcyBhIGxpdHRsZSBkaWZmZXJlbnQgYmVjYXVzZSBpdCBoYXMgbm8g
Y29uY2VwdCBvZgo+IHRocmVhZHMgYW5kIGV4ZWN1dGVzIHdvcmsgaW1tZWRpYXRlbHkuCj4gCj4g
RG8geW91IHNlZSB0aGlzIG9uIGEgcmVjZW50IHUtYm9vdD8KPiBXaXRoIHRoaXMgY29tbWl0IGlu
IHUtYm9vdCB0aGlzIHByb2JsZW0gc2hvdWxkIG5vdCBoYXBwZW46Cj4gZjgyMjkwYWZjODQ3ICgi
bXRkOiB1Ymk6IEZpeCB3b3JrZXIgaGFuZGxpbmciKQoKbm8gd2UgdXNlIDIwMTYuMDcgYmFzZWQg
Ym9vdGxvYWRlci4gSSdsbCBsb29rIG9uIGl0LiBUaGFua3MuCgo+IAo+IFRoYW5rcywKPiAvL3Jp
Y2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
