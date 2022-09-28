Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BE2C32771
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Sep 2022 10:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l3SOnwD/dx5TkHYFP9UAbgxDb0JLOyYMNcgtzXKCAiA=; b=tpwhfx9uFxadxe
	8rSjiP6vmuKSNB/YmnNTtoYrXjfH+nlr7m7wme566I9ZbNQ0SbC03no8+rPgoc2lZ78cSVDjJmrny
	O41JPa9z8Z9sy9uYSC7yKzqN/HKForgwzji4VyCdBqsmo/nz9LBQ1pv7wu7AD8jmq0/IXHIf1ZsVJ
	KiH3gnSU86zOW0BSTG4H1FBsSC74EncbnzTVYvYDcv/aDyuCsu/tMYZCdI7ideAvcmbLYc3co+wO+
	mt20WRXenYLhUPTVc5g/i4vylusObz4XxwRIWhBwEPMkj4iOR5aUjpdL006Lcw3Lu18HelAckhzrR
	ts9ABGcFCFMZpD5cyjGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odUAE-00FYe9-D4; Wed, 28 Sep 2022 10:19:38 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odUAA-00FYap-TI
	for linux-mtd@lists.infradead.org; Wed, 28 Sep 2022 10:19:36 +0000
Received: by mail-ed1-x52f.google.com with SMTP id a41so16623216edf.4
        for <linux-mtd@lists.infradead.org>; Wed, 28 Sep 2022 03:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=skymem-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=QL5DW5OuC6IaKeka2Ba34BglQYFPJ3KZO2Tagw9qeig=;
        b=DWN+11S19dyKGmY06R0pQOjtqCQGzZyxTeUbmmvHHZu7jl1wi72QBZGtrp/W5nT3B/
         Z/ipHEenxeZwaoibEmfnwq1wueNF2sGGXdegbRSqa5OtcFiW9BQXcO4zwbECJJDSBUOU
         R+fs6sbZMpiW93+IaRvdHN8N8mkVEjgQszw1e5QDyI1RxldAPStPPM7XcOVc+dMCqadh
         9BJ1Fxj0C8OmZTKUvGNeRShsiuqgMJbD323a5GNYMINDiQh+DR1d3XJawnohWitOKRnp
         S5FvwdSQA2LwXHHdgtFzTRJSNVQHsR/rJopgikG2LD7NKIBASHmuiHZNLdthPFSPmZPi
         g61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=QL5DW5OuC6IaKeka2Ba34BglQYFPJ3KZO2Tagw9qeig=;
        b=NKMuoZhP6vZNSwMEGMvJ1Ga+h7sp9QSRGXjOPtEV3B7e0P45qHv9ZPJcpXbgvuDYh+
         UsNl9cUJPyV/6p/zq43Tcsw1aMgQEKzT+F7Tf410soSq/5yoib/HyicVifmKYm7rb0zq
         TwIIiegu4HEoC162nXPBQVtbVSPW6de7tfYUB/7mgJ7qy4xHiLi00hQmA4AAuvqagclN
         ttdbDRycsSXg4p4MRe19VWyiVj+c2kils2OmnHAbASrZyoRmm3RPH9gXq+wAVDHPuT8T
         tNsreJAxIiW8q0hZnk5ja4xFJLdON/Vwi0qlBcwVgaMbXFJcbzSM2FXI3gaD5Y3iRJBi
         KwgA==
X-Gm-Message-State: ACrzQf1UIo9OKvrWhD5tYNTl0adKJgZ2dTsODkXoq1o1IzWul/pXWRP8
	PR+AFAqVYa13iGFEssrNVddGr2qZCf4eG+ce8nepOQ==
X-Google-Smtp-Source: AMsMyM7a5D0ccRN36KDNegROl44Xj0SYqtfsv2sMLRSip13qrSxndOUmh1IOPDa7uk7PVaS1ZlYYV1Mljk6+SkNh+F4=
X-Received: by 2002:a50:eb05:0:b0:457:c6f5:5f65 with SMTP id
 y5-20020a50eb05000000b00457c6f55f65mr6362845edp.311.1664360372279; Wed, 28
 Sep 2022 03:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220924131010.957117-1-yangyingliang@huawei.com>
 <CAFBinCCFSrYv-JZrda27Ein=YrEik=yvOjHtiz-=aR0q-+FFFA@mail.gmail.com>
 <e640b2b7-edf7-54dd-c207-a0906858d98c@huawei.com> <CAFBinCAUGQXjevOcpD0X2XR7+1MKWuLPJcGShtHSJMjSGfCU6A@mail.gmail.com>
In-Reply-To: <CAFBinCAUGQXjevOcpD0X2XR7+1MKWuLPJcGShtHSJMjSGfCU6A@mail.gmail.com>
From: Info Skymem <info@skymem.com>
Date: Wed, 28 Sep 2022 12:19:20 +0200
Message-ID: <CAKvd=_g+Oyb5M7jYAp4ixwZhFxY2imz6wzCsa0jhUi4E4DLHCw@mail.gmail.com>
Subject: Re: [PATCH -next] mtd: rawnand: intel: Add missing of_node_put() in ebu_nand_probe()
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Yang Yingliang <yangyingliang@huawei.com>, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_031935_391733_14498011 
X-CRM114-Status: GOOD (  21.93  )
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

SGksCnRoYW5rIHlvdSBmb3IgeW91ciBpbmZvcm1hdGlvbi4KCk9uIG91ciB3ZWJzaXRlIHlvdSBj
YW4gZmluZCBlbWFpbCBhZGRyZXNzZXMgb2YgY29tcGFuaWVzIGFuZCBwZW9wbGUuCmh0dHBzOi8v
d3d3LnNreW1lbS5pbmZvCgpJbiBzaG9ydCwgaXTigJlzIGxpa2UgR29vZ2xlIGZvciBlbWFpbHMu
CgpCZXN0IHJlZ2FyZHMsClJvYmVydCwKU2t5bWVtIHRlYW0KCk9uIFR1ZSwgU2VwIDI3LCAyMDIy
IGF0IDk6MjcgUE0gTWFydGluIEJsdW1lbnN0aW5nbAo8bWFydGluLmJsdW1lbnN0aW5nbEBnb29n
bGVtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+IE9uIE1vbiwgU2VwIDI2LCAyMDIyIGF0IDM6
NTggQU0gWWFuZyBZaW5nbGlhbmcgPHlhbmd5aW5nbGlhbmdAaHVhd2VpLmNvbT4gd3JvdGU6Cj4g
Wy4uLl0KPiA+ID4+ICtlcnJfb2Zfbm9kZV9wdXQ6Cj4gPiA+PiArICAgICAgIG9mX25vZGVfcHV0
KGNoaXBfbnApOwo+ID4gPiBIZXJlIEkgaGF2ZSBvbmUgcXVlc3Rpb246Cj4gPiA+IE15IHVuZGVy
c3RhbmRpbmcgaXMgdGhhdCB3aXRoIHRoaXMgcGF0Y2ggd2Ugbm93IHVzZQo+ID4gPiBvZl9ub2Rl
X3B1dChjaGlwX25wKTsgaW4gY2FzZSBhbnkgZXJyb3Igb2NjdXJzIGR1cmluZyBwcm9iZS4KPiA+
ID4gQnV0IHdoYXQgYWJvdXQgdGhlIGNhc2Ugd2hlcmUgdGhlcmUncyBubyBlcnJvciBhbmQgc29t
ZW9uZSBsYXRlcgo+ID4gPiB1bmxvYWRzIHRoZSBkcml2ZXIgKHVzaW5nIHJtbW9kKT8gT3IgaW4g
b3RoZXIgd29yZHM6IGRvIHdlIG5lZWQKPiA+ID4gYW5vdGhlciBvZl9ub2RlX3B1dCgpIGNhbGwg
aW4gZWJ1X25hbmRfcmVtb3ZlKCk/Cj4gPiBJbiBub3JtYWwgY2FzZSwgd2hlbiB0aGUgbW9kdWxl
IGlzIHJlbW92aW5nLCB0aGUgb2Zfbm9kZV9wdXQoKSBpcwo+ID4gY2FsbGVkIGluIGRlbF9tdGRf
ZGV2aWNlKCkgd2hpY2ggaXMgY2FsbGVkIGJ5IG10ZF9kZXZpY2VfdW5yZWdpc3RlcigpLgo+IFRo
YW5rIHlvdSBzbyBtdWNoIGZvciB0aGUgZXhwbGFuYXRpb24hIFdpdGggdGhpcyB5b3VyIHBhdGNo
IGdldHMgbXk6Cj4gUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVt
ZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cj4KPgo+IEJlc3QgcmVnYXJkcywKPiBNYXJ0aW4KPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdAo+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
