Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFFBEE14D4
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Sep 2023 08:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqcl6elreCac0UmfzucoX2PZR9PD5WtVpHJwnnCMMb8=; b=DX2wLN7Ksa36lgAAReMGuGsweu
	msmqkueuKP4JTXwMUVEuOg9kCF+aw7vDPhZUnNIORix/OwtpDqaGOYlF0qvOttXqzHdBgEAREMacf
	Y0cIwaaiaoAPA4ZpT4sY82WF0WzIK3K8ApXp8TdZCAuLjPAl3JDh/M5VGBmpK+TjwUe+gb4M3CLnW
	gaXl64xs6o7QPNd2pLUXZpiBJU4L3zItH7Y+1+1vdcBycEfqiAF64zpaXg8JJkgLSfpcS4rY/R3Bh
	FccqxaQWwAYgxpU3fNUfwp10WQku7VpoGc61yUnAoxJT2qM7lWdlO3+4kIiE7KEo17eNUjGTxXGKT
	GPuAhzJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeA9H-00BZAv-39;
	Thu, 07 Sep 2023 08:13:59 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeA9F-00BZAB-1g
	for linux-mtd@lists.infradead.org;
	Thu, 07 Sep 2023 08:13:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id B6565CE191A;
	Thu,  7 Sep 2023 08:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86021C4339A;
	Thu,  7 Sep 2023 08:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694074434;
	bh=oTcxoO3zSCDpXZafwrXHiI751ZzS6JBBCs2MekhQSC8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=h7mM4Ku4a+8i8f8+p7KrSkBXuMm25TcVgXN5MWs7i559RWnwuBGSGkpLFA2dvMUjE
	 EyU35V6rD/KMjA3rxcdIxYrUeFVsEsvAJR88zFtzU27vE/j0mJQ3jaothsbR8onimL
	 th3Rf/UcwcwZUxrqCBeOh54sVQLP/e4qX2Anjhq6z91gc4pA1OdlY05pxExtkEC/Ad
	 aa8dUP+9eZw8Is5jgdZ+TEAlLfj9PNkvKywL6/VUhuSNB5yvzJm06CpiNNqvGNDXkt
	 tdCWq73INCZ45RFNP7xxiGpOO8dJytoDlv17J/+LVk5T4sH9zWg8loKqO3QMyVHji+
	 blaw4TA9+b+Lw==
MIME-Version: 1.0
Date: Thu, 07 Sep 2023 10:13:50 +0200
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 17/41] mtd: spi-nor: atmel: convert flash_info to new
 format
In-Reply-To: <aba618e2-ad74-d716-c8d7-e77588b22509@linaro.org>
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-17-291a0f39f8d8@kernel.org>
 <aba618e2-ad74-d716-c8d7-e77588b22509@linaro.org>
Message-ID: <4a25955300a53a36a842f4e8bd3a2e1a@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_011357_738406_2A0DB9DA 
X-CRM114-Status: UNSURE (   9.06  )
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

>> +	{
>> +		.id = SNOR_ID(0x1f, 0x66, 0x01),
>> +		.name = "at25fs010",
> 
> nitpick, we shall respect the order of the members declared in
> flash_info struct.

As mentioned in my first reply, you're fine with keeping the id
first? After this series, we can swap the name and id members in
struct flash_info.

For all the other members, they should be used consistently. So
we could also swap the members in flash_info.

> And I'll let you double check if the conversion is accurate :D.
> 
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

So I'll convert that one in an Acked-by: for all the conversion
patches?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
