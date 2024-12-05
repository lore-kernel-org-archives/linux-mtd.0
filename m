Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B4BE77178
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Dec 2024 11:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=paf+Od8xwPOk3Pf6ru54emFwMfd5lmcVrGTTMsNxZXg=; b=cupCHw6+ldfOvj
	4UDEKjGlAvY0l8IPumk7cb1nyxOGxhYfdBZmPbd1iDM+5uOu4xBgILgQ8b5yDMnDf7eYzw+n39XLK
	p1DLmJlZcgXrm7yTF3BGlz86zb/XouyJNTAec/Oqw1jETtrDN5GqEtZNYZOvCA/R0HqlZbpTQ8H9G
	AsI+6EQgnp9s4zZF0OpGaa+r/Mhv9SHulBfpG22Y4mc4pn2p3gkDk4gpsqDK4XwD/AtlFOnkdjxy3
	c1YIyzMTj5WGSQW6HVY6KL2GQX/fEx31cnVY3fZheBRnfMsCRInbmJpQT9i2UcOfD/Q5eW2hVdpFV
	euJVE54ZRYDq9hsv0WjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAVn-0000000Fpkm-1CyG;
	Thu, 05 Dec 2024 11:59:15 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Ka-0000000FZwg-2HP2
	for linux-mtd@lists.infradead.org;
	Thu, 05 Dec 2024 10:43:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1801FF80A;
	Thu,  5 Dec 2024 10:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733395415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hb69N5/gNXCj5657rpj7cw2JqJmkhjwP5sOdYlqCXeQ=;
	b=Q9gpTidqEfFP5QYeRpiJHZQy0IkLVVEiKngqoP/1xKLUxRGbHbz2pUMmP8Ni9ucrYm2C44
	jpRiK8zafkDRsiMX7Oyg9tJ65CensrW1la2Va6z5yAihd8FKfYRWd4FvNQ/ruTrNKNRV2W
	Zo0Ue+yCS8FF/KLw37iZGNOY3f1NFDYr333TZ7NdICtVPWuEiITVVbJbT954vtaOSfrHAh
	ZRVCHgDjzAyv9gMOCu3LFc5KaIMNeGwBVpicqQb9V48Wj+6kaoOBJUXEpEVbHH3Xpd35Ke
	Mv93LUdLeh9Lg5amEsyKjSPgsdlzcLAbFffC9BKoWow9ESLZJEwe8QciUmA3Iw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michal Simek <michal.simek@amd.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
	linux-mtd@lists.infradead.org,
	Maciej Andrzejewski <maciej.andrzejewski@m-works.net>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3] mtd: rawnand: arasan: Fix double assertion of chip-select
Date: Thu,  5 Dec 2024 11:43:27 +0100
Message-ID: <173339519118.766262.18442148583345975205.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <Z02tOwEHfDsH1Sil@UBUNTU-PF54DSY0>
References: <Z02tOwEHfDsH1Sil@UBUNTU-PF54DSY0>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_024336_715542_DF296092 
X-CRM114-Status: UNSURE (   9.84  )
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

T24gTW9uLCAwMiBEZWMgMjAyNCAxMzo1MTowNyArMDEwMCwgTWFjaWVqIEFuZHJ6ZWpld3NraSB3
cm90ZToKPiBXaGVuIHR3byBjaGlwLXNlbGVjdHMgYXJlIGNvbmZpZ3VyZWQgaW4gdGhlIGRldmlj
ZSB0cmVlLCBhbmQgdGhlIHNlY29uZCBpcwo+IGEgbm9uLW5hdGl2ZSBHUElPLCBib3RoIHRoZSBH
UElPLWJhc2VkIGNoaXAtc2VsZWN0IGFuZCB0aGUgZmlyc3QgbmF0aXZlCj4gY2hpcC1zZWxlY3Qg
bWF5IGJlIGFzc2VydGVkIHNpbXVsdGFuZW91c2x5LiBUaGlzIGRvdWJsZSBhc3NlcnRpb24gY2F1
c2VzCj4gaW5jb3JyZWN0IHJlYWQgYW5kIHdyaXRlIG9wZXJhdGlvbnMuCj4gCj4gVGhlIGlzc3Vl
IG9jY3VycyBiZWNhdXNlIHdoZW4gbmZjLT5uY3MgPD0gMiwgbmZjLT5zcGFyZV9jcyBpcyBhbHdh
eXMKPiBpbml0aWFsaXplZCB0byAwIGR1ZSB0byBzdGF0aWMgaW5pdGlhbGl6YXRpb24uIENvbnNl
cXVlbnRseSwgd2hlbiB0aGUKPiBzZWNvbmQgY2hpcC1zZWxlY3QgKEdQSU8tYmFzZWQpIGlzIHNl
bGVjdGVkIGluIGFuZmNfYXNzZXJ0X2NzKCksIGl0IGlzCj4gZGV0ZWN0ZWQgYnkgYW5mY19pc19n
cGlvX2NzKCksIGFuZCBuZmMtPm5hdGl2ZV9jcyBpcyBhc3NpZ25lZCB0aGUgdmFsdWUgMC4KPiBU
aGlzIHJlc3VsdHMgaW4gYm90aCB0aGUgR1BJTy1iYXNlZCBjaGlwLXNlbGVjdCBiZWluZyBhc3Nl
cnRlZCBhbmQgdGhlCj4gTkFORCBjb250cm9sbGVyIHJlZ2lzdGVyIHJlY2VpdmluZyAwLCBlcnJv
bmVvdXNseSBzZWxlY3RpbmcgdGhlIG5hdGl2ZQo+IGNoaXAtc2VsZWN0Lgo+IAo+IFsuLi5dCgpB
cHBsaWVkIHRvIG10ZC9maXhlcywgdGhhbmtzIQoKWzEvMV0gbXRkOiByYXduYW5kOiBhcmFzYW46
IEZpeCBkb3VibGUgYXNzZXJ0aW9uIG9mIGNoaXAtc2VsZWN0CgpQYXRjaGUocykgd2lsbCBiZSBh
dmFpbGFibGUgd2l0aGluIGhvdXJzIG9uOgptdGQvbGludXguZ2l0CgpLaW5kIHJlZ2FyZHMsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
