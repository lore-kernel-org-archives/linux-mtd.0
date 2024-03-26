Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA55C54E67
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2024 07:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PDd9kwwjigovbzte/4KiF0LGEcuNykuT9IrMzE2gNYY=; b=Qdv7GjxktVBJpq
	KzvQyDNtG07aKSHv3OstRmsVVFdyXMuxz8qOif8hFuWYyAYRQ2McjjltwCFTJ5/3XeOnuyqALGL5Q
	jtrQwabRa0da7mkPkO0YYrZjvKQyt+Pk3usqrZqqDKvEsL+coVVXERIwwiNEWHUlfvDtsAZnBhWr4
	sdaLzvCaTGL30DYUAt8+XMPPYme67kLJRQHOoeKNqQbu4W9dU8xYHJju2CE75JS/tQaszZW2ZiD8l
	Fdcq3JyjCA7xu5YlGWePSVsfufoKs/+fxk9mf9+KCebHFyOutE2BQfM/XnihN3qSrmuRdn7SMYpPu
	bQQuf0IZ8xUR/f0NUmgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp1SC-00000003TtF-1eo5;
	Tue, 26 Mar 2024 07:42:40 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp1S5-00000003TsT-2Avn
	for linux-mtd@lists.infradead.org;
	Tue, 26 Mar 2024 07:42:34 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6e6b22af648so4076508b3a.0
        for <linux-mtd@lists.infradead.org>; Tue, 26 Mar 2024 00:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711438951; x=1712043751; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=suWtwDEm4B03eU+FNeyx8FV8u6kO5WvtfeH16xAc4og=;
        b=zbrWztaMUifHnO4/+WTNYkJuw2qvKy8Ze3MCM9XauoUoKzJOIRt63PjWwD+QNePuzp
         KvK3J6+K7zehKGHwngYelbuZeRvkHAqJBInp7BscvEKdKNfMOBj/iC7/DbolWX6Oyon/
         3dzwaJ0TWAcXkN9X9d5HpSJ1FlPY/h1N2+KElMz883DFoUdUi3pkqbzn88ZZbZg9xVK3
         fvu8mFwkF/oun08b2HcjlRneLajohzfLRTTU/i29H0E6NFvQoNa+UalRIZThmMLYGKAu
         wIA4nksm2GamxVG/1qRc/1IKorrvbuQu2RsyPENWajiShG6EYubTLTSfOMXCOTaEvWQS
         41Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711438951; x=1712043751;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=suWtwDEm4B03eU+FNeyx8FV8u6kO5WvtfeH16xAc4og=;
        b=Gr0b7JrRZf07pXReXhd7guachjr0Ni+igICr+JuluKkk4PF5GB4CS6IGdaLiKeEVFP
         mSSGx2imNb4X1hEoLtrKiTnyDS+aScOj7m4mA9EDWzZBttVEFS9/dD3hghTAp+R1hoCt
         Rzh5B6t9XwuhRxpmPzD0O4zCwLJK6St2auae+3rHep8TZPJMx6Q0XjV4g1CTw4Ro4Z1m
         2RGUB9ke7OQdw+L703Jcp/BQIRsvDfOGNbXyH/xsKJ+pV1jA0yD9FZPU0XZKgt0mFz1g
         Y2tzGNO/5HjSMBGTPqmMcC2llUBFiJJ5rtXZuQT6U2NtK6q9bX9wMj3itzeEYlIHtaRp
         xpVg==
X-Forwarded-Encrypted: i=1; AJvYcCWc9SHf9Q1yucTbUCItt2tFVf6PQJ/zUl7T8tsVZ5x885/3OApF10CfHUzfHQf0BjF71ukLS2X+I/AxnnwxUQSh8MCtSD9OzmHY55277w==
X-Gm-Message-State: AOJu0YyfkNA6XlNSgOrBwGmk9u0mqnCQ1KZTTyVpUnnrG+dzqYxWSDKt
	2fc12vLd0IVkYOIIe+7N5w1AkAdM0LyYTGTN6xka62MYO7lOXSWUEPTTGVzb9A==
X-Google-Smtp-Source: AGHT+IENYADQhqltAgsX3SaQGsChrRbnmlYma0ZqXAvA2PgQ9EbWV1JZJVQXA1LqKU8H1D8C5SxnMA==
X-Received: by 2002:a05:6a20:3d87:b0:1a3:a8ff:473b with SMTP id s7-20020a056a203d8700b001a3a8ff473bmr939435pzi.29.1711438950796;
        Tue, 26 Mar 2024 00:42:30 -0700 (PDT)
Received: from thinkpad ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id fi16-20020a056a00399000b006e795082439sm5313094pfb.25.2024.03.26.00.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 00:42:30 -0700 (PDT)
Date: Tue, 26 Mar 2024 13:12:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: rawnand: qcom: Fix broken reset in
 misc_cmd_type in exec_op
Message-ID: <20240326074223.GB9565@thinkpad>
References: <20240325103053.24408-1-ansuelsmth@gmail.com>
 <20240325103053.24408-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240325103053.24408-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_004233_594784_9A1427B0 
X-CRM114-Status: GOOD (  23.11  )
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

T24gTW9uLCBNYXIgMjUsIDIwMjQgYXQgMTE6MzA6NDhBTSArMDEwMCwgQ2hyaXN0aWFuIE1hcmFu
Z2kgd3JvdGU6Cj4gbWlzY19jbWRfdHlwZSBpbiBleGVjX29wIGhhdmUgbXVsdGlwbGUgcHJvYmxl
bXMuIFdpdGggY29tbWl0IGE4Mjk5MGM4YTQwOQo+ICgibXRkOiByYXduYW5kOiBxY29tOiBBZGQg
cmVhZC9yZWFkX3N0YXJ0IG9wcyBpbiBleGVjX29wIHBhdGgiKSBpdCB3YXMKPiByZXdvcmtlZCBh
bmQgZ2VuZXJhbGl6ZWQgYnV0IGFjdHVhbGx5IGRyb3BwZWQgdGhlIGhhbmRsaW5nIG9mIHRoZQo+
IFJFU0VUX0RFVklDRSBjb21tYW5kLgo+IAo+IFRoZSByZXdvcmsgaXRzZWxmIHdhcyBjb3JyZWN0
IHdpdGggc3VwcG9ydGluZyBjYXNlIHdoZXJlIGEgc2luZ2xlIG1pc2MKPiBjb21tYW5kIGlzIGhh
bmRsZWQsIGJ1dCBiZWNhbWUgcHJvYmxlbWF0aWMgYnkgdGhlIGFkZGl0aW9uIG9mIGV4aXRpbmcK
PiBlYXJseSBpZiB3ZSBkaWRuJ3QgaGFkIGFuIEVSQVNFIG9yIGFuIE9QX1BST0dSQU1fUEFHRSBv
cGVyYXRpb24uCj4gCj4gQWRkIGFkZGl0aW9uYWwgbG9naWMgdG8gaGFuZGxlIHRoZSByZXNldCBj
b21tYW5kIGFuZCByZXR1cm4gZWFybHkgb25seQo+IGlmIHdlIGRvbid0IGhhdmUgaGFuZGxpbmcg
Zm9yIHRoZSByZXF1ZXN0ZWQgY29tbWFuZC4KPiAKPiBGaXhlczogYTgyOTkwYzhhNDA5ICgibXRk
OiByYXduYW5kOiBxY29tOiBBZGQgcmVhZC9yZWFkX3N0YXJ0IG9wcyBpbiBleGVjX29wIHBhdGgi
KQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFu
IE1hcmFuZ2kgPGFuc3VlbHNtdGhAZ21haWwuY29tPgo+IC0tLQo+IENoYW5nZXMgdjI6Cj4gLSBB
ZGQgdGhpcyBwYXRjaAo+IAo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgfCAy
ICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiBpbmRleCAxOWQ3NmUzNDVhNDkuLmI4Y2ZmOTI0
MGIyOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiAr
KysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiBAQCAtMjgxNSw3ICsyODE1
LDcgQEAgc3RhdGljIGludCBxY29tX21pc2NfY21kX3R5cGVfZXhlYyhzdHJ1Y3QgbmFuZF9jaGlw
ICpjaGlwLCBjb25zdCBzdHJ1Y3QgbmFuZF9zdWIKPiAgCQkJICAgICAgaG9zdC0+Y2ZnMF9yYXcg
JiB+KDcgPDwgQ1dfUEVSX1BBR0UpKTsKPiAgCQluYW5kY19zZXRfcmVnKGNoaXAsIE5BTkRfREVW
MF9DRkcxLCBob3N0LT5jZmcxX3Jhdyk7Cj4gIAkJaW5zdHJzID0gMzsKPiAtCX0gZWxzZSB7Cj4g
Kwl9IGVsc2UgaWYgKHFfb3AuY21kX3JlZyAhPSBPUF9SRVNFVF9ERVZJQ0UpIHsKCkJ1dCB0aGlz
IHdpbGwgZmFpbCBpZiB0aGUgcHJldmlvdXMgcGF0Y2ggaXMgbm90IGFwcGxpZWQuIFNvIHRoaXMg
bWFrZXMgbWUgdGhpbmsKdGhhdCB5b3UgYXJlIHRyeWluZyB0byBmaXggdGhlIE9QX1JFU0VUX0RF
VklDRSBjb21tYW5kIHdpdGggdGhlc2UgMiBwYXRjaGVzLgoKLSBNYW5pCgotLSAK4K6u4K6j4K6/
4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
