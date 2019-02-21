Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CF1C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 10:50:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A50232147A
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 10:50:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mFR0AAUK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXmuhlOf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A50232147A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=snR7ckmf8MY1e89mFR1PmQbXWgTVpFJSpmeGcX9lHQk=; b=mFR0AAUK4YDovd
	39ouPbbq6GhdTykj8qS6QC3h7BBGZkXn3j9tCEnaMxPykw0rY8BrywnvXR6XNt3o5RhGmEZNAerme
	IAdrtr1AjDOti8sgBYrlqSbkaxrZDAqyMVRgyIU3HvXyakVRreyiCpAR8KxFuMaeKtncqmuf3FFLQ
	/NwZ7K8RFCyetPnOUW9///yYltiuOvTmJ+XsF2RKYzUpehJOUcMVoldXLfEQ16dc4leorx0jFpvUS
	ROnsONdJupQXXAT9dqe6V4MtJxaihU+DmnVSG/U/CYA8gvVrYkXRaEp3QZHBPIUqNy74R1X2Wi+ao
	VviJdZC4s/9D0JTuweMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwlvg-0002rV-Kp; Thu, 21 Feb 2019 10:50:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwlvc-0002fo-53
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2019 10:50:10 +0000
Received: from localhost (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD5912085A;
 Thu, 21 Feb 2019 10:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550746207;
 bh=UzPbx+4zhvLIEMpbClq8uHK5gFKnQ2FWG/PtwIKyJMY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GXmuhlOfBS8Ft76flrx9W04KSE3BXpSvA+yA6+cnK9N4GYQNvTFxSU3IV8zk6eST5
 viDbmnjauXdDaJ5pguJmaL6E/VSqLLuEzW+yR1+MzRjGIy28Q61Ql0mwwdL4LYxkC3
 FfpfH/h4Qz6aw8Zn8okfk96SFzHDxWip7SRLpO0Y=
Date: Thu, 21 Feb 2019 11:50:01 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Subject: Re: [EXT] [PATCH v6 2/2] mtd: spi-nor: cadence-quadspi: Add support
 for Octal SPI controller
Message-ID: <20190221115001.09008681@kernel.org>
In-Reply-To: <BYAPR08MB453362F4253ADA149D05315FDB7E0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <20190212083809.6534-1-vigneshr@ti.com>
 <20190212083809.6534-3-vigneshr@ti.com>
 <BYAPR08MB453362F4253ADA149D05315FDB7E0@BYAPR08MB4533.namprd08.prod.outlook.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_025008_226504_1482D6FB 
X-CRM114-Status: GOOD (  10.15  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Vignesh R <vigneshr@ti.com>,
 "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 21 Feb 2019 10:41:33 +0000
"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:

> Hi, Vignesh
> 
> >
> >Cadence OSPI controller IP supports Octal IO (x8 IO lines), It also has an
> >integrated PHY. IP register layout is very similar to existing QSPI IP except for
> >additional bits to support Octal and Octal DDR mode. Therefore, extend
> >current driver to support Octal mode. Only Octal SDR read (1-1-8)mode is
> >supported for now.  
> 
> Does this your Cadence OSPI controller support 8-8-8 IO mode, if yes,
> Why not directly enable 8-8-8 mode? 
> 

Mode 8-8-8 is anyway not supported by the core (see [1] if you need
more details).

[1]https://patchwork.kernel.org/cover/10638055/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
