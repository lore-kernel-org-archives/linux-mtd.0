Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C51C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 17:58:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF70760F90
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 17:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF70760F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Md3FyiOTdwRfTtDEEx2Fe+xOsjx+1QrRUrFWWvSTSRQ=; b=dCoTHZ2uPGK6AXhNaaDs/S5KHk
	90Cyz5FOLZe+YQHis+JVM4fBe59NQLxb/otiWdUUuoCP5BwMt4r9By7SCdbcMrEwCbgCE/dXMnPYd
	VNraFyxv8cGvh5q0GeSroNUeBsWdkFuNOuJd7ienNwC9glQbAnYHBADQtDnZ0SyYc918A3HFatEZ6
	bEUy+3pE2Hz1gpNRab4yYMt5o7lEJYDhC0k6vaUtnf3hhPNf3LnF0UldTeuPwExHjN17+Tm79/BI3
	Zv5tx8bfe18vX39DjqyUZW4f+QDF1BWn2cL3TRjG9pi88c0fEaaRF/Yp0/p/Fvu6usQ4xSsUdqfOn
	oNHnVpfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miKW6-0063hw-VK; Wed, 03 Nov 2021 17:57:43 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miKPY-0061UD-9g
 for linux-mtd@lists.infradead.org; Wed, 03 Nov 2021 17:50:57 +0000
Received: by mail-pf1-x42e.google.com with SMTP id k2so3133291pff.11
 for <linux-mtd@lists.infradead.org>; Wed, 03 Nov 2021 10:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cec1IkGMyor9VWmtx4jxePpP/Ury3qWcerMb8kIcD10=;
 b=O3z2y09w9dx+iV6Qr5gJ98blbky1rfmN7YLMMxfIfhxNjTy5u1uuiOOcNenEJIHEGu
 XUJMzbtjN4O04iwjKDTNuTUtDBeR1rtHgd2v6Zzrjb7P/vzaTAM4L7m0BKXRpKOc16Ux
 TsuJJFZqENF9TyOjHHY/dSG7O+yn862e96nU5iB0M6yBxlcggVwzRmHP5+ZVSYXQaPQT
 vYxsCJbUKA0CcAIDxeWMUkSn473dUUiTsbLp30zeTaQWpvtLWQ4VuimyjqGmcVbLcgQm
 guiURi0D0S1fMkfTOVLg77JBZsHTzUGjxVyWAMAajtKBGiylFbmxBAfb711JFSEKVxbj
 enRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cec1IkGMyor9VWmtx4jxePpP/Ury3qWcerMb8kIcD10=;
 b=NWbqnOu/lhlPHI7kdXnhOtQu9FbK/UZaI6qAsaAniHu9M8FzbgeAzJOv5dVva7N30E
 GOz2h7q1Ml8hr97am43PIvqy5Wa1XovZ+06dVH261mkpudQqvvC9UdQv5DKXOvDm2cyX
 XmZNe4Jmpi29MUWvZUckCrNxRjftD5nwENQkH2O92eo1Gn9zUTQ8/atvsScKnuw5fjAy
 1c8cvm+MwBTm3kJnHO7sTdYazi+dA/8AtkfzKNab3zFBbwMAxzbw5Rg2iXGr76oQPly8
 Ib2GdBCmDWgME6sUDyMFdWUzTcDj5CRJB77chRAAVwdrOvj1UtF9V75WGPrKtA3are8p
 7q2A==
X-Gm-Message-State: AOAM532A49IvcDPYhZcRLf5gEFbbbFjGr3DhDOhVVShZNnnLw0rGlu9R
 WLdMqulSQq/Xc/Km5fa68+U=
X-Google-Smtp-Source: ABdhPJziEKjMSokadyHzCpjSZKz9g11QPkrnoRXfNJa4HHDydIbiElCjq/m9KN2WmMeXUinShR1MaQ==
X-Received: by 2002:a05:6a00:b48:b0:47c:23e:ecb7 with SMTP id
 p8-20020a056a000b4800b0047c023eecb7mr45757989pfo.42.1635961852304; 
 Wed, 03 Nov 2021 10:50:52 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id r25sm2287533pge.61.2021.11.03.10.50.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 10:50:51 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd: rawnand: brcmnand: support "no-wp" DT property
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Brian Norris
 <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20211103151117.18690-1-zajec5@gmail.com>
 <20211103151117.18690-2-zajec5@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <c59157a1-2c15-928f-f5a7-fab7128e8dd2@gmail.com>
Date: Wed, 3 Nov 2021 10:50:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211103151117.18690-2-zajec5@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_105056_396721_5EA849B1 
X-CRM114-Status: GOOD (  20.31  )
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

T24gMTEvMy8yMSA4OjExIEFNLCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4gRnJvbTogUmFmYcWC
IE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IAo+IFNvbWUgYm9hcmRzIG1heSB1c2UgV1At
Y2FwYWJsZSBjb250cm9sbGVyIGJ1dCBzdGlsbCBoYXZlIFdQIG5vdAo+IGNvbm5lY3RlZC4gVGhp
cyBjaGFuZ2UgZml4ZXM6Cj4gWyAgICAxLjE3NTU1MF0gYmNtNjMxMzhfbmFuZCBmZjgwMTgwMC5u
YW5kOiB0aW1lb3V0IG9uIHN0YXR1cyBwb2xsIChleHBlY3RlZCBjMDAwMDA0MCBnb3QgYzAwMDAw
YzApCj4gWyAgICAxLjE4NDUyNF0gYmNtNjMxMzhfbmFuZCBmZjgwMTgwMC5uYW5kOiBuYW5kICNX
UCBleHBlY3RlZCBvbgo+IFsgICAgMS4yODU1NDddIGJjbTYzMTM4X25hbmQgZmY4MDE4MDAubmFu
ZDogdGltZW91dCBvbiBzdGF0dXMgcG9sbCAoZXhwZWN0ZWQgYzAwMDAwNDAgZ290IGMwMDAwMGMw
KQo+IFsgICAgMS4yOTQ1MTZdIGJjbTYzMTM4X25hbmQgZmY4MDE4MDAubmFuZDogbmFuZCAjV1Ag
ZXhwZWN0ZWQgb24KPiBbICAgIDEuMzk1NTQ4XSBiY202MzEzOF9uYW5kIGZmODAxODAwLm5hbmQ6
IHRpbWVvdXQgb24gc3RhdHVzIHBvbGwgKGV4cGVjdGVkIGMwMDAwMDQwIGdvdCBjMDAwMDBjMCkK
PiBbICAgIDEuNDA0NTE3XSBiY202MzEzOF9uYW5kIGZmODAxODAwLm5hbmQ6IG5hbmQgI1dQIGV4
cGVjdGVkIG9uCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxl
Y2tpLnBsPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5j
IHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFu
ZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+IGluZGV4IGY3
NTkyOTc4M2I5NC4uOGI2MTY3NDU3ZjBjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNt
bmFuZC9icmNtbmFuZC5jCj4gQEAgLTcxNCw3ICs3MTQsOCBAQCBzdGF0aWMgaW50IGJyY21uYW5k
X3JldmlzaW9uX2luaXQoc3RydWN0IGJyY21uYW5kX2NvbnRyb2xsZXIgKmN0cmwpCj4gIAlpZiAo
Y3RybC0+bmFuZF92ZXJzaW9uID49IDB4MDUwMCkKPiAgCQljdHJsLT5mZWF0dXJlcyB8PSBCUkNN
TkFORF9IQVNfMUtfU0VDVE9SUzsKPiAgCj4gLQlpZiAoY3RybC0+bmFuZF92ZXJzaW9uID49IDB4
MDcwMCkKPiArCWlmIChjdHJsLT5uYW5kX3ZlcnNpb24gPj0gMHgwNzAwICYmCj4gKwkgICAgIW9m
X3Byb3BlcnR5X3JlYWRfYm9vbChjdHJsLT5kZXYtPm9mX25vZGUsICJuby13cCIpKQo+ICAJCWN0
cmwtPmZlYXR1cmVzIHw9IEJSQ01OQU5EX0hBU19XUDsKClNob3VsZCBub3QgdGhpcyBiZSBhIGxv
Z2ljYWwgT1IgaGVyZSBvciByYXRoZXIsIHNob3VsZCBpdCBiZSBtb3ZlZCBvdXQKb2YgdGhlIGNo
ZWNrIG9uIGN0cmwtPm5hbmRfdmVyc2lvbiBlbnRpcmVseT8gV2hhdCByZXZpc2lvbiBvZiB0aGUg
TkFORApjb250cm9sbGVyIGRvIHlvdSBoYXZlIG9uIHRoYXQgY2hpcD8KCj4gIAllbHNlIGlmIChv
Zl9wcm9wZXJ0eV9yZWFkX2Jvb2woY3RybC0+ZGV2LT5vZl9ub2RlLCAiYnJjbSxuYW5kLWhhcy13
cCIpKQo+ICAJCWN0cmwtPmZlYXR1cmVzIHw9IEJSQ01OQU5EX0hBU19XUDsKPiAKCgotLSAKRmxv
cmlhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
