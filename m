Return-Path: <SRS0=Kxx5=TH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D313C004C9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 15:10:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40BBE2087F
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 15:10:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bDa0IIIo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40BBE2087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mnlZ/5FDRUNBcvhxTUC4UqQzEUAyishJ899Pn0tQCas=; b=bDa0IIIooDSSF+
	yhOxriJoySf5574I7u8Dq5kDRf0+BXbOQac6RnbKbqKkDV19S9IdTNIvpy/cYBU5uPu2hqjiQj8Zt
	pxOOTkAK1/JQI/l3uBMo/S3rZz+VNOM1iagYL2EPvDDVlmyRzRLNYZfhdZ+HOfbnEZ0gSCtuY0zq1
	DlTu1QCwgVXf9kdcSQ/W4AyBH9NLAFHxqr82AI3uMktzh1/UDa8da9q/LEXrLeYBJwvNin+jCpfqy
	FrdI09Dbl+PUafME5h1cXyq7hwXuPEx+eYBBV1d3gj4jl0xk1xqCGzAL8shECQtAWeF8196dhsDWK
	kArcYhisfn9amXXFB7AA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hO1k5-0000FT-8z; Tue, 07 May 2019 15:10:53 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO1k2-0000Dv-Bv
 for linux-mtd@lists.infradead.org; Tue, 07 May 2019 15:10:51 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2BEAB273331;
 Tue,  7 May 2019 16:10:47 +0100 (BST)
Date: Tue, 7 May 2019 17:10:38 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Zhuohao Lee <zhuohao@chromium.org>
Subject: Re: [PATCH v2] mtd: spi-nor: add debugfs nodes for querying the
 flash name and id
Message-ID: <20190507171038.0413678f@collabora.com>
In-Reply-To: <CABD5ybk+NFsVtdg06=s=iGczoCe2e2s1M+yWZMaUix02uggnrQ@mail.gmail.com>
References: <20190506084414.89702-1-zhuohao@chromium.org>
 <CANMq1KBpqb5-Ab1z_9zzvNVCkY72pBrAEJ2UVO1CgOjP=xXQ+A@mail.gmail.com>
 <CABD5ybnTbKLNUU68+bN9EcbkJECU6egPghUm=h=xHToWGmeWUw@mail.gmail.com>
 <CANMq1KCxRyvsQ++eDHt3wko6j05kBNUHjWCQtLMKBJxO8-Fwxg@mail.gmail.com>
 <CABD5ybk+NFsVtdg06=s=iGczoCe2e2s1M+yWZMaUix02uggnrQ@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_081050_536167_D8173ECB 
X-CRM114-Status: GOOD (  19.10  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Nicolas Boichat <drinkcat@chromium.org>, bbrezillon@kernel.org,
 richard@nod.at, Brian Norris <briannorris@chromium.org>,
 Marek =?UTF-8?B?VmHFoXV0?= <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 7 May 2019 23:06:32 +0800
Zhuohao Lee <zhuohao@chromium.org> wrote:


> > > > > @@ -231,8 +231,11 @@ static int m25p_probe(struct spi_mem *spimem)  
> > > >
> > > > Can we add this to function that is generic to all spi-nor devices,
> > > > instead of making this specific to m25p?  
> > > I can't find a better way to insert the spi_nor_debugfs_create()
> > > inside spi_nor.c.
> > > Another way is adding spi_nor_debugfs_create() to all of the caller.
> > > What do you think? Any other suggestion?  
> >
> > That, or maybe create a new spi_nor_device_register that does both
> > mtd_device_register and that spi_nor_debugfs_create call?  
> Thanks for suggestion. I feel that putting the mtd_device_register
> (high level api) inside the spi-nor (low level api)
> isn't perfect. This also will limit the caller to call this api to
> register mtd device with debugfs and lost the flexibility.
> I'll keep the original idea that adding spi_nor_debugfs_create() to
> all of the caller.

Why don't you move that to the MTD layer? If you add partname/partid
fields to mtd_info you'll have everything you need to make that generic.
It's then up to the upper layer to fill those fields before calling
mtd_device_register().


> > > >  
> > > > > +               return;
> > > > > +       }
> > > > > +       debugfs_create_file("flashid", S_IRUSR, root, nor,
> > > > > +                       &flashid_dbg_fops);
> > > > > +       debugfs_create_file("flashname", S_IRUSR, root, nor,
> > > > > +                       &flashname_dbg_fops);  

I thought we agreed on partname/partid. Any reason for switching back
to flashname/flashid?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
