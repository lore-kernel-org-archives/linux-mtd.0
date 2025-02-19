Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5091C021B1
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2025 13:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2U5rEZ+ss9tFeGAPhZFCjHKiVu2Ttx5DyfwFqRpSYts=; b=3HHd+nZGc5vczX
	3k9Wydg3uZz5GzG3+x3bujtrs4okpGVWWJ/qYzfbOD43s22XenZcJIRpcepp6bLAVCvCPZL7p9PL7
	vzAYDWIQ45SYeIB5FDuj2W2f90v82la0Qc74rMU37To6ZP2U3Im9Wq0oMwftymrI7TnOj1n7udI+T
	w0jDQjpDKhzxVKp/a8dkrS2iQj+kbGfZat5XEt4zuqODZJtbOlbetSd1wXtEEnnWP/9ds8LYQ/Ipo
	Vp/2ZcmPh4QQlBlABRix2iTZDdgeBtarRaZH2pXa14ODC+CkxJz/bK0czJct7y1eXNrJqmK5xz+7w
	3hH8+gLX1QXSgwsqNTdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkMq-0000000D1ya-0Iud;
	Wed, 19 Feb 2025 13:44:00 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkKH-0000000D1GC-1SdG
	for linux-mtd@lists.infradead.org;
	Wed, 19 Feb 2025 13:41:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 831B5443F3;
	Wed, 19 Feb 2025 13:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739972478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jLW4K3/hv4RaJdxc1c1PU1HUsFnGoU6IqGG4GCR/Mnk=;
	b=mFHUSe6EXFcwPIaN5PEqzhEuVTKJL6B2YUEJPTKIoN7Ji2SJMARnfe7dlqobh788HTuzlf
	oTNO6axbKj8kVx1ySPaV97G57pinMOcCH1MtSVIuONLKxL8VNCNEpPF5MHtMNLOuBH5UQH
	H42PcIgu2vRIl9LnaeYbiNPO6opMFGF7QWNQvU2bFrs6x8RD4z8n3YRQ2f7+S1JkAIta5i
	qRD8S2f9I4C4mr8IPMcXs0DSVHn8zblcjkgIhjLEIL1Yn+jNhQAkbJfj1NcXcDkDvuVGTQ
	8YV7gQeUfe+3/xaJgiaPfHk9lqq+LQOVkyRFAapklqYRQHk33ywzBngj4QPBWQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: spi-nor: fixes for v6.14-rc4
Date: Wed, 19 Feb 2025 14:41:16 +0100
Message-ID: <173997243494.1255269.14514020665682587184.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <mafs08qq4myux.fsf@kernel.org>
References: <mafs08qq4myux.fsf@kernel.org>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeigeefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeeugfdvffefhfduhfetfffgieeiudeugeffvdehvddvledujeejvedvgfdtvefgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidrrddpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeejpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehmfigrlhhlvgeskhgvrhhnv
 ghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_054121_513716_71533DF3 
X-CRM114-Status: UNSURE (   6.62  )
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

T24gTW9uLCAxNyBGZWIgMjAyNSAxNDoyNjoxNCArMDAwMCwgUHJhdHl1c2ggWWFkYXYgd3JvdGU6
Cj4gV2UgaGF2ZSBhIHJlZ3Jlc3Npb24gd2l0aCBTU1QgZmxhc2ggd3JpdGVzLiBUaGlzIHB1bGwg
cmVxdWVzdCBjb250YWlucwo+IHRoZSBmaXguCj4gCj4gUmVnYXJkcywKPiBQcmF0eXVzaCBZYWRh
dgo+IAo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMjAxNGM5NWFmZWNlZTNl
NzZjYTRhNTY5NTZhOTM2ZTIzMjgzZjA1YjoKPiAKPiBbLi4uXQoKTWVyZ2VkIGludG8gbXRkL2Zp
eGVzLCB0aGFua3MhCi0+IG1lcmdlIGNvbW1pdDogMWRiZjYwMjc3ZTliNjE4MWQyMzY2YTk0Yzk3
NDcyODEwNmNkZDU1MQoKS2luZCByZWdhcmRzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
