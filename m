Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8CFC282D1
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 09:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xjVNnr4IJ0KNB5qQ/o7Swt9jn3dqAW7pnCiVW4xDeSY=; b=MMbzWRhqVy6Uxh
	HLMpOsN8DuEQvgg52FBg1VdYbK6ZVs08GLuElzTLp4FqE3igwCiPD58WR4UMehP0mP63UW2BPUoyq
	/Jh9UcvaHaKcK7LUtDrgOxClxX0MyxHZ+bgZAUTGmbE/zu4A4vNhcSnxCv78yl6U4vigvqT7AJKws
	LgDXS5mzAh4EBCPPm7VVBlJ4wPrxvOj3eBCJZhQZykx/FWLNlrHwnmPuTpB9L64YC8TS/Fz9rR4ve
	WpABOl7rwIUiGwP+nGaOGbtu4gfo861f0LzPz0lZfDif0YPHQYBiu6a76PiRp2zKEgAnQOOWfQpZM
	0+3KXJPqPootupJHMzCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq7qY-0000000AXPo-2xdH;
	Thu, 06 Mar 2025 09:48:54 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6go-0000000ALw1-37Sy;
	Thu, 06 Mar 2025 08:34:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 435F744267;
	Thu,  6 Mar 2025 08:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741250083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4X+FnHVpWzWW4W0hGDVyaY0sBAjRDXZg/ShUEe46pbo=;
	b=mF8P6ZyAPX08OLt4l16Kpo2v7XG2grorpNpUUF2ND52CndXRHfjFV0oy/0WjBehTD5VZE7
	f+mraZVyAQQPAt4SFEev/YX24UWI4LhjvB3GTRNaQ4YNrbhNUIVGK3QsMawpwpYOW9obEh
	RsMG6stsKk68DAv6eZY+InvMQF3LSz7/wKKtC+ZkE41HylBQNUuEYyUYSSnscCKfXdnNsV
	DWqFrp872aRrtLF8IuGFzj8oqNxq61u+Kl1ye0+RDclKmW4kGejtdp8d/4RwrLRPeiOhiS
	DLrtSBWgq6iM6miU7AmQNzvXBkHjT5nT88HacGvinpbJAQMAPOlu57ikZO4d+A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Manikandan.M@microchip.com>
Cc: <mwalle@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <Nicolas.Ferre@microchip.com>,
  <alexandre.belloni@bootlin.com>,  <claudiu.beznea@tuxon.dev>,
  <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <devicetree@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <Varshini.Rajendran@microchip.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: sst: register SFDP region into NVMEM
 framework to read MAC Address
In-Reply-To: <6fee6e71-106f-474b-9a0c-5df5fb0caa00@microchip.com> (Manikandan
	M.'s message of "Thu, 6 Mar 2025 07:09:44 +0000")
References: <20250305100134.1171124-1-manikandan.m@microchip.com>
	<D889CRJC6W19.2LDQCDVG7BLNG@kernel.org>
	<6fee6e71-106f-474b-9a0c-5df5fb0caa00@microchip.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 06 Mar 2025 09:34:41 +0100
Message-ID: <87eczawo9q.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdejvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtohepofgrnhhikhgrnhgurghnrdfosehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepmhifrghllhgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopefpihgtohhlrghsrdfhvghrrhgvsehmihgtrhhotghhihhprdgto
 hhmpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_003446_911920_4A4087F4 
X-CRM114-Status: UNSURE (   8.94  )
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

Cj4+PiArc3RhdGljIGludCBzc3QyNnZmX25vcl9wb3N0X3NmZHAoc3RydWN0IHNwaV9ub3IgKm5v
cikKPj4+ICt7Cj4+PiArICAgICBzdHJ1Y3QgbnZtZW1fZGV2aWNlICpudm1lbTsKPj4+ICsKPj4+
ICsgICAgIHNzdDI2dmZfc2ZkcF9udm1lbV9jb25maWcuZGV2ID0gbm9yLT5kZXY7Cj4+PiArICAg
ICBzc3QyNnZmX3NmZHBfbnZtZW1fY29uZmlnLnNpemUgPSBub3ItPnNmZHAtPm51bV9kd29yZHMg
KiBzaXplb2YoKm5vci0+c2ZkcC0+ZHdvcmRzKTsKPj4+ICsgICAgIHNzdDI2dmZfc2ZkcF9udm1l
bV9jb25maWcucHJpdiA9IG5vcjsKPj4+ICsgICAgIHNzdDI2dmZfc2ZkcF9udm1lbV9jb25maWcu
cmVnX3JlYWQgPSBzc3QyNnZmX3NmZHBfbWFjX2FkZHJfcmVhZDsKPj4+ICsKPj4+ICsgICAgIG52
bWVtID0gZGV2bV9udm1lbV9yZWdpc3Rlcihub3ItPmRldiwgJnNzdDI2dmZfc2ZkcF9udm1lbV9j
b25maWcpOwo+Pj4gKyAgICAgaWYgKElTX0VSUihudm1lbSkpIHsKPj4+ICsgICAgICAgICAgICAg
ZGV2X2Vycihub3ItPmRldiwgImZhaWxlZCB0byByZWdpc3RlciBOVk1FTSBkZXZpY2U6ICVsZFxu
IiwgUFRSX0VSUihudm1lbSkpOwo+Pj4gKyAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihudm1l
bSk7Cj4+IAo+PiBJIGRvbid0IHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRvIGhhdmUgdGhpcyBvbmUt
b2ZmIGluIGEgcGFydGljdWxhcgo+PiBkcml2ZXIuIElmIGF0IGFsbCwgdGhpcyBzaG91bGQgYmUg
aGFuZGxlZCBpbiB0aGUgY29yZS4gU29ycnksIGJ1dAo+PiB0aGlzIHJlYWxseSBsb29rcyBsaWtl
IGFuIHVnbHkgaGFjay4KPj4gCj4KPiBCZWNhdXNlIHRoZSBFVUkgaWRlbnRpZmllciB3aXRoaW4g
dGhlIFNGRFAgaXMgdW5pcXVlIHRvIHRoZSAKPiBTU1QyNlZGMDY0QkVVSSBmbGFzaCwgSSBvcHRl
ZCB0byBoYW5kbGUgaXQgaGVyZSByYXRoZXIgdGhhbiBpbiB0aGUgY29yZS4KPgo+IEFsc28gaGVy
ZSB0aGUgTUFDIGFkZHJlc3MgZGF0YSByZXNpZGVzIHdpdGhpbiB0aGUgMHgyNjAtMHgyNkYgcmFu
Z2UsIEkgCj4gd2lsbCByZXNpemUgdGhlIG52bWVtX2NvbmZpZy5zaXplIHRvIDB4MTAgaW5zdGVh
ZCBvZiByZWdpc3RlcmluZyB0aGUgCj4gZnVsbCBTRkRQIHJlZ2lvbiBhcyBOVk1FTS4KCk9wZW4g
cXVlc3Rpb24gdG8gYWxsIHBhcnRpZXMgaW4gdGhpcyB0aHJlYWQ6IGhvdyBkbyB3ZSBnaXZlIGFu
IG9mZnNldCBpbgp0aGUgZGV2aWNlIHRyZWUgdGhhdCBpcyByZWxhdGl2ZSB0byB0aGUgc2ZkcCBy
ZWdpb24gYW5kIG5vdCB0aGUgZGF0YQpyZWdpb24/IEkgYmVsaWV2ZSB3ZSBjYXJlIG5vdCB0byBt
aXggdGhlc2UgYXJlYXMgd2hpbGUgZGVzY3JpYmluZy4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
