Return-Path: <SRS0=/+zL=6W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B43C38A2A
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 10:32:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E141120708
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 10:32:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="catmgCiG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E141120708
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NFBtGQO/yltPk1AccJpiDwM3QGlkZwSX4yiukPZwMJk=; b=catmgCiGQYN0Aw
	xRpaqIp/6lbc7WxPGIP1KBOH7OKHDtAEUCq5AoGGIguGu1NUOciP8a4Oya5rIb4RJYeB5i/3vk5U2
	JKd4fk+UUdTq1NBYeDYE4vgZ41q8OPYeFjTKqbTjj9R9c25FH9vYW+NpIYOdA6iReEdW4YYzKFxt6
	KMzK89tuhZSSraDqLopA7rSa1ToGinWEsB9y6o2hxtZ1Tmj0q9rCtT0EkTCLC7hOncnwMDBMUzpL7
	AgsTru5F7KzIGvtOyyjtcMaUU9ZObqAXSoJJiCiHwDVBlrQ4h+6AtJl5wXVWPwvn9yBxhP5E2IaRz
	+vwwrncA/QQN6nG0SBiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jX0In-0007DK-HI; Fri, 08 May 2020 10:32:21 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jX0Ik-0007Cq-P2
 for linux-mtd@lists.infradead.org; Fri, 08 May 2020 10:32:20 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D6E66FF809;
 Fri,  8 May 2020 10:32:06 +0000 (UTC)
Date: Fri, 8 May 2020 12:32:05 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 00/17] mtd: rawnand: cafe: Convert to exec_op() (and more)
Message-ID: <20200508123205.4cf293b7@xps13>
In-Reply-To: <20200502151510.59a690a8@collabora.com>
References: <20200427082028.394719-1-boris.brezillon@collabora.com>
 <20200502112732.330971-1-lkundrak@v3.sk>
 <20200502151510.59a690a8@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_033218_946399_E4C23744 
X-CRM114-Status: GOOD (  10.77  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 Lubomir Rintel <lkundrak@v3.sk>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


> > 2.) When the block after a conditional is multiple lines, could you please
> > include the curly braces? That is:
> > 
> >         if (ctrl1 & CAFE_NAND_CTRL1_HAS_DATA_IN) {
> >                 cafe_read_buf(chip,
> >                               subop->instrs[data_instr].ctx.data.buf.in +
> >                               nand_subop_get_data_start_off(subop, data_instr),
> >                               nand_subop_get_data_len(subop, data_instr));
> >         }
> > 
> > Instead of:
> > 
> >         if (ctrl1 & CAFE_NAND_CTRL1_HAS_DATA_IN)
> >                 cafe_read_buf(chip,
> >                               subop->instrs[data_instr].ctx.data.buf.in +
> >                               nand_subop_get_data_start_off(subop, data_instr),
> >                               nand_subop_get_data_len(subop, data_instr));
> > 
> > This makes things significantly easier to read for me, not to mention that it
> > comes handy to have the braces around for printf debugging.  
> 
> I do prefer the version without brackets, but given you debugged it,
> I'd be okay changing that one ;-) (assuming Miquel is okay with that
> too, of course).

I also prefer having curly braces around single-multiline-instructions
:)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
