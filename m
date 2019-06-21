Return-Path: <SRS0=RgZt=UU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6C4C43613
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 19:16:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B3972083B
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 19:16:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lydx+Brc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndRgHw+A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B3972083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JCYX6M9FVCxRS5l06jZ7yAnEwjGyWFFAwOfty9+14Z4=; b=lydx+BrcpIXP4I
	DyNmnMXd7QvUHqPCDVEC0Kc2Sp+popS3zwbnEP2LV/qoeNOwK1r4We021XvXuYrZvreGkg7t+z9Uu
	aHgxIhnAoQIIhpLkVplSsDpbTk1OM/NFVKGHDtUQnfFTl9XOw3roDYa42zYrUEtmRdzYlqjP0k+GY
	uvGzFtW4FEhZ/r8CKFvtM7hDXgNeybKhN/v2r66AlU+lHwNRNkPKpGG7ZjzXxUwz3hjUumNkJcj8b
	/pxGM55YiTqpF3ls2/SNLFfZUVnTohwnKlJasaCPcV+NLiC6pPoIOUiLZXibnXANTNmn+VAiIFMIB
	0TLNHR9K6NC5DpcUZXdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1heP1U-00088H-1A; Fri, 21 Jun 2019 19:16:32 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heP1Q-00087m-QE
 for linux-mtd@lists.infradead.org; Fri, 21 Jun 2019 19:16:30 +0000
Received: by mail-lj1-x243.google.com with SMTP id x25so6931638ljh.2
 for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2019 12:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7PdC7YN7EywADSea1wEztgXyQWpXjbloVQRfPBcjqDY=;
 b=ndRgHw+AHW4cnNiN+0AroQ70kvx6x3cnwolv6ijsegqcGFSw+/EuGKwXAmlxE5u9ql
 Q2DQOd1O+S0FZEjW1lWD9yE1ISTDPN1O1/CEBDXSSK6uPWekPBMzaO0U03gNYI2xEDqg
 zWGRY9baQWRb4VpU+JKVL5MEg2WjqKJIoWbeEbzE7aGBA7lfrn6jY0zohOAwv/GiQr32
 JpQ0XsqK90rWwdDdbLG97juG2i0dt1rGa9Q7Ox1bEqpVaI2lOROU69S6gh9Y1bDKnyMh
 qwobLQTQcOMS5Afa340e8Reg5pPfP7HH09fXK6sigrkeYwZvHvJawqhA9z/RNeDKTEwz
 qk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7PdC7YN7EywADSea1wEztgXyQWpXjbloVQRfPBcjqDY=;
 b=TBTCgpyTc2x4s0qaStnnREL0272sqRMM3MT+IL3LjSnWsEQzU9wK16zeSwIbriSx7N
 Qn0Ae/C4Zl0GKpku7LFQk8GNt86Xt3pbYLW2QZiUH8538sngU68MbN1UIxo02CwtbqH6
 9ZJJJzS+FdZMTeqge86OVXtL4nG3HBasFEMHjuossa24E7NlbOPaVOqboGchHVg9Ua7i
 VJ3+pCZIwrHJsX6g7WQRnu+byW38o9zhrOaOlkFToz5v9Yo//g72eaTutq2X20G2Vr1h
 Dord/lCvHlLUow8jUNQUg4uVGCgQYDVsBCTsWjUFeSpCrLuL/X9hgQfvrhkUVkQ6b3ZW
 J72g==
X-Gm-Message-State: APjAAAXewfpHttSh4JCgNILRKULBmDFH9N/vGHom+mWoci8Lu2vJCGx4
 58Eu8ULUhFsxtjcxN9RhL6tSmJHHbvU=
X-Google-Smtp-Source: APXvYqxUSHcHCvhNnoGCberIuV2MXbPezUpmvnF/vOn08ic5wfZvUDu1bNMymtKouZAbVYWNkKmxEQ==
X-Received: by 2002:a2e:9d18:: with SMTP id t24mr45511088lji.2.1561144587068; 
 Fri, 21 Jun 2019 12:16:27 -0700 (PDT)
Received: from laska.lan ([93.185.27.99])
 by smtp.gmail.com with ESMTPSA id q22sm515824lje.75.2019.06.21.12.16.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 12:16:26 -0700 (PDT)
Date: Fri, 21 Jun 2019 22:16:23 +0300
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd/ubi: fix initialization order of ubi subsystems
Message-ID: <20190621221623.0db81a14@laska.lan>
In-Reply-To: <561004432.13649.1561142870072.JavaMail.zimbra@nod.at>
References: <20190620132753.19538-1-mikhail.kshevetskiy@gmail.com>
 <CAFLxGvyvFL6iHOgQzw2wqpTYOTY8eW57ORuVQnkjn+Gmub=cbQ@mail.gmail.com>
 <20190621213914.5b0023fd@laska.lan>
 <561004432.13649.1561142870072.JavaMail.zimbra@nod.at>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190621_121628_851404_AADBEEB4 
X-CRM114-Status: GOOD (  15.28  )
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
bXRkOiB1Ymk6IEZpeCB3b3JrZXIgaGFuZGxpbmciKQoKbm8gd2UgdXNlIDIwMS4wNyBiYXNlZCBi
b290bG9hZGVyLiBJJ2xsIGxvb2sgb24gaXQuIFRoYW5rcy4KCj4gCj4gVGhhbmtzLAo+IC8vcmlj
aGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
