Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430CACA0EC2
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Aug 2025 10:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5PqF8IDqPEVUHcYzdNmVLMSIYOUV1IPPzGkY6cT97E=; b=fmpGgL7Ghw5jzB
	ppfZk2huV00G0B/U9rRsGOjfnqMDHvm2EOUQhD6iA5k857lV18eKNbyYFLuXkOePSV/ROS7bz5Hqs
	Fh+FtnJ9WoJZ02Hwv5AKTNYKTffypSjMBSThUpMHG6eT0TbLqy3PFqvndaUhFOa8g8DTkQ9o3ZzAK
	c2VSSsyE1JtJ+xOmdYUQwRJxqnJP1D3ZDMen8QIGAsfoH24wWaW69fCToB0Ixff1Ddh4+t/HwcuKk
	57B7003VGg/NY6BXRnrM/qhzi2w6EJKDQXelvGWfNNixjf3ONN9/JuAnMSnNMM0TPKVohfON97aBq
	30byMO9WZPcAdwpBUzHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukKcW-00000002ask-0wPb;
	Fri, 08 Aug 2025 10:46:44 +0000
Received: from relay15.mail.gandi.net ([2001:4b98:dc4:8::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukK8N-00000002XmW-1EXe
	for linux-mtd@lists.infradead.org;
	Fri, 08 Aug 2025 10:15:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BCE5E43145;
	Fri,  8 Aug 2025 10:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754648132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l+/cjitHQaCn5Z2qFtrgnop6PRPmcwaQTWfAxvoFm44=;
	b=E0O0eyTL5CSCW9zYLfXjJYG+MrSNMES9PWx+hdfNrHkAk29sheGYLyET1egCdCzjJERF9/
	E99actiq6It4TqLFk9JQZr4lmPAZpDQmbwvWj74Ta4k2ATEdB8ozfbblfkU720JNdvSvVo
	uuctgDRTuCftk4/n0hpcwC+QqCEMv80hwmlTLwlGq/5yXM+4nS6vA0tWIk6Dh+8CJJ7HVO
	xyefbxaDrI6vqap8R4hffTdyKBKuDgn4INe2qj6GaO/WsAnFYsdcJgMVWmW79bgjgux2Oi
	o+7lmm1PgUgF3Cd37RPS3OhbctCwTFW4YYEeKfVhude3mfs6YMwrjmPwF9LqOg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  richard@nod.at,  alvinzhou@mxic.com.tw,
  leoyu@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH 1/2] mtd: spi-nand: Add support for randomizer
In-Reply-To: <20250808095503.906244-2-linchengming884@gmail.com> (Cheng Ming
	Lin's message of "Fri, 8 Aug 2025 17:55:02 +0800")
References: <20250808095503.906244-1-linchengming884@gmail.com>
	<20250808095503.906244-2-linchengming884@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 08 Aug 2025 12:15:30 +0200
Message-ID: <878qjuazlp.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdefheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrddutdekrdeiheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrieehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtoheplhhinhgthhgvnhhgmhhinhhgkeekgeesghhmrghilhdrtghomhdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrt
 hdprhgtphhtthhopegrlhhvihhniihhohhusehmgihitgdrtghomhdrthifpdhrtghpthhtoheplhgvohihuhesmhigihgtrdgtohhmrdhtfidprhgtphhtthhopegthhgvnhhgmhhinhhglhhinhesmhigihgtrdgtohhmrdhtfi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_031535_863339_45308594 
X-CRM114-Status: UNSURE (   7.23  )
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

SGkgQ2hlbmcgTWluZywKCk9uIDA4LzA4LzIwMjUgYXQgMTc6NTU6MDIgKzA4LCBDaGVuZyBNaW5n
IExpbiA8bGluY2hlbmdtaW5nODg0QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEZyb206IENoZW5nIE1p
bmcgTGluIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4KPiBBZGQgcmFuZG9taXplciBvcGVy
YXRpb24gc3VwcG9ydCBmb3IgdXNlciBkYXRhIHNjcmFtYmxpbmcuCj4KPiBGb3IgbW9yZSBoaWdo
LXJlbGlhYmlsaXR5IGNvbmNlcm4sIGlmIHN1YnBhZ2Ugd3JpdGUgbm90IGF2YWlsYWJsZSB3aXRo
Cj4gaGFyZHdhcmUgRUNDIGFuZCB0aGVuIHRvIGVuYWJsZSByYW5kb21pemVyIGlzIHJlY29tbWVu
ZGVkIGJ5IGRlZmF1bHQuCgpDb3VsZCB3ZSBhZG9wdCBhIGhlbHBlciB0aGF0IGFsbG93cyB0byBl
bmFibGUgYW5kIGRpc2FibGUgdGhlCnJhbmRvbWl6ZXI/CgpJIGhhdmUgbm8gdXNlIGNhc2UgaW4g
bWluZCByaWdodCBub3csIGJ1dCBJIGZlZWwgbGlrZSBpdCB3b3VsZCBiZSBhCmJldHRlciBhcHBy
b2FjaC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
