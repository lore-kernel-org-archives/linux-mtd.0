Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E8BC43334
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 14:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tev8NZybBUhBnTzWx13vQ8JBnFzwCiJ8XYQLrJZsszs=; b=u93j14SJWYhrDH
	Lrf12RzS/ZeBi6P+tzmdjHNVtorVajxdCEgkIc0u2UPXHsmabH0if3/3cAZSfER8aN4nSmzgvucvQ
	FHqMh1OGmezhktwredQn3PUf7KM4VnzfS/q9E2onpgI7xcmHVh/+kvZS3QEvDP0oT89oosysxmqcc
	HBsdOj3Ygupf8krPf87u5d9mED0ctyAjhgF9ul6GC9cTbNwVf1fzIp5wO9lIH9tp4nWwUOiQt3NEF
	oOvksnxMeQJNdIZTVflMD5ZH3MU2bXbtQJwplFT1pq8UuHNEJ1DQvkIp67Edo8xkU7BfUPzHYhMNr
	ObFYVZaG34bizW0L6LIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx7yV-007e09-IA; Fri, 03 Jun 2022 14:08:27 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx7yS-007dzG-7a
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 14:08:25 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 5EAB95C00E4;
	Fri,  3 Jun 2022 10:08:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 03 Jun 2022 10:08:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	tom-fitzhenry.me.uk; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1654265303; x=1654351703; bh=KAAWDaYR9D
	AAjcCE8MtwOQmv/iLpTKonhaACeihg1sk=; b=k1mSP4WHfLJKp82LjdQztgZUO3
	vVH+Edh/Y7pF1XZT9h+XroJQh0d1sPOjZ/per8O+Cg252ShUljx/1yA7v3YA9w2i
	4nqa0RnJGqZ5ZWVPz1pAXlq3+M+d6FBNPI3Q4rF80Hbglgael7x91sGfhm++uGFx
	h4WIDpsW43oUOjGzjBhp57fNmHw51kN1HzHPuPPFId3hSVBJ2dqL3e6lPryKkSNR
	VRekWxSUVKJwzNB1nwCOXheY62cZoc3Qnf4fAvFlY2Mn8X+u+IMZiwzYu2OEkkA9
	blhLywwLPldibgZPhIvn0lzVXKZCA7FwofouNN98HSJ64U3EtNGnAlUWJ7lQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1654265303; x=
	1654351703; bh=KAAWDaYR9DAAjcCE8MtwOQmv/iLpTKonhaACeihg1sk=; b=f
	/DgesW4PIfMEQewKlQa/fbrSMgjMexdVSBt8sdufq6mv6Oe/VYZX+/rYYDAdBMm9
	X/G9V1WEUE5lMGEz8Ap4jCr+e2sJzvGv6fU3EiCU+126Ru5d90UFzNZwD5uXRCL3
	PtKSMmMYKkOx9TDXfNcK+DpMykxbrUwoeQdx9CuFEaLsE+pxC36jvDI9Vu1jbmIf
	LfnRQOR1kTaoyt9N3gg2742c16eB+3agDgOWdv7sIrjhSVFYHVxPXxJ/5R9fXxpU
	OehYHN6V3uX2y3BMDd6A0xTqGRG340PzdwJRCSDDX/Ewubhh0rlaKfh0e5FeCBKJ
	G83y60FMFKqU8DOky7pJA==
X-ME-Sender: <xms:1xWaYlYSBwHEKh9QJr9QZBQLKEsH4_jXP6QGMqO_buphseP4jYohfQ>
    <xme:1xWaYsYuuo2Qc33cJl0VmJtaEBxP5g3DLFxxqfV_PRWPwy_p8juXYH4W6g8ku4dR3
    15dnpd9YB_6o9p2qw>
X-ME-Received: <xmr:1xWaYn8mNGhhWCjXvXKPlhN0BaVxm4GTXpAlul6Geq-Vz8uqPdQvJHhrBW9u3oLsIM4Pl3BH8M5YKRBJnPFGlePk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigdejudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepvfhomhcu
    hfhithiihhgvnhhrhicuoehtohhmsehtohhmqdhfihhtiihhvghnrhihrdhmvgdruhhkqe
    enucggtffrrghtthgvrhhnpeekueeijeefueffkeekteegleevjeeiteehiedvtdejiedv
    vdelvdffvddvtdeugfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehtohhmsehtohhmqdhfihhtiihhvghnrhihrdhmvgdruhhk
X-ME-Proxy: <xmx:1xWaYjrqwRwfgp3BTMWXgtSPn5UsDBdQO9xioQjK3LsrsBJpAn3how>
    <xmx:1xWaYgqbvOwVoW4ilYyIJnqLhNe2dxKNqXFSG5iwFJ14WYFUMxMPXA>
    <xmx:1xWaYpSbt1lD22VolxYqjdCOmZyiytjw00mYYP2ejtmFW18NBHe8MQ>
    <xmx:1xWaYtgDCCbv6WuTzh1M6n1Og7-bX0_UZn9og4SwUpRR867thaGT-g>
Feedback-ID: iefc945ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 10:08:20 -0400 (EDT)
Message-ID: <3210537d-9591-ed28-605f-3802e4e1597f@tom-fitzhenry.me.uk>
Date: Sat, 4 Jun 2022 00:08:18 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] mtd: spi-nor: siliconkaiser: add support for sk25lp128
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20220603135933.143372-1-tom@tom-fitzhenry.me.uk>
From: Tom Fitzhenry <tom@tom-fitzhenry.me.uk>
In-Reply-To: <20220603135933.143372-1-tom@tom-fitzhenry.me.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_070824_386203_88B73DB6 
X-CRM114-Status: UNSURE (   5.49  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Sorry, I've just noticed that this patch fails checkpatch.pl.

I will fix this and send a v2 shortly.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
