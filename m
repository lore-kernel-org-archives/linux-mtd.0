Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0017C5B542
	for <linux-mtd@archiver.kernel.org>; Mon, 26 May 2025 09:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KLIXpIzPtnaaeK+fbL9wE9vrTHlXpAGHv0oLSgnK0ws=; b=FVK+KuvRBi/EE5
	hSjt9Gv6Z7G7rUUlZ69GFV7x4bfYvLht/fa4gYsJ6FHNdtdlvqdrKEluiGlx1ywKQ/ye+etS4+n5w
	XdQ2zDCrpVFVR+3bREqbH/UdZ5FqAFVi9lH8YQmILkCGQ6kdP//2qb6E6/MwTfVrFlUVSQ6uuf9kA
	pND/xJZKSn7oegmb6Mv70RxBLi4Q61hyay8bj/c4Aox9QhMf4iS0yFC1dAUxTBktORaKxCa9xY9Da
	fhCfq4n6HCv70YBprSmrrbnkIhKtWOtXCjaWSNR2+s01JUdC6HlBz6w+O/O69FVVDLz+XXJzZCs00
	nMh+uaTHT36WaTo+hdqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJUGs-00000008X21-0f2H;
	Mon, 26 May 2025 09:37:26 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJUDB-00000008WTX-0iy3
	for linux-mtd@lists.infradead.org;
	Mon, 26 May 2025 09:33:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C15743A02;
	Mon, 26 May 2025 09:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748252014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VNGjzIqdxM0hPsySERyRHiMNfxA6daMLJ5evfjl4AIM=;
	b=WuM3B0WnfHNs6ccX6I5aM4nduFC4O/ef01pD5zVPblEaKqtXjlapw/0gR5baNpfAYkzDIL
	wveUSDdjVivY6728+I8ADK374hMzfCZUcnnvc7WHA9SC0ssdvCx7L+4dnyzexbMaM8+kQo
	yAdevjFuAvnBPFjnxrprCeSsZEXWANAcJ9O+AnXMIbG9KlEidi6aLzAwsq5c8PXat0YShs
	E6//lLuVVPyQhknBkNYr8N5jCkx2EGRANwc93nmWybeHPjx5aw8lK0PxJdlWAO5BRPJi5h
	AS7smCvmCOPlbBoUNREJBOCUdA7exaj+DxVsB91EmFOoqDWW6hlL8Zy1d3S31A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez?= Rojas <noltari@gmail.com>
Cc: linux-mtd@lists.infradead.org,  dregan@broadcom.com,
  bcm-kernel-feedback-list@broadcom.com,  florian.fainelli@broadcom.com,
  rafal@milecki.pl,  computersforpeace@gmail.com,  kamal.dasu@broadcom.com,
  dan.beygelman@broadcom.com,  william.zhang@broadcom.com,
  frieder.schrempf@kontron.de,  linux-kernel@vger.kernel.org,
  vigneshr@ti.com,  richard@nod.at,  bbrezillon@kernel.org,
  kdasu.kdev@gmail.com,  jaimeliao.tw@gmail.com,  kilobyte@angband.pl,
  jonas.gorski@gmail.com,  dgcbueu@gmail.com
Subject: Re: [PATCH v5] mtd: rawnand: brcmnand: legacy exec_op implementation
In-Reply-To: <874ix74yrh.fsf@bootlin.com> (Miquel Raynal's message of "Mon, 26
	May 2025 09:28:02 +0200")
References: <20250521080325.581366-1-noltari@gmail.com>
	<87wma74ceh.fsf@bootlin.com>
	<CAKR-sGeUGpUFBf_Zvg=7ro0EpGKy0dQVF58mAQt27YX+79qv1A@mail.gmail.com>
	<874ix74yrh.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 26 May 2025 11:33:33 +0200
Message-ID: <871psb1zte.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddujedujeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufgjfhgffffkgggtsehttdertddtredtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeegueetheejuefhteduueeltdfhtdeludfgleegfeeljefgkeetvdetuddugeelnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpvggttgdrrhgvrggunecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepnhholhhtrghrihesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepughrvghgrghnsegsrhhorggutghomhdrtghomhdprhgtphhtthhopegstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghrohgruggtohhmr
 dgtohhmpdhrtghpthhtohepfhhlohhrihgrnhdrfhgrihhnvghllhhisegsrhhorggutghomhdrtghomhdprhgtphhtthhopehrrghfrghlsehmihhlvggtkhhirdhplhdprhgtphhtthhopegtohhmphhuthgvrhhsfhhorhhpvggrtggvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhgrmhgrlhdruggrshhusegsrhhorggutghomhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_023337_359922_22407EC9 
X-CRM114-Status: GOOD (  15.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

>> AFAIK, the legacy functions were only using it for
>> NAND_CMD_SET_FEATURES, which we don't support:
>> https://github.com/torvalds/linux/blob/c86b63b82fde4f96ee94dde827a5f28ff5adeb57/drivers/mtd/nand/raw/brcmnand/brcmnand.c#L1922-L1938
>>
>> The other uses I could find are already covered by our
>> chip->ecc.read/write functions.
>>
>> In any case I've tested the patch for reading, erasing and writing the
>> NAND and so far I haven't found any unsupported error apart from
>> NAND_CMD_GET_FEATURES with a Macronix NAND in the Sercom H500-s
>> (BCM63268).
>> I believe it's used for unlocking the NAND, which isn't needed in that
>> device.
>
> Well, you are restoring an old behavior so I won't ask for a better
> support, but you should normally allow software ECC engines (and even no
> engine at all) and in this case the core will require a write path. I
> honestly think it is not very complex to implement but if someone is
> lacking this feature it can be added later.
>
> Please just fix the braces in the for loop that was reported, but no
> hurry, I'll only take this after -rc1.

Nevermind, I'm applying now. You can send a follow-up patch for -rc1 if
you want.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
