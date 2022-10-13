Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2B4C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Oct 2022 22:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L2Cg9PE5WfpXnG+UwWKoQFN3vnQi09JfdRIMcHWp8js=; b=TlQXcjHIp3UYdD
	Sl8vAL+F5Mi58hfhwAnZt0cGJDGajQq5vgNdFoAWKpoAvMXAKOr9XUtad/QaQGJHeseHdJF7bzKjh
	SeB/iNuzBnL+tjNpaLRscRl6vA+3xPSuEaaeQkXLYqezcfUnBUJalqnW3mXkO99eMgTog6P5FAkXo
	+Wg2n7j+iRcT3neUSxnXZjN15swGxEYd9EevIg5NP61DpgFHrTMp2LPzaEKybjdchGJp83qls9Buk
	YuMgPa8CeNqmQ7dlQ3GMg5mYXWO1PN1Rv7u+qASvquBTCpF39XX1ZAK4M0iDJZyKq3mZ3Oc/NE3Ye
	UDxj9Wpi6iVGfd1N972Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj6jH-00D6Cd-Kr; Thu, 13 Oct 2022 22:31:03 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj6jE-00D6CI-S8
	for linux-mtd@lists.infradead.org; Thu, 13 Oct 2022 22:31:02 +0000
Received: by mail-lj1-x22a.google.com with SMTP id j23so4010910lji.8
        for <linux-mtd@lists.infradead.org>; Thu, 13 Oct 2022 15:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cio19eOorEpvC0IXTz19MRWiUl8flOGKJqR6efzpLpU=;
        b=EmILxCB7hEHCT0phtbWECct4UOAJS+2Bl4fvzOJIzlr8ApCs9+rg0olOVhNoonV99m
         mEGnCdEDMcZbOAMXvoqklhZNeR9m3tg6kfhBE/Lpupnn3oyH0Bi4WguENMzzxwDLfoQL
         EoK/1LnkDJ8tKqVcaA/6IPVIWxBlsQ+NNFkmiDhiWXE2N5vrp9oaCfuFKhFSmGop4zao
         Kq7+Y3z81fiHupANJUEcSNN4GzWdxYyb5HXGWjtSGtZvfKd3/KFhVdxehsTi3sZui1z9
         vPBiusAMLViYw///lbuyNIympWbr+N/wvI62RP8/FS7nlXII3Xc3ARDvl5HZhEN505FV
         omVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cio19eOorEpvC0IXTz19MRWiUl8flOGKJqR6efzpLpU=;
        b=XS8NpEuSHod1A0RhNfWCKAhkjBZbRH+FQ+kokZcuMqrlUzJQFpIpQDh8V6EQPHYznz
         s97RvgIXu3Hxu7AQANkhTeT1ZCXYmfyOyyLlNBtJrDpeUJGdcRvH0++RlVKSvCl+4rDx
         T9VuOmpiUTLaj8bw3ZYrFNsBAtu6zrrn+7rhwJ/t/pn/qRl1v5UDy7gapu7GwBUlbyEr
         96loW+0ELihxYOClxBbyzPcecThwN0DAvUMuGUM5JX8nR7Y4h83+2ENXuSIoxHnz4Obo
         Ab0wiff+HAozm+4JKI3z78lezRVe7YCkxamwKPF8jl5gyG2njKVMTVWIoXlZkIISSQFK
         ijFA==
X-Gm-Message-State: ACrzQf390syQDj9Zx+WbTLqRQi+7Hzncmy5xg027ViJ/BTlJY1TAdFmZ
	nuf93frc/EwwSxd7PA2NYeI6sQ==
X-Google-Smtp-Source: AMsMyM76zcA4W3LOD0wO4IEy5AOIbQzdxAjCr1SnDV0b6lYIaoe9cxNPGh9vLGnQAon1Q3ggS0bIrg==
X-Received: by 2002:a05:651c:88:b0:26d:fab0:3269 with SMTP id 8-20020a05651c008800b0026dfab03269mr755066ljq.193.1665700257945;
        Thu, 13 Oct 2022 15:30:57 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id u7-20020ac24c27000000b0049ad315cfc3sm83296lfq.162.2022.10.13.15.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 15:30:57 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH] mtd: parsers: bcm47xxpart: Fix halfblock reads
Date: Fri, 14 Oct 2022 00:28:55 +0200
Message-Id: <20221013222855.2384881-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_153100_972378_A2D33273 
X-CRM114-Status: GOOD (  15.28  )
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
IFJhZmHFgiBNacWCZWNraSA8emFqZWM1QGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogTGludXMg
V2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvbXRkL3BhcnNl
cnMvYmNtNDd4eHBhcnQuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9wYXJzZXJzL2JjbTQ3
eHhwYXJ0LmMgYi9kcml2ZXJzL210ZC9wYXJzZXJzL2JjbTQ3eHhwYXJ0LmMKaW5kZXggNTBmY2Y0
YzIxNzRiLi4xM2RhZjliZmZkMDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL3BhcnNlcnMvYmNt
NDd4eHBhcnQuYworKysgYi9kcml2ZXJzL210ZC9wYXJzZXJzL2JjbTQ3eHhwYXJ0LmMKQEAgLTIz
MywxMSArMjMzLDExIEBAIHN0YXRpYyBpbnQgYmNtNDd4eHBhcnRfcGFyc2Uoc3RydWN0IG10ZF9p
bmZvICptYXN0ZXIsCiAJCX0KIAogCQkvKiBSZWFkIG1pZGRsZSBvZiB0aGUgYmxvY2sgKi8KLQkJ
ZXJyID0gbXRkX3JlYWQobWFzdGVyLCBvZmZzZXQgKyAweDgwMDAsIDB4NCwgJmJ5dGVzX3JlYWQs
CisJCWVyciA9IG10ZF9yZWFkKG1hc3Rlciwgb2Zmc2V0ICsgKGJsb2Nrc2l6ZSAvIDIpLCAweDQs
ICZieXRlc19yZWFkLAogCQkJICAgICAgICh1aW50OF90ICopYnVmKTsKIAkJaWYgKGVyciAmJiAh
bXRkX2lzX2JpdGZsaXAoZXJyKSkgewogCQkJcHJfZXJyKCJtdGRfcmVhZCBlcnJvciB3aGlsZSBw
YXJzaW5nIChvZmZzZXQ6IDB4JVgpOiAlZFxuIiwKLQkJCSAgICAgICBvZmZzZXQgKyAweDgwMDAs
IGVycik7CisJCQkgICAgICAgb2Zmc2V0ICsgKGJsb2Nrc2l6ZSAvIDIpLCBlcnIpOwogCQkJY29u
dGludWU7CiAJCX0KIAotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
