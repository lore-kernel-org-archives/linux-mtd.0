Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8274C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 10:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0u0tVx+Re9XsPByVNA1KZxCFHnEpgLIUhTYkrflCMYE=; b=ZIBawWapmnoBp0
	KMXS/KEOk31bG0/NJsXyyfakhlhL5Ffrx8CFL+/H9S8Qb4QlQdoDxFDCL7T0qD2YJkY7JACA3axS1
	nY3uIoVFcy5fkzIl+htOSyZL+9KWdPKWLyEslQ9MmVqh7k3FpDP2JvJv2R8Av3nnkhVzbzPbk4NcB
	b4uw6M3TibDOzFudBDalYTMTqm6xk2AS5ac7D0BzJCU59UmJQuhpRLRK5g3VkIHzWtPgSrnTElzak
	LZCltFQpfyXT54ibWu0A0pJ3HyfNUQI1C6AeFQbwYDnbwwqrlZdPz1m/E2baI9BG8r0gSeTCti2zF
	TMWr5E9KoiS0srjWySag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzFNZ-000yt8-3q; Thu, 09 Jun 2022 10:27:05 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzFNU-000ypE-UC
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 10:27:03 +0000
Received: by mail-ej1-x62e.google.com with SMTP id u12so46560814eja.8
        for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2022 03:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=sOUTYmBneU8iG+DbESjBMogqAliu7BQ9pIctsnxzzY8=;
        b=KcbtaW+Syi3OQ9ucjj23DpcuP7IxuMzTv74WDyxY7k5J5wFm1XFA8r9gg4Y46WISer
         FbzmwndkTD9CXu7nZ6q1A1/8quMVRTePoENvbJCJw9Ayht6xn2JcDb6HuKHCVmfeVLOz
         bOTo6Z8tmPX2biiHCMn18E75JRIUt7T6NJR0FgOHouFb2hH01PdT1P9hP3yVR8hXbmTS
         dUcQDvanXVtJ6u2rCrnWa2l5bbV7kYDkK/1etnVJt6pSAjbIRcHvtZunyn4GJqdPlRUw
         GHHPJjYwDAzxZARBO6A4wDQ0LU5I5+zgr21ZfCss2ziZ6FlIlc2AgvmKiwlics3wdzab
         S2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=sOUTYmBneU8iG+DbESjBMogqAliu7BQ9pIctsnxzzY8=;
        b=gMADjbT8sYMzd4VG7Y/skxBWPkN624ARmW2UsGTiJ3EzklfDpIJC6bcrAyKeF0WDDV
         9YiXyyLF0qdGKV7lyxORmohQYkJGk/d8Dsq/6K8iSlzKPPOV1CAcJoujP7pXqvsUH8hD
         7oJk9KrKSx/yArCJAYa1bmj9gJO+Yq7NqZyafBquRb4iRL+66O+QfIn+AVyqwPPyoqTm
         5J/t6HeNALQzxk0v1j2JYbDZj1oRujp6nMkRAYS7mswnWLfBoDiUDmm4kqpbJADbDamB
         eRVbXaZO27Hn2xG9eNFH9dDKN80D/JobCLJXYJrgfRy2LAunYbXW56Ose3ATwoRCs+Yr
         BF9w==
X-Gm-Message-State: AOAM531qycMFZHOCd9gO5JB9HVVFfwYRJ1JeeokXhBp2TlJYcefkpI5x
	yGvY804/NLhmsNxJ06Xb/SM=
X-Google-Smtp-Source: ABdhPJyKWGGdiwtTA3k2q4C3kDwA3pz4FW+/eH64t+dXA1QIsqIkpA0BKRQ54f3WO8G470p5FNoRcw==
X-Received: by 2002:a17:906:84b:b0:70c:d506:7817 with SMTP id f11-20020a170906084b00b0070cd5067817mr32323334ejd.206.1654770417293;
        Thu, 09 Jun 2022 03:26:57 -0700 (PDT)
Received: from Ansuel-xps. (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.gmail.com with ESMTPSA id o9-20020a170906600900b006fec8e5b8a9sm10456213ejj.152.2022.06.09.03.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 03:26:56 -0700 (PDT)
Message-ID: <62a1caf0.1c69fb81.a67af.bdf8@mx.google.com>
X-Google-Original-Message-ID: <YqHK7WOZsq/YH2kV@Ansuel-xps.>
Date: Thu, 9 Jun 2022 12:26:53 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] mtd: nand: raw: qcom_nandc: reorder
 qcom_nand_host struct
References: <20220608001030.18813-1-ansuelsmth@gmail.com>
 <20220608001030.18813-4-ansuelsmth@gmail.com>
 <20220609072240.GB2758@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220609072240.GB2758@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_032701_019712_1B40983C 
X-CRM114-Status: GOOD (  19.28  )
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

T24gVGh1LCBKdW4gMDksIDIwMjIgYXQgMTI6NTI6NDBQTSArMDUzMCwgTWFuaXZhbm5hbiBTYWRo
YXNpdmFtIHdyb3RlOgo+IE9uIFdlZCwgSnVuIDA4LCAyMDIyIGF0IDAyOjEwOjMwQU0gKzAyMDAs
IEFuc3VlbCBTbWl0aCB3cm90ZToKPiA+IFJlb3JkZXIgcWNvbV9uYW5kX2hvc3QgdG8gc2F2ZSBo
b2xlcyBpbiB0aGUgc3RydWN0Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnN1ZWwgU21pdGgg
PGFuc3VlbHNtdGhAZ21haWwuY29tPgo+IAo+IElmIHRoaXMgcGF0Y2ggZ2V0cyBtb3ZlZCB0byAy
LzMsIHlvdSBjb3VsZCBzYXZlIGZldyBjaGFuZ2VzLiBBbHNvLCBkbyB0aGUgc2FtZQo+IGZvciBv
dGhlciBzdHJ1Y3RzIGFzIHdlbGwuCj4gCj4gVGhhbmtzLAo+IE1hbmkKPgoKU2luY2UgMi8zIGFs
cmVhZHkgaGFkIGxvdHMgb2YgY2hhbmdlcyBkaWRuJ3Qgd2FudCB0byBwdXQgYSBzdHJ1Y3QKcmVv
cmRlciBpbiBpdCBzaW5jZSBpdCBkb2VzIHRvdWNoIGFsc28gb3RoZXIgdmFsdWVzLiBUZWxsIG1l
IGlmIEkgc2hvdWxkCnNxdWFzaCB0aGUgMiBjb21taXQuCgo+ID4gLS0tCj4gPiAgZHJpdmVycy9t
dGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIHwgNyArKysrLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fj
b21fbmFuZGMuYwo+ID4gaW5kZXggMDZlZTlhODM2YTNiLi4xMTBmODM5YzllNTEgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiA+ICsrKyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+ID4gQEAgLTQ3NSwxMSArNDc1LDEzIEBAIHN0
cnVjdCBxY29tX25hbmRfaG9zdCB7Cj4gPiAgCWludCBjczsKPiA+ICAJaW50IGN3X3NpemU7Cj4g
PiAgCWludCBjd19kYXRhOwo+ID4gLQlib29sIHVzZV9lY2M7Cj4gPiAtCWJvb2wgYmNoX2VuYWJs
ZWQ7Cj4gPiAgCWludCBlY2NfYnl0ZXNfaHc7Cj4gPiAgCWludCBzcGFyZV9ieXRlczsKPiA+ICAJ
aW50IGJibV9zaXplOwo+ID4gKwo+ID4gKwlib29sIGNvZGV3b3JkX2ZpeHVwOwo+ID4gKwlib29s
IHVzZV9lY2M7Cj4gPiArCWJvb2wgYmNoX2VuYWJsZWQ7Cj4gPiAgCXU4IHN0YXR1czsKPiA+ICAJ
aW50IGxhc3RfY29tbWFuZDsKPiA+ICAKPiA+IEBAIC00OTAsNyArNDkyLDYgQEAgc3RydWN0IHFj
b21fbmFuZF9ob3N0IHsKPiA+ICAJdTMyIGNscmZsYXNoc3RhdHVzOwo+ID4gIAl1MzIgY2xycmVh
ZHN0YXR1czsKPiA+ICAKPiA+IC0JYm9vbCBjb2Rld29yZF9maXh1cDsKPiA+ICAJaW50IG5yX2Jv
b3RfcGFydGl0aW9uczsKPiA+ICAJc3RydWN0IHFjb21fbmFuZF9ib290X3BhcnRpdGlvbiAqYm9v
dF9wYXJ0aXRpb25zOwo+ID4gIH07Cj4gPiAtLSAKPiA+IDIuMzYuMQo+ID4gCj4gCj4gLS0gCj4g
4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKLS0g
CglBbnN1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
