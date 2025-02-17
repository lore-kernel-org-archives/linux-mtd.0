Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAE1C021AA
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2025 15:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kcIx512cQcK9sLo8aax3HbFflP7Lwp+Cy0qpQmUMhcU=; b=aXSFfODqANmcC4
	eZvcSqBoelWSFD/bcqnKsWeYjDxV8LmOyxvPkIFRt0DC47QKanltD9uRMB4NJv1I4WfmOe5FqXuga
	q79YMmklIEY5WGaVtXGnzhHL1OxR8a/aD0JsEY1BzEE+R+NNk7jRPJs+q/X44Y9ay/muFXtJwwOTo
	udG+loQXrmbJ3prYdJX1tY8XlVyCInP3Yc6ZeyptjQLtMXGXGi9YvIufZwfkZWVvgqQDT1Y99GjBU
	y8oRYEr52nGjV5ymFLSlm1GE+21O9BhGBHmkpvFtktBgrNV8M7mgq5EIcLRM/0cN1AYcd4UyDHqgH
	TSxZJMdRZavGmoSvGJrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk38R-000000053XF-2Za0;
	Mon, 17 Feb 2025 15:34:15 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk38N-000000053Sz-3Geu
	for linux-mtd@lists.infradead.org;
	Mon, 17 Feb 2025 15:34:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB5E644404;
	Mon, 17 Feb 2025 15:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739806449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zjug7zwJB+7D/J3bHUofos6eYTEPhFwBND0lwrNQIg8=;
	b=WT6BucwD7+xprmkMsraMp/zqE6plEloteVWxDasofM9CirfwaS0NsFBu3Gt50LmcrbZ/VC
	HrKQ78/bXAKMdsBq5t/it+iX7oiBM7YVRFUjOLmVR70p7TzV842ydMS0syHquO4KevwF/M
	R2LcOL1bPjtlFz85k1cLXoZha060e3kxL/9LNPuePK2HaIkikNL8zgkVzYN3+8AAr9udAE
	zHJLf0c06LOg9QLRfW+4i4fUAndBBbXGpRzqyzJD5hy0TnDf2GSy6QRG4CD3p7rq85C+5M
	BEMrKXBnNK2bICuvpy7dDTrLE5c0or7acLN7aaOIGB1ENybYSleWOY1TcnSf4g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Michael
 Walle <mwalle@kernel.org>,  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: spi-nor: fixes for v6.14-rc4
In-Reply-To: <mafs08qq4myux.fsf@kernel.org> (Pratyush Yadav's message of "Mon,
	17 Feb 2025 14:26:14 +0000")
References: <mafs08qq4myux.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 17 Feb 2025 16:34:08 +0100
Message-ID: <871pvwvb4f.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehkeejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehmfigrlhhlvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhts
 hdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_073412_434732_4A6A1ACC 
X-CRM114-Status: UNSURE (   6.54  )
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

SGkgUHJhdHl1c2gsCgpPbiAxNy8wMi8yMDI1IGF0IDE0OjI2OjE0IEdNVCwgUHJhdHl1c2ggWWFk
YXYgPHByYXR5dXNoQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBIaSBNaXF1ZWwsCj4KPiBXZSBoYXZl
IGEgcmVncmVzc2lvbiB3aXRoIFNTVCBmbGFzaCB3cml0ZXMuIFRoaXMgcHVsbCByZXF1ZXN0IGNv
bnRhaW5zCj4gdGhlIGZpeC4KClN1cmUuCgpJbiBnZW5lcmFsIHlvdSBjYW4ganVzdCBsZXQgbWUg
a25vdyB3aGVuIHlvdSB3YW50IHRvIHF1ZXVlIHBhdGNoZXMKdG8gbXRkL2ZpeGVzLCBJIGtub3cg
bWFraW5nIGEgZm9ybWFsIG1lcmdlIHJlcXVlc3QgaXMgYSBiaXQgaGVhdnksIHNvCmZvciBmaXhl
cyBib3RoIHdheXMgd29yayBmaW5lIHdpdGggbWUuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
