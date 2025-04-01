Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619B7C36014
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Apr 2025 12:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mzw1DO6ETsQLJQuU+dRQrQdXEN9lYEXmZegZyvRLIJ8=; b=dzQqg0/Gsdtjnt
	CmB/T3QFedfkT+6bh7/+NeD9GocHQ+0lBLxkYa5qLoupH3dbsCJFFvxgtDU0OH8009KbJ8/+PTwoJ
	g6iFp+ytt9ZnnIttBIUBGR0SsNAk5eEXDk7D7HYo72fpIya5lFCmMvQAkOar8i6AHenzxq+Hf9blc
	JXTLI+wsDmg1oFaImgF0vzS7QK9TV+gpEPQ0aSdML2yIe2y+0algtwvpPHIjpP8OJ4BynDtu6yXpo
	xmhwi2DwgzrOswsryaxlAH1Z4u3o0A6I+fVOpicmuNeW7KtXgW2wonEINGYtz872HkjUZN6LCXS41
	rXu8qvj/NhkUjS0hso+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzb3j-00000003LZq-2VNp;
	Tue, 01 Apr 2025 12:49:39 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzap7-00000003IJq-3yLp
	for linux-mtd@lists.infradead.org;
	Tue, 01 Apr 2025 12:34:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92337442FC;
	Tue,  1 Apr 2025 12:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743510870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gQiKS3PRSJxL3AJE4OR0yro+DINn76xiSWsh/Yf+G+s=;
	b=D18xgaEGPcn9ucQotIJIi0lrQgbQhamMz4qkoZuUR+Nqbdy8IikRc53A6HgZXm9qZuJSsp
	SdZyFhfEoHxZLjKWwzdN/ZA6QYF2I2wFSPgv8mtxNKYg4IfxjfpX2ahL8vUWEC2q3thInw
	V9eDjqBM0BTys/BAbljh/ygK/47nBcowxr6GT+ofIDcaup+oKUCCZWpHh9Lcou1C5W1j6h
	n3aCSKHUbRrSNBRzrEE3O8Uj3+Bxml9Z16NM7T3A2qtadAkTe8Mi/G74T/GvwHxR8yIbMC
	xhG/dAj8mvMgal4QDiFbFF0oJOadJZODV3wmDMknW1pohUa2e7b07u+8lWmOUQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd spinand build breakage
In-Reply-To: <20250331112612.4d230483@endymion> (Jean Delvare's message of
	"Mon, 31 Mar 2025 11:26:12 +0200")
References: <20250331112612.4d230483@endymion>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 01 Apr 2025 14:34:28 +0200
Message-ID: <874iz8t60b.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedvjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvdevueffgfehledtffeiudevvdekveeltdelkeefueefiefhieegveejkeekjeenucffohhmrghinhepmhgrrhgtrdhinhhfohenucfkphepledvrddukeegrdduuddtrdduleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrdduuddtrdduleefpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepjhguvghlvhgrrhgvsehsuhhsvgdruggvpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_053434_132529_7CAA78CE 
X-CRM114-Status: GOOD (  10.30  )
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

SGkgSmVhbiwKCk9uIDMxLzAzLzIwMjUgYXQgMTE6MjY6MTIgKzAyLCBKZWFuIERlbHZhcmUgPGpk
ZWx2YXJlQHN1c2UuZGU+IHdyb3RlOgoKPiBIaSBNaXF1ZWwsCj4KPiBUaGlzIGNvbW1pdCBvZiB5
b3VyczoKPgo+IGNvbW1pdCA3Y2UwZDE2ZDU4MDJiZmRlNDIwOWU1MmVlOGFkNjQ0Y2ExZWFiNDIz
Cj4gQXV0aG9yOiBNaXF1ZWwgUmF5bmFsCj4gRGF0ZTogICBGcmkgSmFuIDEwIDE1OjQ1OjI0IDIw
MjUgKzAxMDAKPgo+ICAgICBtdGQ6IHNwaW5hbmQ6IEFkZCBhbiBvcHRpb25hbCBmcmVxdWVuY3kg
dG8gcmVhZCBmcm9tIGNhY2hlIG1hY3Jvcwo+Cj4gYnJlYWtzIHRoZSBidWlsZCBmb3IgbWUgKHVz
aW5nIGdjYyA3LjUuMCkuIEkgc2VlIHRoaXMgaGFzIGFsc28gYmVlbgo+IHJlcG9ydGVkIGJ5IHRo
ZSBJbnRlbCB0ZXN0IHJvYm90IGhlcmU6Cj4KPiBodHRwczovL21hcmMuaW5mby8/bD1saW51eC1r
ZXJuZWwmbT0xNzQyMjc2MTA4MTA2MzUmdz0yCj4KPiBEbyB5b3UgaGF2ZSBhIGZpeCBmb3IgdGhp
cyBhbHJlYWR5LCBvciBzaG91bGQgd2UgcmV2ZXJ0IHRoaXMgY29tbWl0Cj4gKHBsdXMgMWVhODA4
YjRkMTViOSB3aGljaCBkZXBlbmRzIG9uIGl0KSBmb3IgdGhlIHRpbWUgYmVpbmc/CgpJIGFtIHdv
cmtpbmcgb24gaXQsIGFwcGFyZW50bHkgZ2NjIDcuNSBkb2Vzbid0IGxpa2UgdGhlIFZBX09QVApw
bGFjZWhvbGRlci4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
