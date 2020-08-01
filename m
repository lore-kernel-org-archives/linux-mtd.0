Return-Path: <SRS0=Mklv=BL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596F3C433E0
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Aug 2020 12:57:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 251D12080C
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Aug 2020 12:57:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xV4S0SG4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="n/7VNWjN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 251D12080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Yvf6HGlQIwcbaMOGqyZAy0J/Ca5brQ86aPFh6jbSrq0=; b=xV4S0SG4kPgI22hK35seX4Kyw
	qBzvuIP8BKahST4flGSoDYqYf+L6PAkPpncsJQIbbLqo5Hiv1u39KYzZomXiHsFifqpW+R239+T1k
	ozUU5gs2ysssQldg1PScWV/BdFBCdzR5LzZmORU6KmYTlo2+PCFsSDJUAsflYWBfX3jDzkB2h7ae1
	E1gGDxqyxTzEJhvVPKKDj6Q3bWyMwipR4psOCC0neZTt0VIb1Wu4GH298LbXRsU7sowYEFdSvBnM8
	G31zMOQPI/ezAziuh2NobW8rF4DnFmyH6RBmcNFudREFq9OF7EPj8yRD5mS2bTUmFAybTQRiJE/ll
	gl4HnDOng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1r4E-00084V-JT; Sat, 01 Aug 2020 12:56:50 +0000
Received: from mail.skyhub.de ([5.9.137.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1r4B-00083x-S0
 for linux-mtd@lists.infradead.org; Sat, 01 Aug 2020 12:56:48 +0000
Received: from nazgul.tnic (unknown [78.130.214.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B8CAE1EC02FA;
 Sat,  1 Aug 2020 14:56:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1596286602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=NfmlZOrLaBmBGlzbXE5z6x4RKpqqJJmlzC4+91fmYUA=;
 b=n/7VNWjNwrVYldmM5JNyqQEVZd3Vp3hpjJSMuFhfSkrW8mQhIHtpfasKy9w1BEromsKKyZ
 /CdJ8nlcvZTCqyn05aBVgUH+WGtmqEhe61zMEoDcH8PmujGuHYORgBg9sVbSuZSh5qLljK
 uihuEhdcnAWg6tPbjyrRXoOKhqTEw/0=
Date: Sat, 1 Aug 2020 14:56:57 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
Subject: Re: [RFC PATCH 00/17] Drop uses of pci_read_config_*() return value
Message-ID: <20200801125657.GA25391@nazgul.tnic>
References: <20200801112446.149549-1-refactormyself@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200801112446.149549-1-refactormyself@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200801_085648_120862_9E91FE08 
X-CRM114-Status: GOOD (  11.76  )
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
 helgaas@kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Wolfgang Grandegger <wg@grandegger.com>, intel-gfx@lists.freedesktop.org,
 linux-gpio@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 skhan@linuxfoundation.org, bjorn@helgaas.com,
 Kalle Valo <kvalo@codeaurora.org>, linux-edac@vger.kernel.org,
 linux-hwmon@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Aug 01, 2020 at 01:24:29PM +0200, Saheed O. Bolarinwa wrote:
> The return value of pci_read_config_*() may not indicate a device error.
> However, the value read by these functions is more likely to indicate
> this kind of error. This presents two overlapping ways of reporting
> errors and complicates error checking.

So why isn't the *value check done in the pci_read_config_* functions
instead of touching gazillion callers?

For example, pci_conf{1,2}_read() could check whether the u32 *value it
just read depending on the access method, whether that value is ~0 and
return proper PCIBIOS_ error in that case.

The check you're replicating

	if (val32 == (u32)~0)

everywhere, instead, is just ugly and tests a naked value ~0 which
doesn't mean anything...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
