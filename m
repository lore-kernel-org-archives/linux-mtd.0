Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0AFCD5BD1
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2026 16:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nccAX6mceqX3OrMa0FUkJKw8zoLi7F2L59HhyslzmVI=; b=NuRknch1i2uY0V
	9mt+NfxMXZtmMJE11mHUiliaXtW2g0/giuUDassfLJfS4FkEENO4jZc3U6AvEGnzJ5yOQC4Typr6a
	BRtwjgfzKJcdj9fiuUKsjN7SgHPaAW1HK4XjSC+DKM89s2EXGbjIa6viycEzV7KcWJX6VxbQGqr+4
	rl6obdiT/knU7autjrkM+lGMO4IIUyWJNbS35PKETZW1SXeZ9Z+ImYrl4kzdeHGSly1yu1XlWW3ve
	VdiYN4gYgbrHTnlRRLDVtMsnV5LgbhE0FfPhrEEvvNmQMIiJMyssG0lVnlf3ApU+r49cuAkDOuIU2
	GXFjfq1LY7lOdxylzgZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSJK-0000000DUWn-0jmg;
	Tue, 02 Jun 2026 16:49:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSJI-0000000DUWG-4B0t
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jun 2026 16:49:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C268860123;
	Tue,  2 Jun 2026 16:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0681F00893;
	Tue,  2 Jun 2026 16:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780418986;
	bh=LFB8O8U4QgaKB297gBssYNIgpiABI/UmXL93J9wGzfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q0f+O0gv/nkLTpToavxBJddtyEo1zobgVX2X7Jj3xKtlSsDjIRF9S8gJpma1B7Qw/
	 qpl8eEOQV+9UPVmeeufPbe/H5gPWw7dPYQvaS3mMUo8Ro7bHTttsM4nKQNeSsFd0dY
	 ANlwIX1w3c4u+XYNghpN2ACSZhR8hrfvovzH1+aY5cRB/ocUbAiQku2BvRldicjt06
	 KHiK20PsKJ6L2N8hxPXB7Y/QqXvokTdFt2k116t2kSoc8RMJMz4Gdrs239n/VK7i3C
	 287/dtH4ozIY0ReLdShcsEkgmwITonFIAQzwfVOScdz5P0rWtKCYnSD5/h9gXD/48J
	 u0Sjr3Er+fpyQ==
Date: Tue, 2 Jun 2026 11:49:45 -0500
From: Rob Herring <robh@kernel.org>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: broonie@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	pratyush@kernel.org, mwalle@kernel.org,
	takahiro.kuwano@infineon.com, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, praneeth@ti.com, u-kumar1@ti.com,
	a-dutta@ti.com
Subject: Re: [PATCH v3 02/13] spi: dt-bindings: cdns,qspi-nor: add PHY tuning
 pattern partition property
Message-ID: <20260602164945.GA475455-robh@kernel.org>
References: <20260527175527.2247679-1-s-k6@ti.com>
 <20260527175527.2247679-3-s-k6@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260527175527.2247679-3-s-k6@ti.com>
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

On Wed, May 27, 2026 at 11:25:16PM +0530, Santhosh Kumar K wrote:
> PHY tuning requires a known data pattern to be readable from flash.
> When no partition is explicitly identified, the controller must search
> all available partitions to locate the pattern by label, which adds
> overhead and relies on label naming conventions outside the
> controller's control.

I agree 'label' is not the best choice. Software should not care what 
'label' contains. It should really be 'compatible' instead.

> Add cdns,phy-pattern-partition, a phandle property that allows the DT
> author to directly reference the flash partition holding the PHY tuning
> pattern. The controller uses this partition during calibration, avoiding
> the partition search entirely.

Do you have any data that this approach being "direct" is faster? In 
fact, it might be worse. Instead of searching just the limited number of 
partition subnodes, you now search the entire tree for a matching 
phandle value. We do have phandle caching, so that might save you here.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
