Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924CFECAAD2
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Aug 2022 14:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KB+uTVOeM4JFJQc+hGCgIRQYH5owY6vXhlRRHK2TsF4=; b=osCuvivdfu3ozTy/fIp6U1gvvX
	tFdtCRPAZ7zksBwEX/hyIq0Z23xjjYPyrrplPUzkuP21GCFO58A8+vOGRod+2hJwqnrYqfnPyHnlK
	Iiak0sZj3M6tmkOql5xG10ve5k/b7SczQjDuGWVUPFY+jZ63UWuwk7Ncu66SN8meUGMs/M7kGvSM8
	ykehKz3H3aCoCiuCOMePZtZTzgLXyH+zoez6HbHFUo09kov5+8/icGRBXflw5GBxWGB4MNjPru5uE
	Ugk2+A727L0shmS6GLmEdNvUTySw5xxBRc5qRgAVmZWdG0FwZ3qPhe5COnSXKB22N1+zIznr4+3SF
	IrkuLtgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSJLr-00HWuP-1Q; Sun, 28 Aug 2022 14:33:27 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSJLc-00HWlM-KP; Sun, 28 Aug 2022 14:33:14 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 8858222D1;
	Sun, 28 Aug 2022 16:33:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1661697183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bwtC9ZIuYAB2A3TteH5zPFKqQJ2DrJO4wxsda0FFBrE=;
	b=KznYoTy9iue5vF7/hSESEctDdioSRs8n4n2hqBIDkzR7gvg4gOF0YLYEo9M5XjBBVFBc/X
	bU11LaqPWiz4z+BoPkufiLDYa+HiuGL2Sq1Fc3j8sG/eGpvcyWAiEKM8oApVhSkmH4mO8f
	8XcTEiX0GMUblPaZ8SNao8Y9aPFl51d8qW7ggOFodL1Uzu1WSo3Yag7EjaYaSZhr93Qsst
	5DBd99KMGwJECymKB9uiNax2rIiQ7zZI8UkzAtyWEZFhZ5hir3Fna0Jtg8oZvrZWM5i16h
	OJE9ct0u+HOyIY5TVijhw2FvVap8jhHovp/qpW8PcVtpFIKSaqkdsDFWtps3bw==
MIME-Version: 1.0
Date: Sun, 28 Aug 2022 16:33:03 +0200
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v1 06/14] nvmem: core: introduce NVMEM layouts
In-Reply-To: <b46d0db0-bd82-9ea3-281d-cc3ee3e9b002@milecki.pl>
References: <20220825214423.903672-1-michael@walle.cc>
 <20220825214423.903672-7-michael@walle.cc>
 <b46d0db0-bd82-9ea3-281d-cc3ee3e9b002@milecki.pl>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <e62a50dfd968168015dd3e4fab896056@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_073312_887008_EFDCF403 
X-CRM114-Status: UNSURE (   8.01  )
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

QW0gMjAyMi0wOC0yOCAxNjowNiwgc2NocmllYiBSYWZhxYIgTWnFgmVja2k6Cj4gT24gMjUuMDgu
MjAyMiAyMzo0NCwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4gRm9yIG5vdywgdGhlIGNvbnRlbnQg
Y2FuIGJlCj4+IGRlc2NyaWJlZCBieSBhIGRldmljZSB0cmVlIG9yIGEgYm9hcmQgZmlsZS4gQnV0
IHRoaXMgb25seSB3b3JrcyBpZiB0aGUKPj4gb2Zmc2V0cyBhbmQgbGVuZ3RocyBhcmUgc3RhdGlj
IGFuZCBkb24ndCBjaGFuZ2UuCj4gCj4gTm90IHJlYWxseSB0cnVlIChzZWUgQnJvYWRjb20ncyBO
VlJBTSBhbmQgVS1Cb290J3MgZW52IGRhdGEpLgoKQWxsIGV4Y2VwdCB0aG9zZSB0d28gZHJpdmVy
cyBkb24ndCBhZGQgY2VsbHMgb24gdGhlaXIgb3duLiBBbmQgZm9yCnRoZXNlIGl0IGlzIG5vdCBw
b3NzaWJsZSB0byBhZGQgbm9uIHN0YXRpYyBjZWxscywgZXhjZXB0IGluIGJvYXJkCmNvZGUgbWF5
YmUuIFRoaXMgc2VyaWVzIG1ha2UgaXQgcG9zc2libGUgdG8gYWRkIHRoaXMgcnVudGltZSBwYXJz
aW5nCnRvIGFueSBOVk1FTSBkZXZpY2UuCgotbWljaGFlbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
