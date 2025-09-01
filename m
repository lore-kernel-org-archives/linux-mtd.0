Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A4ACA0FFF
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 16:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dMWOXKDKvpVv4ZGFaCV7hwWnBlgZNvTD1xDTpsKpa98=; b=j9hDdU7oIV9fkc
	S2CBX5fmXmQMkSI58stEtii4MqpsYMjcGfoJj+WMwFJZbL9NlYVXN52V1QxD+4ZOCi4feKid5CGwi
	9Dhfk8BSpxZ/xWxENFXMuhbj3GKNHs1usUCtSZHhNcrF1SJva5IUYZEzhQfIVZ7OmMT1YaX1Us3tC
	4g25fC5s7tshwwji9lZQwr97qc3hELSj6GLSWjbaVm8q5DP8cjJ7EZGQ48E7LS3bv1xrSW95DbjI9
	0ND/pI9CpkIwVviVXeErHVU+/bHC3JCftYEwo6+BxeQX1k/6wwhEKzEPoyMRnJTo4XkMMucjh6l9Q
	fpkhwcG8sllQothIrYbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7j2-0000000DL7P-0PQJ;
	Mon, 01 Sep 2025 16:49:48 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4BH-0000000CcGh-1Vbq
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 13:02:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DEA3B1A0175;
	Mon,  1 Sep 2025 13:02:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE40060699;
	Mon,  1 Sep 2025 13:02:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8046D1C22D736;
	Mon,  1 Sep 2025 15:02:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756731761; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=stw2sU2uMpeiDADUvOE5aA2pc/ewBdvRgUY7Re+j3kU=;
	b=RO+fFFwjn3Td3VlLsYNaOwXRszWa/IIL/dZDFZ0xJ1oAPXnAwx7hLdIYfc2jSG+Z6u5ksI
	pQFaj3MIHFM4AqjhXjc/LGi/zuBmp48ZGFTMuz/+4O92vkk8bYTPNVeJ1t0DHIeOguf/zU
	M/F2Vxxtxay+O7EzCtLPse2OTunBy1aYGEJwSwGF0SoM8LK8QEg3ku8KBQJ2TRqHcex3v2
	fv8u3x0QyjdiQuE8yleNaMXX//8OaJxnMHJ9pDQa7ey3dV14BBV7mdd2P6UvM7G2vWy+64
	o9TyOeELkAnXmoBbf4evxue67DF36hEtTixyTTW3w5iskv4R4RaipO/ljrvVFg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michal Simek <michal.simek@amd.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <20250830100637.14756-1-rongqianfeng@vivo.com>
References: <20250830100637.14756-1-rongqianfeng@vivo.com>
Subject: Re: [PATCH] mtd: rawnand: pl353: Use int type to store negative
 error codes
Message-Id: <175673175662.52409.8678310323858548486.b4-ty@bootlin.com>
Date: Mon, 01 Sep 2025 15:02:36 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_060243_531405_B8FC8C05 
X-CRM114-Status: UNSURE (   7.24  )
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

T24gU2F0LCAzMCBBdWcgMjAyNSAxODowNjozNyArMDgwMCwgUWlhbmZlbmcgUm9uZyB3cm90ZToK
PiBDaGFuZ2UgdGhlICdyZXQnIHZhcmlhYmxlIGZyb20gdTMyIHRvIGludCBpbiBwbDM1eF9uYW5k
X3Byb2JlKCkgdG8gc3RvcmUKPiBuZWdhdGl2ZSBlcnJvciBjb2RlcyBvciB6ZXJvOwo+IAo+IFN0
b3JpbmcgdGhlIG5lZ2F0aXZlIGVycm9yIGNvZGVzIGluIHVuc2lnbmVkIHR5cGUsIGRvZXNuJ3Qg
Y2F1c2UgYW4gaXNzdWUKPiBhdCBydW50aW1lIGJ1dCBjYW4gYmUgY29uZnVzaW5nLiBBZGRpdGlv
bmFsbHksIGFzc2lnbmluZyBuZWdhdGl2ZSBlcnJvcgo+IGNvZGVzIHRvIHVuc2lnbmVkIHR5cGUg
bWF5IHRyaWdnZXIgYSBHQ0Mgd2FybmluZyB3aGVuIHRoZSAtV3NpZ24tY29udmVyc2lvbgo+IGZs
YWcgaXMgZW5hYmxlZC4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEK
ClsxLzFdIG10ZDogcmF3bmFuZDogcGwzNTM6IFVzZSBpbnQgdHlwZSB0byBzdG9yZSBuZWdhdGl2
ZSBlcnJvciBjb2RlcwogICAgICBjb21taXQ6IDhhOWUwOTdkZWY1NTM5MTI3M2QzMDQyYjMyMzUw
ZGVkMWVjODNlMDQKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5n
aXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2Jv
dCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
