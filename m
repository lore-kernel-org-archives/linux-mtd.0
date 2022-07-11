Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E074C43334
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Jul 2022 09:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IKRpv2V9G//cuqxCv0VNN4soTHwp0oA0vWyokRhq/lQ=; b=GJWrcDObLPRPKU
	aT/QkfVLZLFO0fuZmI+eb/4Gm6Ziid90TFtu4tnlaSKh2iJ7p+WXf8K9JW3OkaLhTdGEV8HmjNbcw
	+DnEnmmzFPVJtY5Ip4wD3+L2D+tLR0vdYDTzQX1JP/grincTvj+/g92M8KzWCMfhOtFtxiIT1nxXY
	MaHwzuG2vwRJIoSyi9hwqaICBsfqbFA422O4KKv75D4T5UfaLCC6It5Hclfawoyj4A/Yo50YjURL2
	xE4g6FZU5Xjnr5QvLjk/Vcj2KomYhdOHgAKkpSIlEWQCXdiwNlJWoaPyvY/pukCz/NcodHq0hkFwL
	HWjyiPfdO4Z2YVilaJ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oApz3-000Hr7-Gp; Mon, 11 Jul 2022 09:45:41 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oApyy-000HkQ-T9
	for linux-mtd@lists.infradead.org; Mon, 11 Jul 2022 09:45:39 +0000
Received: by mail-ej1-x62b.google.com with SMTP id oy13so3009681ejb.1
        for <linux-mtd@lists.infradead.org>; Mon, 11 Jul 2022 02:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=Bq2HHms6AYgHYGDCtfqbJZ7y5sZjzAQdQH1EkzM9C18=;
        b=BP4Ycps/+/wZY3T+hDjZzSfcDf8B6Vcj52YP4do07cxYU/MIvWJFXARFkNKu8yzrjE
         9ruDzC5O4zeVYjPc8RL6X/zjJm8N5lHdRKrGBTqT628ldG7Wx47IMorHTVDaaoaWKHsA
         r/9bD0J8hIrnY4Kyx374fRP4LOrwTO/PuKTyEiUTpQ+sigRgDThXOxQVaK8CDgZeGZLd
         EzLOitxJzYTBLtNLg/BtRMUJDlszhJSNdVRtHcLukKkR64ZG7nrG2DJPuDa2MHwDtn41
         e7z2YM4BMdt1j1UxzzWuumbjckhOHsjTa8bkJrV2kPDs3pLvRclJTvj83jKawmytGGoV
         axsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Bq2HHms6AYgHYGDCtfqbJZ7y5sZjzAQdQH1EkzM9C18=;
        b=4d9JTgcIwuZFAE3jrpy4pYjnXKWCVtYL5+HI8IvXgeXh1o/3in3S9bcRPZHYL4kNVI
         yrActUevUcvmlvcJQxyDu9sloNc3IzJL1mWMJvc5ipZsqyILVnPL6buk8bi2h+CHkJIH
         Ew9dRO4fXc4inBzjKKZXJ5wCjcU3J17bO7mJFCnySJeOCP95fzL41UgEoHcGWG1vMxud
         E7qu19RMkfaI3yIqaTlOSMfNdesmPcdu7UCzPRC3mLE/8iBfQ4StDo+OYw8Iz+mECID3
         Bx/iJXKxYvrW9oTE7zRMtY3WurJasvGPj0mbkibwQbsjAOKpou0jF7nfdlcrifWMYjAz
         P6eg==
X-Gm-Message-State: AJIora9SvXYs5jTr1gu59yCpCjVmYJugehPcdZSik2kJDnR6yqOCx3uz
	TSsh+6wvZENwqSbG+QBGzE0=
X-Google-Smtp-Source: AGRyM1vYBH95BozWGJApIreWVYlsZ+VPPmSFqDn5RZ59CFWM0nvVAya69sLzRyBqmFepa7yhqyaYzg==
X-Received: by 2002:a17:907:2895:b0:72a:ed50:f0e8 with SMTP id em21-20020a170907289500b0072aed50f0e8mr17707404ejc.392.1657532731925;
        Mon, 11 Jul 2022 02:45:31 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id s20-20020a05640217d400b0043a64eee322sm4049161edy.28.2022.07.11.02.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 02:45:31 -0700 (PDT)
Message-ID: <a6cafdd0-b995-e1b5-c8ad-21cb6d935b83@gmail.com>
Date: Mon, 11 Jul 2022 11:45:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH 2/2] mtd: core: find OF node for every MTD partition
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: ansuelsmth@gmail.com, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20220707163607.20729-1-zajec5@gmail.com>
 <20220707163607.20729-2-zajec5@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20220707163607.20729-2-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_024536_975539_00E7467F 
X-CRM114-Status: GOOD (  11.70  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gNy4wNy4yMDIyIDE4OjM2LCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4gRnJvbTogUmFmYcWC
IE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IAo+IERvbid0IGxpbWl0IHRoaXMgZmVhdHVy
ZSB0byB0aGUgIm52bWVtLWNlbGxzIi4gVGhlcmUgYXJlIG1vcmUgY2FzZXMgdG8KPiB0aGlzLgo+
IDEuIER5bmFtaWMgcGFydGl0aW9ucyBtYXkgbmVlZCB0byBiZSBoYW5kbGVkIHdpdGggcGFyc2Vy
cwo+ICAgICBUaGlzIGFwcGxpZXMgdG8gImZpeGVkLXBhcnRpdGlvbnMiIHBhcnNlciBhbmQgYWxs
IGN1c3RvbSBvbmVzLgo+IDIuIER5bmFtaWMgcGFydGl0aW9ucyBjYW4gYmUgaGFuZGxlZCB3aXRo
IHNwZWNpZmljIGRyaXZlcnMKPiAgICAgQ29uc2lkZXIgInUtYm9vdCxlbnYiIGFzIHNwZWNpZmll
ZCBpbiB0aGUgdS1ib290LGVudi55YW1sLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWC
ZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KClRoaXMgY29kZSBuZWVkcyBtb3JlIHdvcmssIHBsZWFz
ZSBkcm9wIHRoaXMgcGF0Y2hzZXQgZm9yIG5vdy4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
