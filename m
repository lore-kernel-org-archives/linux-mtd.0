Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3F5C47255
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 16:15:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6104B206DB
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 16:15:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dsd7i1Sc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6104B206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IPEdI427uqaB4Ck0elUC61OEM4sDkhBAKdORs+T/A1c=; b=dsd7i1ScsGZ4Go
	bfrYWFUSBww5FlFHjnTsFs4/og8//RJdeNywmCrRDNvxFeaZl9r4Qwh3K2QACOIsBPFJT+CSurWqj
	V3LaDow6w27KGrsnhhBDIkAInkOz0gtEmf99TBGHQ0DPBYNFxqXAvz2g0n96rpIRITeLFvlw1FNsj
	RTQhv7nxDquTJdfqaYROw3y8xWpKJ/iUUC/t92JdhYbyzkx4tDYGxkfuWnHA6ZkL3f7yUCU36/nnY
	Dpq3zPUYP9CKknqU+xcbhVpi+aq6z/O8Clxx36nukVFi05yRM0eo4OnXmNPujfSvJ2Avr6J3rkHZ2
	8fhg/GwKGanZbkGYjQTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYB4r-0008NW-CV; Mon, 11 May 2020 16:14:49 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYB4o-0008Mu-CD
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 16:14:47 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E8D2D24000A;
 Mon, 11 May 2020 16:14:40 +0000 (UTC)
Date: Mon, 11 May 2020 18:14:39 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 7/8] mtd: rawnand: arasan: Add new Arasan NAND
 controller
Message-ID: <20200511181439.0c7b2768@xps13>
In-Reply-To: <20200510090230.1ba6f6d7@collabora.com>
References: <20200508171339.8052-1-miquel.raynal@bootlin.com>
 <20200508171339.8052-8-miquel.raynal@bootlin.com>
 <20200510090230.1ba6f6d7@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_091446_547139_00B7EB0D 
X-CRM114-Status: GOOD (  12.22  )
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
> 
> > +
> > +	if (steps > ANFC_MAX_STEPS)
> > +		return -ENOTSUPP;
> > +
> > +	return steps;
> > +}  

I took the logic of the above proposal and extended the helper to be
"anfc_pkt_len_config", taking two pointers as argument: *steps and
*pktsize, which will be updated in case of success. Otherwise
this function returns an error and can be added to the "check_op" path
instead of only failing at execution time.

---8<---

+static int anfc_pkt_len_config(unsigned int len, unsigned int *steps,
+                              unsigned int *pktsize)
+{
+       unsigned int nb, sz;
+
+       for (nb = 1; nb < ANFC_MAX_STEPS; nb *= 2) {
+               sz = len / nb;
+               if (sz <= ANFC_MAX_PKT_SIZE)
+                       break;
+       }
+
+       if (sz * nb != len)
+               return -ENOTSUPP;
+
+       if (steps)
+               *steps = nb;
+
+       if (pktsize)
+               *pktsize = sz;
+
+       return 0;
+}

--->8---

And then, in anfc_check_op():

+               case NAND_OP_DATA_IN_INSTR:
+               case NAND_OP_DATA_OUT_INSTR:
+                       if (instr->ctx.data.len > ANFC_MAX_CHUNK_SIZE)
+                               return -ENOTSUPP;
+
+                       if (anfc_pkt_len_config(instr->ctx.data.len NULL, NULL))
+                               return -ENOTSUPP;
+
+                       break;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
