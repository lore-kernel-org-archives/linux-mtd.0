Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E12C7EE2F
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 15:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u2vQeALVMc7nTxfY5MV8BGJox8Uv9tq1TTORj++khPo=; b=3BJRPC6rD7gpd4
	iwLa35f3DaOXoBBko+8w2/tXloKNU/Jtk32zF30moOjz5K0PMnlC9aHN05KpKY5F78Xj4AI00mYrT
	kDSDdRu9WOHaDF6sRU+X3Mpxdp5xR1PGsVGDfkEYNyuQY4Wro8qROo+TsX0whxDKSDmpvSy1df5Kd
	BBWP6jduA4r5rh8JgPkS8PZ19XYloF5U4PTPYQP+Yc8JME7kiefUcdj4VegybwyA8ql5oW9HdMNti
	A8xZ5hKmXUoiQwpdbou23JVgy9lRFQBMPowHx7XOkRx3DpiVGIeaSR96feaDHgNJsM0IIZBTvZChs
	RXk5sA3S0doFiTnKua1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8j2Y-004O9g-1G;
	Mon, 12 Jun 2023 15:01:06 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8j2V-004O7p-2j;
	Mon, 12 Jun 2023 15:01:05 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-977d6aa3758so814067066b.0;
        Mon, 12 Jun 2023 08:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686582061; x=1689174061;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrjIaSswtTyEY7Z8qdbgtXftw/wW1klcn/CpxmtkX3c=;
        b=MoV2QEdO3zATE97Mvg8ltny6qdqArDowpHJ8EY5BBTGq7VSxNV6B3GamkBWpiZS+8t
         stSc29yAUb4awRgsYYXV7YSTR9hZCQD9ak5fZVowQfL1PPN/nzvARWjoQBLbcSqAS6LG
         67fANOGUc/tNyL1WvzgzdIxUewkgq8pDTwkQagZ06TTqPTUQeLLTEbgI3I5hZlipXo42
         3yziw4GhShnQ6Lg/Cv/jlwjurvWNKnQgJhKXqym7acLF+NVH4fhZ7vSJ9nkhFjRdoRtY
         aj/DHXiXC0YDv7IPBdRpIWqujinu9a/yU4SzLooRU+h6TXBi8fqoC9fB53TWBjwSlXYJ
         zgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686582061; x=1689174061;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mrjIaSswtTyEY7Z8qdbgtXftw/wW1klcn/CpxmtkX3c=;
        b=QabSoLwXGtMgZ9IbieadQsXD0RRQYC3WeHv0aYL7diXNX+mKiwJkr3nTIxLO6VcJK8
         RUqtxIGa7aCSPg3xCeIsTlY3Yt5/EH79PdtjfBDOZQoiTEMX9biYp3BB4o3y9PcggEsi
         /F3W18SV46R/dGKsRQ28ic4nNjBKx5vqxDx1RAAFBwHgqxc6vdjGC55ezMS69j+8wUFA
         NxEFrqXGibg627Auc1f8N50FGmxCpnzfr6sqj7NBcQM5LhmFjrvoOhBO1rzX0b4GHIEP
         b8+qJLhyOR/Qfv6YUTR0PnR/2hjN1QjbKZoIjIUX0E7IakScwkBvnpeX/9cRpsfLUUYB
         tuBA==
X-Gm-Message-State: AC+VfDycn8qB48Cj9PCn7xXR3knWboP/foFPB81/S/fbSoVplTiQW7DS
	VPmi3bT4CjPgBqYq9Li790/Hkgd38Gw=
X-Google-Smtp-Source: ACHHUZ5blwfhznY7HEehsUI5LMmuOJwU7N2BdDI1xQ2Y0yJXTUUc4FAlxBZNIkv7qM1VODcBabS/9w==
X-Received: by 2002:a17:906:730b:b0:973:bcf6:1d4 with SMTP id di11-20020a170906730b00b00973bcf601d4mr11632209ejc.76.1686582060941;
        Mon, 12 Jun 2023 08:01:00 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id m3-20020a1709061ec300b00973f1cd586fsm5420857ejj.1.2023.06.12.08.00.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 08:01:00 -0700 (PDT)
Message-ID: <11e16c3b-6f7b-a6a9-b0ed-b7ac0cd703e3@gmail.com>
Date: Mon, 12 Jun 2023 17:00:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v2 0/5] Fixes for Rockchip NAND controller driver
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_080103_888221_26DD7B1F 
X-CRM114-Status: GOOD (  10.02  )
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

VGhpcyBzZXJpZSBjb250YWlucyB2YXJpb3VzIGZpeGVzIGZvciB0aGUgUm9ja2NoaXAgTkFORCBj
b250cm9sbGVyCmRyaXZlciB0aGF0IHNob3dlZCB1cCB3aGlsZSB0ZXN0aW5nIGJvb3QgYmxvY2sg
d3JpdGluZy4KCkZpeGVkIGFyZToKICBBbHdheXMgY29weSBod2VjYyBQQSBkYXRhIHRvL2Zyb20g
b29iX3BvaSBidWZmZXIgaW4gb3JkZXIgdG8gYmUgYWJsZQogIHRvIHJlYWQvd3JpdGUgdGhlIHZh
cmlvdXMgYm9vdCBibG9jayBsYXlvdXRzLgogIEFkZCBvcHRpb24gdG8gc2FmZWx5IHByb2JlIHRo
ZSBkcml2ZXIgb24gYSBOQU5EIHdpdGggdW5rbm93biBkYXRhIGxheW91dC4KICBGaXggZGVmYXVs
dCB0aW1pbmcuCiAgRml4IG9vYmZyZWUgbGF5b3V0LgogIEFkZCBtaXNzaW5nIGNoaXAgSUQuCgpD
aGFuZ2VkIFYyOgogIEFkZCB0YWcKICBBZGQgbWFudWZhY3R1cmVyIG9wcwogIFJld29yZAoKSm9o
YW4gSm9ua2VyICg0KToKICBtdGQ6IG5hbmQ6IHJhdzogcm9ja2NoaXAtbmFuZC1jb250cm9sbGVy
OiBjb3B5IGh3ZWNjIFBBIGRhdGEgdG8KICAgIG9vYl9wb2kgYnVmZmVyCiAgbXRkOiBuYW5kOiBy
YXc6IHJvY2tjaGlwLW5hbmQtY29udHJvbGxlcjogYWRkIHNraXBiYnQgb3B0aW9uCiAgbXRkOiBu
YW5kOiByYXc6IHJvY2tjaGlwLW5hbmQtY29udHJvbGxlcjogZml4IG9vYmZyZWUgb2Zmc2V0IGFu
ZAogICAgZGVzY3JpcHRpb24KICBtdGQ6IG5hbmQ6IHJhdzogYWRkIGJhc2ljIHNhbmRpc2sgbWFu
dWZhY3R1cmVyIG9wcwoKUGF3ZcWCIEphcm9zeiAoMSk6CiAgbXRkOiBuYW5kOiBhZGQgc3VwcG9y
dCBmb3IgdGhlIFNhbmRpc2sgU0RUTlFHQU1BIGNoaXAKCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9N
YWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9pbnRl
cm5hbHMuaCAgICAgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2lk
cy5jICAgICAgICAgICAgICAgfCAgNSArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9zYW5k
aXNrLmMgICAgICAgICAgIHwgMjYgKysrKysrKysrKwogLi4uL210ZC9uYW5kL3Jhdy9yb2NrY2hp
cC1uYW5kLWNvbnRyb2xsZXIuYyAgIHwgNTIgKysrKysrKysrKysrLS0tLS0tLQogNSBmaWxlcyBj
aGFuZ2VkLCA2NCBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX3NhbmRpc2suYwoKLS0KMi4zMC4yCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
