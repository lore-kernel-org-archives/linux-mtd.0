Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F365C636CD
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Jan 2023 08:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CwUixB0bvhkwhIOMKIeZ5h8xYBKbN9zE4IfIJ0cSoGs=; b=OKG8LHC7320FJa
	qW+JzKdnmZQJhlyV+PGr8ATZ72bQZWv1ZieHUvj3A82npYi2HvEGG6fyZJvTR5wGMjCsTjjaci5Vv
	cxCA5je57Up+92M+7KylzfwWulPjDxDLUTDOIn/NpVrH7Dnq6PUuhHbtknUUxrfPXRpNSjD5Wj0l2
	hFMnYOwg0iNCudWGc/+VDfc2qJg9s0H70FIuUphPVDZRKoua09kWotgdRYhSQqU0gzN/jSQWM6oyI
	kkdeeZW9nQoCDwZVGhhyahute8cvTDou6KMRu8noo1K+6BLcbFrucK9WsTeVi38SF0pbQJlEv1a8O
	tyaazdyuGHck8S+hFPTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMmTO-006sC8-Gm; Tue, 31 Jan 2023 08:58:38 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMmTL-006sAq-RA
	for linux-mtd@lists.infradead.org; Tue, 31 Jan 2023 08:58:37 +0000
Received: by mail-ej1-x632.google.com with SMTP id m2so39064221ejb.8
        for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2023 00:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CAJfnR6fa3MBsUu3iXXYgokOOtyOI7KhZSRkynFniHg=;
        b=JkTkS+2rjbNOSlZiA3zAqBj7mmSK37oNiNJoq6N0ed+a5XQQtJRCjYutzP8GgcQvIc
         xbNwteWMV1Hy2wadM1Xh7zckRxLzuuL5qFEMpzCEPN+lIKHpKly5knwZnZHnC2c7HS3s
         9TEMPSALr+AspEDIpl7O46lTHjlGtUh2rFh06QM0qcixBJmOONLCNuxfZimfLSWg1q8p
         IjHYPCH0qK6quQ/H9L0Y4hWIRIuWiCGcyCUQNq5U0lGDLq13d+JR3kyi4JnCk5upym15
         LY1oKim+jL4c5vVMpONhEOG+Dr7D4h7dcBeO/GmH7yG2wYf7RPCS6+C+QYvjfYkWVnxX
         oxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CAJfnR6fa3MBsUu3iXXYgokOOtyOI7KhZSRkynFniHg=;
        b=ZFiarLaK0wz0KLMBM0dN0GHSPSqIeAyJcBQ7DpI/X1ACjcRy1QCbvuA9YmBN+0goel
         0s42iZ+ujGKz5dcQTjvs+tHEX9rbOhzoxLw8vtbS23mpRdhmg5NqEaOTtPNDRLwh83JB
         kGzoULdZQR86az2cANCTpRQ7bkke/kZJfTmIOvFdu6sekYIXgPYHcvzGQasG76/0Ktqp
         XmWj2p3hSYLnIh8X2VG9mlFRjueNZymeqqmmT8Gl0hhdwFleCwe0T68GVhYZwncBV33x
         uHpRWQfmPpoQVVZF8oRYqLX98iswdftSfb8hLOU2lh2ayhb0lqg64zfrwi+PtFxEN0Ib
         +K7w==
X-Gm-Message-State: AO0yUKXMgwiqHE5BpBERKBaj9coubzvGrv892v6AvTRrIk3iSta4aP1t
	zBwVmAqJ8ka3bra0qBtF+tg7qrLiOy8q0366
X-Google-Smtp-Source: AK7set+2tG9/pHS/JAaPaeSjIod59bnjV7G4qPj/Wdlonz5su46y+RDgsBF6WUH/ANgRvtkh6y7fvw==
X-Received: by 2002:a17:906:b812:b0:880:3129:d84a with SMTP id dv18-20020a170906b81200b008803129d84amr13866531ejb.60.1675155511617;
        Tue, 31 Jan 2023 00:58:31 -0800 (PST)
Received: from [192.168.2.104] ([79.115.63.122])
        by smtp.gmail.com with ESMTPSA id c7-20020a170906d18700b00871f66bf354sm7989817ejz.204.2023.01.31.00.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 00:58:02 -0800 (PST)
Message-ID: <9e9a080b-62d7-38ef-b8cc-53a9eb70b130@gmail.com>
Date: Tue, 31 Jan 2023 10:57:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH -next] mtd: spi-nor: core: fix implicit declaration
 warning
To: Zeng Heng <zengheng4@huawei.com>, tudor.ambarus@microchip.com,
 pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, liwei391@huawei.com
References: <20220923031457.56103-1-zengheng4@huawei.com>
From: Tudor Ambarus <tudor.ambarus@gmail.com>
Content-Language: en-US
In-Reply-To: <20220923031457.56103-1-zengheng4@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_005835_916656_5784D620 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
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

CgpPbiAyMy4wOS4yMDIyIDA2OjE0LCBaZW5nIEhlbmcgd3JvdGU6Cj4gc3BpLW5vci9jb3JlLmMg
bmVlZHMgdG8gaW5jbHVkZSBsaW51eC9kZWxheS5oLAo+IG9yIGl0IHdvdWxkIHJhaXNlIGJlbG93
IGNvbXBpbGUgd2FybmluZzoKPiAKPiBkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYzogSW4gZnVu
Y3Rpb24g4oCYc3BpX25vcl9zb2Z0X3Jlc2V04oCZOgo+IGRyaXZlcnMvbXRkL3NwaS1ub3IvY29y
ZS5jOjI3Nzk6MjogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmHVz
bGVlcF9yYW5nZeKAmSBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiAg
IDI3NzkgfCAgdXNsZWVwX3JhbmdlKFNQSV9OT1JfU1JTVF9TTEVFUF9NSU4sIFNQSV9OT1JfU1JT
VF9TTEVFUF9NQVgpOwo+ICAgICAgICB8ICBefn5+fn5+fn5+fn4KPiAKPiBGaXhlczogZDczZWU3
NTM0Y2M1ICgibXRkOiBzcGktbm9yOiBjb3JlOiBwZXJmb3JtIGEgU29mdCBSZXNldCBvbiBzaHV0
ZG93biIpCj4gU2lnbmVkLW9mZi1ieTogWmVuZyBIZW5nIDx6ZW5naGVuZzRAaHVhd2VpLmNvbT4K
CkFwcGxpZWQgdG8gZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L210ZC9saW51eC5naXQsIApzcGktbm9yL25leHQgYnJhbmNoLgoKVGhhbmtzLAp0YQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
