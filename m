Return-Path: <SRS0=t7GP=TY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FB8C072B5
	for <linux-mtd@archiver.kernel.org>; Fri, 24 May 2019 07:53:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07A6120879
	for <linux-mtd@archiver.kernel.org>; Fri, 24 May 2019 07:53:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b5RqMAmb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07A6120879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJMQFQNmR+Wi6ZzdY9lwBMDF3XPQxJXGCAJwJS5e0/k=; b=b5RqMAmbbKUJv1
	oV/Yq63rtGq7JiLFg7q900aCl0F1dqEPbEyx+Y9hzdpohgeKCGNCBxs4mfVeMlVnSLzs9JzOpmlQy
	W4syYYZpTmEl9NClsqtLrIMOfUlk9Yh+dWCIRdgBasFHc6/ARQzWVQjEoeRQlqh1tLqHflQIZg1IP
	sBvV240neu7xG3VkQkRSioZ2By3Nf9sm/caQW8TDNTs4beG0t99pL/Ay6yykXWBd2TV4ntc/UgVes
	qoEShK6++j1ZEFj5BMH+sCLN+1FRTzWr+Ywg64mphk4Ja5T39PnLd9fSH+2zxs6lFF2HIoX5deHd2
	rJsoFAyvz0NWCAxw4rug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hU50h-00008y-H1; Fri, 24 May 2019 07:53:03 +0000
Received: from mail-qk1-f193.google.com ([209.85.222.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hU50e-00008b-DT; Fri, 24 May 2019 07:53:01 +0000
Received: by mail-qk1-f193.google.com with SMTP id d10so6090647qko.4;
 Fri, 24 May 2019 00:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QmIWS/gC+fa19PxSGHgrqfgpvxjgo7flHvAf9Hy7FNk=;
 b=Q2dcJfO1Lu/IcYtBkLGHcedolToQw/YXoDf0rEvc7/sFnquOxEDccCs2gxnQ84G5qv
 lPo2ZFubcVaBoC5kVRYYpXxw/QcKp4jYbbuJiCD2KuW7YHkEO7GG0mO2BTFRr+EJm6NE
 vl98+Hl/vPKUEP23RHNJXSshjDH/tfAVwe6ouVeFFYKN3cwX0iYvZxANQ4GfVl7U3dSE
 o+Ntq53+fFsZliX1cbsJOYIIvk+bKLF0zzHHaYtAAB5YNy8tBPXWC3UG7umY5AFlRMvF
 jyzX+2ifJsjL86vOjOioG8lmqY4K1Vx2HzIwK3e9QBc6VNojoIJgR9tiDvNrpEYKqN5y
 wuUQ==
X-Gm-Message-State: APjAAAXzLQVryG6Mk+x6k/E/O/W4z+j24ilRctNYeXTQearKHrknOOF6
 KHjP6hcPjZZeOe9GPG1SHR6LtZn0bhmmTSEd2so=
X-Google-Smtp-Source: APXvYqxaxfnh6nmAp0lGugPobsxiW7O+QwmUArkhVA0P3guGuBwge1kPVPSxfQEQDjERy7qUg4QYOPiGt1HNqd9w5y4=
X-Received: by 2002:ac8:19a7:: with SMTP id u36mr2812318qtj.7.1558684379039;
 Fri, 24 May 2019 00:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190507092020.1917-1-xiaolei.li@mediatek.com>
 <20190507092020.1917-2-xiaolei.li@mediatek.com>
In-Reply-To: <20190507092020.1917-2-xiaolei.li@mediatek.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 24 May 2019 09:52:42 +0200
Message-ID: <CAK8P3a3d-2U=hpb0P0+W-eZ0cviwKVwy6dWvHbhBCgF4CJUWKA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 1/1] mtd: rawnand: mtk: Re-license MTK NAND driver
 as Dual MIT/GPL
To: Xiaolei Li <xiaolei.li@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190524_005300_457838_FA7BC570 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Ryder Lee <ryder.lee@mediatek.com>, srv_heupstream@mediatek.com,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, jorge.ramirez-ortiz@linaro.org,
 yingjoe.chen@mediatek.com, boris.brezillon@collabora.com,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Wei Yongjun <weiyongjun1@huawei.com>, yellowriver2010@hotmail.com,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 peterpandong@micron.com, rogercc.lin@mediatek.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXkgNywgMjAxOSBhdCAxMToyMCBBTSBYaWFvbGVpIExpIDx4aWFvbGVpLmxpQG1l
ZGlhdGVrLmNvbT4gd3JvdGU6Cj4KPiBJdCBpcyB3YW50ZWQgdG8gdXNlIE1USyBOQU5EIGRyaXZl
ciB3aXRoIEdQTC0yLjAgb3IgTUlUIGxpY2Vuc2UuCj4gQnV0IG5vdyBpdCBpcyBvbmx5IGxpY2Vu
c2VkIGFzIEdQTC0yLjAuCj4gU28gcmUtbGljZW5zZSBpdCBhcyBkdWFsIE1JVC9HUEwgYW5kIHJl
cGxhY2UgbGljZW5zZSB0ZXh0IHdpdGgKPiBTUERYIHRhZy4KPgo+IFNpZ25lZC1vZmYtYnk6IFhp
YW9sZWkgTGkgPHhpYW9sZWkubGlAbWVkaWF0ZWsuY29tPgo+IEFja2VkLWJ5OiBKb3JnZSBSYW1p
cmV6LU9ydGl6IDxqb3JnZS5yYW1pcmV6LW9ydGl6QGxpbmFyby5vcmc+Cj4gQWNrZWQtYnk6IFJ5
ZGVyIExlZSA8cnlkZXIubGVlQG1lZGlhdGVrLmNvbT4KPiBBY2tlZC1ieTogUmFmYcWCIE1pxYJl
Y2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IEFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPgo+IEFja2VkLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJy
ZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+IEFja2VkLWJ5OiBSb2dlckNDIExpbiA8cm9nZXJjYy5s
aW5AbWVkaWF0ZWsuY29tPgoKQWNrZWQtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+
CgpTb3JyeSBmb3IgbWlzc2luZyB0aGlzIGVhcmxpZXIuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
