Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A4BC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 17:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2EhfNlS57E/0hLV2xy9TrJhHela6c2s9v8glbHpwWWA=; b=HQkINteE0+RVXf
	5FT2yeWQ0PtMXdKBkvi/QPflthhlyXhJxEfvTcNWb2jxIsmq9YPp6Hg4S3pfWddx+pdD1kZTSduGm
	vqtgwhdlPPQcTeQzWWqlZcEiaM2CQvjFsAiPkxVMN66bgYlt6zMqFqI56WXM4/8WPV+oDXd+YgsAq
	ISpOQ3VrQNOL8zp1IyRoN7EO/fcrERczbk01C2tj3001zhDD4oFW9bkbyAWrjaGW/YQsqA6btZaX/
	Kg9YIwtHMGQDMFFHi/QYIz8m++5zNR2xd4CE2u7p2/9ClwXgPog1Hs+papfsiPA5yrKLMM0ypAKld
	I8Z66nSi4JO1uHxZS50Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxuAc-006nPG-Gr; Thu, 16 Dec 2021 17:03:54 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxtrF-006i3Z-Gk
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 16:43:55 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C48141F4133E;
 Thu, 16 Dec 2021 16:43:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639673031; bh=NRlWnUKSxIUgHuxirD6NYoUC5ZA2xF6iZlzklepC9FQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WOim5bl5S+nTsXk/ANhy88KBaCLLoDC3McEVMtZoPEet3N1DJQnWWKU8nvX1R0YDP
 FDrARNXt2GOu1pZKJSJrUlrZULJwP6CpL1KYOvNwJp5F99IyeFn0n1sy7Kxn2Q1rca
 gNRzwvNT4nzGl5dCmDHfjpVa2a1pJtkIi63y9OLQEN/r6mK2MlnjKsn0Ku8byDzvI2
 nAwNcAapTwLAOmCC0Q2LyORL3KcSYpNxbXJ9JphQS+L3XcfHRY0X/XkxhgNx7rRlqa
 q3KqtYEGmYDoSDmhTksA+sMxhS1kotpWQFlfVFwC3/6pwp+6HaL+QvhAk3/Nq+olFx
 EMYH1AetY1NlA==
Date: Thu, 16 Dec 2021 17:43:47 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Mark Brown
 <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, Michael Walle
 <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>, Mauro Lima
 <mauro.lima@eclypsium.com>, Alexander Sverdlin
 <alexander.sverdlin@nokia.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Hans-Gert Dahmen
 <hans-gert.dahmen@immu.ne>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [PATCH v4 2/3] mtd: spi-nor: intel-spi: Convert to SPI MEM
Message-ID: <20211216174347.69cf611c@collabora.com>
In-Reply-To: <Ybtn1VTsspxdIeT8@lahna>
References: <20211118130543.11179-1-mika.westerberg@linux.intel.com>
 <20211118130543.11179-3-mika.westerberg@linux.intel.com>
 <20211216115100.448351e4@collabora.com> <Ybtn1VTsspxdIeT8@lahna>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_084353_791906_9F8BB5F2 
X-CRM114-Status: GOOD (  20.56  )
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

On Thu, 16 Dec 2021 18:22:45 +0200
Mika Westerberg <mika.westerberg@linux.intel.com> wrote:

> Hi,
> 
> On Thu, Dec 16, 2021 at 11:51:00AM +0100, Boris Brezillon wrote:
> > On Thu, 18 Nov 2021 16:05:42 +0300
> > Mika Westerberg <mika.westerberg@linux.intel.com> wrote:
> >   
> > > +static bool intel_spi_cmp_mem_op(const struct intel_spi_mem_op *iop,
> > > +				 const struct spi_mem_op *op)
> > > +{
> > > +	if (iop->mem_op.cmd.nbytes != op->cmd.nbytes ||
> > > +	    iop->mem_op.cmd.buswidth != op->cmd.buswidth ||
> > > +	    iop->mem_op.cmd.dtr != op->cmd.dtr ||
> > > +	    iop->mem_op.cmd.opcode != op->cmd.opcode)
> > > +		return false;
> > > +
> > > +	if (iop->mem_op.addr.nbytes) {
> > > +		if (iop->mem_op.addr.nbytes != op->addr.nbytes ||
> > > +		    iop->mem_op.addr.dtr != op->addr.dtr)
> > > +			return false;
> > > +	}  
> > 
> > Hm, are you sure you want to allow op->addr.nbytes > 0 when
> > iop->mem_op.addr.nbytes == 0? Feels like the command should be reported
> > as unsupported in that case. Unless 0 is a wildcard meaning 'any', but
> > that would be confusing, since operations with 0 address bytes are
> > valid, and I actually expect the number of address cycles to be fixed 
> > or bounded.  
> 
> Indeed. I will change it to:
> 
> 	if (iop->mem_op.addr.nbytes) {
> 		if (iop->mem_op.addr.nbytes != op->addr.nbytes ||
> 		    iop->mem_op.addr.dtr != op->addr.dtr)
> 			return false;
> 	} else if (op->addr.nbytes > 0) {
> 		return false;
> 	}

Why no just

	if (iop->mem_op.addr.nbytes != op->addr.nbytes ||
	    iop->mem_op.addr.dtr != op->addr.dtr)
		return false;

then?

> 
> in v5 if that's what you meant.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
