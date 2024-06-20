Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5459C2BBCA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2024 14:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U5uDC5W3jn08NOieNVlMjyAfXtSO6JAo5xKPFXnNKvc=; b=CSS0KDgnkkL2Mu
	9wBjuPUefpd6+NjZFUNCIg2r1EXsbES/aV536h6KwiDmGCTbVrEW4r67zA0FieegbXqFpANmHYS71
	ERWUa8V0Ppii0oPifxN7hsYetEC715gEPJsop8hw+kXoFti6PMLZdQwu8tv6JMbF01dOLd2+Js+uw
	vEaaDU6fC7bCdxTZL8VRGSUkmJElcPu1k2+TQHBvO/qAckkDMbQTJksvX7rIY8p3clgpAx0/V5lpp
	hiFW+syzBa4bEBaJoMjYbpsGYCkidCAzFLrb6gFj3cbsO41SFCsjXfzxDwbcDeRJ8lJ9YbVZq+KV5
	ifsWLCJl9Zs7OfK0Aarg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKIMm-00000005KVm-0Nhh;
	Thu, 20 Jun 2024 14:02:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKIMj-00000005KUT-3p08
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jun 2024 14:02:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B4933621B3;
	Thu, 20 Jun 2024 14:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA805C2BD10;
	Thu, 20 Jun 2024 14:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718892136;
	bh=RwCFKECv1FH8ndgP92pPiQzSzdHIVvEvgd22L++EPMQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JhNn98oWOpK9K8Rg6GmI2o/wCl++W3pp1zyP2/2tGdVRqfospX6GHU0fgWs36r5ov
	 TGBk3T5QtQsa5PsRQK6FvhegAol+oHADaTWPEUxVjJWPyZaQqWU2sreL2DEwsffqr9
	 +9Czj7GYW6z7DV7X66t8LGojEC5JzwukYKQausHjEcW4MTuyShkljbIcCu7QegYDhS
	 vImFL81L1TVMSNCX7gFjJ+ulfFeSPiJXbOF6veIpU+/l9SW8EEJ+7XXTvl/6tY89d3
	 ExesLjO0CsO1VMUvUk4uwCmkIo0OuaAzE43Vb+/gc8wk/gUGkYmF+7ZUMMBgW/Gptu
	 YWN1pGLE1IQGw==
From: Pratyush Yadav <pratyush@kernel.org>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>,  "Pratyush Yadav"
 <pratyush@kernel.org>,  "Miquel Raynal" <miquel.raynal@bootlin.com>,
  "Richard Weinberger" <richard@nod.at>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  "Linus Walleij" <linus.walleij@linaro.org>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  "e9hack" <e9hack@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: winbond: fix w25q128 regression
In-Reply-To: <D233KUGR81P5.1BJ8JSACE7C6A@kernel.org> (Michael Walle's message
	of "Tue, 18 Jun 2024 13:14:03 +0200")
References: <20240610074809.2180535-1-mwalle@kernel.org>
	<76f8be4e-3050-4ae6-93b4-9524a0689022@linaro.org>
	<D233KUGR81P5.1BJ8JSACE7C6A@kernel.org>
Date: Thu, 20 Jun 2024 16:02:13 +0200
Message-ID: <mafs04j9ng1ay.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_070218_075519_F34134E1 
X-CRM114-Status: GOOD (  22.47  )
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

On Tue, Jun 18 2024, Michael Walle wrote:

> Hi Tudor,
>
> On Tue Jun 18, 2024 at 12:33 PM CEST, Tudor Ambarus wrote:
>> On 6/10/24 8:48 AM, Michael Walle wrote:
>> > Commit 83e824a4a595 ("mtd: spi-nor: Correct flags for Winbond w25q128")
>>
>> That commit did:
>> -       { "w25q128", INFO(0xef4018, 0, 64 * 1024, 256)
>> -               NO_SFDP_FLAGS(SECT_4K) },
>> +       { "w25q128", INFO(0xef4018, 0, 0, 0)
>> +               PARSE_SFDP
>> +               FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>>
[...]
>> > diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
>> > index ca67bf2c46c3..6b6dec6f8faf 100644
>> > --- a/drivers/mtd/spi-nor/winbond.c
>> > +++ b/drivers/mtd/spi-nor/winbond.c
>> > @@ -105,7 +105,9 @@ static const struct flash_info winbond_nor_parts[] = {
>> >  	}, {
>> >  		.id = SNOR_ID(0xef, 0x40, 0x18),
>> >  		.name = "w25q128",
>> > +		.size = SZ_16M,
>> >  		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
>> > +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>>
>> and here you add dual and quad to trigger SFDP parsing I guess. All fine
>> if the old flash supports dual and quad read. But please update the
>> commit message describing the intention. With that ACK. Would be good to
>> have this merged soon.
>
> Right. It's not because it will trigger the SFDP parsing, but
> because that what was tested by Esben. We're lucky that this will
> trigger the SFDP parsing ;) I'll explain that in more detail and add
> a Link: to the bug report mail.

Should we treat this flash similar to the Macronix ones Esben sent out
patches for [0]? It seems that there are some old parts without SFDP
support and new ones with SFDP support. From your comment in [1]:

> This is an entry matching various flash families from Winbond, see my
> reply in v1. I'm not sure we should remove these as we could break the
> older ones, which might or might not have SFDP tables. We don't know.

Since the entry matches multiple families, do _all_ of them support dual
and quad read? If not, attempting to enable dual or quad reads on them
can cause problems.

Also, for parts that _do_ have SFDP available, won't it be better to use
the information in SFDP instead of our hard-coded ones anyway? Using
SPI_NOR_TRY_SFDP here would let us do that.

[0] https://lore.kernel.org/linux-mtd/20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com/
[1] https://lore.kernel.org/linux-mtd/0525440a652854a2a575256cd07d3559@walle.cc/

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
