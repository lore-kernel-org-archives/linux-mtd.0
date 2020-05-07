Return-Path: <SRS0=/Eax=6V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF07CC38A2A
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 16:12:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DB4F2083B
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 16:12:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IKw8E8I0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DB4F2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wOOs9aSUddf9VZeCH9XDqzXVUBtSv0uZALCAOJgHpi4=; b=IKw8E8I0atTtJY
	4OWvCitz5jwIl+iM06BJtv+5FURMlxSjE9+zhKT4bCVI9h+l1DSASeGt29dhxxR9wjEp4ZQc1qzrb
	fLT80o8o8AjgOaSKUxxAXny72vJq+7yiCCuXqzlSxMrPCIAlCev+OrzvcSvkvtIoNw3cyGaj9cDVj
	w2US+G+2jLGF5ctIzuiSu2xd+jDmFRWtK6TtX5gvRYi6sQKSWFDy6JRJxC9hzFE4VKPrBDutaoBAb
	zh7OzV+yp0kUyPxkV7Clg18lhl07/l7s9vnhYweS67cwOaRQ2qqI8b7LTpUcjO804ArfLgyikq91v
	hPkCpkoT7MJxBIwUyDdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWj8i-0006MH-Nx; Thu, 07 May 2020 16:12:48 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWj8g-0006Ld-0H
 for linux-mtd@lists.infradead.org; Thu, 07 May 2020 16:12:47 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 765C22A073C;
 Thu,  7 May 2020 17:12:44 +0100 (BST)
Date: Thu, 7 May 2020 18:12:40 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 7/8] mtd: rawnand: arasan: Add new Arasan NAND
 controller
Message-ID: <20200507181240.7455966f@collabora.com>
In-Reply-To: <20200507175301.7affb8f7@xps13>
References: <20200507110034.14736-1-miquel.raynal@bootlin.com>
 <20200507110034.14736-8-miquel.raynal@bootlin.com>
 <20200507141103.0c241877@collabora.com>
 <20200507171311.7669d0db@xps13>
 <20200507172453.15a03574@collabora.com>
 <20200507175301.7affb8f7@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_091246_177396_517EEB19 
X-CRM114-Status: GOOD (  18.24  )
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

On Thu, 7 May 2020 17:53:01 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Thu, 7 May
> 2020 17:24:53 +0200:
> 
> > On Thu, 7 May 2020 17:13:11 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > Hi Boris,
> > > 
> > > Boris Brezillon <boris.brezillon@collabora.com> wrote on Thu, 7 May
> > > 2020 14:11:03 +0200:
> > >     
> > > > On Thu,  7 May 2020 13:00:33 +0200
> > > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > > > 
> > > >       
> > > > > +
> > > > > +static void anfc_chips_cleanup(struct arasan_nfc *nfc)
> > > > > +{
> > > > > +	struct anand *anand, *tmp;
> > > > > +
> > > > > +	list_for_each_entry_safe(anand, tmp, &nfc->chips, node) {
> > > > > +		nand_release(&anand->chip);        
> > > > 
> > > > 		ret = mtd_device_unregister(nand_to_mtd(&anand->chip));
> > > > 		WARN_ON(ret);
> > > > 		nand_cleanup(&anand->chip);
> > > > 
> > > > Or maybe add this WARN_ON() to nand_release() so we don't have to ask
> > > > people to use mtd_device_unregister() + nand_cleanup().      
> > > 
> > > I don't get your point here? I'm not against adding a warn_on between
> > > both functions but it's not related to this driver?    
> > 
> > We've asked people to not call nand_release() but instead call
> > mtd_device_unregister()+nand_cleanup(), which is not done here. My
> > point is, if even us can't get it right, maybe it's a sign we should
> > instead patch nand_release() to do the right thing.  
> 
> It's in my todo-list, yes. What about just dropping nand_release
> entirely? So that nand_scan_tail as its nand cleanup and
> mtd_device_register as its mtd_device_unregister and everything will be
> much clearer?
> 

Yep, that would work too.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
