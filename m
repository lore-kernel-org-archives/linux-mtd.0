Return-Path: <SRS0=enRf=27=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8383FC33CA4
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 08:22:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55CD62072E
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2020 08:22:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hup+ESHH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55CD62072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZPirEOGEiTc6bktULHx/QjVcIOPyWt+63wugyAIraos=; b=Hup+ESHHvcCN30
	wOw02/7oF0p1QYKFdyjom3/ZtrHW3XzYrX5zb7cpZj6a20LsY8IVp35/Zy7Gjx/p+GWGRX0DOaTjr
	HxJTeX74wIh/o+C+B0jPxjp2SVf4jBDLygi+ewy5hy8D4vsBQNb2IoK/5qPWYLTQ68N624iQGbHzB
	xsanPglGFh3R5tiGIAjIKegfbA75ZdxvGqJX22uyivJCb/8uFklt9phQlSJpx4DDLjGpF1exSRlre
	XEWZbzDfw9obhN9VmdHn1VirksBIAPI6uZqHByH7DBgciPNNXDpcwi1vpg6MfiB6EJxrMld4ZWmbY
	LmJEeaT8tGj3SaAxDMkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ippYO-00022f-4p; Fri, 10 Jan 2020 08:22:00 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ippYK-00021w-LC
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2020 08:21:58 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1F0FF293977;
 Fri, 10 Jan 2020 08:21:55 +0000 (GMT)
Date: Fri, 10 Jan 2020 09:21:52 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] mtd: nand: spi: rework detect procedure for
 different read id op
Message-ID: <20200110092152.64d05705@collabora.com>
In-Reply-To: <20200110091024.56918193@xps13>
References: <20200110025218.1257809-1-gch981213@gmail.com>
 <20200110075859.3edfae3a@collabora.com>
 <CAJsYDVK4RtX92O3M+EOsZa5qS4TxE0OVaEq=KOnAuP6DEHvw2Q@mail.gmail.com>
 <20200110090422.75988c49@collabora.com>
 <20200110091024.56918193@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_002156_825243_64525537 
X-CRM114-Status: GOOD (  19.57  )
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

On Fri, 10 Jan 2020 09:10:24 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Fri, 10 Jan
> 2020 09:04:22 +0100:
> 
> > On Fri, 10 Jan 2020 15:34:28 +0800
> > Chuanhong Guo <gch981213@gmail.com> wrote:
> >   
> > > Hi!
> > > 
> > > On Fri, Jan 10, 2020 at 2:59 PM Boris Brezillon
> > > <boris.brezillon@collabora.com> wrote:    
> > > > [...]      
> > > > > +     ret = spinand_read_id_op(spinand, 1, 0, id);
> > > > > +     if (ret)
> > > > > +             return ret;
> > > > > +     ret = spinand_manufacturer_match(spinand,
> > > > > +                                      SPINAND_READID_METHOD_OPCODE_ADDR);
> > > > > +     if (!ret)
> > > > > +             return 0;
> > > > > +
> > > > > +     ret = spinand_read_id_op(spinand, 0, 1, id);      
> > > >
> > > > Hm, we should probably do only one of each read_id and iterate over all
> > > > manufacturers/chips each time instead of doing 3 read_ids per
> > > > manufacturer.      
> > > 
> > > This actually do the former instead of the latter. Maybe the function
> > > names are a bit
> > > misleading. spinand_manufacturer_match iterates over all manufacturers
> > > in one call,
> > > and spinand_manufacturer_detect is called once in spinand_detect.
> > > Do you have suggestions on function naming?    
> > 
> > Maybe you can just inline the content of this function in
> > spinand_detect().  
> 
> Actually I found that part clear enough, I would keep it as is, out of
> the spinand_detect() function as long as there is no actual reason to
> merge them?

Hm, I kind of disagree. The current name makes it sound like the
function detects the manufacturer or does a per-manufacturer id
detection, which is not the case. How about spinand_id_based_detect() or
spinand_readid_detect()?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
