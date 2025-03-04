Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F6EC282D3
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMnqv2rEyDTi475wV+OqTNInhpycYlxdPsmWw/uT4PU=; b=PFiOyIzySpaMJC
	TA5bGH/1BjphMi1CJdLKac2DYcyE/kr659HOaqPNBPcJ5DM4TbM+LV6KPf1f9TRD+TsOF6Q5xdym3
	zQGXLfmq0oi5kCaE9HimiQCl5Hn9dvKy4C7LFwb5Z59eaJD8iAfu1OBQVzx7ofzfFdOTI8QfldSbO
	ueCkjTRzv3QoTbncRxM93wVxNixFqYXSZvVYbvaPFrH6PzGJAdmJkngdbmkRx70f9H6Mk/ELO299G
	xrI3m4PC6HU/ZMTn2GWDWI/iBTyNZdJA2IT9MUJA5XVlfTYndmpW994k3zVUFmLIdJLHB5wm8ZMK1
	j/XfSs0cIDYrscPF+yeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR57-00000004X6Q-3lNF;
	Tue, 04 Mar 2025 12:09:05 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQ84-00000004Kkh-3Qwn
	for linux-mtd@lists.infradead.org;
	Tue, 04 Mar 2025 11:08:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D67A42FF1;
	Tue,  4 Mar 2025 11:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741086482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x8PHBPyVcVGACAsLJJbh1k3kLjnnIG01sREfq4tZ7nE=;
	b=dIY/tIcJd7TrWrVoAtPaqW5eJaAlepxXeIILc5whI078rHRl+YK93K4gGxkCIUq83ture0
	mkAqE+ev3l3itIxUqXyCAkRovqY+87wGR2Acu5NkoZlQrCUepexmi49tonh/8pP33D+sKS
	gdrxWCCigw9qnIKsMxwscZeJqkxbfTNxt2UgwcSUPQZyMrIGn9zV3znj6JulTojupPd8gf
	HD+MUtKNrXoD0+Ta1miaS7SLyHdxBiFIulWFDUZetT6Ubp4uty/2QwOQgIxDXNcexDS0xl
	SphfiC29r/gkQUmxy04gxIo1LfniOBcAFq6d26HCLQZiZfElxMKlHS4NdWkF+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250303145223.1748-1-vulab@iscas.ac.cn>
References: <20250303145223.1748-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] mtd: Fix error handling in mtd_device_parse_register()
 error path
Message-Id: <174108648055.2291907.15045418587875568653.b4-ty@bootlin.com>
Date: Tue, 04 Mar 2025 12:08:00 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddukeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdegiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhulhgrsgesihhstggrshdrrggtrdgtnhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_030805_006758_85FE8FDD 
X-CRM114-Status: UNSURE (   7.58  )
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

T24gTW9uLCAwMyBNYXIgMjAyNSAyMjo1MjoyMyArMDgwMCwgV2VudGFvIExpYW5nIHdyb3RlOgo+
IENoZWNrIGFuZCBsb2cgZGVsX210ZF9kZXZpY2UoKSBmYWlsdXJlcy4gUHJpbnQgYW4gZXJyb3Ig
bWVzc2FnZQo+IHdpdGggcHJfZXJyKCkgdG8gcHJldmVudCBzaWxlbnQgZmFpbHVyZXMsIGJ1dCBw
cmVzZXJ2ZSB0aGUgb3JpZ2luYWwKPiBlcnJvciBjb2RlIGluc3RlYWQgb2YgcHJvcGFnYXRpbmcg
dGhlIHNlY29uZGFyeSBlcnJvciBzaW5jZQo+IGRlbF9tdGRfZGV2aWNlKCkgaXMgYWxyZWFkeSBp
biBhbiBlcnJvciBoYW5kbGluZyBwYXRoLgo+IAo+IAoKQXBwbGllZCB0byBtdGQvbmV4dCwgdGhh
bmtzIQoKWzEvMV0gbXRkOiBGaXggZXJyb3IgaGFuZGxpbmcgaW4gbXRkX2RldmljZV9wYXJzZV9y
ZWdpc3RlcigpIGVycm9yIHBhdGgKICAgICAgY29tbWl0OiAyYTZhNDQ1NTVmMDcyNzA3MDY0M2Zk
ZGU3ZmZhYzY1NzFlNDEzMjdhCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQv
bGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQg
bm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
