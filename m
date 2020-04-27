Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0873C54FCB
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 15:39:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62D9620656
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 15:39:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AJHi2jII";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iclky+Go"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62D9620656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z/4PsUNnqn163CwvB3NlLhLTuWduwMhk4PQ85L/iZZQ=; b=AJHi2jIIs+zW80
	MG7YbWktUs2f9QNEbdYWvYawfCyHffUecEo1TQ2B8+lw8wDAwDHbLrZbQwh/bw/ENe7mQdMpzMPeE
	tVwbnKVEYG/ydEGUeg4BZa3TPozC9C5InsOlNQ6EhubVe0Up8mpMCA7ugEOlSiulTaRGRZs5uwG/x
	ajhcMz9azrUuKq9u/pmz7CyexsCfZw6DD1V7xKhxagb1hKgI6IkRhdSinuMyiev3QQZOc6Ye8vDfx
	CzQNgMy19JvxaBwZuAVDgQDIxfdqKvDd6TX1OvgRawP+fmkzkYmyyR4Li4EUL2LKE7M+As5o2bgJg
	C75DcH3P55mJTP8E7kOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT5qM-00019a-1e; Mon, 27 Apr 2020 15:38:50 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT5qI-00018S-KF
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 15:38:47 +0000
Received: by mail-io1-xd2d.google.com with SMTP id z2so19278048iol.11
 for <linux-mtd@lists.infradead.org>; Mon, 27 Apr 2020 08:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iTidgto46X3PBcLh/NZ3p3EEGIHyStvrrt3xBRoiKAg=;
 b=iclky+Goj+8nLqDIQ9Ej9kG/1gbh8zknNJ9GmTUliHSJgJ5stv396dgtpB+rMqC4zZ
 OJfs7amekuelbG/oMXztZT8Jl6YV6bWv+mrJhxijOTC9XjkyjtUG6tsZ6jNrrAZnzUyL
 kDZUtOqhR8D/Mmk8lgh8NT/SIzQAXbeTjoivRgkBvquFc9wLYLShf8hjK+xoY0zXQppB
 AryBNHQYJQrkFZw7tjNeXM2axUnxnbWiynSNZD32Rerl7FAyQWShoVYUEITchlW797t8
 BKb+6Mx4czi/BhJZ9+jnreBdBys0CUobKXhPasjgVZU46bC53QaabmEX06VkKfPk5M4q
 NB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iTidgto46X3PBcLh/NZ3p3EEGIHyStvrrt3xBRoiKAg=;
 b=Yor5QMTyohxkigxMHMkzs5OmcXlTMbfR2ac6uZ4QRTh4x/Ng5Fmq+A0GLUPFXrWEjm
 SOdB/YayDnpy7Pl4kmsEnZ7MeYCEKEA/a0wIdrhLHSuj07ucakPNjTzd/E0tsFm3WPxR
 NoCf2KGXvFAmcSqkdv5ovj9Bsxup6gT2T7/aJ1a5A/YS1j6e7uYRAbkcbnlz21Xwr3i3
 qE9PtIfjzRp4SHg9pVA/wjv8vLH8glm9QgXzxP7PI88M455Mkh0SyjQw5mQowClDKD5g
 lUFxSpYdudTQviZMdds0Rw/WQ+uJa7uG4Jw+cxrgXLnxIAIwnlZ8plFW6HrIuPIh7r0f
 8QLw==
X-Gm-Message-State: AGi0PuYdm7m6+TTj1Ab5EcpCI+nJ70UAVYP0/Ke++C6kRlKO9rQinrVX
 xxZud0vKuUwakoh/leS5GbkOp9sjAyVGfj0oBZI=
X-Google-Smtp-Source: APiQypK2OeOQ1R0yIPyYwvW+TSu4zZdULykTH/FcCZ3v/uXwLwvDPknpzq77avRB2FvKMNHPW7arFhiGUwk804z30mM=
X-Received: by 2002:a02:8666:: with SMTP id e93mr21477338jai.0.1588001925361; 
 Mon, 27 Apr 2020 08:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200417101129.35556-1-yuehaibing@huawei.com>
 <CAC=U0a2VfQBmHdS4eL0Fbm==aVCS0FWoBnZi7tRHzNKmm=SDVQ@mail.gmail.com>
 <20200427164336.5df4650a@xps13>
In-Reply-To: <20200427164336.5df4650a@xps13>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Mon, 27 Apr 2020 11:38:34 -0400
Message-ID: <CAC=U0a1zWmKFVJVfYLJOnwcB_voqFqWFZJCZxo78Zby=PbhAiA@mail.gmail.com>
Subject: Re: [PATCH -next] mtd: rawnand: brcmnand: Remove unused including
 <linux/version.h>
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_083846_661663_DBA8BF08 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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
Cc: "R, Vignesh" <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 YueHaibing <yuehaibing@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBBcHIgMjcsIDIwMjAgYXQgMTA6NDMgQU0gTWlxdWVsIFJheW5hbAo8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIaSBLYW1hbCwKPgo+IEthbWFsIERhc3UgPGtk
YXN1LmtkZXZAZ21haWwuY29tPiB3cm90ZSBvbiBGcmksIDE3IEFwciAyMDIwIDE0OjQwOjUxCj4g
LTA0MDA6Cj4KPiA+IE9uIEZyaSwgQXByIDE3LCAyMDIwIGF0IDY6MTIgQU0gWXVlSGFpYmluZyA8
eXVlaGFpYmluZ0BodWF3ZWkuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gUmVtb3ZlIGluY2x1ZGlu
ZyA8bGludXgvdmVyc2lvbi5oPiB0aGF0IGRvbid0IG5lZWQgaXQuCj4gPiA+Cj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4KPgo+IENhbiBJIHN1
cHBvc2UgeW91IG1lYW50ICJSZXZpZXdlZC1ieSIgPwo+CgpSZXZpZXdlZC1ieTogS2FtYWwgRGFz
dSA8a2Rhc3Uua2RldkBnbWFpbC5jb20+Cgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
