Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7034CD1CDC0
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2024 08:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0jrt8/mQYYgqWQ3QEZg800sMd8CEAiwqOWXEX5W/mE=; b=rFvPJtrVwGC/yI
	5avjgJXhGcyefnEp8udaeKH44+VPxOBtJbdkkRIG/N+O86irXtH7isjs92juUhVex9hlZfa5dTvnC
	eGz6YkgCJpdJ0MHbHTl8pFXrgwliwh9N6lsFelzrthgTVOuPw+szCSnL7NT+/d+jX6sGiThM5LZYm
	eUrxAPk3K6WhhrDFMZjN6JhaCy4L3XcsX0c5Ox5/vmka6As+jRX9dlHsHZqZDicH+8c1fUoPXUQjG
	/2lPRPwU8+nhVdRc1SWOFw8Yhw4VQOJxuSg1bwmsTBJlwnUTUbSLc16N8JhDaWq8jwXjSp37Oyulg
	mjepzYrTaTrtY0w6bMvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Aia-0000000AFyy-22qo;
	Tue, 22 Oct 2024 08:58:20 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Abh-0000000AEYs-0ZOb;
	Tue, 22 Oct 2024 08:51:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF223E0002;
	Tue, 22 Oct 2024 08:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729587070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TQcS/K1EL6TJRmWoBCyGMGQnz1Ou/w2iE3xeVuMMr/M=;
	b=QQhlXlUfBbPRw4FrGNQz71LqTH9JBAfQIy+uGcFziA3YMgqQDrl+m8asJT6kfpW73K/W0O
	fanUjjjlf9L2zbV0OuuOej0RC5NHuUBS2qKzo59xmg7Fyg0ZP7ofg7PjgWe/Czep9io91f
	mzAJuRw8WVOVI+TRtNhRq3/0ucLb5d5p8oDAjoys8pUO+/XkHCZld1osg1mNNGhYn9MC41
	MJbjldOkZC1dOz+HIg+XmtIAEOILhhRkqz9Szqi/rf7pkHTWntnKxXtDYhXt53REg51NAc
	RVo+RiFKLRO5WBw1FX8jmusCCnFWEPo/xZzkT9gQx09x8dzXF5a/8/X95SUvSA==
Date: Tue, 22 Oct 2024 10:51:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hui-Ping Chen <hpchen0nvt@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nikita.shubin@maquefel.me, arnd@arndb.de,
 vkoul@kernel.org, esben@geanix.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
Message-ID: <20241022105109.1906f524@xps-13>
In-Reply-To: <9cfd923a-4bc8-4a6c-986d-8d0c6fd6d9bb@gmail.com>
References: <20241018022519.721914-1-hpchen0nvt@gmail.com>
	<20241018022519.721914-3-hpchen0nvt@gmail.com>
	<20241021103254.1f31205b@xps-13>
	<9cfd923a-4bc8-4a6c-986d-8d0c6fd6d9bb@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_015113_331371_D27E85CB 
X-CRM114-Status: GOOD (  10.82  )
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

SGkgSHVpLVBpbmcsCgo+ID4+ICsKPiA+PiArc3RhdGljIGludCBtYTM1X25hbmRfd3JpdGVfcGFn
ZV9od2VjYyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBjb25zdCB1OCAqYnVmLAo+ID4+ICsJCQkJ
ICAgICAgaW50IG9vYl9yZXF1aXJlZCwgaW50IHBhZ2UpCj4gPj4gK3sgIAo+ID4gVGhlIGhhcmR3
YXJlIEVDQyBlbmdpbmUgc2hvdWxkIGFsd2F5cyBiZSBkaXNhYmxlZCBieSBkZWZhdWx0Lgo+ID4K
PiA+IFRoZW4sIGluIHRoZXNlIGhlbHBlcnMgeW91IHNob3VsZDoKPiA+ICogZW5hYmxlIHRoZSBF
Q0MgZW5naW5lCj4gPiAqIGRvIHlvdXIgdGhpbmdzCj4gPiAqIGRpc2FibGUgdGhlIEVDQyBlbmdp
bmUgIAo+IAo+IFRoZSBFQ0MgZW5naW5lIG9mIHRoZSBNQTM1IE5BTkQgY29udHJvbGxlciBjYW5u
b3QgYmUgdHVybmVkIG9uIG9yIG9mZiBzZXBhcmF0ZWx5Lgo+IAo+IFRoZSBFQ0MgZW5naW5lIGlz
IGFjdGl2YXRlZCB3aXRoIHRoZSBETUEsCj4gCj4gYW5kIGl0IGNhbGN1bGF0ZXMgYW5kIHdyaXRl
cyB0byB0aGUgT09CIGR1cmluZyB0aGUgdHJhbnNmZXIuCgpXaGF0IGFib3V0OgoKRUNDIEFsZ29y
aXRobSBFbmFibGUgQml0IFsyM10gRUNDRU4KCglUaGlzIGZpZWxkIGlzIHVzZWQgdG8gc2VsZWN0
IHRoZSBFQ0MgYWxnb3JpdGhtIGZvciBkYXRhCglwcm90ZWN0aW5nLiBUaGUgQkNIIGFsZ29yaXRo
bSBjYW4gY29ycmVjdCA4IG9yIDEyIG9yIDI0IGJpdHMuCgkwID0gQkNIIGNvZGUgZW5jb2RlL2Rl
Y29kZSBEaXNhYmxlZC4KCTEgPSBCQ0ggY29kZSBlbmNvZGUvZGVjb2RlIEVuYWJsZWQuCgo/CgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
