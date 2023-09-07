Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D930EE14D3
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Sep 2023 06:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tx2qqV8wTjMHmvZ06OCuuDzoFSL6jeOEcf92WPdFEEg=; b=wn6O7foazys23q61xrpEOVOqPQ
	elMiIi+3SohHSIRcFFochyk9GOnlG5SstDXNPhrZeNwMMkJbltLI4KOKeBgt/fFf4hbonNXvi8VZ6
	v3R+8xSV+O1ptY9TSGmoJhugVfSI3Jn+5EaMqae5srSjW62E7MBghzxfulMUcifc3hsLGr6W3BuvL
	jscsut1l+0bU3cyV1cKS3AnQTPpDrAW8/fdoit4XqhkS1zZqKPAoPGF6SaEv5wjmpoaHyw7Fx6Fu/
	zgvyB/5sHDNZdxiuHMsvrwFcRfhZxe6GKx2oVmZ043KpO8I+U0ORXumauT1a8BY6mbXnqRhB8Vn/U
	Y1QB+Byg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qe8vU-00BTVD-2B;
	Thu, 07 Sep 2023 06:55:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qe8vQ-00BTUa-2P
	for linux-mtd@lists.infradead.org;
	Thu, 07 Sep 2023 06:55:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7C39E611E7;
	Thu,  7 Sep 2023 06:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCE8C433CC;
	Thu,  7 Sep 2023 06:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694069734;
	bh=mjcPEuc/gz0ex7VoEhNdmXz/LJ1yG2hyB4GVOCktz/w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Of4n82yUjLpH0jr9GO+SkTaPM7UepX+lFfRpXy3ptxIL1iU+qS67KTyqOjHhgWyQS
	 Gg4GWfztbuDocJ6yV1JBWphktEYR0DsdGrw0+/UWuIPVzLQSc0P/1bcYofAvpW2b28
	 +C+A09bBFmNvfZy6N+SACzkykc7LSUYx5sFiJ0TgeuAHb/UN2PCWYndkK6jvIBo5cm
	 mIyGk7j6uj6PB4YuPO6hoZ2R6LLfuX2ebGhNgQZ6CvdItCLjjt99MrhYXWeIqrzf6t
	 OCgwfuuiQDUDaxJZhlXIcq/09cfyrCLRxJOKjgVxqbSA0Eqi8NQbPAIl8okGViXj4d
	 OiVBbyOkwnC6Q==
MIME-Version: 1.0
Date: Thu, 07 Sep 2023 08:55:31 +0200
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 11/41] mtd: spi-nor: drop .parse_sfdp
In-Reply-To: <530942be-4175-43d5-a111-c433be7eff72@linaro.org>
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-11-291a0f39f8d8@kernel.org>
 <530942be-4175-43d5-a111-c433be7eff72@linaro.org>
Message-ID: <b843818e776a33d58db8b969270a5cda@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_235536_845169_DB594F9C 
X-CRM114-Status: UNSURE (   6.29  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

> the condition looks broken. the method returns bool, but here you 
> return
> size_t probably. And when size is zero one shall parse sfdp, not the
> other way around.
> 
> maybe return (nor->info->size == 0)?

Yeah, good catch.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
