Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29A4C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Apr 2022 12:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EpWErO7jNXcZdnNKLffB/zwINKgWpxawi5L/s04FzRo=; b=gmjCbP2D6NsBjGiNtlpENYs9Nv
	g7TyJ0dYA0eRMQXdPHKcOMDEdpeXiyQg/5u/28NkGhLzl7Etve/LpuXE308Yaz11wrFDCw+myWw1I
	R9fR5klAvVvM1KFqGI7p0g18UkyTYiX3mF1HQCs0Zj3b7VIkQ5Lczl0UuUyfkm4WyocmKnVPlHjbU
	5g4r3/VIM6Xp1CnwxEakqJ82CznMvlkWupe14QyxRY8comgHUwhpvmdz9MVucZqnDcrYvHj/dAZWC
	AbVilwAkdgF2bpYxnkMK/ovpNbPI7GIbl+qmzv9SLI3MpdTLlhL0nrWEp9Bcy2JHCKCCmzyqQ7Izb
	5LcHBKDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngQG5-00Gdkt-2D; Mon, 18 Apr 2022 12:13:33 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngQG2-00GdjF-4z
 for linux-mtd@lists.infradead.org; Mon, 18 Apr 2022 12:13:31 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 920A122175;
 Mon, 18 Apr 2022 14:13:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1650284008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sDTjYlCaBa9GLh++sa/WCQdXuUrcubJCdTwx3SdcA1Q=;
 b=hzXAChF9N1ILebUw69v7FcCfSE9sAXERxDXW3a/CotuLCpZBsGXKG1XdWjLEjkWmngXnWn
 gUazAnZpwYWZz0SfXIFiXCWZAbIDjBnh1xOoOE3zQl21SBxUiY9RKR1vj9Sd+tf27qs1U2
 qgWiIvXubT6htCbhqMTTfZv3JAd4bBc=
MIME-Version: 1.0
Date: Mon, 18 Apr 2022 14:13:28 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v1 2/2] mtd: spi-nor: expose internal parameters via
 debugfs
In-Reply-To: <20220418121044.2825448-2-michael@walle.cc>
References: <20220418121044.2825448-1-michael@walle.cc>
 <20220418121044.2825448-2-michael@walle.cc>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <fca7f401141caee41f574cdd0339a6e1@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_051330_419908_F53B826A 
X-CRM114-Status: UNSURE (   7.02  )
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

Am 2022-04-18 14:10, schrieb Michael Walle:
> There is no way to gather all information to verify support for a new
> flash chip. Also if you want to convert an existing flash chip to the
> new SFDP parsing, there is not enough information to determine if the
> flash will work like before. To ease this development, expose internal
> parameters via the debugfs.

Here's an example:
# cat params
name		w25q32dw
id		ef6016
size		4.00 MiB
write size	1
page size	256
address width	3
flags		HAS_SR_TB|HAS_LOCK|HAS_16BIT_SR|NO_READ_CR|SOFT_RESET

opcodes
  read		3b
   dummy cycles	8
  erase		20
  program	02
  8D extension	none

protocols
  read		1S-1S-2S
  write		1S-1S-1S
  register	1S-1S-1S

erase commands
  20 (4.00 KiB) [1]
  52 (32.0 KiB) [2]
  d8 (64.0 KiB) [3]
  c7 (4.00 MiB)

sector map
  region              | erase mask | flags
  --------------------+------------+----------
  00000000 - 003fffff |     [ 123] |

# cat capabilities
Supported read modes by the flash
1S-1S-1S
   opcode	03
   mode cycles	00
   dummy cycles	00
1S-1S-1S (fast read)
   opcode	0b
   mode cycles	00
   dummy cycles	08
1S-1S-2S
   opcode	3b
   mode cycles	00
   dummy cycles	08
1S-2S-2S
   opcode	bb
   mode cycles	02
   dummy cycles	02
1S-1S-4S
   opcode	6b
   mode cycles	00
   dummy cycles	08
1S-4S-4S
   opcode	eb
   mode cycles	02
   dummy cycles	04
4S-4S-4S
   opcode	eb
   mode cycles	02
   dummy cycles	00

Supported page program modes by the flash
1S-1S-1S
   opcode	02

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
