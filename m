Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26005EE57DF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Sep 2023 13:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iRobyhc3Fe1pqwUNO1P3f8W4pF0/hdWZs5im1gq8wsc=; b=isDTUbnZ5E7Co+
	mgf7KMXNmmwgYNmiy6R8ENJ+qGjiMzQOzbMBPwfdmPXpxP1IbVWVdPnD4qwcLTgFLW+ButGX98TJ/
	TvLhJOjwwxAC5/xFuaJ532GLcjnU7if9wPIvFmjA4Y2iTZz8FWYy+3d/o1aMq1ox8JJdF6787+trA
	mtq5LSLI2/c/JcLLbZx1X/lcNWsiTTaaNBdCzBiP4sdgXTd+PaBzKX+e+WKbIoPJTAWUcJUaRwpqK
	VwzwigY5VzAnR5IX4eA26Nk4nC3yIEFK2RbXU1QqbgSDhRBddmXIpLh6yciZc1aLEBcJ2UjI472Rs
	MoqjlrvkyMYQMKteSMfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfghQ-000ZdA-1U;
	Mon, 11 Sep 2023 13:11:32 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfghN-000Zc1-0E
	for linux-mtd@lists.infradead.org;
	Mon, 11 Sep 2023 13:11:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 646EEFF826;
	Mon, 11 Sep 2023 13:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694437884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mgHSeOg7Afn9CeLK8bBHh3Wcdm8cf648NndqnCrpqho=;
	b=P0SJn7a4XwNoN4uLat4oIeFtf8ya1EzokqZiW25wj/VA6y3gb9/YOkDL6xGZ101Ap5fzcy
	xCI743y4jMg/ixkYhDKfd1IxmsNNo7CoFlz6bE13croYBVNx+VRp9Cg04SR4lrIcRvsE+e
	ceH8301fX/A4zpD0EarsD+iGvUZ2CtczRDOQS/tA4jrLcFZBWSGjyglhxkhHN6P8fMaG2a
	NwpTIjyIbVT+ABaUsOsnPUGbAjaZBKC6HKrxgvuwuSYymvUw5VgaNTEcqxhL6LlhULtMn2
	RoxFlTyX8NmWuUqpWHA6EimQbBclvBJnBw8EscMpdDgmZqsbJRvv/kaCvlbFBw==
Date: Mon, 11 Sep 2023 15:11:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Johan Jonker
 <jbx6244@gmail.com>, <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] mtd: rawnand: remove 'nand_exit_status_op()'
 prototype
Message-ID: <20230911151110.09cf4c00@xps-13>
In-Reply-To: <7ab06111-5208-77b2-0f09-0751de23ae66@salutedevices.com>
References: <20230823105235.609069-1-AVKrasnov@sberdevices.ru>
	<7ab06111-5208-77b2-0f09-0751de23ae66@salutedevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_061129_244493_E6C09D2A 
X-CRM114-Status: GOOD (  12.88  )
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

Hi Arseniy,

avkrasnov@salutedevices.com wrote on Mon, 11 Sep 2023 13:30:00 +0300:

> Please, ping

Please, -rc1 was tagged yesterday night...

> Thanks, Arseniy
> 
> On 23.08.2023 13:52, Arseniy Krasnov wrote:
> > This function is exported and its prototype is already placed in
> > include/linux/mtd/rawnand.h.
> > 
> > Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> > ---
> >  drivers/mtd/nand/raw/internals.h | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
> > index e9932da18bdd..b7162ced9efa 100644
> > --- a/drivers/mtd/nand/raw/internals.h
> > +++ b/drivers/mtd/nand/raw/internals.h
> > @@ -106,7 +106,6 @@ int nand_read_page_raw_notsupp(struct nand_chip *chip, u8 *buf,
> >  			       int oob_required, int page);
> >  int nand_write_page_raw_notsupp(struct nand_chip *chip, const u8 *buf,
> >  				int oob_required, int page);
> > -int nand_exit_status_op(struct nand_chip *chip);
> >  int nand_read_param_page_op(struct nand_chip *chip, u8 page, void *buf,
> >  			    unsigned int len);
> >  void nand_decode_ext_id(struct nand_chip *chip);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
