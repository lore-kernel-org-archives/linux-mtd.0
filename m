Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5EAC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Dec 2021 05:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uvuJeuUX+OcXLn8+Q7M+etokfXxXuHnp/SpgI9BVDdo=; b=t15Q8yrjeh6rt/
	JAbd5CXo+Kfd16aWfCfurKXbyUOjKG+pEC3MwXTT8MMgFHvfVSC+LhO1ChSNPPwdNjQeo1Mi+kon7
	ONRYna8M/6N3E2iXk425LDy/fqeV0k3VObltcxFEyaKprDL+W/AEiE2Y7wndG4b2yMng3bhOHNqXV
	ZlNKD9+SCND+TK3j2Sug7A9I+AHca//tKLOO5BMAQxga3KjvEmYvmceMo9qw9rvIk8bbdz/YLIv5v
	na3V6MP2anH99lTIEb9Bv2jSSnV7XgXAoMiweXjBfra7X/ENGpoc3VqN/8v7+lyIy/KWoJS2GL0oz
	623gvN81nR1xCeUxEoBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwdQx-007mmp-E1; Mon, 13 Dec 2021 04:59:31 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwdQk-007mjn-4v; Mon, 13 Dec 2021 04:59:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0CC57B80CAB;
 Mon, 13 Dec 2021 04:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7897CC00446;
 Mon, 13 Dec 2021 04:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639371554;
 bh=uqDkjyi1DAG2WVFI7Iu0TC2w+GaDC3EmWkInyLpcGtE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mVDRCny15VHJlA+o7pFyvRO+fGTVY2J3x91BIqcOwy4cryBFjZQyaHtyPhgW6KO28
 HCKopx8WXOVlRdPjhEOrjN2VBJ1zFB8NRnGb5EUdfofWdRrki7ZlorlrhKm0n81/la
 3mN9IpyIgfzc1/r0ZuBokeJT/zwaGH17foE/YzWMrXovh2MCpsiNQwWNaKLY5YRyFy
 blW8ncTTX15Q1zUIMmgSzOFg2mWmU6KWhkXrs65ZUlMvc/lyG3K8k5h5nInsBLDfjW
 SlpMqgTcrrDN8iKQSo2q7ad2+NbXTwlELLLoqff2K0DHg43fpfYsWOz0ibzpD4QupX
 V/h6/iJ4bdVAQ==
Date: Mon, 13 Dec 2021 10:29:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Gross <agross@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Baolin Wang <baolin.wang7@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Jaroslav Kysela <perex@perex.cz>,
 Jon Hunter <jonathanh@nvidia.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Scott Branden <sbranden@broadcom.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 alsa-devel@alsa-project.org, bcm-kernel-feedback-list@broadcom.com,
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 00/11] dmaengine: kill off dma_slave_config->slave_id
Message-ID: <YbbTHo+Wfpl30ZUH@matsya>
References: <20211122222203.4103644-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211122222203.4103644-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_205918_383283_0836E41F 
X-CRM114-Status: GOOD (  15.25  )
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

On 22-11-21, 23:21, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> I recently came across some new uses of the 'slave_id' field that
> I had (almost) removed a few years ago. There are no legitimate
> uses of this field in the kernel, only a few stale references and
> two drivers that abuse the field as a side-channel between the
> dmaengine driver and its client.
> 
> Let's change the xilinx and qualcomm drivers to use the documented
> side-channel (peripheral_data) instead, and remove the remnants of
> it to prevent new users from coming in.
> 
> I think I got all the necessary Acks on v1 already, so if there are
> no further concerns, please merge this through the dmaengine tree
> for v5.17, or pull from

Arnd, Thanks for the cleanup. I have applied and folder the fix you sent
in this

-- 
~Vinod

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
