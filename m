Return-Path: <SRS0=6kki=IC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52100C433DB
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Mar 2021 07:12:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E810C64EF8
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Mar 2021 07:12:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E810C64EF8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3sXmbaiC1uvH3VVhkCMp8r8tf+Te+S/8VXpXFFBmsWQ=; b=kuZu7PeHo5/iqjWewiNG2g2F3
	S0sy+Np0eGYzz6lh+XfJncsPlrtbzIc+wqH+owHWT3wkYZ2ghBmKNlLhZCpwML65LwUTfrXs4U+GK
	L/VGZt/mRdwqU66n9qox3wbFYM7PGo/Fqq8W5DNiCGQC3ROucZl2LfFbb44eZmicKRB0o/fYtSd3a
	8ZasbYVq8KX3nOMGHhqSnURUy144rljFauiNuggtTBAIuTBk9AgoHlPb8L4R/gFpywfmKMS3Ba2DW
	7ocRD1inxgNu93OXbTqVTrMvWRuFu6y0yr515IAoQz8izKYYArkjxaaJclgP4Eduipt50c8Oc51Dr
	mCtmBqgGA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHi99-0080xm-Js; Thu, 04 Mar 2021 07:11:43 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHi7m-0080cc-1i
 for linux-mtd@lists.infradead.org; Thu, 04 Mar 2021 07:10:22 +0000
Received: by mail-il1-x129.google.com with SMTP id f10so23385532ilq.5
 for <linux-mtd@lists.infradead.org>; Wed, 03 Mar 2021 23:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Vf8fdcUVLb/cgBi45coWwL+X8axBJeREpOHV3vnDbWE=;
 b=d3bmdq7h0jjYYoC/XOIG85HlNrX0LAymln+2kuS9TCxQzX99H3t7Yc6TY9TsE/9YmQ
 pfrWzzv1JwbZecUXUWZwyPDU4RAW5AlftBc01oCfr4uzaHnwCQlnk2cx4s65CW+Hg+Pm
 3Z+1EvTwexTJ6DSl+sh0i358jYYWtiSVItoU5/+f4eiqWavi2pxiSWwlsYvLDtoFZIpY
 TVJCpoWn7XRFpscHYp4k3/JtV2HIhjJ06PmLZABL5sZ95OIdGnVZ6Djr1cVHr3SpV3xY
 cDGp7QGIcXxAdMbeOYL6VJ+22aUJpPFyE9UvWF8FQuYK7HVx5b7F37juSk5HIMqgrPnp
 r8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Vf8fdcUVLb/cgBi45coWwL+X8axBJeREpOHV3vnDbWE=;
 b=rCyqKIHrIk83o6EVDEFu7P+foIjjtDOLCfLd+3iA5acbX7RXsFxXrlsTeeV4zRZTrE
 Dg/X6l2rIWli1Kq8IjpInA7y7/8IRx2RU4mTjJBeTm5bgOwgYz6g7IaNUm/0FiF96i/V
 8XLlsac3SqMAojc8EN4Fq/mPKWGSDwUY1yYbXYkBdDzJH5XtBtrOrY4A7s2Ndy7Z76ta
 EI2yETbZk1+zxym1YWla4u4agtLuSdmr4HLfkKas5i6Nh/Cv4miJL8Qeu8QprbLLpTFm
 Oi7d8xl2LL04w+cJUmZh8ep1MWGlRr3WaPos2+i3+iV0CPJhO6xfpTXkc34jh1iu3iI/
 ro7g==
X-Gm-Message-State: AOAM531WBkqjzmBss0eJfcArK9va0YtmVrtn4rP6U+dIurd6billMbg9
 /gt7L6AoLLr2dA/tXhjXAK0juzRz2dx9YT00Ti4=
X-Google-Smtp-Source: ABdhPJz6VMqCHc5Kf+YA7w36vKsiMVgBDqO9e3W5YCWueKOuhylZJOl7HXo3eYCOtNMNJlq1FFQ4ALLvOsN3f0vggIc=
X-Received: by 2002:a92:c265:: with SMTP id h5mr2629399ild.225.1614841815729; 
 Wed, 03 Mar 2021 23:10:15 -0800 (PST)
MIME-Version: 1.0
References: <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
 <CAEyMn7aMNjKHXhe_hN15XVczombrTnNqASmva_-MT92+qqV8xA@mail.gmail.com>
 <615749fe-52f5-9e07-db46-41e5e03b55cf@microchip.com>
 <CAEyMn7aXXOS3abS=n_8Y6GtN-xYRYyGT3H-AoavWqCqqM01V9A@mail.gmail.com>
 <fb31d09c-d20a-9a42-6ed2-fd74c7699dfc@microchip.com>
 <CAEyMn7bY9CisxoWcpF=zR+DYJpW+=EeWLGE_gAB3WK9hvkcuJQ@mail.gmail.com>
 <9263ef4d-7944-00bb-8e2f-b7d33e5aab87@ti.com>
 <e1901135-0433-d693-56c9-3a9fdaca1d55@microchip.com>
 <20210301133618.rzs4amh5ujwys277@ti.com>
 <99f92851b9ee95d01564ae01c56085eb@walle.cc>
 <beaf17ed-d200-4470-f726-e4a71d9565fb@microchip.com>
 <729a56daea261808db672472e47d8c20@walle.cc>
 <116efdb0-8b82-914d-2389-d73e2ea2e89a@microchip.com>
 <c4db1916-18fe-5167-31c1-6bc652bb6212@ti.com>
 <CAEyMn7Z0mYTrtd6TwKJqL6He9g-6o0yYJ2H78oG8gZy9mxXETw@mail.gmail.com>
 <5ea9c0cb-3281-7bfd-e2b1-8217eff94c20@ti.com>
In-Reply-To: <5ea9c0cb-3281-7bfd-e2b1-8217eff94c20@ti.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 4 Mar 2021 08:10:03 +0100
Message-ID: <CAEyMn7b+vHNiSRJTP2Qs3doK2n3xgCQm9YFBCYEn09GWLehQ0Q@mail.gmail.com>
Subject: Re: spi-nor: maxronix MX25L12835F support
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor.Ambarus@microchip.com, Michael Walle <michael@walle.cc>,
 p.yadav@ti.com, 
 ycllin@mxic.com.tw, zhengxunli@mxic.com.tw, juliensu@mxic.com.tw, 
 linux-mtd@lists.infradead.org
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

SGkgVmlnbmVzaCwKCkFtIERvLiwgNC4gTcOkcnogMjAyMSB1bSAwODowMiBVaHIgc2NocmllYiBW
aWduZXNoIFJhZ2hhdmVuZHJhIDx2aWduZXNockB0aS5jb20+Ogo+Cj4KPgo+IE9uIDMvMy8yMSA3
OjE0IFBNLCBIZWlrbyBUaGllcnkgd3JvdGU6Cj4gPiBIaSBWaWduZXNoLAo+ID4KPiBbLi4uXQo+
ID4+Pj4+Cj4gPj4+Pj4gSG93IGFib3V0IG5hbWluZyB0aGVtIHNvbWV0aGluZyBsaWtlICJ1cGRh
dGVkLWZsYXNoLW5hbWUgfHwKPiA+Pj4+PiBmaXJzdC1uYW1lIi4KPiA+Pj4+PiBBbnl3YXksIHRo
ZXNlIGFyZSBqdXN0IHdvcmthcm91bmRzLiBNYW51ZmFjdHVyZXJzIHNob3VsZG4ndCB1c2UgdGhl
Cj4gPj4+Pj4gc2FtZQo+ID4+Pj4+IEpFREVDIElEIGZvciBuZXcgZmxhc2hlcy4gVGhleSBzaG91
bGQgYXQgbGVhc3QgYWRkIGFuIGV4dGVuZGVkIElELgo+ID4+Pj4KPiA+Pj4+IE1oLCB3aGF0IGFi
b3V0IGEgbGlzdCBvZiBuYW1lcz8gSSBtZWFuIHllcyBpdCBpcyBhIHdvcmthcm91bmQsIGJ1dAo+
ID4+Pj4gdGhlcmUgaXMgYWN0dWFsIGhhcmR3YXJlIGRvaW5nIHRoaXMsIHNvIElNSE8gbGludXgg
aGFzIHRvIGRlYWwgd2l0aAo+ID4+Pj4gaXQgaW4gc29tZSB3YXkuIE9UT0ggdGhhdCBsaXN0IG1p
Z2h0IGJlIGxvbmcgYW5kIGRvZXNuJ3QgbG9vayBnb29kCj4gPj4+PiBpbiBkbWVzZyAob3Igd2hl
cmV2ZXIgdGhhdCBzdHJpbmcgbWlnaHQgYmUgdXNlZCkuCj4gPj4+Pgo+ID4+Pj4gSXQgbWlnaHQg
Y29tZSBpbiBoYW5keSB0byBoYXZlIGEgbWVjaGFuaXNtIGluIHBsYWNlIGlmIHNvbWVvbmUKPiA+
Pj4+IHJlYWxseSBjYXJlcyBhYm91dCBpdCB0aG91Z2guCj4gPj4+Pgo+ID4+Pgo+ID4+PiBBIGxp
c3Qgb2YgbmFtZXMgd2l0aCBkaWZmZXJlbnRpYXRpb24gYXQgcnVuLXRpbWUsIHdoZXJlIHBvc3Np
YmxlLAo+ID4+PiBzb3VuZHMgZ29vZC4gT3RoZXJ3aXNlIHdlJ2xsIHN0aWNrIHRvIGEgZGVmYXVs
dCBuYW1lLCB3aGF0ZXZlciB0aGF0Cj4gPj4+IHdpbGwgYmUuIERvIHlvdSBjYXJlIHRvIHNjcmF0
Y2ggYSBwYXRjaCBmb3IgdGhlIGxpc3Qgb2YgbmFtZXMgaWRlYT8KPiA+Pj4KPiA+Pj4gV2UnbGwg
c3RpbGwgaGF2ZSBhIHNpbmdsZSBmbGFzaCBlbnRyeSwgd2l0aCBhIGxpc3Qgb2YgbmFtZXMsIGFu
ZCB3ZQo+ID4+PiBzdGlsbCBuZWVkIHRvIGVpdGhlciBkbyB0aGUgU0ZEUCBkZXRlY3Rpb24gZmly
c3QsIG9yIHRvIHRyaWdnZXIgdGhlCj4gPj4+IFNGRFAgZGV0ZWN0aW9uIHdpdGggYW4gZXhwbGlj
aXQgZmxhc2ggaW5mbyBmbGFnLiBJJ2xsIGZvbGxvdyBQcmF0eXVzaCdzCj4gPj4+IHN0ZXBzIGFu
ZCBldmFsdWF0ZSB0aGUgImRldGVjdCBTRkRQIGZpcnN0IiBpZGVhLgo+ID4+Pgo+ID4+Cj4gPj4g
SWYgd2UgZG8gZ28gZG93biB0aGUgcm9hZCBvZiAiZGV0ZWN0IFNGRFAgZmlyc3QiLCB3ZSBzaG91
bGQgYWRkCj4gPj4gU1BJX05PUl9TS0lQX1NGRFAgdG8gZmxhc2hlcyB0aGF0IGN1cnJlbnRseSBk
b24ndCBjbGFpbSBEVUFML1FVQUQvT0NUQUwKPiA+PiBjYXBhYmlsaXR5IGN1cnJlbnRseSBpbiBv
cmRlciB0byBhdm9pZCBhbnkgc3VycHJpc2VzIGR1ZSB0byB3cm9uZyB2YWx1ZXMKPiA+PiBpbiB0
aGUgdGFibGUuCj4gPgo+ID4gRG9lcyB0aGlzIG1lYW4gdGhhdCBhbGwgZW50cmllcyB0aGF0IGhh
dmUgRFVBTC9RVUFEL09DVEFMIGRlZmluZWQgY2FuCj4gPiBoYXZlIHRoZW0gcmVtb3ZlZCBBbmQg
dGhlIGNvcnJlY3QgdmFsdWVzIHdpbGwgYmUgZGV0ZWN0ZWQvc2V0IGJ5IFNGRFA/Cj4gPgo+Cj4g
Tm8sIG5vdCBhbGwgRHVhbC9RdWFkL09jdGFsIFNQSSBmbGFzaGVzIGhhdmUgU0ZEUCB0YWJsZXMg
cG9wdWxhdGVkLgo+IFJlbW92aW5nIERVQUwvUVVBRC9PQ1RBTCBjYXBhYmlsaXRpZXMgZm9yIGEg
Zmxhc2ggdGhhdCBkb2VzIG5vdCBoYXZlCj4gU0ZEUCB0YWJsZXMgcG9wdWxhdGVkIChvciBoYXMg
d3JvbmcgdmFsdWVzKSB3aWxsIGNhdXNlIHJlZ3Jlc3Npb24gYXMKPiBjb2RlIG1heSBmYWxsYmFj
ayB0byBsZWdhY3kgU1BJIG1vZGUuCgpTbyBpbiB0aGF0IGNhc2UgcmVtb3ZpbmcgdGhlIGZsYWdz
IGNhbiBvbmx5IGJlIGRvbmUgb24gY2hpcHMvZmxhc2hlcwp0aGF0IGFyZSBjaGVja2VkIGFuZCBy
ZXZpZXdlZCBmb3IgYSB2YWxpZCBmdW5jdGlvbmFsIFNGRFAgZGV0ZWN0aW9uLgoKLS0gCkhlaWtv
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
