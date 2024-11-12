Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A53D32D8D
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Nov 2024 13:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Ho08+1pXyVnvqhAu8kuzOTGJZGWAPkg16dMRcgiwXg=; b=Y8rDII0mX2Cq4l
	qCNlGnBEmCYs/NgffV1gbaEenlaWT94ad/bTaVIr/wnXBH6QXH7XFSx077MuMon8SXp6zjt/BDJ3j
	uneaBa3swRwtjvzwaYKX2naZScbH9YAxN9whWgpnr5PWSbS5ggjYT1a/UMD3RZL57/hkWLjEy5meh
	Q3QxiP4K81PenGCobA3f+HtrMTcMBIoBODnadjtupiEWqppr/hN1e3KCostdMXYZkEX1HL4EGKeYX
	vNqY32WAog/TmtkFKSDnJteKyB3eBbNzd31O+O1/r7FmvEX2CAwPm4bfI27wZPt8wTW/mc6oTCxH9
	pzK4txaND2V1bLNuq86A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqZT-00000003ULV-12f9;
	Tue, 12 Nov 2024 13:04:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqXe-00000003U1p-0Cwh;
	Tue, 12 Nov 2024 13:02:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E81445C54CA;
	Tue, 12 Nov 2024 13:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E08C4CECD;
	Tue, 12 Nov 2024 13:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731416565;
	bh=C9qhHkdxvMTuRSejox1HHbCUK/S4CWthrHnzCrzr6wA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ukwfhHS0Y+TX59sqrVKIwZrvE2+rCeaPVPjXHh3+Kjab9Z32uyBwTaZm4xnc/Gpwd
	 8FJ1HiduPliq7Lzgl/BhcbQuJlxh+nTZ6hqYgBgxmZ071PUVk7w4b/9SHfTc3JiDWA
	 6bDBBkji5/nX/00UvzwavQaApE3oVDWTC0sw1F0DH//Q4fXwBRE6u1/YSxbrjywYni
	 4eqxY6Ng/n7KB8GJPeornUeNtR1P9g0tkrVl3r28Pv1jMZS16N6SEUki90oo1zPJAV
	 gV+RuLvpuI8CTcuzUiMI7vFTXX1hbA1e65LeJVeFIzZZ3/S4nK8mzcfOa+k4JXJoUt
	 IDRKSFU3z0x6Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  peng.fan@oss.nxp.com,
  m.felsch@pengutronix.de,  mwalle@kernel.org,  miquel.raynal@bootlin.com,
  richard@nod.at,  vigneshr@ti.com,  robh@kernel.org,  krzk+dt@kernel.org,
  conor+dt@kernel.org,  shawnguo@kernel.org,  s.hauer@pengutronix.de,
  kernel@pengutronix.de,  festevam@gmail.com,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  imx@lists.linux.dev,
  linux-arm-kernel@lists.infradead.org,  Peng Fan <peng.fan@nxp.com>
Subject: Re: [RESEND PATCH v4 2/2] mtd: spi-nor: support vcc-supply regulator
In-Reply-To: <7d5dcd4e-967c-4627-92d5-86232492c7e3@linaro.org> (Tudor
	Ambarus's message of "Tue, 12 Nov 2024 07:01:19 +0000")
References: <20241029102238.44673-1-tudor.ambarus@linaro.org>
	<20241029102238.44673-2-tudor.ambarus@linaro.org>
	<mafs0zfm57tsy.fsf@kernel.org>
	<7d5dcd4e-967c-4627-92d5-86232492c7e3@linaro.org>
Date: Tue, 12 Nov 2024 13:02:40 +0000
Message-ID: <mafs0r07g7ggf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_050246_155691_D9EF286D 
X-CRM114-Status: GOOD (  12.48  )
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

On Tue, Nov 12 2024, Tudor Ambarus wrote:

> On 11/11/24 2:02 PM, Pratyush Yadav wrote:
>> On Tue, Oct 29 2024, Tudor Ambarus wrote:
>> 
>>> From: Peng Fan <peng.fan@nxp.com>
>>>
>>> SPI NOR flashes needs power supply to work properly. The power supply
>>> maybe software controllable per board design. So add the support
>>> for an vcc-supply regulator.
>>>
>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>>> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
>>> [ta: move devm_regulator_get_enable() to spi_nor_probe(). Add local dev
>>> variable to avoid dereferences.]
>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> 
>> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
>> 
>
> thanks, Pratyush. I sent a v5 here, where I introduce the temporary
> variable to struct device in its dedicated patch. Would you mind adding
> the R-b tag there?
> https://lore.kernel.org/linux-mtd/20241111111946.9048-1-tudor.ambarus@linaro.org/

Ah, I missed that in the many emails in by mailbox. Will take a look.

>
> btw, I try to keep patchwork in sync, so you can see the status of
> patches there as well:
>
> https://patchwork.ozlabs.org/project/linux-mtd/list/?series=&submitter=&state=&q=spi-nor&archive=&delegate=
>
> Thanks!

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
