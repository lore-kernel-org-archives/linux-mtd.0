Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9622C11D3D
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 20:52:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9693D2468E
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 20:52:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tmz7bMkf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9693D2468E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eOR6DX1pI0p6S84hB3jkOOtxx7iShW8g5duc5nsukMo=; b=tmz7bMkfXtFZ8z
	QwbYQG+ut+HsFBTJJD+LbggGxc8bv6tidIRM/ihODQdWD37y1p6gFpBxrc51LrqGFngJT+jfVbG3D
	FM8WjYaY75yPtDSfnAYwPtGoLICj3tlZWBA8PAeg9oQ7KZUeSRwr5z3n5/FzGgUnxttnqN/rNAu2b
	cAFtFwgDiUJZOoDMNyiYgGc0tHSOcojfTBsblcaOl/cjeJ6QuZPr0WKN/Z13SfcKr7k1Kq4tYP3zX
	Gi7VZeeo2XhrN5g5t3h2U5Ov/Q5PwKQhG2qUcfYLiOCRNlyKRoAx3hPEDuYlvkeOoinGmYaZ2hrM1
	ZAKOfw2Y+CNLdzeYU9jw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7Q8r-0007ej-15; Thu, 27 Feb 2020 20:52:21 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7Q8n-0007eP-WA
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 20:52:19 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 07DD42964E6;
 Thu, 27 Feb 2020 20:52:16 +0000 (GMT)
Date: Thu, 27 Feb 2020 21:52:13 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
Subject: Re: [EXT] Re: [PATCH v4 2/5] mtd: spinand: micron: Add new Micron
 SPI NAND devices
Message-ID: <20200227215213.01fd760b@collabora.com>
In-Reply-To: <MN2PR08MB639762D89F85C2556F51D48EB8EB0@MN2PR08MB6397.namprd08.prod.outlook.com>
References: <20200206202206.14770-1-sshivamurthy@micron.com>
 <20200206202206.14770-3-sshivamurthy@micron.com>
 <20200227192247.52f84723@collabora.com>
 <MN2PR08MB6397477172BAC14986175E6DB8EB0@MN2PR08MB6397.namprd08.prod.outlook.com>
 <20200227211759.7ba02273@collabora.com>
 <MN2PR08MB639762D89F85C2556F51D48EB8EB0@MN2PR08MB6397.namprd08.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_125218_166714_E8B044F9 
X-CRM114-Status: GOOD (  18.75  )
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
 Boris Brezillon <bbrezillon@kernel.org>,
 "shiva.linuxworks@gmail.com" <shiva.linuxworks@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 27 Feb 2020 20:24:22 +0000
"Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com> wrote:

> Hi Boris,
> 
> > 
> > On Thu, 27 Feb 2020 20:16:46 +0000
> > "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com> wrote:
> >   
> > > Hi Boris,
> > >
> > > Thanks for the review.
> > >  
> > > >
> > > > On Thu,  6 Feb 2020 21:22:03 +0100
> > > > shiva.linuxworks@gmail.com wrote:
> > > >  
> > > > > From: Shivamurthy Shastri <sshivamurthy@micron.com>
> > > > >
> > > > > Add device table for M79A and M78A series Micron SPI NAND devices.
> > > > >
> > > > > Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
> > > > > ---
> > > > >  drivers/mtd/nand/spi/micron.c | 31  
> > > > +++++++++++++++++++++++++++++++  
> > > > >  1 file changed, 31 insertions(+)
> > > > >
> > > > > diff --git a/drivers/mtd/nand/spi/micron.c  
> > > > b/drivers/mtd/nand/spi/micron.c  
> > > > > index c028d0d7e236..5fd1f921ef12 100644
> > > > > --- a/drivers/mtd/nand/spi/micron.c
> > > > > +++ b/drivers/mtd/nand/spi/micron.c
> > > > > @@ -91,6 +91,7 @@ static int micron_8_ecc_get_status(struct  
> > > > spinand_device *spinand,  
> > > > >  }
> > > > >
> > > > >  static const struct spinand_info micron_spinand_table[] = {
> > > > > +	/* M79A 2Gb 3.3V */  
> > > >
> > > > Should be added in a separate patch.  
> > >
> > > Okay, I will create separate patch for each device.  
> > 
> > No, I meant just for this line.  
> 
> How about including this line with 1st Patch?

It's even worse if you move it to patch 1. Let's keep it like that.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
