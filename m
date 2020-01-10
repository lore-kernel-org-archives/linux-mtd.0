Return-Path: <SRS0=enRf=27=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6AA0C33CA2
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 08:10:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 984092072A
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 08:10:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fz5QE+6a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 984092072A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UGWhSoF0G2AqfrUqBd7hi1b0nrzBZcxolFPE4GEM3ak=; b=Fz5QE+6ah6f985
	3gTlxqucxK0qsgDZUBVQO9H+8xMar07YHfyvWbO2GZ2N5jU9I7xaBegKV7aAjpvCoFZAuWPpj2lAY
	+YFOGp+Npz2hlFcR8TIhu/oueyKfx4ew5WL7Bvqbt1jdOzZwftGyS0AoC2HRyGlnEKdcocl5mX9At
	RnG5b0UVIoQmVJjCfdiJ4j7LX5Jrs2kY+GMT0DYE3+++Yo7UjCwI/i2Lt/DkTPVaRZZEY2Bih8a7T
	tzDGJLuvw9KRvoCV82R7JdlKDFvXExbGdd4EXH4Xt4kGuKCW9CWUVxK7jMsASGDCRmz0pcsUE40Oz
	+G+p3LWnyKW2MFPZNkwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ippNR-0005bl-7b; Fri, 10 Jan 2020 08:10:41 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ippNN-0005aT-RU
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2020 08:10:39 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 2998810000D;
 Fri, 10 Jan 2020 08:10:25 +0000 (UTC)
Date: Fri, 10 Jan 2020 09:10:24 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2] mtd: nand: spi: rework detect procedure for
 different read id op
Message-ID: <20200110091024.56918193@xps13>
In-Reply-To: <20200110090422.75988c49@collabora.com>
References: <20200110025218.1257809-1-gch981213@gmail.com>
 <20200110075859.3edfae3a@collabora.com>
 <CAJsYDVK4RtX92O3M+EOsZa5qS4TxE0OVaEq=KOnAuP6DEHvw2Q@mail.gmail.com>
 <20200110090422.75988c49@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_001038_031093_88281DD7 
X-CRM114-Status: GOOD (  14.53  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 open list <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Chuanhong Guo <gch981213@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

Boris Brezillon <boris.brezillon@collabora.com> wrote on Fri, 10 Jan
2020 09:04:22 +0100:

> On Fri, 10 Jan 2020 15:34:28 +0800
> Chuanhong Guo <gch981213@gmail.com> wrote:
> 
> > Hi!
> > 
> > On Fri, Jan 10, 2020 at 2:59 PM Boris Brezillon
> > <boris.brezillon@collabora.com> wrote:  
> > > [...]    
> > > > +     ret = spinand_read_id_op(spinand, 1, 0, id);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +     ret = spinand_manufacturer_match(spinand,
> > > > +                                      SPINAND_READID_METHOD_OPCODE_ADDR);
> > > > +     if (!ret)
> > > > +             return 0;
> > > > +
> > > > +     ret = spinand_read_id_op(spinand, 0, 1, id);    
> > >
> > > Hm, we should probably do only one of each read_id and iterate over all
> > > manufacturers/chips each time instead of doing 3 read_ids per
> > > manufacturer.    
> > 
> > This actually do the former instead of the latter. Maybe the function
> > names are a bit
> > misleading. spinand_manufacturer_match iterates over all manufacturers
> > in one call,
> > and spinand_manufacturer_detect is called once in spinand_detect.
> > Do you have suggestions on function naming?  
> 
> Maybe you can just inline the content of this function in
> spinand_detect().

Actually I found that part clear enough, I would keep it as is, out of
the spinand_detect() function as long as there is no actual reason to
merge them?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
