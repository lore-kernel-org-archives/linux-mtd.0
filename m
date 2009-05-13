Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M49lb-0001cW-IY
	for linux-mtd@lists.infradead.org; Wed, 13 May 2009 08:24:49 +0000
Subject: Re: AW: UBI - NAND Flash Programming
From: Artem Bityutskiy <dedekind@infradead.org>
To: "Musch, Edwin" <musche@dataio.com>
In-Reply-To: <B538B21A486F9E4CBBE577217764F37701662A61@email2.dataio.internal>
References: <B538B21A486F9E4CBBE577217764F37701662A61@email2.dataio.internal>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 13 May 2009 11:24:10 +0300
Message-Id: <1242203050.27996.173.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, no offence, just a kind suggestion: we do not appreciate
top-posting here. Well, any technical mailing list does not
appreciate that.

A: Because we read from top to bottom, left to right.
Q: Why should I start my reply below the quoted text?

A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?   

A: The lost context.
Q: What makes top-posted replies harder to read than bottom-posted?

A: Yes.
Q: Should I trim down the quoted part of an email to which I'm replying?

Please, read http://david.woodhou.se/email.html

On Tue, 2009-05-05 at 14:41 -0700, Musch, Edwin wrote:
> I'm working on the device level of the chip, but I'm not using the Linux kernel. Only our customer does but we have to follow the UBI convention.

And we do not appreciate looooooooong lines, just like any technical
mailing.

> We are programming blank chips in production so there is nothing in the NAND flash. This means I do not have to change anything from the Image, right?

Right. The link I posted you last time does have the algorithm
description. It is more generic than you need, but you may easily
simplify it. In your case - you do not have to preserve erase
counters. Just skip bad blocks, that's all.

> So I don't have to make any updates within the main and the spare area, right?

UBI does not touch the spare area. Never.

> With question 2 & 3 I try to say. Do I need to update a dependency if a block will be moved?

No. In UBI all eraseblocks are independent.

>  Is there something in the main / spare area of the NAND flash that needs to be updated if a block will be moved into the next good block.

No. You may even randomly re-arrange all eraseblocks, this
should not matter.

> Could you provide me the structure of the table if "NAND_USE_FLASH_BBT" is enabled?

No, sorry. Never used BBT. You should download kernel sources
and dig them, unfortunately.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
