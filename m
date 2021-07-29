Return-Path: <SRS0=YHiu=MV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838BFC4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jul 2021 11:19:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D7C860F00
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jul 2021 11:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D7C860F00
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+QyzkPYhQGWgELOc/zeuagLS4qW3oluRVVYEkSxj5FM=; b=oHk2TCKYD5H6A9
	5OO5OHRX7ytUsGQt0Tc6oMkCoMwzFlISKjJOOmwPK677y4sf2jgn8ZLU7yxF5SWHoeruJr9Iujd58
	kE30YXto3y7zFhzL34t68NM20m1vxLS7Z9bHjNprXCJfbMaDKytJ4y9NB/UjhUDqHi3MyzN6pkEcM
	Fsd6cVQEzZppjL7xsyNkA7qk2qRNVEmJmNj2/SToNORDBSKXwQ+OCoyFf4Ohw9OKdSJLQJTZ9BOLy
	RZEngi19yiypT6H+L2xU/zRAphH6S7xstlqGaTxrfhPa6XmyTAQ2vdMoSjyvXZ1jSdhz+wESke7Iy
	ARibKwG2rqC9YZOYAazg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m943J-003y3f-Gc; Thu, 29 Jul 2021 11:18:13 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m943E-003y39-7t
 for linux-mtd@lists.infradead.org; Thu, 29 Jul 2021 11:18:09 +0000
Received: by mail-ej1-x630.google.com with SMTP id gs8so10002107ejc.13
 for <linux-mtd@lists.infradead.org>; Thu, 29 Jul 2021 04:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=65ZwwJqLgs4c9HtCALozYsS5NsihCPZf/ynWKHwUyR8=;
 b=KzMZFRO6hmvgYKId5o3d7SOQb8EMTg17Lt7c87ajkq3mxdsrAnZuzjd78zV0hB5Ak3
 RuFRi/DPGHSeLWQzsrOq8Zd1HeQ2O8CeHk0XTbJtxEGCyWC7asw5mHDbHXgFdTiXRE8N
 XGJ29IMNwRmw0twXFXZkQcrCvoXJLz/XngDGdADdW7jHpe+J/6pruVphVa6LRvJHmewK
 /hLCmSB0eIdXXBmW5mIucvOw2q31pAjUa8YFBq2I3h02fldHSdy2aqyUcFe2mihrB1eG
 TDt65ZvGSiD1eIJ7QY4RhbmAuF26F2phzx/LqqecLEDMpBbsu5/2f6HBamAYpIiIctO0
 VfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=65ZwwJqLgs4c9HtCALozYsS5NsihCPZf/ynWKHwUyR8=;
 b=WsYIP/0W2dBLM3grFXkvbNd9i0/EMjCAstJwDPLZekVJOJgva7IIwenKMuU9wDBfuz
 lR2Tb5311BNue2JzEvfWt355D2a/J8jXPFwV77lN73Dd1N9mDDRxcs4NsWuxC02aBEW+
 YBZuoWJndUNzMXGcJ52gQSCsGjlIkP9598vl8ic7w73HMovVOXiSDl5YBYDTvur65pVP
 kz/pt51ulZy+2BQ//C8fVam0nOKdh3lUYd8wcUx+4jISEA2ufdZq6iLpVfBbZ56HOJKL
 ngM10Ybu7d3XCxPVjekBXCbljW42ejhcKKYiFf8Nlt1Sm1sen2WylOWayio7Y53exero
 HudQ==
X-Gm-Message-State: AOAM532VgJDmFfeISF7D/qaXpftWc02eqnI+6e906t2ECDL7gXlPPKAz
 c8e/oPf6OE606lK+sEP2v6F2xJIvUt5dC31JJKslHA==
X-Google-Smtp-Source: ABdhPJySfQ1NPMpN+/lsPjW164mn0r8d3REf4kf9pWPQ8yyRotEZCYiRLEJVSRNfO8LG3+VSGEByagnqdZ8GMYanqTw=
X-Received: by 2002:a17:906:4fd6:: with SMTP id
 i22mr4214483ejw.92.1627557485657; 
 Thu, 29 Jul 2021 04:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLjzyG_2wGDYmwgeoQuuQ7cykJ11THf8jMrOFXZ7vXheJQ@mail.gmail.com>
 <YPGojf7hX//Wn5su@kroah.com>
 <568938486.33366.1626452816917.JavaMail.zimbra@nod.at>
 <CAOuPNLj1YC7gjuhyvunqnB_4JveGRyHcL9hcqKFSNKmfxVSWRA@mail.gmail.com>
 <1458549943.44607.1626686894648.JavaMail.zimbra@nod.at>
 <CAOuPNLh_KY4NaVWSEV2JPp8fx0iy8E1MU8GHT-w7-hMXrvSaeA@mail.gmail.com>
 <1556211076.48404.1626763215205.JavaMail.zimbra@nod.at>
 <CAOuPNLhti3tocN-_D7Q0QaAx5acHpb3AQyWaUKgQPNW3XWu58g@mail.gmail.com>
 <2132615832.4458.1626900868118.JavaMail.zimbra@nod.at>
 <CAOuPNLhCMT7QTF+QadJyGDFNshH9VjEAzWStRpe8itw7HXve=A@mail.gmail.com>
 <CAFLxGvywv29u6DJZrJxnJJmUDSQ4xpbT0u5LNKY1uGKyQom+WA@mail.gmail.com>
In-Reply-To: <CAFLxGvywv29u6DJZrJxnJJmUDSQ4xpbT0u5LNKY1uGKyQom+WA@mail.gmail.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 29 Jul 2021 08:17:53 -0300
Message-ID: <CAAEAJfCY+X-G=7Oe9NqrJ4yQZ29DBA78jOFAX44GD0g6=s7qhg@mail.gmail.com>
Subject: Re: MTD: How to get actual image size from MTD partition
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Pintu Agarwal <pintu.ping@gmail.com>, Richard Weinberger <richard@nod.at>, 
 Kernelnewbies <kernelnewbies@kernelnewbies.org>, Greg KH <greg@kroah.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 Sean Nyekjaer <sean@geanix.com>, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_041808_443750_D71ABA17 
X-CRM114-Status: GOOD (  22.41  )
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

SGkgUmljaGFyZCwKCk9uIFR1ZSwgMjcgSnVsIDIwMjEgYXQgMTg6MTYsIFJpY2hhcmQgV2VpbmJl
cmdlcgo8cmljaGFyZC53ZWluYmVyZ2VyQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1
bCAyMiwgMjAyMSBhdCAxOjExIFBNIFBpbnR1IEFnYXJ3YWwgPHBpbnR1LnBpbmdAZ21haWwuY29t
PiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIDIyIEp1bCAyMDIxIGF0IDAyOjI0LCBSaWNoYXJkIFdl
aW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PiB3cm90ZToKPiA+ID4KPiA+ID4gLS0tLS0gVXJzcHLD
vG5nbGljaGUgTWFpbCAtLS0tLQo+ID4gPiA+PiBCdXQgbGV0IG1lIGFkdmVydGlzZSB1YmlibG9j
ayBhIHNlY29uZCB0aW1lLgo+ID4gPiA+IFNvcnJ5LCBJIGNvdWxkIG5vdCB1bmRlcnN0YW5kIGFi
b3V0IHRoZSB1YmlibG9jayByZXF1ZXN0LiBJcyBpdAo+ID4gPiA+IHBvc3NpYmxlIHRvIGVsYWJv
cmF0ZSBsaXR0bGUgbW9yZSA/Cj4gPiA+ID4gV2UgYXJlIGFscmVhZHkgdXNpbmcgc3F1YXNoZnMg
b24gdG9wIG9mIG91ciBVQkkgdm9sdW1lcyAoaW5jbHVkaW5nCj4gPiA+ID4gcm9vdGZzIG1vdW50
aW5nKS4KPiA+ID4gPiBUaGlzIGlzIHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lIHdlIHBhc3M6Cj4g
PiA+ID4gcm9vdGZzdHlwZT1zcXVhc2hmcyByb290PS9kZXYvbXRkYmxvY2s0NCB1YmkubXRkPTQw
LDAsMzAKPiA+ID4gPiBBbmQgQ09ORklHX01URF9VQklfQkxPQ0s9eSBpcyBhbHJlYWR5IGVuYWJs
ZWQgaW4gb3VyIGtlcm5lbC4KPiA+ID4gPiBEbyB3ZSBuZWVkIHRvIGRvIHNvbWV0aGluZyBkaWZm
ZXJlbnQgZm9yIHViaWJsb2NrID8KPiA+ID4KPiA+ID4gRnJvbSB0aGF0IGNvbW1hbmQgbGluZSBJ
IHVuZGVyc3RhbmQgdGhhdCB5b3UgYXJlICpub3QqIHVzaW5nIHNxdWFzaGZzIG9uIHRvcCBvZiBV
QkkuCj4gPiA+IFlvdSB1c2UgbXRkYmxvY2suIHViaWJsb2NrIGlzIGEgbWVjaGFuaXNtIHRvIHR1
cm4gYW4gVUJJIHZvbHVtZSBpbnRvIGEgcmVhZC1vbmx5Cj4gPiA+IGJsb2NrIGRldmljZS4KPiA+
ID4gU2VlOiBodHRwOi8vd3d3LmxpbnV4LW10ZC5pbmZyYWRlYWQub3JnL2RvYy91YmkuaHRtbCNM
X3ViaWJsb2NrCj4gPiA+CltzbmlwXQoKT3VjaCwgc28gc3VycHJpc2VkIHRoYXQgYWZ0ZXIgYWxs
IHRoZXNlIHllYXJzIHNvbWVvbmUgaXMgZG9pbmcgc3F1YXNoZnMvbXRkYmxvY2sKaW5zdGVhZCBv
ZiB1c2luZyB1YmlibG9jayA6LSkKCkNhbiB3ZSBwYXRjaCBlaXRoZXIgS2NvbmZpZyBvciBhZGQg
c29tZSB3YXJuX29uY2Ugb24gbXRkYmxvY2sKdXNhZ2UsIHN1Z2dlc3RpbmcgdG8gdXNlIHViaWJs
b2NrIGluc3RlYWQ/CgpJIHJlbWVtYmVyIHRoZXJlIHdhcyBzdGlsbCBzb21lIHVzZSBjYXNlKHMp
IGZvciBtdGRibG9jayBidXQgSSBjYW4ndCByZW1lbWJlcgpub3cgd2hhdCB3YXMgaXQsIHBlcmhh
cHMgd2Ugc2hvdWxkIGRvY3VtZW50IHRoZSBleHBlY3RhdGlvbnM/CihJcyB0aGF0IGZvciBKRkZT
MiB0byBtb3VudD8pCgpUaGFua3MsCkV6ZXF1aWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
