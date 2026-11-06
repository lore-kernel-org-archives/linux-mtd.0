Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD09C606A32F
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2026 21:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RXOzF1OH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=ULZJPgCF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=itOTwKU3mNoT9Tb0xojblp9EGEwf+4ocg+248t067OA=; b=RXOzF1OHlWVMl9z8CYvGaEmiYi
	nfNpiX+l5GoTfXdFc4txeshCBM1qCVfARe43t9cnWasnDaolcYA2M2g6suaHJATtNi78D+Wo4K1fl
	iQhSu51XCdKWZp80958JntLSs9YVt/4teRifWLBymro5iaxRZMHsDKXLcMwulEdqxG9bvs/v3Jdwx
	59SF1dPKRwzz/paHWxc2PKjZ7IvWXS854sWT8cV/c307FyFRJVk68OxXRy1RV2p5GS81Sb9UxA7Lb
	BAkWwkNlWc25aA3hQwaikc37x1p+q4HIxbVLQ+3LHe2aAINMWCDMdlIl9g7X7p9ftmbVbbwA0pba1
	CH6+Cqug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRDP-0000000Df32-3dR9;
	Fri, 06 Nov 2026 21:11:15 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPRDN-0000000Df2g-3YdF
	for linux-mtd@lists.infradead.org;
	Fri, 06 Nov 2026 21:11:15 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jLsKs2p6tz1XLyhh;
	Fri,  6 Nov 2026 21:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1793999469; x=1796591470; bh=xKjcuvfEsrQaalDXDb5/zzpQ
	Y2N+PE19jIG9FttWmsg=; b=ULZJPgCFJAs7uYkZvw/AEp6SFwoUMH3c5Qnz7PpY
	5IKb3jNrIg0ZYSo59tyqIVjuB5R6DifyGNZcgEfMA/Wn4Se26yorEzvWj73gYS3m
	Oet/VTaoAgubyEkAkQ9xZXSLDxM5kc39zd+2TkIt9/5RqGzJ2D3uzKcp+zNBL8o2
	bIZlY5rfN7bIWJsmzbqMvuXmnk4RHKrXJxMHUWHz+zJSg93btQqdKw36BcpBA5Jo
	VHmFHrWBrF7oFVhnKXDXpNyQy4nZf+F6oVF2S3lbv8/3jr8HHVW2NEtPOlkKWZo7
	CbidWRm9LHM0SG6QfKjAn8OcCIpndrhzAA8U0hwg4PoMzg==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id UDGiGonopHWh; Fri,  6 Nov 2026 21:11:09 +0000 (UTC)
Received: from [100.80.231.125] (unknown [104.135.182.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jLsKn2hQFz1XM0nn;
	Fri,  6 Nov 2026 21:11:09 +0000 (UTC)
Message-ID: <534257c9-6f48-4a01-8589-330e4e4e41e1@acm.org>
Date: Fri, 6 Nov 2026 13:11:08 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: Reschedule in spi_nor_wait_till_ready()
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>
Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>
References: <1b755e40b80fded4b4b4c1f1c81f0d171012a1de.1793999093.git.bvanassche@acm.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <1b755e40b80fded4b4b4c1f1c81f0d171012a1de.1793999093.git.bvanassche@acm.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_131113_916125_CDFB7223 
X-CRM114-Status: GOOD (  21.52  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/6/26 1:04 PM, Bart Van Assche wrote:
> In spi_nor_wait_till_ready_with_timeout(), cond_resched() is only
> called after spi_nor_ready() returns 0. If the flash is already ready on
> the first status check, the function returns before reaching
> cond_resched(). This happens e.g. under QEMU, where SPI NOR page
> programs and sector erases complete synchronously during the MMIO write,
> combined with a controller driver that polls without sleeping.
> Consequently, multi-sector erases in spi_nor_erase() and multi-page
> writes in spi_nor_write() may iterate over thousands of sectors or pages
> without ever yielding the CPU on kernels built without
> CONFIG_PREEMPTION, e.g. ARM32 kernels with CONFIG_PREEMPT_VOLUNTARY=y.
> This triggers soft lockup and RCU stall reports.
> 
> Move cond_resched() to the start of the polling loop such that every
> call reschedules if needed, even if the flash is ready on the first
> check. Doing this in the shared wait helper instead of in the
> spi_nor_erase() and spi_nor_write() loops covers all callers that wait
> for a program or erase operation to complete.
> 
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>   drivers/mtd/spi-nor/core.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 90524c58602e..3e3b727d262e 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -653,6 +653,8 @@ static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
>   	deadline = jiffies + timeout_jiffies;
>   
>   	while (!timeout) {
> +		cond_resched();
> +
>   		if (time_after_eq(jiffies, deadline))
>   			timeout = 1;
>   
> @@ -661,8 +663,6 @@ static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
>   			return ret;
>   		if (ret)
>   			return 0;
> -
> -		cond_resched();
>   	}
>   
>   	dev_dbg(nor->dev, "flash operation timed out\n");

(+Brian)

The following probably should be added to the above patch:

Fixes: a95ce92e4b28 ("mtd: spi-nor: improve wait-till-ready timeout loop").

Bart.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
