Return-Path: <SRS0=11ri=LJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13ABBC48BE5
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jun 2021 19:51:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB17760BBB
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jun 2021 19:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB17760BBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date
	:Message-ID:From:References:Cc:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eMXartYoqHFJOFARQWPKmhnJjv6N+o/iuMMTohuS6RA=; b=PhfJ/btXITxO8P
	bHCx5qb8sHIP69uZuIAgwQIPoIC1v64Ki3KzwydRsaTxPLG5ny5YeMC9v9ZEaxhtEIiBG5KUZt0L0
	fxbQJYv1qIy/w+RCcez3fCbLGZHXByaG15wFQRU3qMZTZb58eDkp7ymtFWSXORrpquCxLR3seAAWX
	JckoQGlxPg12XVYJiIYS4fjhAotjrzljD7LGy9YkH0riS8IE5XVYwBzzcCF9Aj77dQ3AS8RwPUvuM
	sp/iz9RMkJ9Ad2BFu/HooN6KAFyVCRLpH3PS6R5NJxPlzLJQpq3H03U4E0Lmi3Cjdy6Z5y+XvR8uz
	/vygEU3ObOMGFEAJ8NEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltF5C-002aIL-3Q; Tue, 15 Jun 2021 19:50:47 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltB8u-0011nR-NL
 for linux-mtd@lists.infradead.org; Tue, 15 Jun 2021 15:38:23 +0000
Received: from [IPv6:2001:4c4c:2228:2400::1000]
 (20014C4C222824000000000000001000.catv.pool.telekom.hu
 [IPv6:2001:4c4c:2228:2400::1000])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hs@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4CD6582934;
 Tue, 15 Jun 2021 17:38:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1623771482;
 bh=Ej4rCqetLA22T9wWq3Szx63Mg97UjXN4quAi/wmiorE=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=w4UPMvakgrKUQLtejM2GLU9QSfH7jmaSn0I5dlhseWNIAOGyl5FisWyRK0pRjCCvl
 8kvSrxaNS3XltIoG/0EZVeLWo2y27z6TwDiiMIG+a9vBM4FDOixEDgBOR8mzOYu6x0
 FXpnQ6KY67mpuZk3BWnfo7c9qwa77Oqr3q4sdT4JtPttbeN9GYQ6eItnTnLyuo2tws
 91yY9sa0utKNYOmT+xsFkYwEpnQqhn2mTwhPHkVJBquSPSvAZZghMrLP8ZRe7aP8r/
 /uTyW9EMS/JMqUuI+cYr9w/VBZs70HvQbV4LnqrYXdUFcFUgrV4bZOmfFmiYmE4sQN
 Oq+Ld8PkTfzvA==
Subject: Re: [PATCH][next] mtd: devices: mchp48l640: Fix return of
 uninitialized value in ret
To: Colin King <colin.king@canonical.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210615140652.59521-1-colin.king@canonical.com>
From: Heiko Schocher <hs@denx.de>
Message-ID: <b0d971da-ff2e-7ad4-cba7-32a1406b983d@denx.de>
Date: Tue, 15 Jun 2021 17:38:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210615140652.59521-1-colin.king@canonical.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_083820_994097_6478F671 
X-CRM114-Status: GOOD (  15.41  )
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
Reply-To: hs@denx.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Colin,

On 15.06.21 16:06, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the case where the read or write lengths are zero bytes the return
> value in variable ret has not been initialized and a garbage value
> is returned. Fix this by initializing ret to zero.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: 88d125026753 ("mtd: devices: add support for microchip 48l640 EERAM")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mtd/devices/mchp48l640.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks!

Reviewed-by: Heiko Schocher <hs@denx.de>

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
