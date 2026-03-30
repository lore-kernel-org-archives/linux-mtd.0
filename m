Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7114210F3DCD
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2026 14:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H04HyhZ+b0/kfvaAZaT05MrSC2/kLvLFjwmGmqcbkBA=; b=yOYf5X56gMzUxy
	5G1vUd+yrQFdgz/UGpgFXw3jxxQyEV+FKPbBW4MwDfnGQBiWmnXq2XYhaxnqtmQTqTdKtIhjik37A
	nvjAwztGRb6v8vgAsP+/rJjIkeAdjNtn85GDNa5kr8ucPw2etihSCXcjb0OARO5967do/giH4vpZ5
	EwhWHx8cmL2BtY8tw/hbkwtiOincLAZ6pNaCXLgoGRRea5yx24S+47hAn5NbqpN3fpd+xittaCbHu
	GqNpRLnIql3oQaVCkZRM4rrFb2yfcnQlX1u6kSatStkf9oRcIudW2MEdpkoBg+76Tp0KQSYu1UMB/
	pZN/0VUag6v8BgAQq/pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DZ8-0000000BPuT-0aYj;
	Mon, 30 Mar 2026 14:26:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DZ5-0000000BPu6-314b
	for linux-mtd@lists.infradead.org;
	Mon, 30 Mar 2026 14:26:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BF70439C1;
	Mon, 30 Mar 2026 14:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC73CC4CEF7;
	Mon, 30 Mar 2026 14:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774880763;
	bh=6Enu+qeykIJnVKTzv2YVl8Y1MDo2hvWsbeaPp6jo55A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CvLNOsa5vjF6ZXL9hoG1CSdRLnMfeROo+B9C9qkIacBTwuBTT+P71v8eK4A0QJ8co
	 bEJpc0rE35tcgHiU1YApoUY4XAYgWFntswjrmzoGZ958BFAKBexE/d4TuIZo3slMCH
	 9B+JJ9oPEjc/TRf7Znd84TGmzgiYVNPcBXlD19YXPkUiycArf9WpX01n/uDSHMYd/p
	 OzwAIHLH0jOisTl0RcU8YfGDfuSVeSamRLaMMKuILp0fSSdKYE4+V5dXW7pjJYJfnF
	 aUifZsNjDF7GzfWGI2Y5QxoIpu/E8bszKL961IByS+12+TBPPrjz73ardIxRusmnlL
	 Wavuz7jnfQndA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Sanjaikumar V S <sanjaikumarvs@gmail.com>
Cc: mwalle@kernel.org,  pratyush@kernel.org,  hd@os-cillation.de,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,
  miquel.raynal@bootlin.com,  richard@nod.at,
  sanjaikumar.vs@dicortech.com,  stable@vger.kernel.org,
  tudor.ambarus@linaro.org,  vigneshr@ti.com
Subject: Re: [PATCH v4 0/2] mtd: spi-nor: Fix SST AAI write mode
In-Reply-To: <20260330073129.24-1-sanjaikumarvs@gmail.com> (Sanjaikumar V.
	S.'s message of "Mon, 30 Mar 2026 07:31:29 +0000")
References: <20260311103057.29-1-sanjaikumarvs@gmail.com>
	<20260330073129.24-1-sanjaikumarvs@gmail.com>
Date: Mon, 30 Mar 2026 14:25:58 +0000
Message-ID: <2vxzwlytz955.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_072603_777675_09228146 
X-CRM114-Status: GOOD (  12.26  )
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

On Mon, Mar 30 2026, Sanjaikumar V S wrote:

> Hi,
>
> I wanted to follow up on this patch series fixing SST AAI write mode
> issues. It has received Tested-by and Reviewed-by tags from Hendrik
> Donner.
>
> Could you please let me know if any further changes or actions are
> required for these patches to be considered for inclusion?

Applied patch 1 to spi-nor/next. Thanks!

For patch 2, I left a comment. I am not sure if it takes the right
approach.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
