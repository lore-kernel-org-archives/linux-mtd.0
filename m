Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49083E77197
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2025 20:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y6GfKHw3QKYphpDzz/K8jexchBAk7VES4uzcHdmAPI0=; b=I/VivtmKqfxZL0
	Y251Rd08bDVTfhgKx//dmHqTgRF/iK0tpu5JcG7lxwH+/eKzpqDdZbMdbFMgm/ienn65tBgR2Klaq
	gYvADsUkcHCgQOAJZo53eD2BhpINzFZx4pQsuITJhax4srbICEeHMVkzLvChiXB16HmImn+ATaRv0
	oaLLT7RxPV+4OJBEHH3auVTHVgjj+GrlRipwiXX2q7Xy4o0Rzp+hX+9MBq4ovQuc1oathLYBQt0h9
	bLsKcJUqEhOTNbYDvWgS3ue6veOSeAiO53iYV5hor9jBv/ZNAeIWEqcyKPOFUjQcwjMmegpEYZZJN
	PfjYQxZ3rG4msz/X7Q5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVz5V-0000000DE9q-07E1;
	Thu, 09 Jan 2025 20:25:05 +0000
Received: from smtp-21.smtpout.orange.fr ([80.12.242.21] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVz42-0000000DDyN-0gOu
	for linux-mtd@lists.infradead.org;
	Thu, 09 Jan 2025 20:23:36 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id Vz3jtNFxoxBEgVz3mtIKZh; Thu, 09 Jan 2025 21:23:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1736454202;
	bh=A++ucjRtawUORMvv4Zrh1RCf4G3FKPv8bp3sH/KVqAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=kGhqSIgdFnTI9Fnh9wMe7FhO4RXSO4xTeVCcxgllq3WKTa5MyHEPqHm9RKIQ1JzhJ
	 R/sRPJQOWi9kBKOZKX5PazPxJsLjLNEzwXZhBaMPpLHgOaW/vXNFTJoHEwqGzhX+F4
	 sX5QiXiZhTGk/u5SczpleP50JHCuHt1BCn37s61UNw5zGoJJDd2awLcKALTlEpQlrD
	 OQ/ZAIdLwVzjDUV1P4KGt5kINpEtltxO01WTVYRv3MYuN4hy1c2XXt/+BZ85EktNPa
	 tsmW4oe0ORJzKzzWUbSa32rVKOhZHk3bhOkUEo9XFj2uQvy7lTx0UPsi24fgXkQvey
	 q80JWO/UrCrig==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 09 Jan 2025 21:23:21 +0100
X-ME-IP: 90.11.132.44
Message-ID: <956f0490-2e47-4655-ab10-a10ef790cfad@wanadoo.fr>
Date: Thu, 9 Jan 2025 21:23:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: winbond: Add support for w25q02jv
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250109-winbond-6-12-rc1-nor-volatile-bit-v2-0-e8cd0812fe4e@bootlin.com>
 <20250109-winbond-6-12-rc1-nor-volatile-bit-v2-2-e8cd0812fe4e@bootlin.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250109-winbond-6-12-rc1-nor-volatile-bit-v2-2-e8cd0812fe4e@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_122334_608545_4DC9422C 
X-CRM114-Status: GOOD (  10.40  )
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

TGUgMDkvMDEvMjAyNSDDoCAyMToxNywgTWlxdWVsIFJheW5hbCBhIMOpY3JpdMKgOgo+IEFkZCBz
dXBwb3J0IGZvciBXaW5ib25kIHcyNXEwMmp2IHNwaS1ub3IgY2hpcCB3aGljaCBzaGFyZXMgbW9z
dCBvZgo+IHcyNXEwMWp2J3Mgc3BlY2lmaWNpdGllcyBhcywgdGhpcyB0aW1lLCB0aGUgY2hpcCBp
cyBtYWRlIG9mIDQgZGlmZmVyZW50Cj4gZGllcy4KPiAKPiBMaW5rOiBodHRwczovL3d3dy53aW5i
b25kLmNvbS9yZXNvdXJjZS1maWxlcy9XMjVRMDJKVl9EVFIlMjBSZXZEJTIwMDcwOTIwMjQlMjBQ
bHVzLnBkZgo+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20+Cj4gLS0tCgouLi4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
d2luYm9uZC5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci93aW5ib25kLmMKPiBpbmRleCBhNGMwZDk5
ZGRlNGZjZDJiMTIzZWI3ZGVkNGY3ODIyMTEwYzZhNGFlLi5kODI5NjJlMGJmN2Q4ZTAwYjMwNWZk
ODM4Mjc0YTU4YzM0ZGQ2YzRlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivd2lu
Ym9uZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci93aW5ib25kLmMKPiBAQCAtMzA1LDYg
KzMwNSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8gd2luYm9uZF9ub3JfcGFy
dHNbXSA9IHsKPiAgIAl9LCB7Cj4gICAJCS5pZCA9IFNOT1JfSUQoMHhlZiwgMHg3MCwgMHgxOSks
Cj4gICAJCS5uYW1lID0gIncyNXEyNTZqdm0iLAo+ICsJfSwgewo+ICsJCS5pZCA9IFNOT1JfSUQo
MHhlZiwgMHg3MCwgMHgyMiksCj4gKwkJLyogVzI1UTAySlYgKi8KCk5pdHBpY2s6IFRoZSBwbGFj
ZSBvZiB0aGUgY29tbWVudCBpcyBub3QgY29uc2lzdGVudCB3aXRoIHBhdGNoIDEvMi4KCkNKCgo+
ICsJCS5maXh1cHMgPSAmd2luYm9uZF9ub3JfbXVsdGlfZGllX2ZpeHVwcywKPiAgIAl9LCB7Cj4g
ICAJCS5pZCA9IFNOT1JfSUQoMHhlZiwgMHg3MSwgMHgxOSksCj4gICAJCS5uYW1lID0gIncyNW01
MTJqdiIsCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
