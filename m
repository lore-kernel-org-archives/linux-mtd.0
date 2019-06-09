Return-Path: <SRS0=Yh92=UI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392C6C28EBD
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Jun 2019 09:59:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00E5320868
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Jun 2019 09:59:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g10+vhzn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00E5320868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emcraft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=al+O8kungSuF9mIebV8d41xyT7l4JasjUhBUiEzKqOQ=; b=g10+vhznyghxYf
	Z0Z8D8FUX3jYayLjeFm6QtKD0jcQUZp06rcpXeA7PlQxfo/1IcOqCH5To28KAiPPBK87qwJ/DSTiH
	0kIU/KZRVLLBaNpguWKpDUgp0TV4Ot2X9lM4sTCAiZsIaRK6P2n/i/3vHd1pz7JvVwh39Dz0bXg+I
	mt4uc5WcKYOCXTew6rN7KKcnD6SDwmVo1DobEwxrcJ8hhWSJj9dt4bzgcakjnJjxONK/jfXO5pQmd
	MApV5/f1wBi/bb23sW6ZfFAKz3Bhe/VP3QLcOp/XtdNthek6S1pcjqWt3MZ6liz+QW8i94+pIQjHI
	KI/TBN0qWKIQHrIj6NCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZubf-0006da-4F; Sun, 09 Jun 2019 09:59:19 +0000
Received: from [176.110.122.116] (helo=ocean.emcraft.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZubb-0006cV-Fd
 for linux-mtd@lists.infradead.org; Sun, 09 Jun 2019 09:59:17 +0000
Received: from [10.8.0.10] (helo=mehome.localdomain)
 by ocean.emcraft.com with esmtps (TLSv1:AES256-SHA:256) (Exim 4.76)
 (envelope-from <sposelenov@emcraft.com>)
 id 1hZubV-0007TW-UY; Sun, 09 Jun 2019 12:59:10 +0300
Message-ID: <ac7d203471da8db3a148c207b586cae919304307.camel@emcraft.com>
Subject: Re: UBIFS: file data corruption during the power cut-off test
From: Sergei Poselenov <sposelenov@emcraft.com>
To: Richard Weinberger <richard@nod.at>
Date: Sun, 09 Jun 2019 12:59:09 +0300
In-Reply-To: <1957000286.85744.1560070414116.JavaMail.zimbra@nod.at>
References: <20190606121037.40a1cc5e@sergmir.emcraft.com>
 <20190606210803.481cbc5d@sergmir.emcraft.com>
 <CAFLxGvy1BTuLkcn=7N=FG_q5cBgj5L1YzyhiakVFewYPyr6dzA@mail.gmail.com>
 <20190607172355.6541fa51@sergmir.emcraft.com>
 <1299833819.84614.1559923336123.JavaMail.zimbra@nod.at>
 <08a796c9a296245c372511c683adb80913d14553.camel@emcraft.com>
 <766367078.85018.1559983598342.JavaMail.zimbra@nod.at>
 <a43eb232a51b7d0c95623de9403158c290163237.camel@emcraft.com>
 <1957000286.85744.1560070414116.JavaMail.zimbra@nod.at>
Organization: Emcraft Systems
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190609_025915_712576_7E127F47 
X-CRM114-Status: GOOD (  12.27  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAyMDE5LTA2LTA5IGF0IDEwOjUzICswMjAwLCBSaWNoYXJkIFdlaW5iZXJnZXIgd3Jv
dGU6Cj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+ID4gTm93LCB0aGUgcXVlc3Rp
b246IHdoeSBhcmUgdGhlc2UgNTEyIGJ5dGVzIG9mIHplcm9zIGluIHRlc3Q0Pwo+ID4gCj4gPiBF
eHRyYXBvbGF0aW5nIHRvIGEgcmVhbCB1c2UgY2FzZSwgY29uc2lkZXIgYSBzeXN0ZW0gd3JpdGlu
ZyBhIGxvZwo+ID4gZmlsZQo+ID4gdG8gdGhlIFVCSSBwYXJ0aXRpb24uIFBvd2VyIGN1dG9mZiwg
cmVjb3ZlcnksIGFuZCB3ZSBoYXZlIGEgZ2FyYmFnZQo+ID4gYXQKPiA+IHRoZSBlbmQgb2YgdGhl
IGxvZyBmaWxlLiBJcyB0aGlzIGV4cGVjdGVkPwo+IAo+IFdlbGwsIHplcm8gYnl0ZXMgYXJlIG5v
dCBnYXJiYWdlLiA7KQoKSSd2ZSBzZWVuIHNvbWUgZGF0YSBpbiB0aGUgbGFzdCA1MTIgYnl0ZXMg
YXMgd2VsbC4KCj4gQnV0IHllcywgdGhpcyBpcyBpcyBleHBlY3RlZC4gSW4geW91ciBjYXNlLCBJ
IGd1ZXNzLCB0aGUgaW5vZGUgc2l6ZQo+IGRvZXMgbm90IG1hdGNoIGV4YWN0bHkgd2hhdCBpcyBw
cmVzZW50IG9uIGZsYXNoLgo+IFNvIHRoZSBmaWxlIHNpemUgaXMgNTEyIGJ5dGVzIHRvbyBsYXJn
ZSwgaWYgeW91IHJlYWQgdG9vIGZhciwgMHgwCj4gYnl0ZXMgYXJlIHJldHVybmVkLgo+IER1cmlu
ZyBqb3VybmFsIHJlcGxheSBVQklGUyB0cmllcyB0byBmaXh1cCBmaWxlIGxlbmd0aHMgYnV0IGlz
Cj4gYXBwcm9hY2gKPiBkb2VzIG5vdCB3b3JrIGluIGFsbCBjYXNlcyBwZXJmZWN0bHkuCj4gCj4g
VGhpcyBjYXNlIGlzIGFjdHVhbGx5IGRvY3VtZW50ZWQsIHBsZWFzZSBzZWU6Cj4gaHR0cDovL3d3
dy5saW51eC1tdGQuaW5mcmFkZWFkLm9yZy9kb2MvdWJpZnMuaHRtbCNMX3N5bmNfc2VtYW50aWNz
Cj4gClRoYW5rIHlvdSBmb3IgdGhlIHBvaW50ZXIuIEknbGwgbG9vay4KClJlZ2FyZHMsClNlcmdl
aQo+IFRoYW5rcywKPiAvL3JpY2hhcmQKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
