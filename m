Return-Path: <SRS0=iZys=BM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570D4C433DF
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Aug 2020 19:15:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30B39206F6
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Aug 2020 19:15:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k4+e4rcM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/jHSvTU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30B39206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=hrtPglQSB9D1gXwi7ghwffdRsCe9abLipBsgTd/rFpw=; b=k4+e4rcMAhEhZIrqzZplEw6+E
	LgyT0XqaJmaLNQsCHrFPnGH1r5NSQ9HBMYj+vYNkZ0b8iYzickskGwxk+BDNBkKRnnW8wfNhPLkT4
	EVjlPUdb6ZIvcWQJ3NEdIHiK5PWmthoybOYxMV7ISZTJ+8XADXvSaeJruzKcCI0f0T6QN455PZ42v
	b/zrhPWPTjxt7lXxV+I0ognRIWw+B5ZjIzzVsvSrUeT1PJCDCYOog8iGmcMmczxTEsT/7NyifQNNx
	Wf75w4PV3+vVsjHt3R7kUiUb12LunHjrQAlVrdrebAHv42t93oZ5l93Mw9Yg1wRPcoMkH40Q0CCeu
	2TPVV5EdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2JQy-00044w-A9; Sun, 02 Aug 2020 19:14:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2JQv-00044Z-U6
 for linux-mtd@lists.infradead.org; Sun, 02 Aug 2020 19:14:10 +0000
Received: from localhost (mobile-166-175-186-42.mycingular.net
 [166.175.186.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E9B0F206E9;
 Sun,  2 Aug 2020 19:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596395648;
 bh=8BmtM5Wz6njp3alR4dE4/v12QyDF8IHMxGR5An5fCEM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=i/jHSvTUizuVlNBRmQdxRNPe6coho/ATL8nGKi/xOmyBYjKmz9+xWg85IsgGxSgIS
 dL1yfc+oHKYsaeZL0AE3OSX+Y10i5fuMEzdWvutU18j1LA95jrbDgF15+X0v94hhxC
 1mNVxGQqYc9cBpDxqrC9KNkOyCMbtt1kU/iMoM8s=
Date: Sun, 2 Aug 2020 14:14:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [RFC PATCH 00/17] Drop uses of pci_read_config_*() return value
Message-ID: <20200802191406.GA248232@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802184648.GA23190@nazgul.tnic>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_151410_091198_F6C779CD 
X-CRM114-Status: GOOD (  13.96  )
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
 linux-gpio@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 skhan@linuxfoundation.org, bjorn@helgaas.com,
 Kalle Valo <kvalo@codeaurora.org>, linux-edac@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Saheed Bolarinwa <refactormyself@gmail.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Aug 02, 2020 at 08:46:48PM +0200, Borislav Petkov wrote:
> On Sun, Aug 02, 2020 at 07:28:00PM +0200, Saheed Bolarinwa wrote:
> > Because the value ~0 has a meaning to some drivers and only
> 
> No, ~0 means that the PCI read failed. For *every* PCI device I know.

Wait, I'm not convinced yet.  I know that if a PCI read fails, you
normally get ~0 data because the host bridge fabricates it to complete
the CPU load.

But what guarantees that a PCI config register cannot contain ~0?
If there's something about that in the spec I'd love to know where it
is because it would simplify a lot of things.

I don't think we should merge any of these patches as-is.  If we *do*
want to go this direction, we at least need some kind of macro or
function that tests for ~0 so we have a clue about what's happening
and can grep for it.

Bjorn

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
