Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A26C02198
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 10:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+pSTNdBEr8DstVafh5yyJIjD2m+sRFOzdR918xUBS4M=; b=cy4E4qubzNOUI1
	igwDZ0wqOFw1RWq3BkOLiJayDKYzfyLIB1alZvzg4eoWfg8DvxRr1s5gt3Wq3xYkncLHFQq86iY0c
	rFVxo0PyG9Ti2W1bEZVcVwj/xtr+KRZDk7OHPxXpemP4qqioAlMNdcUVgghrtSGO+p7NNejHXpHtA
	WKQuPB17YViQgjEdSU19gEq9nBisG2DYzAk61vPVtWPEoKk/rWplnVFUcjpysiu6FF5JiddfZgyNX
	URLuJSX/+1J45Cg4RhmC3/5rvqSVjT6Ku0GAtL1ejvWvz2LoGtawOrNLAIpibiGvSchR9JZzV1//y
	uOgfyV5TvDRCzzl2GmkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQqG-0000000GxZA-3bkg;
	Mon, 10 Feb 2025 10:16:40 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQhW-0000000Gw2Z-03SY
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 10:07:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20F4A43310;
	Mon, 10 Feb 2025 10:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739182055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mnl3ltpqxpmKsu6ADKCDAYoWAzvYAgs424uvMZsRJgU=;
	b=acVPICqu0TBFFs2SvOxoD9jCnQMn6eBRgOjhWyhfADFr/zZlvXTbKYpzTz/GDzGuf+XKay
	j5EnsAX1lqCax9ADUcCgLOEAGpB3jvdZ2RgFINVD3XwZdr7V40acxkShb5M8aYjJLqz3Tz
	gtonrrdTXokKmGFlMhwagGNT+e0dLdYeyI9OXN5SnAdvht42I1RKbz9giR7/GCw5cGXxJ3
	BXW0TrZEQvn3HSCkUUrrtTs63YIiNycAN1wWxwFXmtIE4kwERyatIz5udhI9W2hCMSMIpo
	vCRRFGUrsq9gRhnH1BdEUJkucXmwHdbT8wmZyzeziLOineNJXl42SgH7fObB/w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  richard@nod.at,  alvinzhou@mxic.com.tw,
  leoyu@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v3 1/2] mtd: spi-nand: Add read retry support
In-Reply-To: <CAAyq3SZF9eGKfLLcC3zFHq85-AEb9B=Grjqfap8QqCUKLdLSVw@mail.gmail.com>
	(Cheng Ming Lin's message of "Mon, 10 Feb 2025 10:46:19 +0800")
References: <20250122065605.285145-1-linchengming884@gmail.com>
	<20250122065605.285145-2-linchengming884@gmail.com>
	<878qqj3sju.fsf@bootlin.com>
	<CAAyq3SZF9eGKfLLcC3zFHq85-AEb9B=Grjqfap8QqCUKLdLSVw@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 10 Feb 2025 11:07:33 +0100
Message-ID: <87frkmt8nu.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefjeejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeelvddrudekgedrleekrdekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedrleekrdekgedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehlihhntghhvghnghhmihhnghekkeegsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrt
 ghpthhtoheprghlvhhinhiihhhouhesmhigihgtrdgtohhmrdhtfidprhgtphhtthhopehlvghohihusehmgihitgdrtghomhdrthifpdhrtghpthhtoheptghhvghnghhmihhnghhlihhnsehmgihitgdrtghomhdrthif
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_020738_178509_5FEC2746 
X-CRM114-Status: UNSURE (   8.85  )
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

SGVsbG8sCgo+PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IHNwaW5hbmQt
PnNldF9yZWFkX3JldHJ5KHNwaW5hbmQsIHJldHJ5X21vZGUpOwo+PiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGlmIChyZXQgPCAwKSB7Cj4+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBlY2NfZmFpbGVkID0gdHJ1ZTsKPj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4+Cj4+IFNoYWxsIHdlIHRyeSB0byBz
ZXQgdGhlIHJlYWRfcmV0cnkgbGV2ZWwgdG8gMCB1cG9uOgo+Pgo+PiAgICAgICBpZiAocmV0IDwg
MCAmJiByZXRyeV9tb2RlID4gMSkKPj4KPj4gPwo+Cj4gSWYgd2Ugc2V0IHRoZSByZWFkX3JldHJ5
IGxldmVsIHRvIDAgdXBvbiwgYW5kIHNldF9yZWFkX3JldHJ5IGZhaWxzCj4gd2hlbiByZXRyeV9t
b2RlIGVxdWFscyB0byAxLCBpdCB3b24ndCByZXR1cm4gYW4gZXJyb3IuIFRoaXMgY291bGQKPiBw
b3RlbnRpYWxseSBtYXNrIGFuIHVuZGVybHlpbmcgaXNzdWUuCgpEb24ndCBzYXZlIHRoZSByZXR1
cm4gdmFsdWUgaW4gdGhpcyBjYXNlPyBCdXQgb3RoZXJ3aXNlIHlvdSB3b3VsZCBsZWF2ZQp0aGUg
Y2hpcCBpbiBhIHJldHJ5IHN0YXRlLCBubz8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
