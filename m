Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3B8C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/mM1TdSI2PLPj2LoDMOC/pphqvNBNRqk0rnqu6dl80M=; b=AGhvM5ZcfKN6t+
	FZ9/dd5Ycj8HuHCyol/rQ/Pvw7UuTirwnIb6wvALrg827lbYLS9oIF8cZoS4cjV/kvofidBYqA+/x
	48SP1Jvuo+haNl1OjdctkKUmU4P5q+3xO3n8gYBGpZD2Zm70iwX92aC+hWRAfR4LPKNqavZpJqy6p
	wDIOlGySPwobpqkhJuuTB9lajYBW2fPdo22iXIRFJrxI7dxaSeo71wCsLJ7FOo+ABc/oOSviKqYA1
	zW/4RB1zhotrTC0PP/XNbicpOU+WGjzBQslj0bJpOaXB0ZkpD5rojuB2iziaXXZDWSraJjJfpSx0P
	mbSzXqhctNtQkyWSRZAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okidR-004lUQ-HG; Tue, 18 Oct 2022 09:11:41 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okidO-004lQa-1H
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:11:39 +0000
Received: by mail-lf1-x129.google.com with SMTP id b2so21507485lfp.6
        for <linux-mtd@lists.infradead.org>; Tue, 18 Oct 2022 02:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hs5kolKpC/C8pusTeJANmsAcelkkPgG9+Ckh4D5mS3U=;
        b=cQ8VS/TMzJ1bSVnAog0nYXSe/HvTh2YhN3SDM1Scm7eOWSVxvVpxkFkmlo251b4uZe
         o58JpQozt15w1GWyyRhgQla9SHsqzbF34bVct1r16gTPQZVBLH6Y4aFn44JeP0hvqb2z
         sZtTzv7AMV0Ovc9PX8NqqnQEdVHtHsVJupNkFBGQ76niK/RwG4FigCN0yQ6SZJEcz8x/
         KGuxDhdMZN17yLgrw6XACbIesW5gBphTFZksraIq0pl+DLpUW0ub69Bu29YU8x3/HAnp
         GO1yyNPPyNZoEIfEYjWJYGwYlT+5Nz8d8VMDCBe1mIbjMVpQkRMXyGPZhwxKZT8UHxUF
         3IVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hs5kolKpC/C8pusTeJANmsAcelkkPgG9+Ckh4D5mS3U=;
        b=jeESIm9pclGwdn4v3MIpXrlkmfRpn9IWsSfHrmJNKMNCmDy9752tx7DY+cKizm///6
         TBiUittMd9iPfmkxR9hcd8YTdivS2CBhf9cnegg6WWZTyAedo5BufidzVfnROARA48P/
         2Sri9pPjKMyYUqb7WJFG8Q+EVoEz0L3UkwzRW8NPyxBqT1OoQLowPxkTMJv86Ur9IiKu
         mmAV/FrBO7mGWEJJpIIUw8l7MwBCMWXI0Evc2OCDwHp58+iRPZaptXvF5OmYX9O8UX8L
         SGarl0yIzW8ZW4NKF4ooN1rvarzlCK5d1XaYEOpxGDjx1OHamrYGKlJjRt+nXoTP3a/p
         8VFQ==
X-Gm-Message-State: ACrzQf3kpKJ36Y/Fk1rHh6JyT5w+x4BnGUPer+CReL9ngCQiCEQd7Y3Z
	+UMYc3as3rNzIhlWXQ2c0Rz9Ww==
X-Google-Smtp-Source: AMsMyM7/KXg0yRfat7BbX8yGSAD6lyPNmkWy2TyM/wLC6fRxC6XiC7foevIFxBb/6zZQd41MqOcRew==
X-Received: by 2002:a19:ac04:0:b0:49a:7253:4a68 with SMTP id g4-20020a19ac04000000b0049a72534a68mr700876lfc.322.1666084293321;
        Tue, 18 Oct 2022 02:11:33 -0700 (PDT)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id k15-20020ac24f0f000000b00498fc3d4d15sm1772701lfr.190.2022.10.18.02.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 02:11:32 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	stable@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v2] mtd: parsers: bcm47xxpart: Fix halfblock reads
Date: Tue, 18 Oct 2022 11:11:29 +0200
Message-Id: <20221018091129.280026-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_021138_127121_42AE833A 
X-CRM114-Status: GOOD (  16.29  )
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

VGhlcmUgaXMgc29tZSBjb2RlIGluIHRoZSBwYXJzZXIgdGhhdCB0cmllcyB0byByZWFkIDB4ODAw
MApieXRlcyBpbnRvIGEgYmxvY2sgdG8gInJlYWQgaW4gdGhlIG1pZGRsZSIgb2YgdGhlIGJsb2Nr
LiBXZWxsCnRoYXQgb25seSB3b3JrcyBpZiB0aGUgYmxvY2sgaXMgYWxzbyAweDEwMDAwIGJ5dGVz
IGFsbCB0aGUgdGltZSwKZWxzZSB3ZSBnZXQgdGhlc2UgcGFyc2UgZXJyb3JzIGFzIHdlIHJlYWNo
IHRoZSBlbmQgb2YgdGhlIGZsYXNoOgoKc3BpLW5vciBzcGkwLjA6IG14MjVsMTYwNmUgKDIwNDgg
S2J5dGVzKQptdGRfcmVhZCBlcnJvciB3aGlsZSBwYXJzaW5nIChvZmZzZXQ6IDB4MjAwMDAwKTog
LTIyCm10ZF9yZWFkIGVycm9yIHdoaWxlIHBhcnNpbmcgKG9mZnNldDogMHgyMDEwMDApOiAtMjIK
KC4uLikKCkZpeCB0aGUgY29kZSB0byBkbyB3aGF0IEkgdGhpbmsgd2FzIGludGVuZGVkLgoKQ2M6
IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKRml4ZXM6IGYwNTAxZTgxZmJhYSAoIm10ZDogYmNtNDd4
eHBhcnQ6IGFsdGVybmF0aXZlIE1BR0lDIGZvciBib2FyZF9kYXRhIHBhcnRpdGlvbiIpCkNjOiBS
YWZhxYIgTWnFgmVja2kgPHphamVjNUBnbWFpbC5jb20+CkNjOiBGbG9yaWFuIEZhaW5lbGxpIDxm
LmZhaW5lbGxpQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMu
d2FsbGVpakBsaW5hcm8ub3JnPgotLS0KQ2hhbmdlTG9nIHYxLT52MjoKLSBBZGQgc29tZSBmaXhl
cyBhbmQgc3RhYmxlIHRhZ3MuCi0tLQogZHJpdmVycy9tdGQvcGFyc2Vycy9iY200N3h4cGFydC5j
IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3BhcnNlcnMvYmNtNDd4eHBhcnQuYyBiL2RyaXZl
cnMvbXRkL3BhcnNlcnMvYmNtNDd4eHBhcnQuYwppbmRleCA1MGZjZjRjMjE3NGIuLjEzZGFmOWJm
ZmQwOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvcGFyc2Vycy9iY200N3h4cGFydC5jCisrKyBi
L2RyaXZlcnMvbXRkL3BhcnNlcnMvYmNtNDd4eHBhcnQuYwpAQCAtMjMzLDExICsyMzMsMTEgQEAg
c3RhdGljIGludCBiY200N3h4cGFydF9wYXJzZShzdHJ1Y3QgbXRkX2luZm8gKm1hc3RlciwKIAkJ
fQogCiAJCS8qIFJlYWQgbWlkZGxlIG9mIHRoZSBibG9jayAqLwotCQllcnIgPSBtdGRfcmVhZCht
YXN0ZXIsIG9mZnNldCArIDB4ODAwMCwgMHg0LCAmYnl0ZXNfcmVhZCwKKwkJZXJyID0gbXRkX3Jl
YWQobWFzdGVyLCBvZmZzZXQgKyAoYmxvY2tzaXplIC8gMiksIDB4NCwgJmJ5dGVzX3JlYWQsCiAJ
CQkgICAgICAgKHVpbnQ4X3QgKilidWYpOwogCQlpZiAoZXJyICYmICFtdGRfaXNfYml0ZmxpcChl
cnIpKSB7CiAJCQlwcl9lcnIoIm10ZF9yZWFkIGVycm9yIHdoaWxlIHBhcnNpbmcgKG9mZnNldDog
MHglWCk6ICVkXG4iLAotCQkJICAgICAgIG9mZnNldCArIDB4ODAwMCwgZXJyKTsKKwkJCSAgICAg
ICBvZmZzZXQgKyAoYmxvY2tzaXplIC8gMiksIGVycik7CiAJCQljb250aW51ZTsKIAkJfQogCi0t
IAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
