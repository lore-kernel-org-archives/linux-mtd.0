Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA3DC282C5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Mar 2025 11:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bKMEAK5Jcaw/e3aABthX/8Kg2bmHLyy6oh0DuxOZLu4=; b=dahB6CtxM/isEp
	b0vCPiBazYAUDpnf/Abeaw3fIrdVkl72ubxuPmVD4UbcyvFrHghUO6nQ8X23s9sYsfeh2xwC7lVjY
	ciAM9zSlL+T0Gb2IiebnLlsfFTzbaq+7MBA+9CpXyPt4QT/nxghDwk9KuqAnACWQ7X28Pzwr2fp+9
	Dt+xdo67Ibm22J72Wi7dfkpNtsgx1saUEZDRnk+QErw9iIr3gcUZt5PSBifLd+n8eWuU2yBPY3lCn
	kzU5pAJf10FwazfpDsiO45CROYRCjVUoXJqLYf7j9A5olUYn6pWtT/GWRaWHx7VkA0CZHzklJbdOU
	UVkTDOAP0eTqIaCXkKcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3ac-00000000Ryc-3vwW;
	Mon, 03 Mar 2025 11:04:02 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3aZ-00000000Rx5-3Do9
	for linux-mtd@lists.infradead.org;
	Mon, 03 Mar 2025 11:04:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6DF9442A0;
	Mon,  3 Mar 2025 11:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740999836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UYg0OhYtGacV1+2euRFkrodD8aiR3ZlFwLFtEbH5bs4=;
	b=V8rOERi1COiXtad2VjJsc+kUj6Z6y0+6M3Z8Aca8oFl51RYAgTUurp8mL0bv5hRvcjIr7m
	qg39TNohItoSwlghPft2YRClrT0x6wBCJRl1A3C2dzF5wliEbC66pUfGzWjKaScV5sDy0a
	r00HZwBNkvTlDKdDhJUqyrr5sFGQUWErqyHpwkkDOC7SvkcH/ZiTIqqURZwdYZ2QvRXxyC
	QGA32FNXcv5XcpWeSE4mME5PIq+XBUKqUhu7C6GeVYgANuYgqCIgph3PvEE4iImy5yUbnd
	MIXeIv/foWBijvuAYDjB/VTcmba/48RTmFzVawX1rfT6eXdxC6ipw2gNY+fh4A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-tegra@vger.kernel.org,  linux-mtd@lists.infradead.org,  Jonathan
 Hunter <jonathanh@nvidia.com>,  Lucas Stach <dev@lynxeye.de>,  Richard
 Weinberger <richard@nod.at>,  Stefan Agner <stefan@agner.ch>,  Thierry
 Reding <thierry.reding@gmail.com>,  Vignesh Raghavendra <vigneshr@ti.com>,
  LKML <linux-kernel@vger.kernel.org>,  kernel-janitors@vger.kernel.org,
  Qasim Ijaz <qasdev00@gmail.com>,  Natalie Vock <natalie.vock@gmx.de>
Subject: Re: mtd: rawnand: tegra: Simplify maximum determination in
 tegra_nand_setup_timing()
In-Reply-To: <0193ac44-e858-4aff-a50f-dd95dbf3de5b@web.de> (Markus Elfring's
	message of "Mon, 3 Mar 2025 11:55:49 +0100")
References: <d564cafe-d45a-40b5-9a91-a2e2b97c80d6@web.de>
	<87pliy9yyv.fsf@bootlin.com>
	<0193ac44-e858-4aff-a50f-dd95dbf3de5b@web.de>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 03 Mar 2025 12:03:55 +0100
Message-ID: <87h64a9y04.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelkeeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteehkeelvddvheehtdefkedtjeeutedthfegudekgeefleetkeettdekiefftdeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepofgrrhhkuhhsrdfglhhfrhhinhhgseifvggsrdguvgdprhgtphhtthhopehlihhnuhigqdhtvghgrhgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehjohhnrghthhgrnhhhsehnvhhiughirgdrtghomhdpr
 hgtphhtthhopeguvghvsehlhihngigvhigvrdguvgdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehsthgvfhgrnhesrghgnhgvrhdrtghhpdhrtghpthhtohepthhhihgvrhhrhidrrhgvughinhhgsehgmhgrihhlrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_030400_108498_B4BCA22A 
X-CRM114-Status: UNSURE (   7.89  )
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

T24gMDMvMDMvMjAyNSBhdCAxMTo1NTo0OSArMDEsIE1hcmt1cyBFbGZyaW5nIDxNYXJrdXMuRWxm
cmluZ0B3ZWIuZGU+IHdyb3RlOgoKPj4gSSBhbSBzb3JyeSwgSSBkbyBub3Qgc2VlIHdoYXQgZ2V0
cyBzaW1wbGlmaWVkLiBtYXgobWF4KGEsYiksbWF4KGMsZCkpCj4+IGxvb2tzIHNpbXBsZXIgdGhh
biBtYXgzKGEsYixtYXgoYyxkKSkuCj4KPiBZb3Ugd291bGQgZXZlbnR1YWxseSBsaWtlIHRvIGV4
cHJlc3MgdGhhdCBhIG1heGltdW0gc2hvdWxkIGJlIGRldGVybWluZWQKPiBmcm9tIHRocmVlIChv
ciBldmVuIGZvdXI/KSB2YWx1ZXMuCgpJZiB0aGVyZSB3YXMgYSBtYXg0KCksIHdoeSBub3QsIGJ1
dCBpbiB0aGlzIGNhc2UgSSBkb24ndCBzZWUgdGhlIHBvaW50LgoKPiBodHRwczovL2VsaXhpci5i
b290bGluLmNvbS9saW51eC92Ni4xNC1yYzQvc291cmNlL2luY2x1ZGUvbGludXgvbWlubWF4Lmgj
TDE0Nwo+Cj4KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRG9lcyBp
dCBicmluZyBzb21ldGhpbmcgaW4gdGVybXMKPj4gb2Ygb3B0aW1pemF0aW9uPwo+IENvcnJlc3Bv
bmRpbmcgZWZmZWN0cyBkZXBlbmQgb24gdmFyaW91cyBmYWN0b3JzLCBkb24ndCB0aGV5PwoKT2ss
IHNvIEknbGwgYXNzdW1lIHRoZSBhbnN3ZXIgdG8gbXkgcXVlc3Rpb24gaXMgIm5vIi4KClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
