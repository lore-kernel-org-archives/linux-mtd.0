Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D05C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Feb 2022 12:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8OZ0TNHBZF0+wSwMrzZNJQnniDH38JQW0J0QcKJXscU=; b=pQS1QE5xIXjf1N
	GbaUpuNzhHOj4XPiOFkASdL9/uW0ISZMGthOmvFeYq1Q+/E7sXmrSFt3KVuY1BBGLo7p9wNfT7GZu
	CpoCGq97tXNogm9uChRAtZsRNp1C2IAQS7o6thZ7ZAIbIKeUryETSIo74yg6MoCMT9SMrZ/FnGO3m
	iXSGQO4OcpTmiLus9IJdqz9Mvvaa+R/UKsrxd4SlUMUtf6Gpc8TnjLLl1iWarbqZHzpeMk2AFYLDB
	eO3BvQBk+4zptz8ndaslvu1vOVKbqlXOkfB0GdCDR07nKtJzZXmbXK/S1YWcwWlZ4emu+jMJYw68u
	duO/vHWWMxVkxsbL0wcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJaD5-00F3a9-Dc; Mon, 14 Feb 2022 12:12:04 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJZN3-00ElIE-Br
 for linux-mtd@lists.infradead.org; Mon, 14 Feb 2022 11:18:19 +0000
Received: by mail-lf1-x12c.google.com with SMTP id z14so8744460lfu.5
 for <linux-mtd@lists.infradead.org>; Mon, 14 Feb 2022 03:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kempniu.pl; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7lnMhtpi0tedfFeaMFYKaQ71qw/HvwjAz4fhdXBH9Yc=;
 b=GmIVfeBVHFoj2YipuxdPvmcHpJKJ5UqQJdD8lrN7iLIxX7C/Jk27HNQtBZbsbnUpp7
 3Fya2xulzvXorMJOya4wQofhyNaVxz8NZJvqvScB0HfqNzq3NQebWapLsmZuVldqY0XD
 HMvdfGibYpIpl/3bXD88L9k+BTSpX8EYbvS1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7lnMhtpi0tedfFeaMFYKaQ71qw/HvwjAz4fhdXBH9Yc=;
 b=ef9imN/LcjoVwCo6aWi7WKtDHKkG418rY+E5LDdSgyrw1FOCiJLGvEc3cteu0ugr+/
 W5xoRhpyoZT9mXEughqvCwg+upcAO3KXX569yE/Oa20bkk3A9wSBWOCRUPNnlKTQURZb
 NSfSV+VPgywlfWQGQEhW5rZ+P3uXq5GTkYU6oPDd1AeeCv5jPC1GidAThQznT3aUHvY5
 nyNcUhmEoFzB7D+OTPyW3/0hssoEIBDwNdtMuL3w0NaZW7GEkCu4Abp/9XO6f/t9K2nE
 xdoe2PF0hghvJxyFPmyqjAvHNDKNz3T+zFERaPYiWRUzIb2IYif2s3tQOFWLkzp/QE+p
 Gjag==
X-Gm-Message-State: AOAM532+/8vgfNTfYjnK4k6t+uhotGlHiAMVLDhQ2UfYRt3dtx0cPt1V
 La11DKmw5UCimqmAlMVKeCHnzg==
X-Google-Smtp-Source: ABdhPJzSDp0H18d5H8r0FNVwaPQJ2g+FcKDiACv/T0F5hHOqnzy5wXWf2xbE3lV0tdzzKb+18LuMYw==
X-Received: by 2002:a19:385a:: with SMTP id d26mr10711937lfj.220.1644837495267; 
 Mon, 14 Feb 2022 03:18:15 -0800 (PST)
Received: from larwa.hq.kempniu.pl ([2001:470:64df:111::e02])
 by smtp.gmail.com with ESMTPSA id o17sm527233lfr.240.2022.02.14.03.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 03:18:14 -0800 (PST)
Date: Mon, 14 Feb 2022 12:18:12 +0100
From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
To: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] mtdchar: add MEMREAD ioctl
Message-ID: <Ygo6dNsVn1Y6c3PJ@larwa.hq.kempniu.pl>
References: <20220125104822.8420-1-kernel@kempniu.pl>
 <20220125104822.8420-5-kernel@kempniu.pl>
 <1173246756.12597.1643879936765.JavaMail.zimbra@nod.at>
 <20220203104654.6cb43ea3@xps13>
 <340602071.12640.1643883222200.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <340602071.12640.1643883222200.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_031817_481921_402A2E67 
X-CRM114-Status: GOOD (  15.56  )
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

PiA+PiBJZiBtdGQtPmVyYXNlc2l6ZSBpcyBsYXJnZSAod2hpY2ggaXMgbm90IHVuY29tbW9uIHRo
ZXNlIGRheXMpIHlvdSBtaWdodAo+ID4+IHJlcXVlc3QgbW9yZSBmcm9tIGttYWxsb2MoKSB0aGFu
IGl0IGNhbiBzZXJ2ZS4KPiA+PiBNYXliZSBrdm1hbGxvYygpIG1ha2VzIG1vcmUgc2Vuc2U/Cj4g
PiAKPiA+IE1tbWgsIEkgd291bGQgcmVhbGx5IGxpa2UgdGhlc2UgYnVmZmVycyBkbWEtYWJsZS4K
PiA+IAo+ID4gSSBqdXN0IGRpc2NvdmVyZWQgbXRkX2ttYWxsb2NfdXBfdG8oKS4gV291bGQgdGhp
cyB3b3JrPwo+IAo+IG10ZF9rbWFsbG9jX3VwX3RvKCkgbWFrZXMgc2Vuc2UgdG8gYmUgbW9yZSBm
cmllbmRseSB0byB0aGUgc3lzdGVtLgo+IEl0IHRyaWVzIHRvIGdldCBtZW1vcnkgd2l0aG91dCBm
b3JjaW5nIHdyaXRlLWJhY2sgYW5kIHN1Y2guCj4gQnV0IGlmIHdlJ3JlIG91dCBvZiBjb250aW51
b3VzIG1lbW9yeSBpdCB3b24ndCBoZWxwIG11Y2guIAo+IAo+IFJlZ2FyZGluZyBkbWEtYWJsZSwg
YXMgc29vbiB5b3UgdXNlIHNvbWV0aGluZyBsaWtlIFVCSS9VQklGUyBvbnRvcCBvZiBpdAo+IHRo
ZSBtdGQgZHJpdmVyIGhhcyB0byBiZSBhYmxlIHRvIGRlYWwgaW4gYW55IHdheSB3aXRoIHZtYWxs
b2MoKSdlZCBtZW1vcnkuCgpOb3RlIHRoYXQgdGhlIE1FTVdSSVRFIGlvY3RsIGlzIGFmZmVjdGVk
IGJ5IHRoZSBzYW1lIGlzc3VlLiAgSnVkZ2luZwpmcm9tIHRoZSBkaXNjdXNzaW9uIGFib3ZlLCBJ
IGFzc3VtZSBhIHNlcGFyYXRlIHBhdGNoIGlzIGluIG9yZGVyIHRvIHR1cm4Ka21hbGxvYygpIGNh
bGxzIGluIG10ZGNoYXJfd3JpdGVfaW9jdGwoKSBpbnRvIGt2bWFsbG9jKCkgY2FsbHM/Cgo+IEFu
b3RoZXIgb3B0aW9uIHdvdWxkIGJlIG5vdCB3b3JraW5nIG9uIGZ1bGwgZXJhc2UgYmxvY2tzLgoK
UmlnaHQsIHRoZSBhcHByb2FjaCBwcm9wb3NlZCBpbiB0aGlzIHBhdGNoIHNlcmllcyBhbmQgYWxz
byBwcmV2aW91c2x5IGluCmNvbW1pdCBmNjU2MmJjYTg0ZDIyNTI1Zjc5MjMwNWUzMTA2NTcxZjg3
MTRkMDU3ICgibXRkY2hhcjogcHJldmVudAp1bmJvdW5kZWQgYWxsb2NhdGlvbiBpbiBNRU1XUklU
RSBpb2N0bCIpIGlzIGEgdHJhZGUtb2ZmLiAgSSBmb2xsb3dlZCBhCnN1Z2dlc3Rpb24gSSBoZWFy
ZCBlYXJsaWVyOgoKaHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1t
dGQvMjAyMS1TZXB0ZW1iZXIvMDg4NDg1Lmh0bWwKCi0tIApCZXN0IHJlZ2FyZHMsCk1pY2hhxYIg
S8SZcGllxYQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
