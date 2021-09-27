Return-Path: <SRS0=BNsP=OR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA9EC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 20:33:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D57E161058
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 20:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D57E161058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=3e8.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gb7xPB72oVu8KjvNQ/FjVHYEc6hMJRvx01zzrv0y6UI=; b=UKdDhoLztZVOiX
	HM4IRqetcwDvByTl0BQcgQrOHQSO6ueDcZm2CHuR+gKv1vff3bznA7/YS0jEQElqjO4Y7PJo0fk9t
	25JCX7/PAGnsY1ITUcB8PGtb+NHlBjdozDHE1W0AOzfXVj6YBoOFpQrSjC9r59XxL9VU7+LNZJ0KY
	FT7IXxW6b0Hi6d8rhoBGKz7En/w9J0Xfvww4KuLSfHK7YZo0cMHob3V9s171Hd6Vk8cFYRCHHu/Ij
	toCBdogWtDH0M+lufcMw9QpbiHpTNsD6IrArQLETsJzrnF5EdOYCHvpSE8e1yVdhIq57Kd+jTBxTq
	yW5PbTLYQcGaj5SIxOmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUxIt-004Buk-Ej; Mon, 27 Sep 2021 20:32:47 +0000
Received: from srv4.3e8.eu ([2001:67c:12a0:200::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUxIn-004BrB-RC
 for linux-mtd@lists.infradead.org; Mon, 27 Sep 2021 20:32:45 +0000
Received: from [IPV6:2003:c6:cf12:5a0:9abc:9583:6f0a:c734]
 (p200300c6cf1205a09abc95836f0ac734.dip0.t-ipconnect.de
 [IPv6:2003:c6:cf12:5a0:9abc:9583:6f0a:c734])
 (using TLSv1.3 with cipher TLS_CHACHA20_POLY1305_SHA256 (256/256 bits))
 (No client certificate requested)
 by srv4.3e8.eu (Postfix) with ESMTPSA id 34CCF60073;
 Mon, 27 Sep 2021 22:32:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=3e8.eu;
 s=mail20170724; t=1632774736;
 bh=UzG2e21h9wHznK4ErSzXQr3B2Z0rBnjaGgUtVaw7338=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=wU3KMRARhKVLBtIJU4/O9B7QdFn9o+V/TbdXoH6HKqlpB8A7v0uGolJQcluqOqyIr
 z2UMKp0xJOarvo6AOjb/a2knT0x1C91cCKYvW/cQZkJLYT+mUVn/xBN/qaDf3VyjkO
 Ay7kkur+Zdm9Cp6hY+wvGSp1DRez2bq9FR74fJNff1+Oaw8afNGwwBnSTHlM3ogj7Z
 hbrN9DEqKcoY0HD1lt4bE+gY5dn4UnSUy2IKBGoFYh2HeIzhajPIv0R95etcZvABTz
 Ne41Nya86NSATxV75/dmbfEjxvdNiVGzh0b7Cih8Ypu/czqbdiLp7vJrXlIpQu1ZWR
 V5PS3hv+vb4NQ==
Message-ID: <f800c48f-8e4a-ecdc-3198-c52be0425823@3e8.eu>
Date: Mon, 27 Sep 2021 22:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v2] mtd: rawnand: xway: No hardcoded ECC engine, use
 device tree setting
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Daniel Kestrel <kestrelseventyfour@gmail.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210808072643.GA5084@ubuntu>
 <51f2ebf4-6df1-eba5-99f1-1ec88e475d20@3e8.eu> <20210917190154.76203a9a@xps13>
 <e9dd0653-139f-749b-c088-e756ee2d2132@3e8.eu> <20210917213246.319e60cb@xps13>
 <14eb0cb7-b0af-87bf-b9a5-3e35eeb43f54@3e8.eu> <20210927183150.4be87140@xps13>
From: Jan Hoffmann <jan@3e8.eu>
In-Reply-To: <20210927183150.4be87140@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_133242_074787_A116B91B 
X-CRM114-Status: GOOD (  13.00  )
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

SGkgTWlxdcOobCwKCj4gU28gd2hhdCBJIHByb3Bvc2UgaXM6Cj4gLSBpbiB0aGUgZHJpdmVyIHBy
b2JlOiBzZXQgdGhlIGRlZmF1bHQgdG8gc29mdHdhcmUgRUNDCj4gLSBpbiB0aGUgYXR0YWNoKCkg
aG9vazogZHJvcCB0aGUgbGluZSBzZXR0aW5nIHRoZSBlbmdpbmVfdHlwZSB0byBTT0ZULgo+IAo+
IFBsZWFzZSBjaGVjayB0aGUgYmVsb3cgZGlmZiBhbmQgdGVsbCBtZSBpZiBpdCB3b3JrcyBmb3Ig
eW91LiBJJ2xsIHRoZW4KPiBwcm9wb3NlIGEgd2lkZXIgc2VyaWVzIGZpeGluZyB0aGUgb3RoZXIg
ZHJpdmVycyBhcyB3ZWxsLgoKSSBjYW4gY29uZmlybSB0aGF0IHlvdXIgcGF0Y2ggZml4ZXMgdGhl
IGlzc3VlLgoKSSB0ZXN0ZWQgdXNpbmcga2VybmVsIDUuMTAgb24gYSBGcml0emJveCA3MzYyIFNM
ICh3aXRoIG9uLWRpZSBFQ0MKY29uZmlndXJlZCB2aWEgZGV2aWNlIHRyZWUgd2hpY2ggd2FzIGJy
b2tlbiBiZWZvcmUpLiBJIGFsc28gY2hlY2tlZCBvbgphIEZyaXR6Ym94IDc0MTIgKHRoaXMgZGV2
aWNlIHVzZXMgc29mdHdhcmUgRUNDKS4gQm90aCBhcmUgd29ya2luZyB3aXRoCnRoaXMgcGF0Y2gu
CgpUaGFua3MsCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
