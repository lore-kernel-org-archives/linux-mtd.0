Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B91FE65D25
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Nov 2024 05:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gb1aKFt8qCz3blLSjAWFEXxv1+2T1pxn3Nv2ckVMQqE=; b=xDvKbvYqfUjOty
	ILBE/emr8kcmyt+wKaeWII0cKlvCzlOV1wjEfp40xpY+A7F8gVDpP8uyPeeFN2qTmnyWxMxfhOwgb
	QoSkar+yzgAo/XMqxIDtua4UqgDZSWR/iN3PdjipxNqW5PYlHdcuSOM8JmALZtyLygSFEf4JmFh+e
	Z2BAbp/Nw/0FVPESrhmXbpjNeyT0yamD1RsemVRXKCzeeEyTPR6R/hW1C0XR+4JBAsOwQLu6anKBx
	6AeAbzOQWRQew+stWohX42l+waIaw6BWgH2gzck/O7Jub1dNIa/ibc7SkEJ2xif7fc69gNWicUIk4
	xtLPOcRmA43m1h8yYwlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEMTK-00000001gN4-2nTv;
	Fri, 22 Nov 2024 05:44:50 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEMTH-00000001gMh-1JBA
	for linux-mtd@lists.infradead.org;
	Fri, 22 Nov 2024 05:44:48 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2ea499f264fso1248961a91.1
        for <linux-mtd@lists.infradead.org>; Thu, 21 Nov 2024 21:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732254286; x=1732859086; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gub5T2Df8Jz73HK7wvhBgYTBp/GDEpEZ06A04qe1jqg=;
        b=FXz+/Mc8WdVDXruN206MZEaj9tVZ+ojKK9f3OFUxt8vixMHH5XRE4sZ8r2OgPn97GG
         trHn9jgXVLpyyW1Ep/Dabzgiyt/oxh3zcUo4V8EOVE3iqjZqDdGF1ko7zShohQ4NrbTa
         KsTItx5BXGNh4TsSZCaDMZKKLZ/me+E8S7B3ENtWbQT0ynvsZw9FpHOVPnUlb28U1pyW
         e4GOy9mG8Bh7j9pi169ZFjU+AjKbTv7pSwAo+4U9wzxBWb9zO3YwSFcNlweBFfQpzXny
         4vGA7+aksxiMnrJCjRFVCgcHp6VhibPSiknzQo9uygGLPUOLSLsizQ4KYKF0ViuBDA6K
         RgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732254286; x=1732859086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gub5T2Df8Jz73HK7wvhBgYTBp/GDEpEZ06A04qe1jqg=;
        b=UdmiB4FENn+zgrJAm+A52dKu8FEhynrfK0WrHhEyVonKHJ3rEJPMFE428OdqJScuEj
         gxieWr4YTslJyivHDetIyoYbu45H2uYmGV8dMYYMVWlxm4rbi1+ppk2wXgBAuGq20zMF
         zWwBwI0h27mpT9Kqxv1IyUHE80s6xMoLYdrRjH/2aZFAfRrOyvRyAUisZxrFzQqcT7Qo
         shIVV4Dprk6mlNDlxDoSE2o1Q+nE+06zEYQCEUxcUz6NiL2wQCXQY4GxZV91MkQCmLsR
         3HYMnjv2o2zYY3mRR5EINGJH0ZFC+pRgoF8n0wfLIApr//itHUnHoP3IK5KaNWJ3lg8Z
         GLtg==
X-Forwarded-Encrypted: i=1; AJvYcCWiqYeZ5kXxXf+pTZEca25+vNmNUfvkr0idp2z2gDGd7xtzNMWi6DKpI9b28CLv02JwMxBmTr9fHEM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwH51Ux4G+2ZcVQ/1nl8y0GJn8/NJpb28+Y2SQOpPf5HxJsVEuk
	Odwf2Y/5Ux1L+P+6PkTeoKvNx2OdJF+8Q00Km87pbDgMNrnxsNlrxnrscA7opuuoUxrBd2bXBno
	Mnhj7yaFg5CqhYMaMLD4Df4brDXg=
X-Gm-Gg: ASbGnctsSoGgJ0mC8GXHbZTJ2wJVklxxvTW+kjxWuv9uXUb+b4VYUDnMnO2jHrfQ5Sr
	3WHoXaZsNf/SpWnmXSahEWpbUUWM5L04=
X-Google-Smtp-Source: AGHT+IEi3BM1B7tXNp8c3gLvKjDnthIxWhH9+DjzuchJxWnz7JATjUyFqjUmeNr8DreiO/n+QR7VjOlV8fejYPo8B/8=
X-Received: by 2002:a17:90b:1b49:b0:2eb:140d:f6c5 with SMTP id
 98e67ed59e1d1-2eb140dfdfcmr1588370a91.4.1732254286078; Thu, 21 Nov 2024
 21:44:46 -0800 (PST)
MIME-Version: 1.0
References: <20241114023528.181583-1-linchengming884@gmail.com>
 <20241114023528.181583-3-linchengming884@gmail.com> <87serozv8y.fsf@bootlin.com>
In-Reply-To: <87serozv8y.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Fri, 22 Nov 2024 13:42:24 +0800
Message-ID: <CAAyq3SZTiOabjw1E61nu2AX+zJgWxvgijrgamH9ESEPekZ+43w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mtd: spi-nand: macronix: Add support for read retry
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_214447_351235_66A6718A 
X-CRM114-Status: GOOD (  12.16  )
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

SGkgTWlxdWVsLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8
IDIwMjTlubQxMeaciDE45pelIOmAseS4gCDkuIvljYg2OjMz5a+r6YGT77yaCj4KPiBPbiAxNC8x
MS8yMDI0IGF0IDEwOjM1OjI4ICswOCwgQ2hlbmcgTWluZyBMaW4gPGxpbmNoZW5nbWluZzg4NEBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBGcm9tOiBDaGVuZyBNaW5nIExpbiA8Y2hlbmdtaW5nbGlu
QG14aWMuY29tLnR3Pgo+ID4KPiA+IEFkZCBmdW5jdGlvbiBmb3Igc3VwcG9ydGluZyByZWFkIHJl
dHJ5Ogo+Cj4gQWRkIHJlYWQgcmV0cnkgc3VwcG9ydC4KPgo+ID4gLSBTZXQgZmVhdHVyZSBvbiBT
cGVjaWFsIFJlYWQgZm9yIERhdGEgUmVjb3ZlcnkgcmVnaXN0ZXIuCj4KPiBJIGFtIHNvcnJ5IHRo
aXMgc2VudGVuY2UgaXMgdW5jbGVhci4gUGx1cyB0aGVyZSBpcyBvbmx5IGEgc2luZ2xlICctJwo+
IHdoaWNoIGlzIHN0cmFuZ2UgZm9yIGEgbGlzdC4KPgoKU29ycnkgYWJvdXQgdGhpcy4gSSdsbCBy
ZXZpc2UgaXQgdG8gbWFrZSB0aGUgY2hhbmdlIGxvZyBjbGVhcmVyLgoKPiA+Cj4gPiBUaGUgU3Bl
Y2lhbCBSZWFkIGZvciBEYXRhIFJlY292ZXJ5IG9wZXJhdGlvbiBpcyBlbmFibGVkIGJ5Cj4gPiBT
ZXQgRmVhdHVyZSBmdW5jdGlvbi4KPiA+Cj4gPiBUaGVyZSBhcmUgNiBtb2RlcyBmb3IgdGhlIHVz
ZXIgdG8gcmVjb3ZlciB0aGUgbG9zdCBkYXRhLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IENoZW5n
IE1pbmcgTGluIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4KPiBUaGFua3MsCj4gTWlxdcOo
bAoKVGhhbmtzLApDaGVuZyBNaW5nIExpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
