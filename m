Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16150C7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 13:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R292JYDmUdowELIu9968AsSKk23uDTzfSzQBrLPL288=; b=MUtEspMWDZXf0D
	TD5fMWcw2wFmhXreUYUz3pE57DCV+RQCS1PDPfa63+jp4yRIOVaNE3Bvw28KQBekDiUWE15h8sFmo
	Tky4uRWpk2lrDhq85ZLnGkiWZe4eQB0NdkmXl2ClcnZIPyw9MQqd5dZzNAzh1xF1Tq4w/Ok/TuHXa
	BFwBKKD9n/eLIicd6fFgA8HfZCndRF465FJVewogPHeSJXUCRAT0t+Vhz88eHmcVz5cttK9UU+YBq
	Ipw8TsX/660daB9+jipSp0tABU5M51/ErrboXnSqRyyy8ApS1Mrcxubzo0gjXDuoHYic1JcUzN2Kb
	Jj/fu914RTmVPkK0L1Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1RvH-00AMKh-0L;
	Tue, 23 May 2023 13:19:31 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1RvE-00AMJA-0V
	for linux-mtd@lists.infradead.org;
	Tue, 23 May 2023 13:19:29 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5619032c026so93963387b3.1
        for <linux-mtd@lists.infradead.org>; Tue, 23 May 2023 06:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684847963; x=1687439963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/y8I9Pv/4V6YStWX5R2hWIwO0b0qZb/p+qZFG9UP80A=;
        b=OIvUK9YMalUppxB8kSu51gObJXvRPS5kRx5ma9aApqEDi59LWrpN5QR7NZohdMM/Z9
         CvKp4N1eOkMX5MA0EPbt5dxeCJqZ8ZRAGq9hG3m1x6Q7CIWML9Zi6pjn0Gwxc0UFOxZo
         KoNv9t0GuZ2wXhQZTfDS1b0gzjoLY9VqGwrozfdW9980ADGshUzbRh/v586Hfc2ZcJvd
         niF/iW4URNhQNhkQs0DwahCAvxMHM0wPFrQ6ZaEt5SibaffLRD/qt3wZLTriyJ3PhPNL
         xSY+/V1cJfM25Iaf5FuAtIY0Ns++qV/NaTMUB4YyXxolaGvnAwS7ovbUofRHQUvjU1ID
         yZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684847963; x=1687439963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/y8I9Pv/4V6YStWX5R2hWIwO0b0qZb/p+qZFG9UP80A=;
        b=DP6fOyrC2dD6x8gEG2wFJhg6Hzp3AR9EtABDu+F0Wm+LeZMamVFO85BGXrnHl/4Wvp
         3wGst2ZZNxJ5vWu/pLjpqv99TKbh6M4UNSCxw7PF5H4HmZnhUfCvdFZYLDEvseOaGZOR
         JQKe2zy8j41nZwzZ+Ab9ynh83JFx51mnL/CJQqGGiGIXShD2tPVSeQ//jucjMrRkEtZU
         7FV6PslycqQh4bh9YCrmDKv/XU+x9tjs2NlhNL40bOXLG1ZTMOIL0uQ1kX6qygvwL7Qu
         ZpM4MTTlwwL0nrJ5A8dSCj0wtgJeXbtMOkOAymde6gSBLD7wJKdFVuvDGdIePfV82Hv8
         KIyw==
X-Gm-Message-State: AC+VfDwK/enWUfHPVFFCb62CbIUhhF+EseXK4BB/ykZu+nV07QOONoLA
	Q0oBOHPrbeBAIns+ajDIylh9XaBOMN+z9gKRPVj5JA==
X-Google-Smtp-Source: ACHHUZ4W3lqcYsC4MLnVzY16h0UOyn1i5YCHe1kXkQgAhuKadsLr0wsFOnpwCZsNgNSeBC25L/8YDjH3irN6ShXY8Q4=
X-Received: by 2002:a0d:cb16:0:b0:561:a80b:6647 with SMTP id
 n22-20020a0dcb16000000b00561a80b6647mr13906047ywd.45.1684847963644; Tue, 23
 May 2023 06:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230506-seama-partitions-v1-0-5806af1e4ac7@linaro.org>
 <20230509093129.40b30c7a@xps-13> <CACRpkdYLZ36Ad5y7qLUTFix6yx=jBQ=ZvxaB9U-fhqQ_fvvXCQ@mail.gmail.com>
 <20230522164559.6c599c61@xps-13>
In-Reply-To: <20230522164559.6c599c61@xps-13>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 May 2023 15:19:12 +0200
Message-ID: <CACRpkdan-iG9po88btAndwTz_VRu0ccUAQDxyZeoBH1jCumUJQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add SEAMA partition types
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_061928_193573_86C85358 
X-CRM114-Status: GOOD (  23.21  )
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

T24gTW9uLCBNYXkgMjIsIDIwMjMgYXQgNDo0NuKAr1BNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiA+IFRoZSBtdGRzcGxpdCBjb2RlIHVzZXMgZGlm
ZmVyZW50IG1hZ2ljIG51bWJlcnMgdG8gaWRlbnRpZnkgd2hlcmUKPiA+IHRoZSBkaWZmZXJlbnQg
cGFydGl0aW9ucyBzdGFydC4KPgo+IElzIG10ZHNwbGl0IGFjdGluZyBvbiBhIGRldmljZSBvciBv
biBhIHBhcnRpdGlvbj8KCkl0IGFjdHMgb24gYSBwYXJ0aXRpb24sIHVzdWFsbHkgeW91IHVzZSBh
IGZpeGVkLXBhcnRpdGl0aW9uIHNjaGVtZSB0byBwb2ludApvdXQgdGhlIGRpZmZlcmVudCBjaHVu
a3MgaW4gdGhlIGZsYXNoIGFuZCB0aGVuIG10ZHNwbGl0IGNvbWVzIGluIHRvCmRvIGl0cyBqb2Iu
Cgo+IFJpZ2h0IG5vdyB5b3UgZGVmaW5lCj4gYSBwYXJ0aXRpb24gdG8gYmUgY29tcGF0aWJsZSB3
aXRoIHNlYW1hLCBJIHdvdWxkIGhhdmUgaW1hZ2luZWQgdGhlCj4gcGFydGl0aW9ucyBjb250YWlu
ZXIgc2hvdWxkIGJlIGNvbXBhdGlibGUgd2l0aCBzZWFtYSBpbnN0ZWFkIG9mCj4gZml4ZWQtcGFy
dGl0aW9ucywgYnV0IEkgaGF2ZW4ndCBsb29rZWQgYXQgdGhlIHdob2xlIGltcGxlbWVudGF0aW9u
LCBzbwo+IG1heWJlIG15IGNvbW1lbnQgaXMganVzdCB3cm9uZy4KClRoZSBOQU5EIGZsYXNoIG9u
IG15IGRldmljZSBuZWVkcyBpdCB0byBiZSBhIHBhcnRpdGlvbiwgaXQgbG9va3MKbGlrZSBzbzoK
CiZuYW5kY3MgewogICAgICAgIC8qIFNwYW5zaW9uIFMzNE1MMDFHMiwgMTI4TUIgd2l0aCAxMjhL
QiBlcmFzZSBibG9ja3MgKi8KICAgICAgICBwYXJ0aXRpb25zIHsKICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAiZml4ZWQtcGFydGl0aW9ucyI7CiAgICAgICAgICAgICAgICAjYWRkcmVzcy1j
ZWxscyA9IDwxPjsKICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDE+OwoKICAgICAgICAg
ICAgICAgIGZpcm13YXJlQDAgewogICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0g
InNlYW1hIjsKICAgICAgICAgICAgICAgICAgICAgICAgbGFiZWwgPSAiZmlybXdhcmUiOwogICAg
ICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwMDAwMDAwMCAweDA4MDAwMDAwPjsKICAgICAg
ICAgICAgICAgIH07CiAgICAgICAgfTsKfTsKClRoZSByZWFzb24gaXMgbWFpbmx5IHRoYXQgb3Ro
ZXIgZGV2aWNlcyBtYXkgcHV0IGVyYXNlYmxvY2tzCmFzaWRlIGZvciBvdGhlciB0aGluZ3MsIGFu
ZCB0aGUgU0VBTUEgZm9ybWF0IGl0c2VsZiBkb2VzIG5vdAprbm93IGl0cyBleHRlbnRzIChpdCBu
ZWVkcyB0byBiZSB0b2xkIHdoZXJlIHRoZSBlbmQgb2YgdGhlCnBhcnRpdGlvbiBpcykuCgo+ID4g
T25lIHN1Y2ggdHlwZSBvZiBwYXJ0aXRpb24gaXMgc2VhbWEsIHNvIHRoZSBjb2RlIG5lZWRzIHRv
IGtub3cKPiA+IHRoYXQgaXQgc2hvdWxkIGxvb2sgZm9yIHNlYW1hIG1hZ2ljIHRvIGRldGVybWlu
ZSB0aGUgc2l6ZSBhbmQKPiA+IHNwbGl0IHRoaXMgcGFydGl0aW9uIGluIGEga2VybmVsIGFuZCBy
b290ZnMgcGFydC4gVGhpcyBpcyB0aGUgY29kZToKPiA+IGh0dHBzOi8vZ2l0Lm9wZW53cnQub3Jn
Lz9wPW9wZW53cnQvb3BlbndydC5naXQ7YT10cmVlO2Y9dGFyZ2V0L2xpbnV4L2dlbmVyaWMvZmls
ZXMvZHJpdmVycy9tdGQvbXRkc3BsaXQ7aD0zZTBkZjg1NjcxM2E4NGIxZGVjZjE3MTkwZjE3MWNi
MTBjZTdhNzU3O2hiPUhFQUQKPgo+IFRoYXQncyB2ZXJ5IGluZm9ybWF0aXZlLCB0aGFua3MgZm9y
IGFsbCB0aGUgY29udGV4dC4gSSBiZWxpZXZlIHRoaXMKPiBjb3VsZCBhY3R1YWxseSBiZSBwYXJ0
IG9mIHRoZSBiaW5kaW5nIGRlc2NyaXB0aW9uIChub3QgdGhlICJ0aGlzIGlzIGFuCj4gb3BlbldS
VCBzdHVmZiIsIG9mIGNvdXJzZSkuCgpIbSBJJ2xsIHRoaW5rIGFib3V0IHdoYXQgSSBjYW4gcHV0
IGluIHRoZXJlLi4uCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
