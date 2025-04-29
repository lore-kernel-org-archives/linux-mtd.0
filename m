Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04592C3ABA9
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Apr 2025 10:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FdawSULli3riZDsExhk5ZU3kPHSkhu/YNMHhLjYhVCw=; b=rpZqG6ad+sd7Jv
	h+7qqdZ1BT1es/4d190W0W4HHfxkBljuXpv4wvc6B2UeqR/9p3BtbNz5uTZJNB4oYWLaQgIKnh7o9
	GvVhzwPFGMUMBL6fyybRlF2bgVK1wkVinIX39rPatoGb7BGaFxNcdXxHzZb+duDpjQxdFHpndbwUO
	WbLws2eKTMdk33KK/f3ft6OYnf5zcqq3P28myP0Kgmxr7JL10QvS9NmmNAe79lNpH3e46yNzdv9JK
	ttZKtR04nZJNLh7rCzOCAZLUX+R6OmzgFBCD+gFmd1xj9skIY3SsMn10WsMpMdAKn0dFErZYJoukm
	sYM7Sf57GBd0yE75SapQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9iF5-00000009JyF-2YHN;
	Tue, 29 Apr 2025 10:31:11 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9h8W-000000096C8-2ylB
	for linux-mtd@lists.infradead.org;
	Tue, 29 Apr 2025 09:20:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D70DE43218;
	Tue, 29 Apr 2025 09:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745918418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FPVpK8S6KKRUozQUb8KiO23QtW/NHAE+krU+hOxvdvU=;
	b=SMfuSMNZY+y6rAX5xUOY91yY/5MjTlunQLcg95OqnBD2WZCeyUK40y7LnEmGEKpPz05wti
	wAXRZWnIeiCSoVSUSbYmgXQ1FvZnXP44MZL2i/K+45g+it7igWrrkElf2Zdu5MJJowy1En
	Afd9+eKkfhcH/cRDXxz5yF45rzEXOD/OuTMKoP7UQfFcrqAngmLkwLFsjFoB6p1CbXzk6v
	gqXE8rUWneRMwtBn4AAiD/Ome25VjrnwnUmpAOUwSItEsiY7ZQ/VFKR63PtbarIPX0qyWy
	S0DYXrzIIfqThuNqQ92yaV8Qt8udtw4Dez5xLQzv1/1j7b+XfuRvDuBl304+7A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: robh@kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 krzk+dt@kernel.org, linux-mtd@lists.infradead.org, masahiroy@kernel.org, 
 nathan@kernel.org, nicolas.schier@linux.dev, richard@nod.at, 
 vigneshr@ti.com
In-Reply-To: <20250411200858.3266447-1-Frank.Li@nxp.com>
References: <20250411200858.3266447-1-Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: mtd: convert vf610-nfc to yaml
 format
Message-Id: <174591841673.992719.14553059335435921742.b4-ty@bootlin.com>
Date: Tue, 29 Apr 2025 11:20:16 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledvrddukeegrddutdekrddvheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrddutdekrddvheehpdhhvghloheplgduledvrdduieekrddurddutdeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggru
 gdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitgholhgrshdrshgthhhivghrsehlihhnuhigrdguvghvpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrght
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_022021_043708_008E906F 
X-CRM114-Status: UNSURE (   5.58  )
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

T24gRnJpLCAxMSBBcHIgMjAyNSAxNjowODo1OCAtMDQwMCwgRnJhbmsgTGkgd3JvdGU6Cj4gQ29u
dmVydCBiaW5kaW5nIGRvYyB2ZjYxMC1uZmMgdG8geWFtbCBmb3JtYXQuCj4gCj4gQWRkaXRpb25h
bCBjaGFuZ2VzOgo+IC0gcmVmIHRvIG5hbmQtY29udHJvbGxlci55YW1sLgo+IC0gaW5jbHVkZSBh
cm0tZ2ljLmggYW5kIHZmNjEwLWNsb2NrLmggaW4gZXhhbXBsZXMuCj4gLSBhZGQgY2xvY2tzIGFu
ZCBjbG9jay1uYW1lcyBkZXNjcmlwdGlvbi4KPiAtIHJlbW92ZSAjYWRkcmVzcy1jZWxscywgI3Np
emUtY2VsbHMgYXNzaWduZWQtY2xvY2tzIGFuZAo+IGFzc2lnbmVkLWNsb2NrLXJhdGVzLgo+IAo+
IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBkdC1iaW5kaW5nczog
bXRkOiBjb252ZXJ0IHZmNjEwLW5mYyB0byB5YW1sIGZvcm1hdAogICAgICBjb21taXQ6IDc4Njkz
ZmY2OGM4YzhhYThiODU1MzM1MWU4NTQ4Mzg2Y2NjZGQwYzYKClBhdGNoZShzKSBzaG91bGQgYmUg
YXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQ
UiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2Fy
ZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
