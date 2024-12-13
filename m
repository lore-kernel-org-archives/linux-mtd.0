Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C220E7717D
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Dec 2024 12:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hYyw2VOQcOH0kSYuqzIMP+mcJ9Q/lS4e0FaPPa9CQ3s=; b=jQlE/E0MUTHCtM
	nqbkdmK5Jrdhz682C362wdlO/gdGkeQpGc1uqxR0g+TrM9nHVkKcBH4q/y82bgb7jUWT+bUWcmG5W
	QD1cTUNeDFUcJGzpstDeXeeaOgss7dShsHzttpnwfP2FRlOYOn98ma2WmVVW6Vy1nVSf7Vf52cp82
	zmcFUH6G/AHh33J9hYX4o1GtOVXl6IgtUy/U97LVTFa+TFlzcPfGHqy4Nk8ICGgf3nOZNRa6xRyX4
	bUWLNHhgo8XHmICG2PJLfOTqPe/vUGNa8YoPGrsPWG/vTzjuJncLqG4ZuM4Qz3KAFvX7gGpdNlcKC
	PVSAqLnVq5nNW9/nFHMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM4TZ-00000003fKu-1G0Q;
	Fri, 13 Dec 2024 12:08:57 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM4TW-00000003fKa-3nX8
	for linux-mtd@lists.infradead.org;
	Fri, 13 Dec 2024 12:08:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8BE4A1C0004;
	Fri, 13 Dec 2024 12:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734091731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f3DmOhWIZupjc0mHh2kodPTDmUfjFFMcREGA7ikxOQg=;
	b=LB2Xu4fQfh9n8geRQtrbPBUOUVSTAX20D8bJTZhpdWUdOab3Xg74TJh01gw7Se8q1XOcug
	RfssqM8weQNHB65gr19QtBkqfGLHFfpY+jw5gEDCz/dh9nXlllLVEr7FoWkQS9nTR3n4Aa
	ynwr6N0mHgWsE7IZARwQnXtJZSxaqJvSu0FFVupnU5kB8XRmVFU/EIH8nEhvtK/QK/W0tF
	QTxJME31iOOIG0uiQeonFznF1wyL+BY0urNJevXxaMx2zl4oMGA9wD+RFd+U4DSGFlwTAf
	xq9DnLO5fC7o3Od8sZbpdMu+g+RsNpFUozeoXEwl068tItopKusDTgJaRzWLyQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <michael@walle.cc>,  linux-mtd@lists.infradead.org,  Mark Brown
 <broonie@kernel.org>,  linux-spi@vger.kernel.org,  Steam Lin
 <stlin2@winbond.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Sanjay R Mehta <sanju.mehta@amd.com>,  Han Xu <han.xu@nxp.com>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Haibo Chen
 <haibo.chen@nxp.com>,  Yogesh Gaur <yogeshgaur.83@gmail.com>,  Heiko
 Stuebner <heiko@sntech.de>,  Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 22/24] mtd: spinand: Add support for read DTR operations
In-Reply-To: <589d95d3-9153-475b-86f7-886ec41cd4f4@linaro.org> (Tudor
	Ambarus's message of "Mon, 11 Nov 2024 14:35:23 +0000")
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
	<20241025161501.485684-23-miquel.raynal@bootlin.com>
	<589d95d3-9153-475b-86f7-886ec41cd4f4@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 13 Dec 2024 13:08:45 +0100
Message-ID: <87ed2blr8y.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_040855_096880_736DE1F6 
X-CRM114-Status: UNSURE (   7.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

On 11/11/2024 at 14:35:23 GMT, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:

> On 10/25/24 5:14 PM, Miquel Raynal wrote:
>> +	SPI_MEM_OP(SPI_MEM_OP_CMD(0x0d, 1),	
>
> do we want some names to these hex values?

I honestly don't think we do because it would be totally redundant with
the macro name, ie.

+#define SPINAND_PAGE_READ_FROM_CACHE_DTR_OP(addr, ndummy, buf, len, freq) \
+       SPI_MEM_OP(SPI_MEM_OP_CMD(0x0d, 1),                             \
+                  SPI_MEM_DTR_OP_ADDR(2, addr, 1),                     \
+                  SPI_MEM_DTR_OP_DUMMY(ndummy, 1),                     \
+                  SPI_MEM_DTR_OP_DATA_IN(len, buf, 1),                 \
+                  SPI_MEM_OP_MAX_FREQ(freq))

is IMHO better than

+#define SPINAND_PAGE_READ_FROM_CACHE_DTR_OPCODE 0x0d
+#define SPINAND_PAGE_READ_FROM_CACHE_DTR_OP(addr, ndummy, buf, len, freq) \
+       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINAND_PAGE_READ_FROM_CACHE_DTR_OPCODE, 1), \
+                  SPI_MEM_DTR_OP_ADDR(2, addr, 1),                     \
+                  SPI_MEM_DTR_OP_DUMMY(ndummy, 1),                     \
+                  SPI_MEM_DTR_OP_DATA_IN(len, buf, 1),                 \
+                  SPI_MEM_OP_MAX_FREQ(freq))

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
