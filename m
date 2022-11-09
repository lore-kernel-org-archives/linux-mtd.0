Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432FCC433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Nov 2022 09:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMeKpOSgAC/4bhmfGb8a7l320Fi4k3gIINp96CwvpH8=; b=lgG+kOO/y5xpdL
	/aak+Lnt35mmQ+j+47v1qjE2sbzi66EcNHwL4AUbrv00QtaDMU1rGgxR9V/CVpCvRFyEWntKRwGRd
	2FyVNo0MHM5NgQGiwf+gY+rtAUiJF3jZs5Z+k1HVX95U5ja4q6X4CNk4HzmXdsq00xnFpRqTwwVPi
	Mws1bAnj2eQ8uYae32VHclDyC5hRMa6oXKH0H2PG94sWQuyiqFedDosJoDJ8Sz0lBre6szdR56Xvk
	xYX7IXOHa899V0YHD4XCEk9yG7fITJOWTcOFXU0Ko88yceYyKn3zbiTMj6A1oXOzsB1hn7/1dNbGl
	kWOq0Z15gCzy/QSQeOvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osh9v-00CC2L-9Z; Wed, 09 Nov 2022 09:14:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osh9p-00CBz3-0B
	for linux-mtd@lists.infradead.org; Wed, 09 Nov 2022 09:14:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6AB0EB81D58
	for <linux-mtd@lists.infradead.org>; Wed,  9 Nov 2022 09:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D797C4347C
	for <linux-mtd@lists.infradead.org>; Wed,  9 Nov 2022 09:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667985241;
	bh=1W7y9ZW1Hi3m7nzUlgOvpMez/79lPrfWcH4WKvc4GYc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IoVQ87wHgCKhe7NJPYn1Q9n4firiWtp84exzCcBDRRMAcpZzefPsvJF282Un+alQ2
	 wgJExUecSE++y1Bh/7v7UfJiuSdWSMDZ8JUn3aEHMA8RBZN5D9O8aRrsJPxun09f1H
	 gpqyGB4UW5g3hH+QtGrpyDeNefrWH01ZY3cqMwets+JkHeolP8eKxiKBquy0u4oLi6
	 pRC+9A4zqnX2bQkC6HP1GwmcW4h4GULjmQJjTzm4TjIJXnGojZR1ZDCn+lWDeqjZhH
	 3PEzXX3d6hpRRuZt+pGOGFpvH0k5+rwP9JQdRrUM2V4MgzDrPxY7K4qyxF+iEQeylZ
	 f0BOir1l93BgQ==
Received: by mail-lf1-f42.google.com with SMTP id g12so24734358lfh.3
        for <linux-mtd@lists.infradead.org>; Wed, 09 Nov 2022 01:14:01 -0800 (PST)
X-Gm-Message-State: ACrzQf0uE/SgALu1vRzq0JU4e4lQlQ5N8GHGHGfSnbNGqzz028Phmwge
	O257OkClHDUMcJNzfMfi+RVcBIYV1oSH0SeQfz0=
X-Google-Smtp-Source: AMsMyM6nqNV8lABCm89TT5c/zWYEWvJqOcSZ+FOSDLV6ElwxEHIAXpfQWy3RsxJUbhi/BY42rofI3671iASHp2Xf1Vk=
X-Received: by 2002:a05:6512:151b:b0:4af:e7d3:4a46 with SMTP id
 bq27-20020a056512151b00b004afe7d34a46mr19965857lfb.583.1667985239507; Wed, 09
 Nov 2022 01:13:59 -0800 (PST)
MIME-Version: 1.0
References: <Y2rgVIbtuDsySzBr@makrotopia.org>
In-Reply-To: <Y2rgVIbtuDsySzBr@makrotopia.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 9 Nov 2022 10:13:48 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG3UWUP-inYHNibJyuJfQwGzfQH8QvJqBNHZgyLc1a+6A@mail.gmail.com>
Message-ID: <CAMj1kXG3UWUP-inYHNibJyuJfQwGzfQH8QvJqBNHZgyLc1a+6A@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] partitions/efi: add support for uImage.FIT sub-partitions
To: Daniel Golle <daniel@makrotopia.org>
Cc: Jens Axboe <axboe@kernel.dk>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Matthew Wilcox <willy@infradead.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Chaitanya Kulkarni <kch@nvidia.com>, Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-efi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_011405_344095_B3BE4D36 
X-CRM114-Status: GOOD (  23.62  )
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

On Wed, 9 Nov 2022 at 00:05, Daniel Golle <daniel@makrotopia.org> wrote:
>
> Add new GUID allowing to parse uImage.FIT stored in a GPT partition
> and map filesystem sub-image as sub-partitions.
>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

I'm not sure I follow the logic here.

You are adding uImage.FIT support as a pseudo-partition type right?
And the only partition driver that supports it is GPT?

Does that mean that all the other types would need a similar change to
be able to detect these subvolumes?

> ---
>  block/partitions/efi.c | 9 +++++++++
>  block/partitions/efi.h | 3 +++
>  2 files changed, 12 insertions(+)
>
> diff --git a/block/partitions/efi.c b/block/partitions/efi.c
> index 5e9be13a56a8..bf87893eabe4 100644
> --- a/block/partitions/efi.c
> +++ b/block/partitions/efi.c
> @@ -716,6 +716,9 @@ int efi_partition(struct parsed_partitions *state)
>         gpt_entry *ptes = NULL;
>         u32 i;
>         unsigned ssz = queue_logical_block_size(state->disk->queue) / 512;
> +#ifdef CONFIG_FIT_PARTITION
> +       u32 extra_slot = 65;
> +#endif
>
>         if (!find_valid_gpt(state, &gpt, &ptes) || !gpt || !ptes) {
>                 kfree(gpt);
> @@ -749,6 +752,12 @@ int efi_partition(struct parsed_partitions *state)
>                                 ARRAY_SIZE(ptes[i].partition_name));
>                 utf16_le_to_7bit(ptes[i].partition_name, label_max, info->volname);
>                 state->parts[i + 1].has_info = true;
> +               /* If this is a U-Boot FIT volume it may have subpartitions */
> +#ifdef CONFIG_FIT_PARTITION
> +               if (!efi_guidcmp(ptes[i].partition_type_guid, PARTITION_LINUX_FIT_GUID))
> +                       (void) parse_fit_partitions(state, start * ssz, size * ssz,
> +                                                   &extra_slot, 127, 1);
> +#endif
>         }
>         kfree(ptes);
>         kfree(gpt);
> diff --git a/block/partitions/efi.h b/block/partitions/efi.h
> index 84b9f36b9e47..06c11f6ae398 100644
> --- a/block/partitions/efi.h
> +++ b/block/partitions/efi.h
> @@ -51,6 +51,9 @@
>  #define PARTITION_LINUX_LVM_GUID \
>      EFI_GUID( 0xe6d6d379, 0xf507, 0x44c2, \
>                0xa2, 0x3c, 0x23, 0x8f, 0x2a, 0x3d, 0xf9, 0x28)
> +#define PARTITION_LINUX_FIT_GUID \
> +    EFI_GUID( 0xcae9be83, 0xb15f, 0x49cc, \
> +              0x86, 0x3f, 0x08, 0x1b, 0x74, 0x4a, 0x2d, 0x93)
>
>  typedef struct _gpt_header {
>         __le64 signature;
> --
> 2.38.1
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
