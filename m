Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB40C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 13:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idev5C0PI+w9J3Jeyq6f46opczcfUBqrkAekWXzsq0E=; b=kuqfnvduQFJXOJ
	oN1JE2BjNqxULvhEeKfLDdkt9FsrosqVRIteIApn+u582dTx5KFjB1J4Q97N/1VbqZgY6bT05h/+x
	dKlYTGUmmRnjGT8+/NN5UPGVV7qDXKUpdEkMzWPhuDB7sa2yx6gFnJocb57qtDAGt7DPoreXH71Og
	XdzcW7UkjX6L6gxbpIV5sIgLBx6AoOC/iHGrLqB5VYHkqiejz3JLWuSB25x1ehJsnribKOAMrDmy3
	ZSmRzNCghQI+BsRwTFrgnS5o9gbaTUuNsCDRNlqTabduVLV7/zPemAmhWtRmiz61MtkfV/9X9Gv04
	Ty+GSm0O6mtfl/EK3Qyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxqtj-005ppN-8h; Thu, 16 Dec 2021 13:34:15 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxqZD-005g7I-Ro
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 13:13:06 +0000
Received: by mail-lf1-x131.google.com with SMTP id cf39so37479674lfb.8
 for <linux-mtd@lists.infradead.org>; Thu, 16 Dec 2021 05:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kempniu.pl; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=TTm8GDC4Ya1PnbACyYGyhr5iQAG0ULNVOO0jsio4rZA=;
 b=LRF3n/UsXcvgYxnMDNjPCEQyCZZNwivRd85ly2TdObMHNqqGTns7dbzWyPwzRBlQFb
 QCDk41nadEpWjrI4wp032SHMe3qQfQYdM054C8FnTb23Efy06FdaDulVp6BEKy2KVI22
 K6HE5/GPuxI0lDW3XWd6wpwayKpYsJmaSb3Xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TTm8GDC4Ya1PnbACyYGyhr5iQAG0ULNVOO0jsio4rZA=;
 b=n/NsKnGhSZbklTyvxLrfZAtnhi+7w1GGlKzTz/pBCWTdSfzVKDBkuIHscMVrFQt9B3
 MWSFldHm2WXyvuX2Gc1ElCG2Ec2/jMNZRVbv7EfzaisjJOAalfbc5a6zp+6GgefFNV2w
 I5TTegUxmTHYJZNtLHMp37S7SPmyvovHuA6lzPTXeS0asBekpLOf3z3EbgIi0pUWPh1T
 VzCF7jppICLydRjs1niHuuDezblxMuOoLtEA8qs+I/VsyfBitLW4pn6n8hxnuM9FDjDa
 8/D4BAsIACdIrZK0cpoej3opmL0uV1tyIFCDZd8MOh/vAJ+zILd75N3uNVSTLAUlKhrF
 jrgw==
X-Gm-Message-State: AOAM533oS6DXE1f2Pfw7FuzepFmwpyX+nmOsFuugIT7s7mjs18EkQNJz
 LiCm2cWPmS/+5GW9Ph1naRn1NA==
X-Google-Smtp-Source: ABdhPJy+TNijK7bNcSDi7if8DIwmcY9LfrlMb+6eVRT6hbFkqwSfWgTNIO6c7CeMuqkWfbTvfrFt1A==
X-Received: by 2002:a05:6512:ba8:: with SMTP id
 b40mr14989002lfv.114.1639660381435; 
 Thu, 16 Dec 2021 05:13:01 -0800 (PST)
Received: from larwa.hq.kempniu.pl ([2001:470:64df:111::e02])
 by smtp.gmail.com with ESMTPSA id z23sm1125746ljn.23.2021.12.16.05.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:13:01 -0800 (PST)
Date: Thu, 16 Dec 2021 14:12:58 +0100
From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] mtdchar: add MEMREAD ioctl
Message-ID: <Ybs7WrAQTat5Gsjg@larwa.hq.kempniu.pl>
References: <20211216083418.13512-1-kernel@kempniu.pl>
 <20211216112456.327298dd@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211216112456.327298dd@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_051304_026670_5C2A3783 
X-CRM114-Status: GOOD (  10.23  )
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

PiBTcGxpdHRpbmcgcGF0Y2ggMSBhbmQgNSBtZWFucyB5b3UgaGF2ZSBhbiBpbmNvbXBhdGlibGUg
QUJJIGNoYW5nZQo+IGJldHdlZW4gdGhvc2UgMiBjb21taXRzLCB0aHVzIGJyZWFraW5nIGJpc2Vj
dGFiaWxpdHkuIEknZCByZWNvbW1lbmQKPiBwdXR0aW5nIHBhdGNoZXMgMi00IGZpcnN0IGFuZCBz
cXVhc2hpbmcgcGF0Y2ggMSBhbmQgNSBpbiBhIHNpbmdsZQo+IGNvbW1pdCBwbGFjZWQgYXQgdGhl
IGVuZCBvZiB0aGUgc2VyaWVzLiBUaGUgb3RoZXIgb3B0aW9ucyB3b3VsZCBiZSB0bwo+IGFkZCBh
IHdheSB0byBleHRlbmQgaW9jdGxzIGluIGEgYmFja3dhcmQgY29tcGF0aWJsZSB3YXkgKHRoZSBE
Uk0KPiBzdWJzeXN0ZW0gZG9lcyB0aGF0IGJ5IGZpbGxpbmcgdGhlIHVuc3BlY2lmaWVkIHBhcnQg
b2YgdGhlIHN0cnVjdCB3aXRoCj4gemVyb3MsIGFuZCByZWx5aW5nIG9uIHRoZSBmYWN0IHRoYXQg
MCB2YWx1ZXMgYWx3YXlzIGltcGxpZXMgJ2RlZmF1bHQKPiBiZWhhdmlvcicgd2hlbiB0aGUgc3Ry
dWN0IGlzIGV4dGVuZGVkIFsxXSkuCgpBY2ssIHRoYW5rcy4gIEkgd2lsbCBmb2xsb3cgeW91ciBy
ZWNvbW1lbmRhdGlvbiBpbiB2MyBhbmQgaW4gdGhlCm1lYW50aW1lIHRoZSBleGlzdGluZyBzcGxp
dCBzaG91bGQgbWFrZSBpdCBlYXNpZXIgdG8gZm9sbG93IGhvdyB2MgpleHRlbmRzIHYxIHdpdGgg
RUNDIHN0YXRpc3RpY3MgaGFuZGxpbmcuCgotLSAKQmVzdCByZWdhcmRzLApNaWNoYcWCIEvEmXBp
ZcWECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
