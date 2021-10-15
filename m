Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44B4C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 10:34:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A16060F9E
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 10:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A16060F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/o2ne4FYftjyOjM3TTbL7RO848qtQmH9QWTNjAAYr4=; b=jYSoBWkA4f/TGq
	KfEYTe6uMDnNjH6i9Q4cln4KL/ezAa2btt8JbxLRzbrG2RNrA5EDw5Me7I4bOb7+o040V+0DhjAWg
	LG2+SFyteqnrY+HSgLAzMQpzAhcNV9Tm0w7ASlTf5smUiLpk5npgFUnBKI+YSAfCWBlhqI/LrwSUx
	Ewvrm/EWCS9q+dIL5rqmWZdSvYgVdd5Z6BTmhv8oxOqeUqp8PrtQnsgvKGhlbrmM8RJZQWv7qAKJ1
	leXuO8FE5K8H75JBMukA6x8pA5FpHTxjsb52K7YVBpKbyFvlfRJplMjkSOBWOzneJRmolm/IH7vJa
	N6pWVEX9S/bApHK7iEJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbKXP-006VUe-N4; Fri, 15 Oct 2021 10:34:07 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbKVF-006Uc9-Fe
 for linux-mtd@lists.infradead.org; Fri, 15 Oct 2021 10:31:54 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 542B820007;
 Fri, 15 Oct 2021 10:31:51 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Morgan <macroalpha82@gmail.com>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, richard@nod.at, vigneshr@ti.com,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH] mtd: rawnand: hynix: Add support for H27UCG8T2ETR-BC MLC
 NAND
Date: Fri, 15 Oct 2021 12:31:50 +0200
Message-Id: <20211015103150.949320-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210930162402.344-1-macroalpha82@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'eec417fd317a95a79257c20b3a1d66d4027549df'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_033153_691480_16062707 
X-CRM114-Status: GOOD (  12.44  )
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

On Thu, 2021-09-30 at 16:24:02 UTC, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the H27UCG8T2ETR-BC MLC NAND. The NAND is used widely
> in the NTC CHIP, is an MLC type NAND, and is 8GB in size. Neither
> JEDEC nor ONFI detection identifies it correctly, so the ID is added
> to the nand_ids.c file. Additionally, per the datasheet this NAND
> appears to use the same paired pages scheme as the Toshiba
> TC58TEG5DCLTA00 (dist3), so add support for that to enable use in
> SLC emulation mode.
> 
> Tested on a NTC CHIP the device is able to write to a ubifs formatted
> partition, and then have U-Boot (with proposed patches) boot from a
> kernel located on that ubifs formatted partition.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
