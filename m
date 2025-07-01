Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFFDC83038
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jul 2025 14:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FwTXDOtmbAeQBweFhr20JF0bCWx8O4tiYWC0entcTMQ=; b=arW9qKs3q8iKl5
	VxqO6KOoHqV2owrDG5CtbFfisJWWKNBQ9MN9D0S4UqRd0rlP/TevJuWYh0gqGbrJSe6KSGMiZanNs
	LfZ5VayBFtvq2QiK2maIjHGk44aADsPqSD0GHjg8UC5VKbZVAgktZndZZms5qgiIlYazIZUifOU/D
	WlFyEZFHHhq6BbrClGXLzQ+B34cQI5P2cK/IWz9fPaz9lRefBy9GAOFwPJAssvVqGs2ZnI5IZC9ks
	PRlZxqAutFQgvYJnGXuEd6TPgNCvSitRCIopln3Csg+uVsvYg3+nyYFetmyoY0efbFuNUHY+WSxCl
	twXI1WgmTP4EGoAN6u2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbso-00000005gdT-0Yvz;
	Tue, 01 Jul 2025 14:22:50 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaTd-00000005OBj-18CD
	for linux-mtd@lists.infradead.org;
	Tue, 01 Jul 2025 12:52:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15B5343A0C;
	Tue,  1 Jul 2025 12:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751374363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LPWusB319hqcjd//15Bc5xcoYqrH7jO6QhAyal/DX+o=;
	b=SJ/lrnNPdamf043ssGzRJW11GCZhIZalKvKQdBn0kqhMaPSGPG8XCuoj0zDpFpQj9RKgXd
	dBW8VS9x5psVADG7aeD5MPZCELoG+gH+TS9liybefNtGazRsTJqM7to87t2+5/RMpQv+5G
	vj3I0zLBLk46t8aRM6jGzt9HfqP+AuB6KQPMfY3oiM1qUyhC4M7F3d9sTR9kvaHAJXVkvL
	0MQhSVdNgDK+ofLR3QeiVHrUbOYKszKZNRSwHWL7ixMRTYWk6YKk/rHpWWo41B5nxp2JT8
	04k801X770tXhlokV2KLiHV/608wh5On92TbIYNAJ+8jm4t2eHqVCVGe7Ng9Hw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>,
  David Woodhouse <David.Woodhouse@intel.com>,  Viresh Kumar
 <vireshk@kernel.org>,  Artem Bityutskiy
 <artem.bityutskiy@linux.intel.com>,  Vipin Kumar <vipin.kumar@st.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand/fsmc:  Add missing check after DMA map
In-Reply-To: <20250701115519.30772-2-fourier.thomas@gmail.com> (Thomas
	Fourier's message of "Tue, 1 Jul 2025 13:55:15 +0200")
References: <20250701115519.30772-2-fourier.thomas@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 01 Jul 2025 14:52:41 +0200
Message-ID: <87zfdooyxy.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepfhhouhhrihgvrhdrthhhohhmrghssehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehurdhklhgvihhnvgdqkhhovghnihhgsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopeffrghvihgurdghohhoughhohhushgvsehinhhtvghlrdgtohhmpdhrtghpt
 hhtohepvhhirhgvshhhkheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrthgvmhdrsghithihuhhtshhkihihsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepvhhiphhinhdrkhhumhgrrhesshhtrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_055245_453729_054F1A61 
X-CRM114-Status: UNSURE (   6.07  )
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

SGkgVGhvbWFzLAoKT24gMDEvMDcvMjAyNSBhdCAxMzo1NToxNSArMDIsIFRob21hcyBGb3VyaWVy
IDxmb3VyaWVyLnRob21hc0BnbWFpbC5jb20+IHdyb3RlOgoKPiBUaGUgRE1BIG1hcCBmdW5jdGlv
bnMgY2FuIGZhaWwgYW5kIHNob3VsZCBiZSB0ZXN0ZWQgZm9yIGVycm9ycy4KCi1UaGUKClNhbWUg
Y29tbWVudHMgYXMgaW4gdGhlIG90aGVyIHRocmVhZCwgdGhlIHRpdGxlIHNob3VsZCBiZSAibXRk
OiByYXduYW5kOgpmc21jOiIgYW5kIHlvdSBtaXNzIENjJ2luZyBzdGFibGVALgoKPgo+IEZpeGVz
OiA0Nzc0ZmIwYTQ4YWEgKCJtdGQ6IG5hbmQvZnNtYzogQWRkIERNQSBzdXBwb3J0IikKPiBTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgRm91cmllciA8Zm91cmllci50aG9tYXNAZ21haWwuY29tPgoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
