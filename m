Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396A2C77B7A
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Jun 2025 18:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XEEt4PmIhluEFChjSIe1m3CDP+l7vouZRaTjYxp3Geo=; b=2rZH2JOZ1oGtlW
	C9UfiptcwGWetKyYdYyPnY066sM7N6rPSVb+ptBcUfcNtL0DdM6Vfz0LxvjRv5Wbc2dMbD/RtuIxK
	nmgb3nU1ep0yq/z5D+fk7Rnbv/EicdaCNkDUPkVuml4PcK/7AeFqdFIrAgmUjbqHUmNlbC3UCw2mu
	yUKdNf/85k33ZtgeR4YvSmFbOipY4C42uiVcLdTTvBV+nlMPzIWzzR9vFdqsz/IM3bBI/sg1kbPon
	YafPTBFF/IGyQAgY7X5VbLDxAgXWohOC/GzJKtlm4eCJj/OUdRJbTCcD9kB0z7Za8ZUx8LGdZ5GSW
	SCFXdAON6Jt1l5cxzAhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKBf-0000000DyIz-2eCH;
	Thu, 19 Jun 2025 18:40:35 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSISm-0000000Ddaj-1G0P
	for linux-mtd@lists.infradead.org;
	Thu, 19 Jun 2025 16:50:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A9D9432D1;
	Thu, 19 Jun 2025 16:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750351801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JyqRMJ2fwx6K6s3v2591yW/FKD6BGZfrH5Cs1G7qqng=;
	b=TouPEzxBZWAb/GQQAQLqo5ArR3pBYlKCHajda7YsUwNJnmvvzW7Qg5ivw8Ev5ZzT6qpIof
	TmUHA5ujT2JTBC8quOrj9t4QURJK0Z43e/LCpHeb7z2R3XPnAbgOvzodJ+KoduOrRkWGCM
	pKfymekq6rROk1DkpjruNpbWhmLGqfCciEoTm+V4ipkLgtHqwgu3CMMGiX0yg2TiDla8TQ
	CbfBq20YcACiAyLIU1BMoue6BRN/BKk/N9sq3OfNA6MpMQzE+IFGzhZjgt+n6ZMW07HgsO
	k70AL8ESMxfnsnIPGUmOStoZoIvySFbbck+nrBIcyUqvvJYdt4slI2k2HUE8PQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: vigneshr@ti.com,  gch981213@gmail.com,  linchengming884@gmail.com,
  richard@nod.at,  linux-mtd@lists.infradead.org, Cheng Ming Lin
 <chengminglin@mxic.com.tw>
Subject: Re: [PATCH 1/1] mtd: spi-nand: macronix: disable continuous read
 for MX35LFxGE4AD
In-Reply-To: <20250619140003.103637-1-amadeus@jmu.edu.cn> (Chukun Pan's
	message of "Thu, 19 Jun 2025 22:00:03 +0800")
References: <5c7ad4dc-a80b-488a-87aa-ecd6389e86c8@ti.com>
	<20250619140003.103637-1-amadeus@jmu.edu.cn>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Thu, 19 Jun 2025 18:49:57 +0200
Message-ID: <87zfe3zney.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeitdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeelvddrudekgedruddutddruddujeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddutddruddujedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopegrmhgruggvuhhssehjmhhurdgvughurdgtnhdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepghgthhelkeduvddufeesghhmrghilhdrtghomhdprhgtphhtthhopehlihhntghhvghnghhmihhnghekkeegsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpr
 hgtphhtthhopegthhgvnhhgmhhinhhglhhinhesmhigihgtrdgtohhmrdhtfi
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_095008_634017_081A3634 
X-CRM114-Status: GOOD (  19.41  )
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

SGVsbG8sCgorIENoZW5nIE1pbmcgZnJvbSBNYWNyb25peAoKT24gMTkvMDYvMjAyNSBhdCAyMjow
MDowMyArMDgsIENodWt1biBQYW4gPGFtYWRldXNAam11LmVkdS5jbj4gd3JvdGU6Cgo+IEhpLAo+
Cj4+IFBsZWFzZSBjYyBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyBmb3IgYWxsIHBhdGNo
ZXMgYW5kIHF1ZXJpZXMKPj4gcmVsYXRlZCB0byBNVEQgc3Vic3lzdGVtcy4KPj4gUnVuIC4vc2Ny
aXB0cy9nZXRfbWFpbnRhaW5lcnMucGwgb24gdGhlIHBhdGNoIGZvciBtb3JlIGluZm9ybWF0aW9u
Lgo+Cj4gU29ycnksIEkgZm9yZ290IHRvIGFkZCB0aGUgZm9sbG93aW5nIG1haWxpbmcgbGlzdC4K
PiBEbyBJIG5lZWQgdG8gcmVzZW5kIHRoaXMgcGF0Y2g/Cj4KPj4gV2h5PyB0aGlzIGRhdGFzaGVl
dCBzYXlzIG90aGVyd2lzZSBbMV06Cj4+Cj4+IFdvdWxkIGl0IGJlIHBvc3NpYmxlIHRoYXQgU1BJ
L1FTUEkgY29udHJvbGxlciBvZiBHTC5pTmV0IEdMLU1UMzAwMAo+PiBoYXMgYSBsaW1pdGF0aW9u
Pwo+Cj4gR0wuaU5ldCBHTC1NVDMwMDAgdXNlcyBNZWRpYVRlayBNVDc5ODEgU29DLCB3aXRoIFNQ
SSBjb250cm9sbGVycwo+IGJhc2VkIG9uIElQTSBkZXNpZ24uIFsxXQo+Cj4gSSBkb24ndCBrbm93
IHdoYXQgdGhlIGRpZmZlcmVuY2UgaXMgYmV0d2VlbiB0aGUgU1BJIGNvbnRyb2xsZXJzIG9mCj4g
TVQ3OTgxIGFuZCB0aGUgWnlucSB1c2VkIGluIGNvbW1pdCBbMl0uCj4KPiBJbiBteSBjYXNlLCB1
YmlfaW9fcmVhZCBhbmQgZWNjIGVycm9ycyBvY2N1cnJlZCB3aGVuIHRoZSBvcGVud3J0Cj4gYXR0
YWNoIHViaSBwYXJ0aXRpb24gKE5NQk0gaGFzIGJlZW4gZGlzYWJsZWQgWzNdKToKPgo+IFsgICAg
Ny44NTIwMDBdIHViaTAgd2FybmluZzogdWJpX2lvX3JlYWQ6IGVycm9yIC01IHdoaWxlIHJlYWRp
bmcgMTI2OTc2IGJ5dGVzIGZyb20gUEVCIDUxNzo0MDk2LCByZWFkIG9ubHkgMCBieXRlcywgcmV0
cnkKPiBbICAgIDcuODY1Mzc0XSB1YmkwIHdhcm5pbmc6IHViaV9pb19yZWFkOiBlcnJvciAtNSB3
aGlsZSByZWFkaW5nIDEyNjk3NiBieXRlcyBmcm9tIFBFQiA1MTc6NDA5NiwgcmVhZCBvbmx5IDAg
Ynl0ZXMsIHJldHJ5Cj4gWyAgICA3Ljg3ODc0Ml0gdWJpMCB3YXJuaW5nOiB1YmlfaW9fcmVhZDog
ZXJyb3IgLTUgd2hpbGUgcmVhZGluZyAxMjY5NzYgYnl0ZXMgZnJvbSBQRUIgNTE3OjQwOTYsIHJl
YWQgb25seSAwIGJ5dGVzLCByZXRyeQo+IFsgICAgNy44OTIxMDRdIHViaTAgZXJyb3I6IHViaV9p
b19yZWFkOiBlcnJvciAtNSB3aGlsZSByZWFkaW5nIDEyNjk3NiBieXRlcyBmcm9tIFBFQiA1MTc6
NDA5NiwgcmVhZCAwIGJ5dGVzCj4gWyAgICA3LjkwMTc1NF0gVUJJRlMgZXJyb3IgKHViaTA6MiBw
aWQgNjg3KTogdWJpZnNfbGViX3JlYWQ6IHJlYWRpbmcgMTI2OTc2IGJ5dGVzIGZyb20gTEVCIDE6
MCBmYWlsZWQsIGVycm9yIC01Cj4KPiBBZnRlciBkaXNhYmxpbmcgY29udGludW91cyByZWFkLCB0
aGlzIGZsYXNoIHdvcmtzIGZpbmUuCj4gU28gZGVzcGl0ZSB0aGUgZGF0YXNoZWV0IHN0YXRpbmcg
c3VwcG9ydCwgSSB0aGluayBpdCB3b3VsZCBiZQo+IGJldHRlciB0byBkaXNhYmxlIGl0IGZpcnN0
IHRvIGF2b2lkIGJyaWNraW5nIE1UNzk4MSBkZXZpY2VzCj4gd2l0aCBNWDM1TEZ4R0U0QUQgZmxh
c2guCgpJIGFtIHNvcnJ5IGJ1dCBkaXNhYmxpbmcgdGhlIGZlYXR1cmUgZm9yIGV2ZXJ5IHVzZXIg
b2YgdGhlIGNoaXAgZG9lcyBub3QKd29yayBpZiB0aGUgcHJvYmxlbSBjb21lcyBmcm9tIHRoZSBT
UEkgY29udHJvbGxlci4KCkkganVzdCBhZGRlZCBDaGVuZyBNaW5nIGZyb20gTWFjcm9uaXguIENo
ZW5nIE1pbmcsIGNhbiB5b3UgY29uZmlybSB0aGVzZQpjaGlwcyBzdXBwb3J0IGNvbnRpbnVvdXMg
cmVhZD8gSXMgdGhlcmUgYW55dGhpbmcgc3BlY2lmaWMgYWJvdXQgdGhlbQp0aGF0IG1pZ2h0IGNh
dXNlIHRoaXMgYnJlYWthZ2U/CgpUaGFua3MgYSBsb3QsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
