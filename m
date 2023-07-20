Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFD1EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 09:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a3ynIyf7u1yA7zn5TLoOGWARKxhoIpVGK3Go0L3IgvI=; b=ELmkcShuLiqRi1
	3m49xX6c79KS6Y3v7YcxF4DHik0oHcY7zM4jhIFHJCC5XRB5S1Y+vDvYP7uX7zPEJt0JCDXKMCz+E
	FqOIqV9oDjwTb7/ldmHh7WLKpdx6dnL9UA5xkkWDF64cIR0lmFmz1dpncng+SV8PC1Rj5d04D3EpK
	BzLKX+L0glo9BQS6YXooqHofKUzHvrxZbokIe0s8B0ZHEY3KZ7VwuGL9UpveHBaRFK1KXR85YDluS
	PyuVwBMnemZBzyLbYDNMAMlj2sPr/kQbsjHUlFbWKcgY2JDkl15OamtCwiOH3hmMzoPHvyfzsvMLk
	p/os8qAyXPQ8qXBi/vcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQNR-00AbwY-0X;
	Thu, 20 Jul 2023 09:55:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQNP-00Abta-0T
	for linux-mtd@bombadil.infradead.org;
	Thu, 20 Jul 2023 09:55:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vd+lEU5Fl2TIPJ8xcsPnSNyWBBTcuOGxPgWz+JpFHhw=; b=drGCCa5PcOCZOrJgwyqwq+pe47
	A1UKezQvXDyGMhdoMeyAmBeHeqWhANM9quU2dlywJpC7YFsHI2771ftMQun17l/t4VjtSiKmPeYHW
	/D2kfUaiMi7TEOytZ+WWd9n7q1x3/iNFDlhcfyzJHLEIwNuHJw+HVj55VkQXJ0aAciVTFk7vg2tko
	ZSiYT01c6SKX8sm7g5Ot6/avKWynHY7GEB9L35Wdti4vzXC6H7J+QFuptYgqjZjIoR7bObTbLjWHo
	PYAaGz09kxq7tnCg/FOSI+YVpiFi2Tcxe3Ui6NUFF44nyJS7khyLYMBAvuVgcgUwLIz0uz9bcNtW8
	uaWD8nKA==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMPL1-00FRD9-0K
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 08:48:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 82B48E0008;
	Thu, 20 Jul 2023 08:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689842919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vd+lEU5Fl2TIPJ8xcsPnSNyWBBTcuOGxPgWz+JpFHhw=;
	b=TZpvZBP8z4VFpjhk1aMn9VASAw7o2tzmqRsxhui1u5vEMZ+6NllUmhF29PK0aQqjn/ZeAM
	YaoqVo/39UESzDb9wSTsghpo+eRIK0i6PmKXfQvQvVLVRn8E06yQVCapKkV1IFdqxWv91R
	ZhmjrIlW6PldJw/yx32DvspNkDLKJD8yG+9wMa6TDURVYNUIdH65VYe/bAMd9GoFnxP4NN
	/KabCx1bF6RT0MVYrin7okunOVnUhF/1FLBUqLzCNLgw47w3aAoMJv1SCqe2P0cJtR6AIE
	F8c3FJcLHdIFAga4NUHLZVTAw7mTGpOQSD9lQDOir0CWAdYb+PnmFolWBFT0EA==
Date: Thu, 20 Jul 2023 10:48:32 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Arnd Bergmann <arnd@arndb.de>, Peter Foley <pefoley2@pefoley.com>, Pedro
 Falcato <pedro.falcato@gmail.com>, Michael Walle <michael@walle.cc>, Mark
 Brown <broonie@kernel.org>, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 Dhruva Gole <d-gole@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: avoid holes in struct spi_mem_op
Message-ID: <20230720104832.15a4d4ab@xps-13>
In-Reply-To: <598bd9d8-249e-125c-bde3-7a63ba6dc5f7@linaro.org>
References: <20230719190045.4007391-1-arnd@kernel.org>
	<598bd9d8-249e-125c-bde3-7a63ba6dc5f7@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_094843_662190_737FDD95 
X-CRM114-Status: GOOD (  21.87  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gVGh1LCAyMCBKdWwg
MjAyMyAwNzo1MDozMyArMDEwMDoKCj4gT24gNy8xOS8yMyAyMDowMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiA+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gPiAKPiA+IGdj
YyBnZXRzIGNvbmZ1c2VkIHdoZW4gLWZ0cml2aWFsLWF1dG8tdmFyLWluaXQ9cGF0dGVybiBpcyB1
c2VkIG9uIHNwYXJzZQo+ID4gYml0IGZpZWxkcyBzdWNoIGFzICdzdHJ1Y3Qgc3BpX21lbV9vcCcs
IHdoaWNoIGNhdXNlZCB0aGUgcHJldmlvdXMgZmFsc2UKPiA+IHBvc2l0aXZlIHdhcm5pbmcgYWJv
dXQgYW4gdW5pbml0aWFsaXplZCB2YXJpYWJsZToKPiA+IAo+ID4gZHJpdmVycy9tdGQvc3BpLW5v
ci9zcGFuc2lvbi5jOiBlcnJvcjogJ29wJyBpcyB1c2VkIHVuaW5pdGlhbGl6ZWQgWy1XZXJyb3I9
dW5pbml0aWFsaXplZF0KPiA+IAo+ID4gSW4gZmFjdCwgdGhlIHZhcmlhYmxlIGlzIGZ1bGx5IGlu
aXRpYWxpemVkIGFuZCBnY2MgZG9lcyBub3Qgc2VlIGl0IGJlaW5nCj4gPiB1c2VkLCBzbyB0aGUg
d2FybmluZyBpcyBlbnRpcmVseSBib2d1cy4gVGhlIHByb2JsZW0gYXBwZWFycyB0byBiZQo+ID4g
YSBtaXNvcHRpbWl6YXRpb24gaW4gdGhlIGluaXRpYWxpemF0aW9uIG9mIHNpbmdsZSBiaXQgZmll
bGRzIHdoZW4gdGhlCj4gPiByZXN0IG9mIHRoZSBieXRlcyBhcmUgbm90IGluaXRpYWxpemVkLgo+
ID4gCj4gPiBBIHByZXZpb3VzIHdvcmthcm91bmQgYWRkZWQgYW5vdGhlciBpbml0aWFsaXphdGlv
biwgd2hpY2ggZW5kZWQgdXAKPiA+IHNodXR0aW5nIHVwIHRoZSB3YXJuaW5nIGluIHNwYW5zaW9u
LmMsIHRob3VnaCBpdCBhcHBhcmVudGx5IHN0aWxsIGhhcHBlbnMKPiA+IGluIG90aGVyIGZpbGVz
IGFzIHJlcG9ydGVkIGJ5IFBldGVyIEZvbGV5IGluIHRoZSBnY2MgYnVnemlsbGEuIFRoZQo+ID4g
d29ya2Fyb3VuZCBvZiBhZGRpbmcgYSBmYWtlIGluaXRpYWxpemF0aW9uIHNlZW1zIHBhcnRpY3Vs
YXJseSBiYWQKPiA+IGJlY2F1c2UgaXQgd291bGQgc2V0IHZhbHVlcyB0aGF0IGNhbiBuZXZlciBi
ZSBjb3JyZWN0IGJ1dCBwcmV2ZW50IHRoZQo+ID4gY29tcGlsZXIgZnJvbSB3YXJuaW5nIGFib3V0
IGFjdHVhbGx5IG1pc3NpbmcgaW5pdGlhbGl6YXRpb25zLgo+ID4gCj4gPiBSZXZlcnQgdGhlIGJy
b2tlbiB3b3JrYXJvdW5kIGFuZCBpbnN0ZWFkIHBhZCB0aGUgc3RydWN0dXJlIHRvIG9ubHkKPiA+
IGhhdmUgYml0ZmllbGRzIHRoYXQgYWRkIHVwIHRvIGZ1bGwgYnl0ZXMsIHdoaWNoIHNob3VsZCBh
dm9pZCB0aGlzCj4gPiBiZWhhdmlvciBpbiBhbGwgZHJpdmVycy4KPiA+IAo+ID4gSSBhbHNvIGZp
bGVkIGEgbmV3IGJ1ZyBhZ2FpbnN0IGdjYyB3aXRoIHdoYXQgSSBmb3VuZCwgc28gdGhpcyBjYW4K
PiA+IGhvcGVmdWxseSBiZSBhZGRyZXNzZWQgaW4gZnV0dXJlIGdjYyByZWxlYXNlcy4gQXQgdGhl
IG1vbWVudCwgb25seQo+ID4gZ2NjLTEyIGFuZCBnY2MtMTMgYXJlIGFmZmVjdGVkLgo+ID4gCj4g
PiBDYzogUGV0ZXIgRm9sZXkgPHBlZm9sZXkyQHBlZm9sZXkuY29tPgo+ID4gQ2M6IFBlZHJvIEZh
bGNhdG8gPHBlZHJvLmZhbGNhdG9AZ21haWwuY29tPgo+ID4gTGluazogaHR0cHM6Ly9nY2MuZ251
Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9MTEwNzQzCj4gPiBMaW5rOiBodHRwczovL2dj
Yy5nbnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD0xMDg0MDIKPiA+IExpbms6IGh0dHBz
Oi8vZ29kYm9sdC5vcmcvei9lZk1Nc0cxS3gKPiA+IEZpeGVzOiA0MjBjNDQ5NWI1ZTU2ICgibXRk
OiBzcGktbm9yOiBzcGFuc2lvbjogbWFrZSBzdXJlIGxvY2FsIHN0cnVjdCBkb2VzIG5vdCBjb250
YWluIGdhcmJhZ2UiKQo+ID4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4gIAo+IAo+IEFja2VkLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFy
by5vcmc+Cj4gCj4gTWlxdWVsLCB3b3VsZCB5b3UgcGxlYXNlIHRha2UgdGhpcyB0aHJvdWdoIG10
ZC9maXhlcz8KCkkgd2lsbCEKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
