Return-Path: <SRS0=YHiu=MV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C01AC4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jul 2021 12:04:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F312C60231
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jul 2021 12:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F312C60231
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zQzQwss6d0nHnDzmN12ipamaxlVyWf8EzXU87qgUD7g=; b=BiBoARi8eQ/nwo
	H/JqVoKWV3YsumsfgHM7dYxu3rvWpYaMI3aD8H+tXpH+mpBoxvd8ZRDV5GtnpZ6F1HTShivSIP7g/
	co7BwFD47tEiLTkhjCID8Lo6RqCjfybgWNw+zDredusmIGa9AJLX5TWVnl1QnaCf+/br5qBr/VJtP
	uqAyKYIGv0CEbh/k8MZB+EicAN0Xo7zOYLvh/qMUQLMu8AsLv5nCOSI5uEHtX2toSYXZcXrIRRQXn
	W+U/728X2aFAqvwhfpznbeUhH76rNcjYobHPBMCD6mfi5dbn4Oiul79xfCuRXeEEI0oqnaH0jPXW6
	7c75b5aQvG9o+nZ1MU/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m94lM-0043YY-05; Thu, 29 Jul 2021 12:03:44 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m94lJ-0043Wd-2O
 for linux-mtd@lists.infradead.org; Thu, 29 Jul 2021 12:03:42 +0000
Received: by mail-ed1-x534.google.com with SMTP id b7so7886989edu.3
 for <linux-mtd@lists.infradead.org>; Thu, 29 Jul 2021 05:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5PqNao+LvVur5nM0wboYYWnzsoVPqlHC4aLEUSYkRe8=;
 b=02vV/yQEakIkTyXZD9abAeEHvCDnuoT3A1ic1/OunC54FJGKkJBv1H4fRFMBQfMVAu
 XOWD5tkW64NqSq7N3sE4eO/bLCm6C1zfEEU41QavjbGTWmXdRXmw2jJlTTDgYoIx6gRC
 Ox3IUbvriQygZZGNbsph59saddP5WR38z1DwF2MspP5WeDgoT/etD7cnTvKA/lbGcM9U
 g5wMzPlxtgqYoJPoteQwQOlqHmvFgkFRqWNPWc538vHyeSpwxuCIKPCX4/A6P00o7q4D
 UEazoOYyFYjOuOcR2DG+i7Q5enWsikDluSgPSe728mrbExGIZYzw9XZMwSwh5V/qL8Iw
 xNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5PqNao+LvVur5nM0wboYYWnzsoVPqlHC4aLEUSYkRe8=;
 b=s3rcjCLuluklRDDnqnIITpZ0IpXgRMPg/Ifs1ywBatDLC0QFyyvM71/ug+GBlLBVB1
 SO2b7yuqgLUBpEttDd6VCSQ9JaObXKuORMo8dOfH6VI1NxmJ4Isnke6a8qWwR5caDfPR
 TxkXN7vyls8B6HCW9HREizQILhHsa13EjJf8tApiNWWS95aUFJMDOARBw7IeuHcL1D1u
 7GZXREloYQlvbf0Lcad2cwioByOPXv3Cc/aq7LuI5+N0X+MP174jwyk1sg9GVXaNBmqQ
 PY+T8nG9V9pF0rVcu/bfkZzAtwHdPpWLe6yYG000zJIPQCuXvYJzUsANNm6uqdUtKch7
 mhNA==
X-Gm-Message-State: AOAM530R6aYP52sdU2vh/Jnjcv+bP7PqKM1eL2VU1bRG8Uve/Z6aRe3j
 TWDK2PJUfOacPCplR1AuPq53pWTMzosYXpBEt0EJOw==
X-Google-Smtp-Source: ABdhPJymcivsFGziq0SihV2i9nQXby5NtNXxaA1zhexuwQiwuYRDZBTYJQxO3n4NHJjRLJ2SOyCIu3Zhu+e9V+8nE7I=
X-Received: by 2002:a05:6402:4c5:: with SMTP id
 n5mr5580197edw.322.1627560217516; 
 Thu, 29 Jul 2021 05:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLjzyG_2wGDYmwgeoQuuQ7cykJ11THf8jMrOFXZ7vXheJQ@mail.gmail.com>
 <CAOuPNLh_KY4NaVWSEV2JPp8fx0iy8E1MU8GHT-w7-hMXrvSaeA@mail.gmail.com>
 <1556211076.48404.1626763215205.JavaMail.zimbra@nod.at>
 <CAOuPNLhti3tocN-_D7Q0QaAx5acHpb3AQyWaUKgQPNW3XWu58g@mail.gmail.com>
 <2132615832.4458.1626900868118.JavaMail.zimbra@nod.at>
 <CAOuPNLhCMT7QTF+QadJyGDFNshH9VjEAzWStRpe8itw7HXve=A@mail.gmail.com>
 <CAFLxGvywv29u6DJZrJxnJJmUDSQ4xpbT0u5LNKY1uGKyQom+WA@mail.gmail.com>
 <CAAEAJfCY+X-G=7Oe9NqrJ4yQZ29DBA78jOFAX44GD0g6=s7qhg@mail.gmail.com>
 <1668790824.35266.1627559144878.JavaMail.zimbra@nod.at>
In-Reply-To: <1668790824.35266.1627559144878.JavaMail.zimbra@nod.at>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 29 Jul 2021 09:03:26 -0300
Message-ID: <CAAEAJfDDtGcUquyP7Jn0Urttt4kSfAQbJ_qPQ90ROtWLavW9EA@mail.gmail.com>
Subject: Re: MTD: How to get actual image size from MTD partition
To: Richard Weinberger <richard@nod.at>
Cc: Pintu Agarwal <pintu.ping@gmail.com>,
 Kernelnewbies <kernelnewbies@kernelnewbies.org>, 
 Greg KH <greg@kroah.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, Sean Nyekjaer <sean@geanix.com>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_050341_157471_4C7E1F2B 
X-CRM114-Status: GOOD (  17.65  )
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

T24gVGh1LCAyOSBKdWwgMjAyMSBhdCAwODo0NSwgUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJk
QG5vZC5hdD4gd3JvdGU6Cj4KPiBFemVxdWllbCwKPgo+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1h
aWwgLS0tLS0KPiA+IFtzbmlwXQo+ID4KPiA+IE91Y2gsIHNvIHN1cnByaXNlZCB0aGF0IGFmdGVy
IGFsbCB0aGVzZSB5ZWFycyBzb21lb25lIGlzIGRvaW5nIHNxdWFzaGZzL210ZGJsb2NrCj4gPiBp
bnN0ZWFkIG9mIHVzaW5nIHViaWJsb2NrIDotKQo+ID4KPiA+IENhbiB3ZSBwYXRjaCBlaXRoZXIg
S2NvbmZpZyBvciBhZGQgc29tZSB3YXJuX29uY2Ugb24gbXRkYmxvY2sKPiA+IHVzYWdlLCBzdWdn
ZXN0aW5nIHRvIHVzZSB1YmlibG9jayBpbnN0ZWFkPwo+Cj4gYSBoaW50IGluIEtjb25maWcgbWFr
ZXMgSU1ITyBzZW5zZS4gRG8geW91IHdhbnQgdG8gc2VuZCBhIHBhdGNoPwo+IEEgd2FybmluZyBp
cyB0b28gbXVjaCBzaW5jZSBvbiBzb21lIHRpbnkgZW1iZWRkZWQgc3lzdGVtIHdpdGggTk9SIGZs
YXNoIG10ZGJsb2NrIGlzIHN0aWxsCj4gYSBnb29kIGNob2ljZS4KPiB1YmlibG9jayBpcyBtb3N0
bHkgdXNlZnVsIGZvciBOQU5EIGZsYXNoLgo+Cj4gPiBJIHJlbWVtYmVyIHRoZXJlIHdhcyBzdGls
bCBzb21lIHVzZSBjYXNlKHMpIGZvciBtdGRibG9jayBidXQgSSBjYW4ndCByZW1lbWJlcgo+ID4g
bm93IHdoYXQgd2FzIGl0LCBwZXJoYXBzIHdlIHNob3VsZCBkb2N1bWVudCB0aGUgZXhwZWN0YXRp
b25zPwo+ID4gKElzIHRoYXQgZm9yIEpGRlMyIHRvIG1vdW50PykKPgo+IGEgbG9uZyB0aW1lIGFn
byBtb3VudCBkaWRuJ3QgYWNjZXB0IGNoYXJhY3RlciBkZXZpY2VzLCBzbyB5b3UgaGFkIHRvIHBh
c3MgbXRkYmxvY2tYIHRvIG1vdW50Cj4gSkZGUzIuCj4gVGhpcyBsaW1pdGF0aW9uIGlzIGdvbmUu
Cj4KCk9LLCBsZXQgbWUgdHJ5IHRvIGNvb2sgYSBwYXRjaCBmb3IgeW91LgoKRXplCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
