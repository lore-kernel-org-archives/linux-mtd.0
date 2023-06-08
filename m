Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CFBC7EE29
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jun 2023 16:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X3Bfh4hA8qildJ7PjS/kyZTdyi4h13ttgZrUScWmxSs=; b=oBdTjRXYV2hPiI
	r7Js2M1c91DlG13Xmaft89ph+eO7p/a6pjCDp1grm8Ac3iiFxW/nTBgUj6tpGeP1Sfr+sfWh702jL
	Lia5KK2nLkShvsJLgT8W/HO7qucCTLO6Nnk91sOi3Wmf5wRFc1S3179zpCQiId3n/VIxAOt4u6FDr
	9KoIWT6O7M3oq7ZfaqeRFllX9usLEl9mFgcYmPYfvbKQ8y+3pK8bxHPZp6W90PdkB6CThihRm5pB0
	sBzXQnHGvxBJoVycmkJlqWcfSqhoJCbBDEY+wQEK9WRrc0meSw46SiYS8/sJoW0OTA9jkgWsk5kCf
	f51o1ELdtJXRRjl03Wuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7IVW-009sb8-1D;
	Thu, 08 Jun 2023 16:29:06 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7IVT-009saU-2n;
	Thu, 08 Jun 2023 16:29:05 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5147f5efeb5so1461024a12.0;
        Thu, 08 Jun 2023 09:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686241741; x=1688833741;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dx4wceDFekjvHQM4pccArhhP8EnGfveOZfWbZuBe+f4=;
        b=Otqmw9EGJd5t1uv5fv8KZRxZePZr9DZNDWIh55VF/587TOI8kFdiE/QE6+ETULucEK
         p0tAH7ty9kWtVyNcOUQ3zz7AYF5XNdM6ZP6NTYMXZfjOrzEBtKz5y5fPaY3zKUI+O+Hh
         EYVKVx8f3CkCmFH3oN37RqsxJlf5Fj//JUv1yoFJnBLUt0+g5aK5fSeVLrJf60KSL0OA
         nhTf7KCM813C7YbALdL9ELTScqhQfmVHu6CWghvdtYLVrN+EwHq7GbhIiH2qYD5rzrR5
         V2GAecNjvvClofUTMkPvePEEt8m6fLmOGFWs4LMhhAnrl/K4KQy4Yo4b8lGPElNEY5oi
         /WrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686241741; x=1688833741;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dx4wceDFekjvHQM4pccArhhP8EnGfveOZfWbZuBe+f4=;
        b=Q/AfUjfgfhXQhrTD3YgO/zUTqEGNxZHc6IMtV5wa3RywP05fKual5VA9k7faER+FiE
         aEANxveZnRqm2T3CBIrb4+4+h7YNL4z5w6cTtYYDXVYrfm1IGQBp+VyyViYx7afyjENH
         1nIOOArw6UEhaGw7l5bA4+JzjEn0xGfCHJQ2fjOSCHCv4wbiPkU/RwkLXFr0pjpv3l8Y
         KdAtSPm0ojQuwqujJDXQuiOT5JV5lW999MD2thYKhNp4rtwO27LUoKMXLSJLmRv7jEA2
         zaJDDyeNpdRwMjl+5SHvJZcurNKpOYcS0g3jXz4vfeTl4jvVH5D5Z7U+gSNESIC6A9Y4
         bbVg==
X-Gm-Message-State: AC+VfDzJ/22gVf13X27oKxDD+O5NaIJpXElw3oXGjxCSi1Xoq92ACxli
	TqjaqBfZfuByAORqawjEXMk=
X-Google-Smtp-Source: ACHHUZ58XomZ/FJB12G2xiLboOeaIJooEA/AyVgjnXFUz+JFy6MuLckqbWnzXxmmupqlqPf2AWUBUQ==
X-Received: by 2002:aa7:d986:0:b0:514:97dc:9d4e with SMTP id u6-20020aa7d986000000b0051497dc9d4emr8175409eds.7.1686241741138;
        Thu, 08 Jun 2023 09:29:01 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id ba7-20020a0564021ac700b0050bc6983041sm716463edb.96.2023.06.08.09.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 09:29:00 -0700 (PDT)
Message-ID: <19bf714a-43f9-c30a-8197-91aaaf4a6e5d@gmail.com>
Date: Thu, 8 Jun 2023 18:28:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 0/5] Fixes for Rockchip NAND controller driver
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_092903_904514_7E96601C 
X-CRM114-Status: UNSURE (   8.42  )
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
dCB0aW1pbmcuCiAgRml4IG9vYmZyZWUgbGF5b3V0LgogIEFkZCBtaXNzaW5nIGNoaXAgSUQuCgpK
b2hhbiBKb25rZXIgKDQpOgogIG10ZDogbmFuZDogcmF3OiByb2NrY2hpcC1uYW5kLWNvbnRyb2xs
ZXI6IGNvcHkgaHdlY2MgUEEgZGF0YSB0bwogICAgb29iX3BvaSBidWZmZXIKICBtdGQ6IG5hbmQ6
IHJhdzogcm9ja2NoaXAtbmFuZC1jb250cm9sbGVyOiBhZGQgc2tpcGJidCBvcHRpb24KICBtdGQ6
IG5hbmQ6IHJhdzogcm9ja2NoaXAtbmFuZC1jb250cm9sbGVyOiBmaXggbmFuZCB0aW1pbmcgZGVm
YXVsdAogIG10ZDogbmFuZDogcmF3OiByb2NrY2hpcC1uYW5kLWNvbnRyb2xsZXI6IGZpeCBvb2Jm
cmVlIG9mZnNldCBhbmQKICAgIGRlc2NyaXB0aW9uCgpQYXdlxYIgSmFyb3N6ICgxKToKICBtdGQ6
IG5hbmQ6IGFkZCBzdXBwb3J0IGZvciB0aGUgU2FuZGlzayBTRFROUUdBTUEgY2hpcAoKIGRyaXZl
cnMvbXRkL25hbmQvcmF3L25hbmRfaWRzLmMgICAgICAgICAgICAgICB8ICAzICsKIC4uLi9tdGQv
bmFuZC9yYXcvcm9ja2NoaXAtbmFuZC1jb250cm9sbGVyLmMgICB8IDU5ICsrKysrKysrKysrKy0t
LS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0p
CgotLQoyLjMwLjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
