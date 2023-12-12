Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02E5C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Dec 2023 00:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a36sHF0okc66uI0o/7FnG494F0ByRvDD3tI3LRzbDeE=; b=gJAokT39/TPmnCByrTx4WzB/H7
	NP8EFns5N+nj5O5Pc9gV0mDVT5KTuiRhr4ayRtZrcKUdtDAHrgmgYbql8ZQxbr3hQ0Fn2IWAY6eUC
	nSrsZEJ9airfokJmv2hSXot2R5MfiJP17ZHKjVyqNAIrCcxmFowCRnHMoRkVv/TeS/jga97Sb6hMY
	eKIFprUYJp7GsBfDsLQr2Z0CVNRWEmAHEiObdV+tSCPGF+Bd+bzM0L8KBJkWelbYmIZoTUNAeVN5L
	583XB7/r2ZKvuGgv48YQH3Nkkcw8pzTSrwO411th4Y3xB0HvUsuB5W6eJUezssMh6qg/2ydzAgak+
	Z5Gc6k2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCqsv-00AOWO-0i;
	Tue, 12 Dec 2023 00:44:29 +0000
Received: from dog.elm.relay.mailchannels.net ([23.83.212.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCqsr-00AOVf-0O
	for linux-mtd@lists.infradead.org;
	Tue, 12 Dec 2023 00:44:26 +0000
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id EC0F97A3326;
	Tue, 12 Dec 2023 00:44:19 +0000 (UTC)
Received: from pdx1-sub0-mail-a241.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 648F07A33C0;
	Tue, 12 Dec 2023 00:44:19 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1702341859; a=rsa-sha256;
	cv=none;
	b=WfVG4SSwRyXeEqf06z6ACiV5ytZmhy8gZItJKq1SZZNPSqMWTNLZdEpGnj2IikrokX+bOp
	s0up7pk6JlFMqOnKYaniYfFQnOs+leFOHCCEDk54VR3YsTcWxoZFJfIzT3/Sg+p5tRMJve
	FAkH7Z/Drgnw00iC6KLa4BWv9dTNC92K1hPkCmIVKK6IblntrLG+aYl6HIa+0hxylA1i96
	AY2P9rpTlSFSMXuwqcJXCCo7cxAdGWOg++zjOi7Sj4QAc8kwCIxttfMsEAZ8HtGaFc9OO6
	Mt90yxfTUwD3uOeIumnJMvaoTwLhOP8a8Jc2A4MYiiR0yKGLTEXckL9nH2lNRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1702341859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=mF/Vo4/Bjp0KnZuQHVj8rbwp5yFhrkFsYdhlOMyaCbg=;
	b=Wh5Khxytvukjt8QWDslzHoUND4LTPJ5D7neQ9e14wl4E2ZVZ3qCm7MSWLKYWWGNegy4pay
	JLp7H03isdxZ/p+VLUsMW4aIGgNM3eprQDR3i+F9kgZdgXb97wipEXH4dv2TeTreZQDE6k
	umNftFkcSeiG3/jOFDp4m3Mcc4BjtdE+X9ATFZZVHSNGecchJYLZzeso/NnQ3nbCY0En0M
	6t7OIgJcvFjV77ZB56zRGhfBjGZ4vv8O+9PN9Dw4/5o+3rRA9mBYBOfD7XUTfQNvzHWKaz
	j1vsMLhwqvyiVrHd3yqfVSoQYi1rNANrlmZh1L3fbnJ9N4QO/lYGfwCMuZOu2w==
ARC-Authentication-Results: i=1;
	rspamd-5749745b69-czvrl;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Desert-Fumbling: 2d7025c1535d992e_1702341859740_305295213
X-MC-Loop-Signature: 1702341859740:2844852777
X-MC-Ingress-Time: 1702341859740
Received: from pdx1-sub0-mail-a241.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.127.58.202 (trex/6.9.2);
	Tue, 12 Dec 2023 00:44:19 +0000
Received: from offworld (unknown [172.56.169.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a241.dreamhost.com (Postfix) with ESMTPSA id 4Sq0HK3kd3zqM;
	Mon, 11 Dec 2023 16:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1702341854;
	bh=mF/Vo4/Bjp0KnZuQHVj8rbwp5yFhrkFsYdhlOMyaCbg=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=j8DHAwuPoFxHqrqS+yeA0YQa9yNrbyRSTaNAJFkQE+UqKgg1Q1MsLd7CWm9jceUYN
	 O8TQS51/TEiDQPKOLg71Hp9nYqh0ifF3wfMDAagn35iH5p5GbMj/pYh9H9jz0Xrdsz
	 JHTaD4I7dFMfUgq9MBq4LlpcqToB57JIanyIuk8epPFGbOFLw/pps//E8v5oHKBJ8p
	 MLgoxBSpI4k1oN28wH7TTbumPC5iczULbNMObYAfuN5s4/3AGJmTeMx4h/wU8hC2Tv
	 hDB6PQCnIwUoX5SSmZ8H3qKfsuQedvUE0rCtSjIeUr2eLQNy+xtauPd0rM2ylxPwxJ
	 WsCD0D5XkTN0A==
Date: Mon, 11 Dec 2023 16:43:58 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jens Axboe <axboe@kernel.dk>, Ard Biesheuvel <ardb@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-efi@vger.kernel.org
Subject: Re: [RFC PATCH 0/6] Add GPT parser to MTD layer
Message-ID: <cykfpuff32nuq3t27vd5tv463cx32phri473fjnrruvom5dk5u@uao5e3ml73ai>
References: <20231211151244.289349-1-romain.gantois@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231211151244.289349-1-romain.gantois@bootlin.com>
User-Agent: NeoMutt/20231103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_164425_279122_E552E72D 
X-CRM114-Status: GOOD (  17.09  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 11 Dec 2023, Romain Gantois wrote:

>Hello everyone,
>
>MTD devices were historically partitioned using fixed partitions schemes
>defined in the kernel device tree or on the cmdline. More recently, a bunch
>of dynamic parsers have been introduced, allowing partitioning information
>to be stored in-band. However, unlike disks, parsers for MTD devices do not
>support runtime discovery of the partition format. This format is instead
>named in the device-tree using a compatible string.
>
>The GUID Partition Table is one of the most common ways of partitioning a
>block device. As of now, there is no support in the MTD layer for parsing
>GPT tables. Indeed, use cases for layouts like GPT on raw Flash devices are
>rare, and for good reason since these partitioning schemes are sensitive to
>bad blocks in strategic locations such as LBA 2.  Moreover, they do not
>allow proper wear-leveling to be performed on the full span of the device.
>
>However, allowing GPT to be used on MTD devices can be practical in some
>cases. In the context of an A/B OTA upgrade that can act on either NOR of
>eMMC devices, having the same partition table format for both kinds of
>devices can simplify the task of the update software.
>
>This series adds a fully working MTD GPT parser to the kernel. Use of the
>parser is restricted to NOR flash devices, since NAND flashes are too
>susceptible to bad blocks. To ensure coherence and code-reuse between
>subsystems, I've factored device-agnostic code from the block layer GPT
>parser and moved it to a new generic library in lib/gpt.c. No functional
>change is intended in the block layer parser.
>
>I understand that this can seem like a strange feature for MTD devices, but
>with the restriction to NOR devices, the partition table can be fairly
>reliable. Moreover, this addition fits nicely into the MTD parser model.
>Please tell me what you think.

I am not a fan of this. The usecase seems very hacky and ad-hoc to justify
decoupling from the block layer, not to mention move complexity out of
userspace and into the kernel (new parser) for something that is already
being done/worked around. Also, what other user would consume this new gpt
lib abstraction in the future? I don't think it is worth it.

Thanks,
Davidlohr

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
