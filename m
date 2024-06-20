Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DCBC2BA1A
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2024 14:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DxYCmTN4IajBH802H3plxDzK12WUx3soHzT6WhbMZw8=; b=hel9BgtPHmVvEX
	QF2WBUFZBf6jrJ4Tg2xPivCsGgkLZIXfWdCWY4c/5pm/1FbZHK1FuSIoIM+6GzD6TI5wOGTU0AXZr
	3VVuoOADfPNnyVty1luLjd+3JyyNUUrirI3MhaHwote7hiniqY+m268PNMOhiQXwsFicGD8mLQhQu
	jf1yMFSlSH6Y6sh65HTQ/F125MpxwPYWXsJ717zdUdqA1d0kp8SSOvvQShtgIYIG0kvNzvq1tw8+g
	57zYRkSp71IExBAnRC42Tz+ccjK8/FdhEmzFn51RDrQU10AbuK+jOAjjOdJwJE7VwShtFOqIYM2yk
	Hkm6h8M+QTNAdUzGN/xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKIsz-00000005UAK-3rzp;
	Thu, 20 Jun 2024 14:35:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKIsx-00000005U98-1r3W
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jun 2024 14:35:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6B62C6216B;
	Thu, 20 Jun 2024 14:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1637C2BD10;
	Thu, 20 Jun 2024 14:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718894134;
	bh=EUEYZw/kD9IsbumaJrAAUG5hqVgcrDB6vpnPWq6BWs0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YHqkRDUb3YBDlGNlITyO0ypBjBWRg7S+fvdUj9JkmK+o7w4D/7yhz62NFEyukaTu+
	 m+AHZmoOGoz9LpwL4NcjHXVqx4lc5bb4u7SDvMv0IYLhZYeisQhNMPDaxUDdTclPGh
	 7g9aCowhLqvVxm9D6po9o26w+5gRNyMf7mpQ4iaWqhDCm3UslpN1MxYsLaRI/uNwwu
	 qou4h42lp7jT7cq0hOjaXOdYdYVe7RnKeZSgxvJNZP26CfzI9cJ8BzDup+0k6fqBdW
	 Z4LBTP9O1tHLPih048EyJ2K8IcmF0bRa6CkqR5ysWCwXo1iAq25RjRrf4Jk670jX/p
	 fLqJ9JLV8F7mg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Linus Walleij <linus.walleij@linaro.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,  e9hack
 <e9hack@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: winbond: fix w25q128 regression
In-Reply-To: <91d155ab7526c14e882f7b88a129fbcd@kernel.org> (Michael Walle's
	message of "Thu, 20 Jun 2024 16:09:13 +0200")
References: <20240610074809.2180535-1-mwalle@kernel.org>
	<76f8be4e-3050-4ae6-93b4-9524a0689022@linaro.org>
	<D233KUGR81P5.1BJ8JSACE7C6A@kernel.org> <mafs04j9ng1ay.fsf@kernel.org>
	<91d155ab7526c14e882f7b88a129fbcd@kernel.org>
Date: Thu, 20 Jun 2024 16:35:31 +0200
Message-ID: <mafs0zfrfel70.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_073535_614392_4658D688 
X-CRM114-Status: GOOD (  28.63  )
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

On Thu, Jun 20 2024, Michael Walle wrote:

>>>> > Commit 83e824a4a595 ("mtd: spi-nor: Correct flags for Winbond w25q128")
>>>> That commit did:
>>>> -       { "w25q128", INFO(0xef4018, 0, 64 * 1024, 256)
>>>> -               NO_SFDP_FLAGS(SECT_4K) },
>>>> +       { "w25q128", INFO(0xef4018, 0, 0, 0)
>>>> +               PARSE_SFDP
>>>> +               FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>>>> 
>> [...]
>>>> > diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
>>>> > index ca67bf2c46c3..6b6dec6f8faf 100644
>>>> > --- a/drivers/mtd/spi-nor/winbond.c
>>>> > +++ b/drivers/mtd/spi-nor/winbond.c
>>>> > @@ -105,7 +105,9 @@ static const struct flash_info winbond_nor_parts[] = {
>>>> >  	}, {
>>>> >  		.id = SNOR_ID(0xef, 0x40, 0x18),
>>>> >  		.name = "w25q128",
>>>> > +		.size = SZ_16M,
>>>> >  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
>>>> > +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>>>> and here you add dual and quad to trigger SFDP parsing I guess. All fine
>>>> if the old flash supports dual and quad read. But please update the
>>>> commit message describing the intention. With that ACK. Would be good to
>>>> have this merged soon.
>>> Right. It's not because it will trigger the SFDP parsing, but
>>> because that what was tested by Esben. We're lucky that this will
>>> trigger the SFDP parsing ;) I'll explain that in more detail and add
>>> a Link: to the bug report mail.
>> Should we treat this flash similar to the Macronix ones Esben sent out
>> patches for [0]? It seems that there are some old parts without SFDP
>> support and new ones with SFDP support. From your comment in [1]:
>> 
>>> This is an entry matching various flash families from Winbond, see my
>>> reply in v1. I'm not sure we should remove these as we could break the
>>> older ones, which might or might not have SFDP tables. We don't know.
>> Since the entry matches multiple families, do _all_ of them support dual
>> and quad read? If not, attempting to enable dual or quad reads on them
>> can cause problems.
>
> I rely on the information Helmut provided. Also the w25q64 and the w25q256
> both have these flags set. So I'd say it's less likely the 128 doesn't
> support it.

Okay, fair enough.

>
>> Also, for parts that _do_ have SFDP available, won't it be better to use
>> the information in SFDP instead of our hard-coded ones anyway? Using
>> SPI_NOR_TRY_SFDP here would let us do that.
>
> Sure, but this is about fixing the referenced commit. A later patch will
> then move that to TRY_SFDP. We can't fix this regression by introducing
> new code IMHO. This seems to be the easiest fix.

New code will make it harder to backport to stable kernels. Beyond that,
I don't see why we can't fix a regression with new code.

Here's why I suggested this: before 83e824a4a595 ("mtd: spi-nor: Correct
flags for Winbond w25q128"), all flashes with this ID got only the
SECT_4K flag -- and thus only single SPI mode. After that commit, all
flashes with this ID got their settings configured via SFDP. Using the
TRY_SFDP approach allows both of those configurations to co-exist. Old
ones still use the old configuration, new ones get to use SFDP.

Now we add a different configuration that adds dual and quad reads to
these old flashes. As mentioned above, this is unlikely to cause
problems, but a new configuration regardless. So _in principle_ I think
TRY_SFDP would be the best balance.

But I get your point -- since both w25q64 and w25q256 have these flags,
it is likely someone just never bothered updating w25q128. So this patch
LGTM. I'll apply it once you send a new version with an updated commit
message.

>
> -michael
>
>> [0]
>> https://lore.kernel.org/linux-mtd/20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com/
>> [1]
>> https://lore.kernel.org/linux-mtd/0525440a652854a2a575256cd07d3559@walle.cc/
>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
