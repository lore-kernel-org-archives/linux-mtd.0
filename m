Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB48D78321
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Dec 2024 13:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TGuGylXc4Ln+sKYfgWah9UOs3H7tm9WvC/XzCKa4r7Q=; b=RqssT0LwB1gWEg
	aqj5nv/duEvJZtkDyQ1xKA5PVQMklROXpyKI2fD/JRgv3xiT0493XHGTM+oQ56DLaQZBhQVztN61+
	M5TNOQhQRcndftYCrZ+TzGlcufpzmfqIblwH1ZGN04FCVV55MP4y6El88qGQzxQm43q+LBJZ3ii/P
	zb4rBepxda3qxIeWXrG4b3EcOPvcR5EyXlcy1k01wDZVOYeEPq7d4Jdlh6h62ekX5E9CyiSgSTn0I
	VJdts2LzwV8XKP75tffR9xCpo6Lks0HC8vyoJCuMI6CRqYXILSnX/HmoKvwG+z+86IGwS9PQB02sg
	HYy4uxnhD1K1i79DYYMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6kp-00000006I38-270j;
	Mon, 02 Dec 2024 13:46:23 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6kn-00000006I2V-09go
	for linux-mtd@lists.infradead.org;
	Mon, 02 Dec 2024 13:46:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E40C460003;
	Mon,  2 Dec 2024 13:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733147175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XtsYJDd2YWAO4ggugHre9sm63/z52Bx1Uf5zXUCaFVs=;
	b=Cuh2qB9SsJF/gBKEf1YljRRO0fWNsRue22eMNKlCzGWJA8tV8ztZ7+SckTnnqGbgH8dUM1
	XJgdBpO5puQLcmr1lOUArfYveH0dMgxcIbg5WSBmoj24PLQrd3KehFTQcTZHsmb39ATemY
	PcPHgVA5K6NVJyoAj4Np1//EiJVPoURJ/sn1oYHlz28PmUtBDyeNwFhKfLdwskXvdDO3Hk
	lcPBK1yaD/M4rVQZXlhh6OqVXU4lx+UZrPAq3i1Tsn+1HCLhAZbmCVIvP638hucprcGAUk
	KeMj8fcnwqdUcKz0rmOJ/cByZJXfQtEWn/uzzUTnSuLUf+LjlO9a8QKKk/zmZg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maciej Andrzejewski <maciej.andrzejewski@m-works.net>
Cc: Michal Simek <michal.simek@amd.com>,  Jinjie Ruan
 <ruanjinjie@huawei.com>,  Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: arasan: Fix missing de-registration of
 NAND chip-selects
In-Reply-To: <Z021Z-cFOJ-Vw3ud@UBUNTU-PF54DSY0> (Maciej Andrzejewski's message
	of "Mon, 2 Dec 2024 14:25:59 +0100")
References: <Z021Z-cFOJ-Vw3ud@UBUNTU-PF54DSY0>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 02 Dec 2024 14:46:14 +0100
Message-ID: <87o71u6vvd.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_054621_206849_16248AA5 
X-CRM114-Status: UNSURE (   8.67  )
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

SGkgTWFjaWVqLAoKT24gMDIvMTIvMjAyNCBhdCAxNDoyNTo1OSArMDEsIE1hY2llaiBBbmRyemVq
ZXdza2kgPG1hY2llai5hbmRyemVqZXdza2lAbS13b3Jrcy5uZXQ+IHdyb3RlOgoKPiBUaGUgTkFO
RCBjaGlwLXNlbGVjdHMgYXJlIHJlZ2lzdGVyZWQgZm9yIHRoZSBBcmFzYW4gZHJpdmVyIGR1cmlu
Zwo+IGluaXRpYWxpemF0aW9uIGJ1dCBhcmUgbm90IGRlLXJlZ2lzdGVyZWQgd2hlbiB0aGUgZHJp
dmVyIGlzIHVubG9hZGVkLiBBcyBhCj4gcmVzdWx0LCBpZiB0aGUgZHJpdmVyIGlzIGxvYWRlZCBh
Z2FpbiwgdGhlIGNoaXAtc2VsZWN0cyByZW1haW4gcmVnaXN0ZXJlZAo+IGFuZCBidXN5LCBtYWtp
bmcgdGhlbSB1bmF2YWlsYWJsZSBmb3IgdXNlLgoKR29vZCBwb2ludCEKCj4gRml4ZXM6IDE5N2I4
OGZlY2M1MGVlM2M3YTIyNDE1ZGI4MWVhZTBiOTEyNmYyMGUgKCJtdGQ6IHJhd25hbmQ6IGFyYXNh
bjogQWRkIG5ldyBBcmFzYW4gTkFORCBjb250cm9sbGVyIikKClRoaXMgc2hvdWxkIGJlIGEgMTIt
ZGlnaXQgc2hhIG9ubHkuIEZZSSBpbiBteSAuZ2l0Y29uZmlnIEkgaGF2ZSB0aGUKZm9sbG93aW5n
IGFsaWFzOgoKICAgICBmaXhlcyA9IHNob3cgLXMgLS1mb3JtYXQ9J0ZpeGVzOiAlaCAoXCIlc1wi
KScKCkl0IHdhcyBjb3JyZWN0IGluIHlvdXIgcHJldmlvdXMgcGF0Y2ggOikKCj4gQ2M6IHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBNYWNpZWogQW5kcnplamV3c2tpIElD
RVlFIDxtYWNpZWouYW5kcnplamV3c2tpQG0td29ya3MubmV0PgoKT3RoZXJ3aXNlIGxvb2tzIGdv
b2QgdG8gbWUhCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
