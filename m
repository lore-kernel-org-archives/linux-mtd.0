Return-Path: <SRS0=IhQK=BN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C176C433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 06:57:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27A2C2068F
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 06:57:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TLiyvyqJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Imiqwh2w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27A2C2068F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q9ct0iSBXe5WAh0dm9j9c3ccTenO930Qt6nOtLrU/5o=; b=TLiyvyqJoAMNE0FXts/c1lJbV
	6tWqZdeOmsK3s3S3L5j8Cy3nJBCNQm0uzlUosrbClXlanpcodQU9dgzcFsjLp/05FoLdfRxy5mV5P
	rrKFYeLu11wsYEXHy3d4s7MK23es/710Ah7OJocFSYhsaBINNl+cYrBtngPO79BX9M+iyy5ZzLmbf
	/dpCox8bua/y72g6gvI+yzx97WyDy645te3FjrnFbfpFgOcgu63gnxHS1sJh7o+KmllMiK31ai0HW
	jReaRLAnWWlzCW7ck+ECps4zVuT/dbhW11fa9bFowBw4w3yGs1NXQSodwToHPiSpRzJHDgxM/KWEE
	19QQgzoxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2UOj-0004Vc-L9; Mon, 03 Aug 2020 06:56:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2UOh-0004V8-PW
 for linux-mtd@merlin.infradead.org; Mon, 03 Aug 2020 06:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=S81Y7/E/1KRByHOMFTAO1WQMOll7HWoP+pv/fCo/3sI=; b=Imiqwh2wh6gfO95HVgGWdIpJ7R
 qFqJDaURIpsOiDpUCq2k3ILdHp9/G64PbhflfbfwXUHR3YCqdMM2JIr5p2HV5QlEFNjYcibq1cAwB
 k5jcDFqNUiYh1ErghhsIpsN5baKyFw50AsjkOnyh0RkcQvG4I/FuQV4i+K4smxUlt0gQ8ZINX4zk1
 zqYZrKBpxdTsr3nucjd2JPKqfEkufPqh/aFaSwGu2mFtFylC2a36pyZdPfsQXEbP1+7In5Kkj2kTD
 iIuAdnnH0jCfMh5vNRvgFzTjztCURqfBsmyFjwViAe1IQB++yIvaVvpqhNNNwV/B+lmZFzbHjUNTv
 QTu3Qcmg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1k2UOb-0005Zd-6v; Mon, 03 Aug 2020 06:56:29 +0000
Date: Mon, 3 Aug 2020 07:56:29 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [RFC PATCH 00/17] Drop uses of pci_read_config_*() return value
Message-ID: <20200803065629.GA19534@infradead.org>
References: <20200802184648.GA23190@nazgul.tnic>
 <20200802191406.GA248232@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802191406.GA248232@bjorn-Precision-5520>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-pci@vger.kernel.org,
 linux-fpga@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-rdma@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Joerg Roedel <joro@8bytes.org>, linux-atm-general@lists.sourceforge.net,
 trix@redhat.com, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Wolfgang Grandegger <wg@grandegger.com>, intel-gfx@lists.freedesktop.org,
 linux-gpio@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 skhan@linuxfoundation.org, bjorn@helgaas.com,
 Kalle Valo <kvalo@codeaurora.org>, linux-edac@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Saheed Bolarinwa <refactormyself@gmail.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Aug 02, 2020 at 02:14:06PM -0500, Bjorn Helgaas wrote:
> But what guarantees that a PCI config register cannot contain ~0?
> If there's something about that in the spec I'd love to know where it
> is because it would simplify a lot of things.

There isn't.  An we even have cases like the NVMe controller memory
buffer and persistent memory region, which are BARs that store
abritrary values for later retreival, so it can't.  (now those
features have a major issue with error detection, but that is another
issue)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
