Return-Path: <SRS0=JbbF=6Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0309AC54E49
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 08:36:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFB9C20820
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 08:36:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L0bVf9Yd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFB9C20820
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W8Id1Ol5rZbqeJQyBu6gdcUd3VvRVqKdHpBITIFdUrU=; b=L0bVf9Ydw2C74A
	yIIB9ymqH1oPzdKfY9QWDYUQYK1KoqBZaNgck3NZaMUJ55wn/DKjtglHgjajtAGSS4WDsMGwXRsYo
	2Pj4U8bTV+aogwl1BqauV/un/icxzyHWfbka+2yzUbuHaBZZLjhRDnCAUWEBqtbj5a7LD1M8X2tfG
	iMJHV5fd0GIL0RqqVfJkmzWZTdBE7o+b9WAxfHtporcKwFJcKzsHMZjBn05HFWnaxd15J3u7/a3lo
	6fxCCZzmaRClwhVezjhcr4cR7lNj0nXSjS7WlHpCYcvVCxBGGBDce1RvSigQtO4AdwlGJ1WhX8NYL
	VqhWb4j32c+nKcBhvwLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXhRF-0000kP-4e; Sun, 10 May 2020 08:35:57 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXhRB-0000g5-Py
 for linux-mtd@lists.infradead.org; Sun, 10 May 2020 08:35:55 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 16C74FF802;
 Sun, 10 May 2020 08:35:48 +0000 (UTC)
Date: Sun, 10 May 2020 10:35:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 7/8] mtd: rawnand: arasan: Add new Arasan NAND
 controller
Message-ID: <20200510103547.7399eba3@xps13>
In-Reply-To: <20200510090230.1ba6f6d7@collabora.com>
References: <20200508171339.8052-1-miquel.raynal@bootlin.com>
 <20200508171339.8052-8-miquel.raynal@bootlin.com>
 <20200510090230.1ba6f6d7@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_013553_981220_66B18E16 
X-CRM114-Status: GOOD (  10.27  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

Boris Brezillon <boris.brezillon@collabora.com> wrote on Sun, 10 May
2020 09:02:30 +0200:

> On Fri,  8 May 2020 19:13:38 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > +static int anfc_len_to_steps(struct nand_chip *chip, unsigned int len)
> > +{
> > +	unsigned int steps = 1, pktsize = len;
> > +
> > +	while (pktsize > ANFC_MAX_PKT_SIZE) {
> > +		steps *= 2;
> > +		pktsize = DIV_ROUND_UP(len, steps);
> > +	}  
> 
> 
> Same here, you shouldn't have a round_up() but instead complain if
> "len != pkt_size * steps"
> 
> 	if (len % 4)
> 		return -ENOTSUPP;

This is not possible, we need unaligned accesses for NAND detection.

> 
> 	if (len < ANFC_MAX_PKT_SIZE)
> 		return len;
> 
> 	for (steps = 2; steps < ANFC_MAX_STEPS; steps *= 2) {
> 		pkt_size = len / steps;
> 		if (pkt_size <= ANFC_MAX_PKT_SIZE)
> 			break;
> 	}
> 
> 	if (pkt_size * steps != len)
> 		return -ENOTSUPP;
> 
> 	return pkt_size;

The rest looks fine, I will change it and also add these checks in
->exec_op() check_nonly path.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
