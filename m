Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E34C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Feb 2022 07:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ey3BIzY2GrREZpvOoNABtikt8nfjzDT4Ob2D5086gFc=; b=DmS54Z9DIvykC3
	5KTQU2VJaTjdd995BFTkgqPopNzNqdKXJe76JULLkq9p/HDatjooqlVY+bBjCVSwJfAbMZXXklH/e
	4FqvZFVbEscG3V4q24pcMvN8mNKgB0Rm3ThP28xohfKiYoo2tFb2uXsJMuL73LgouGUM4YADYepkl
	0nu11F9N6ggngL3zzTpZOaxtAMTAn+YLniPUWRxBSUa5G2dJzxJJGISAeDnfZ6Mc8dvHVA9H0tIG5
	mSBgs9v7XygIifFgMMWD/avOZuGavwiXpIPWXrgA92/e7d+ylcukQDn4QSIF+s8zNp93UzhuxC/C9
	TdeOz0Rr+GwHVlWsdIMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKEKS-005n8a-8l; Wed, 16 Feb 2022 07:02:20 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKEKP-005n86-QC; Wed, 16 Feb 2022 07:02:19 +0000
Received: by mail-qt1-x831.google.com with SMTP id r9so1294321qta.1;
 Tue, 15 Feb 2022 23:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tQsez3rBBuWL5P/PS1iF/3TVpjfzLMW/EONt+f9CiMQ=;
 b=DEQtO8Rec0/pciyxC16dz5iaxsu3WmlWt3NyB5nPzDtrs1WiDLQmd6+hlVBLEnqVpu
 1mebox8SJRxbZTV/O6jAS12dOueg+4F90FldQTblOj89+hrNeAHr+LIeLNdAliI56beR
 pJC3N2/CeNgNv8Gka5T210xTzD/ClYHwqrGc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tQsez3rBBuWL5P/PS1iF/3TVpjfzLMW/EONt+f9CiMQ=;
 b=6V7RnuCy8Q/crwuV1NXmz8GQToFgSam5l5tOtego5o7gLtFkclVffe/PPf5vDaTvvY
 Q8oEm8j+hMcm7ioW+oDp7aIsLoYM131Iy/z7ilswvb9X7gL0bLyeKG+OtOiywrtjGFAE
 Jj7HIxhdbBzcLG1o0N7NtG3z76rw+VJf7+oPnK3SQ+hCh9kbf5PKRiSPfkCylwB9fRep
 ReTMUbs9tUwWdKH9NgyQesYq+WsCasYClfMlKsoAZqOSNOzuA8xmQbIpe3Dy5v3tBiPx
 wC0PZzo4K2MLigziBC0ZDk495HsKH/wHjDZbC+H4jaV9vYLBzWpXdgPgHNnWVmvKAMlb
 OQ+Q==
X-Gm-Message-State: AOAM533G+XiB9rYY8JuUVQ7u2CUH5IO0P5DQg5g3oBi3Z4e+Jrp9Tr42
 Vd8GdlkdJpQdkc13N4azEahT8HnG8/AflBzZ/Nw=
X-Google-Smtp-Source: ABdhPJxUrxTCwzi7Yj2+ExwwwoGmToAHQYb+adCONcmAx/DnApNmNJjP3jevLGycqiKtwihstXuDC7FCB3cmNTkPoqU=
X-Received: by 2002:a05:622a:116:b0:2cd:5be1:3838 with SMTP id
 u22-20020a05622a011600b002cd5be13838mr1054529qtw.494.1644994936320; Tue, 15
 Feb 2022 23:02:16 -0800 (PST)
MIME-Version: 1.0
References: <20220214094231.3753686-1-clg@kaod.org>
 <20220214094231.3753686-11-clg@kaod.org>
In-Reply-To: <20220214094231.3753686-11-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Feb 2022 07:02:04 +0000
Message-ID: <CACPK8XdvczyZ1QHtFm7JJAC7AY+QmWSx0MarUwLjUyOtC9DnSQ@mail.gmail.com>
Subject: Re: [PATCH 10/10] spi: aspeed: Activate new spi-mem driver
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: linux-spi@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>, 
 Mark Brown <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, 
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_230217_870427_2868E5F6 
X-CRM114-Status: GOOD (  18.77  )
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

T24gTW9uLCAxNCBGZWIgMjAyMiBhdCAwOTo0MywgQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9k
Lm9yZz4gd3JvdGU6Cj4KPiBUaGUgcHJldmlvdXMgZHJpdmVyIHVzaW5nIHRoZSBNVEQgU1BJIE5P
UiBpbnRlcmZhY2UgaXMga2VwdCBpbiBjYXNlIHdlCj4gZmluZCBzb21lIGlzc3VlcyBidXQgd2Ug
c2hvdWxkIHJlbW92ZSBpdCBxdWlja2x5IG9uY2UgdGhlIG5ldyBkcml2ZXIKPiB1c2luZyB0aGUg
c3BpLW1lbSBpbnRlcmZhY2UgaGFzIGJlZW4gc3VmZmljaWVudGx5IGV4cG9zZWQuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgoKSSBzdWdnZXN0IHdl
IGRyb3AgdGhlIGRlZmNvbmZpZyBjaGFuZ2VzIGZyb20gYm90aCB0aGlzIHBhdGNoIGFuZCB0aGUK
Zmlyc3QuIFRoaXMgd2F5IHdlJ2xsIGFsd2F5cyBoYXZlIHRoZSBuZXcgZHJpdmVyIGJlaW5nIGJ1
aWx0LCB3aXRoCmxlc3MgY2h1cm4uCgpJZiB5b3Ugc3Ryb25nbHkgcHJlZmVyIHRoZSB3YXkgeW91
J3ZlIGRvbmUgaXQgdGhlbiB0aGF0J3MgZmluZSB0b28uCgo+IC0tLQo+ICBhcmNoL2FybS9jb25m
aWdzL2FzcGVlZF9nNF9kZWZjb25maWcgfCAyICstCj4gIGFyY2gvYXJtL2NvbmZpZ3MvYXNwZWVk
X2c1X2RlZmNvbmZpZyB8IDIgKy0KPiAgYXJjaC9hcm0vY29uZmlncy9tdWx0aV92NV9kZWZjb25m
aWcgIHwgMiArLQo+ICBhcmNoL2FybS9jb25maWdzL211bHRpX3Y3X2RlZmNvbmZpZyAgfCAyICst
Cj4gIDQgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2NvbmZpZ3MvYXNwZWVkX2c0X2RlZmNvbmZpZyBiL2FyY2gv
YXJtL2NvbmZpZ3MvYXNwZWVkX2c0X2RlZmNvbmZpZwo+IGluZGV4IDk2NDUzNjQ0NGNkNy4uYjRh
MWIyZWQxYTE3IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2NvbmZpZ3MvYXNwZWVkX2c0X2RlZmNv
bmZpZwo+ICsrKyBiL2FyY2gvYXJtL2NvbmZpZ3MvYXNwZWVkX2c0X2RlZmNvbmZpZwo+IEBAIC02
NCw3ICs2NCw3IEBAIENPTkZJR19NVERfQkxPQ0s9eQo+ICBDT05GSUdfTVREX1BBUlRJVElPTkVE
X01BU1RFUj15Cj4gIENPTkZJR19NVERfU1BJX05PUj15Cj4gICMgQ09ORklHX01URF9TUElfTk9S
X1VTRV80S19TRUNUT1JTIGlzIG5vdCBzZXQKPiAtQ09ORklHX1NQSV9BU1BFRURfU01DX01URF9T
UElfTk9SPXkKPiArQ09ORklHX1NQSV9BU1BFRURfU01DPXkKPiAgQ09ORklHX01URF9VQkk9eQo+
ICBDT05GSUdfTVREX1VCSV9GQVNUTUFQPXkKPiAgQ09ORklHX01URF9VQklfQkxPQ0s9eQo+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybS9jb25maWdzL2FzcGVlZF9nNV9kZWZjb25maWcgYi9hcmNoL2Fy
bS9jb25maWdzL2FzcGVlZF9nNV9kZWZjb25maWcKPiBpbmRleCBlODA5MjM2Y2E4OGIuLmNjYzQy
NDBlZTRiNSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9jb25maWdzL2FzcGVlZF9nNV9kZWZjb25m
aWcKPiArKysgYi9hcmNoL2FybS9jb25maWdzL2FzcGVlZF9nNV9kZWZjb25maWcKPiBAQCAtMTAz
LDcgKzEwMyw3IEBAIENPTkZJR19NVERfQkxPQ0s9eQo+ICBDT05GSUdfTVREX1BBUlRJVElPTkVE
X01BU1RFUj15Cj4gIENPTkZJR19NVERfU1BJX05PUj15Cj4gICMgQ09ORklHX01URF9TUElfTk9S
X1VTRV80S19TRUNUT1JTIGlzIG5vdCBzZXQKPiAtQ09ORklHX1NQSV9BU1BFRURfU01DX01URF9T
UElfTk9SPXkKPiArQ09ORklHX1NQSV9BU1BFRURfU01DPXkKPiAgQ09ORklHX01URF9VQkk9eQo+
ICBDT05GSUdfTVREX1VCSV9GQVNUTUFQPXkKPiAgQ09ORklHX01URF9VQklfQkxPQ0s9eQo+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybS9jb25maWdzL211bHRpX3Y1X2RlZmNvbmZpZyBiL2FyY2gvYXJt
L2NvbmZpZ3MvbXVsdGlfdjVfZGVmY29uZmlnCj4gaW5kZXggNDkwODNlZjA1ZmIwLi44MGEzYWUw
MmQ3NTkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vY29uZmlncy9tdWx0aV92NV9kZWZjb25maWcK
PiArKysgYi9hcmNoL2FybS9jb25maWdzL211bHRpX3Y1X2RlZmNvbmZpZwo+IEBAIC0xMDMsNyAr
MTAzLDcgQEAgQ09ORklHX01URF9SQVdfTkFORD15Cj4gIENPTkZJR19NVERfTkFORF9BVE1FTD15
Cj4gIENPTkZJR19NVERfTkFORF9PUklPTj15Cj4gIENPTkZJR19NVERfU1BJX05PUj15Cj4gLUNP
TkZJR19TUElfQVNQRUVEX1NNQ19NVERfU1BJX05PUj15Cj4gK0NPTkZJR19TUElfQVNQRUVEX1NN
Qz15Cj4gIENPTkZJR19NVERfVUJJPXkKPiAgQ09ORklHX0JMS19ERVZfTE9PUD15Cj4gIENPTkZJ
R19BVE1FTF9TU0M9bQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9jb25maWdzL211bHRpX3Y3X2Rl
ZmNvbmZpZyBiL2FyY2gvYXJtL2NvbmZpZ3MvbXVsdGlfdjdfZGVmY29uZmlnCj4gaW5kZXggZmMx
YjY5MjU2YjY0Li4zMzU3Mjk5OGRiYmUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vY29uZmlncy9t
dWx0aV92N19kZWZjb25maWcKPiArKysgYi9hcmNoL2FybS9jb25maWdzL211bHRpX3Y3X2RlZmNv
bmZpZwo+IEBAIC0yMTcsNyArMjE3LDcgQEAgQ09ORklHX01URF9OQU5EX0RBVklOQ0k9eQo+ICBD
T05GSUdfTVREX05BTkRfU1RNMzJfRk1DMj15Cj4gIENPTkZJR19NVERfTkFORF9QTDM1WD15Cj4g
IENPTkZJR19NVERfU1BJX05PUj15Cj4gLUNPTkZJR19TUElfQVNQRUVEX1NNQ19NVERfU1BJX05P
Uj1tCj4gK0NPTkZJR19TUElfQVNQRUVEX1NNQz1tCj4gIENPTkZJR19NVERfVUJJPXkKPiAgQ09O
RklHX0JMS19ERVZfTE9PUD15Cj4gIENPTkZJR19CTEtfREVWX1JBTT15Cj4gLS0KPiAyLjM0LjEK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
