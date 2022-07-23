Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D1DC43334
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Jul 2022 14:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fbkLZO8KfafG6Z5rt3VzHHVp8tSXOD9N2joh6LOgQ/M=; b=s+asdrnLhQrt+P
	9qXoJaeC1hj+whnOQXvQY6a5AndJ0H4EAaOkdYjRnzzZDAcVnsRSi3UZcKo98IZRg8i7kLiYK157D
	ZVrCAYokv6Ibfgz4rmjeDL4AABy3JfY+1L9fiGXJZ+oaDlcZenCgzwQzPQFxeF+1QG8ObP2rwo+02
	HFM0Sd0VSRV1hKF67whAn42LwHv5ioWKDhx53n0LXr3m5QVbGgOt8qCzJf4+mPy4EodwNsJkkTyGS
	q5VDlbB8argwWNcDm4KsYOl9FMOg3LITAbsPyHK3f3rqo6nANhOCDB7OdeT5dX3JPBO80ywKhvuGQ
	dlnnombL1GaVkUuQM4Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFGPR-004N5G-53; Sat, 23 Jul 2022 14:47:13 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFGPO-004N3R-5p
	for linux-mtd@lists.infradead.org; Sat, 23 Jul 2022 14:47:11 +0000
Received: by mail-lf1-x12c.google.com with SMTP id m12so10762925lfj.4
        for <linux-mtd@lists.infradead.org>; Sat, 23 Jul 2022 07:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HE7GGuksx6MN+gNz4voCRIijIPTMFt+Q99FuH/9Vyns=;
        b=XcOLoipEtzdWz60RxkIBhM1EJsLSqB3tEf8s+pA+I64qcoAIa2ICCKJdhTzkEMoWr8
         PBCEMVHRfHV57xdzbFKs4xOvjLuAOwDjzGfIXboZ9NijRjxqgSken0cQQSnjqMnG4ilG
         zqLmwpK1aAFqLblq6TAlvbEsTT1cC+tfPEsgp8YN0jhXMXXz8Mxyt46KU9hH5VmTrBCx
         z1EJJz3B8AJCdBkWTu9vZYqViE34sPBxziu4fHVCQrfLUtlDufmGQ61EWeupVlJLWKRc
         xUTOTHoteAF9l+5kIrfsoFsvm+FdNFy8eOf9qRBbHjhch2LJ1EqeiPr/E7y3cY+fxqB6
         X9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HE7GGuksx6MN+gNz4voCRIijIPTMFt+Q99FuH/9Vyns=;
        b=1IpGDowYDLWR3BO9NtHBU5r1STxX78wHniDIr/kNgyV2nbHX0fOu9WQOYp6uZMmP0r
         6OS23zne5Q5zUrvqg4orx0fal2dQsroQNb5DLR4dXR307/6DZ7K+sI8x26t4IV04SzAq
         wuxYyMmdbSHY8KkYsLkQQk7KQ+lRktKn2iPJpZiT2SP6lSnXXieipW0sBSyq4od0/Gml
         vMDjVFSFUJdiUhjsC98813t0Yowu6XA05xtgLtgTB5VLtvnYauv9MfSaxfEK+7Iqxcua
         vZn5b/Gtpc8jdDPiNCzc87INCmTpR4jHCTK5+1S72VFk8m/mQJ/OD/LHSoe2VOIvL2FJ
         gGJQ==
X-Gm-Message-State: AJIora/TeP4nl1Yn/clc7IbXIqCZUtGj0yJ2Wr+i1IFnfWX+/D+0oV42
	DpayntZg9lZ0meNmK8xQyD8=
X-Google-Smtp-Source: AGRyM1tce8Isk5AvQUNCun70fbSPdfnl7tkEm/3+aE4U6gYegDlJnINf0OQKeF50/kjrqO/fUlEKdQ==
X-Received: by 2002:a05:6512:1307:b0:47f:baa4:52c5 with SMTP id x7-20020a056512130700b0047fbaa452c5mr1724043lfu.103.1658587627614;
        Sat, 23 Jul 2022 07:47:07 -0700 (PDT)
Received: from [192.168.1.6] ([212.106.161.60])
        by smtp.gmail.com with ESMTPSA id c11-20020ac25f6b000000b0048a7ad94982sm775468lfc.84.2022.07.23.07.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jul 2022 07:47:07 -0700 (PDT)
Message-ID: <e700eecf-e7e0-c2e7-9e20-b5d20df4b65f@gmail.com>
Date: Sat, 23 Jul 2022 16:47:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] Add SFC support for Ingenic SoCs.
Content-Language: en-US
To: =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
 tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aidanmacdonald.0x0@gmail.com,
 paul@crapouillou.net, dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
 rick.tyliu@ingenic.com, jinghui.liu@ingenic.com, sernia.zhou@foxmail.com,
 reimu@sudomaker.com
References: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
From: Tomasz Maciej Nowak <tmn505@gmail.com>
In-Reply-To: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_074710_258234_6B6A5C64 
X-CRM114-Status: GOOD (  11.23  )
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

VyBkbml1IDIyLjA3LjIwMjIgb8KgMTg6NDgsIOWRqOeQsOadsCAoWmhvdSBZYW5qaWUpIHBpc3pl
Ogo+IDEuVXNlIHRoZSBzcGktbWVtIHBvbGwgc3RhdHVzIEFQSXMgaW4gU1BJLU5PUiB0byByZWR1
Y2UgQ1BVIGxvYWQuCj4gMi5BZGQgU0ZDIHN1cHBvcnQgZm9yIHRoZSBYMTAwMCBTb0MsIHRoZSBY
MTYwMCBTb0MsIGFuZCB0aGUgWDIwMDAgU29DIGZyb20gSW5nZW5pYy4KPiAKPiBMaXUgSmluZ2h1
aSBhbmQgQWlkYW4gTWFjRG9uYWxkIHByb3ZpZGVkIGEgbG90IG9mIGFzc2lzdGFuY2UgZHVyaW5n
IHRoZSBkZXZlbG9wbWVudCBvZiB0aGlzIGRyaXZlci4KPiAKPiDlkajnkLDmnbAgKFpob3UgWWFu
amllKSAoMyk6Cj4gICBtdGQ6IHNwaS1ub3I6IFVzZSB0aGUgc3BpLW1lbSBwb2xsIHN0YXR1cyBB
UElzLgo+ICAgZHQtYmluZGluZ3M6IFNQSTogQWRkIEluZ2VuaWMgU0ZDIGJpbmRpbmdzLgo+ICAg
U1BJOiBJbmdlbmljOiBBZGQgU0ZDIHN1cHBvcnQgZm9yIEluZ2VuaWMgU29Dcy4KPiAKPiAgLi4u
L2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2luZ2VuaWMsc2ZjLnlhbWwgICAgICAgfCAgNjQgKysK
PiAgZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
NDIgKy0KPiAgZHJpdmVycy9zcGkvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDkgKwo+ICBkcml2ZXJzL3NwaS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvc3BpL3NwaS1pbmdlbmljLXNmYy5jICAgICAgICAg
ICAgICAgICAgICAgIHwgNjYyICsrKysrKysrKysrKysrKysrKysrKwo+ICA1IGZpbGVzIGNoYW5n
ZWQsIDc2OCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvaW5nZW5pYyxzZmMueWFt
bAo+ICBjcmVhdGUgbW9kZSAxMDA3NTUgZHJpdmVycy9zcGkvc3BpLWluZ2VuaWMtc2ZjLmMKPiAK
CkV2ZW4gdG91Z2ggaXQncyBzdGlsbCBlYXJseSBpbiByZXZpc2lvbiBwcm9jZXNzLCBJJ2xsIGFk
ZCBteQpUZXN0ZWQtYnk6IFRvbWFzeiBNYWNpZWogTm93YWsgPHRtbjUwNUBnbWFpbC5jb20+CgpU
aGUgdGVzdCB3YXMgcGVyZm9ybWVkIHdpdGggRGFtYWkgRE02MjkxQSBTb0Mgd2hpY2ggaXMgYSBJ
bmdlbmljIFgxMDAwIElQCmJ1dCB3aXRoIDI1NiBNaUIgUkFNLiBObyBidWdzIHlldCBvYnNlcnZl
ZCBvbiBteSBzaWRlLgoKLS0gClRNTgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
