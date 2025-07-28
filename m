Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B452AC87FCB
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jul 2025 11:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QGwm21aBuXf3KF3XWM2Y5gnrqKe6j6FfxT41cqIDcbs=; b=G2qEFs55xEGFx9
	2n+A+5yddFZel7Vbdg/QrvmXbDrpzbUG5R67qWjub0sdaO5rlZhP/169u4eomxVXAiRkvvA/I9BT8
	twftqvmLaZkU+PtGc2oHy3Xcls0QdcuVnR+si614J9ZJE3cktHVlnWSglMqEdZ/SPMR6kBmJkZstF
	lJaidrJ7MdEdt3HWU8vGpvlmfsKF2qpK7AZxNKT2+43oFQhqfAVB4BLZgILMduep5q5Uf9MUabXnm
	hohOqRzQ5xI6B9jhRsjHdRUFo2/ycHO8ytzIxtYI0NKeB5Hj5ZT4XwMXvOAYBO9B7wJIZZxlJB0kn
	Wy10HxZHrjvjOc0Zppew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugM18-0000000ELh0-1lOF;
	Mon, 28 Jul 2025 11:27:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKv3-0000000ECXd-1CXW
	for linux-mtd@bombadil.infradead.org;
	Mon, 28 Jul 2025 10:17:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tB/giJamLwrlrWdb+yV4MiXhuFOprryUVJQyo9azviI=; b=kC7+6M4K2t6Sp3ia1o2rGOsbr9
	qgvTJd/slWv707viVSHHzlAuSGhoPfjRtawj75m1dF2zoe8qyG++prsPOIEpA4mXLQ+JrYzrIa/1N
	Tco/lhSCHDJqx5VEtLk7a66v+Rd0PXenua+FrhDtRtKiQDasj8jbcaXJpowHU/tVz1Bx4eZUj8l4t
	BLfbbPL95fc8fvXy4rJaw1GarKHUeBrw8Bh26U0KnAdMm4/fuqKC3irlxjwAE2C3dMmy4nNgg5aqJ
	PZY/YwjH7vD13pD5wQn0stzhZcW87mYcyltyi/9WxJiF6Yx6XlKQspcO+F0+4io2MPo9DFyn8ePeO
	EdoFndCg==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKur-0000000CQxE-41wp
	for linux-mtd@lists.infradead.org;
	Mon, 28 Jul 2025 10:17:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B535143295;
	Mon, 28 Jul 2025 10:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753697828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tB/giJamLwrlrWdb+yV4MiXhuFOprryUVJQyo9azviI=;
	b=Gvl8upK1SXANWVdQ+RKqeWjUJwzaYa1IC7pSWxIHaT+PJiZxljCfZp8obsC2xIoS0hTWZp
	t64TYwVMiSipYJV+i5zLQUb/RANjGYc3Tdk8ZVHztV501TnBPfu5Mo6HvzoCqODZYqcZ3Z
	qSC11MduGjowoht84bSVJd6k3DyIcQDWLNQeq0Xe5MTXKoP04DY3T68TzoWEYMHJvuUYs/
	aDb492zuOm7qam46TkpgGTPMvGKlOdxLzFHob8xtjmVKkiO2T5BKKfW2ospCLGPO3uen4X
	ETVav/UWaPfAkKqeEDgXF6XIrGxA2ELKrMAMAMYoyxhRCgUWLYqlhz9WWWhlFQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: stable@vger.kernel.org, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Viresh Kumar <vireshk@kernel.org>, 
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, 
 Vipin Kumar <vipin.kumar@st.com>, 
 David Woodhouse <David.Woodhouse@intel.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250707073941.22407-2-fourier.thomas@gmail.com>
References: <20250707073941.22407-2-fourier.thomas@gmail.com>
Subject: Re: [PATCH v3] mtd: rawnand: fsmc: Add missing check after DMA map
Message-Id: <175369782769.102528.246537562442649222.b4-ty@bootlin.com>
Date: Mon, 28 Jul 2025 12:17:07 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeludeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdegiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepuhdrkhhlvghinhgvqdhkohgvnhhighessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehvihhpihhnrdhkuhhmrghrsehsthdrtghomhdprhgtphhtthhopeffrghvihgurdghohhoughhohhushgvsehinhhtvghlrdgtohhmpdhrtghpthhtoheprhhitghhr
 ghrugesnhhougdrrghtpdhrtghpthhtohepvhhirhgvshhhkheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrthgvmhdrsghithihuhhtshhkihihsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepfhhouhhrihgvrhdrthhhohhmrghssehgmhgrihhlrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_111714_343311_CDF60068 
X-CRM114-Status: UNSURE (   5.68  )
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

T24gTW9uLCAwNyBKdWwgMjAyNSAwOTozOTozNyArMDIwMCwgVGhvbWFzIEZvdXJpZXIgd3JvdGU6
Cj4gVGhlIERNQSBtYXAgZnVuY3Rpb25zIGNhbiBmYWlsIGFuZCBzaG91bGQgYmUgdGVzdGVkIGZv
ciBlcnJvcnMuCj4gCj4gCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRk
OiByYXduYW5kOiBmc21jOiBBZGQgbWlzc2luZyBjaGVjayBhZnRlciBETUEgbWFwCiAgICAgIGNv
bW1pdDogN2M5ZTdiZGQ2NjNiMjM4ZjMyYzkzNTQ5MzhmZjY1ZDAyM2YxM2RhZgoKUGF0Y2hlKHMp
IHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9m
IHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4K
CktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
