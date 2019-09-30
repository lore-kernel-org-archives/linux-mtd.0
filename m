Return-Path: <SRS0=FC8N=XZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F42AC35280
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2019 13:35:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08D88215EA
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2019 13:34:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cg+pFmAQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="XRHsgO2l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08D88215EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+AQfhFXv3EOLP9olqzYhWccG2vAKJLqcbZbX63XGF74=; b=cg+pFmAQcA/6Rb
	N2DBT/QeMl0CrH1P+Q1v68Z6HZT/7PpyWrTQsw/WS/cM8DCYHOhd46EH0A8TLKRrvqXFMuWD6TGLV
	XJ9wXUhpKf6x5JJUDccLiaWeHGkftHvNeub+zaS5c52MNY/+Gmythhdw5j4N4F1BCtWLhZI7SX9KU
	LLieKBhLQU+RchC+2oS9Zt6YVoyUzm1jXtUiKyGNrob1s5gaBwiFgsnNMu4Wichz6aHEA9E5GHei6
	5jy81AliwoAaq3Hi75ij6/YLZgSsrMUxeoY49AbAg3QGWCtnwyzHLi0tJeLc1BeX+/K7EHU85yAMW
	vcucjcROu02wcrySNRXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iEvpI-0008Vw-Tp; Mon, 30 Sep 2019 13:34:56 +0000
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iEvpF-0008Tc-5e
 for linux-mtd@lists.infradead.org; Mon, 30 Sep 2019 13:34:54 +0000
Received: by mail-vs1-xe41.google.com with SMTP id l2so6743530vsr.8
 for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2019 06:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AMvf0aJLSBw670rdzFO9x6SzJk02/YpUBF290pMe194=;
 b=XRHsgO2ll4Out3o1wWqMo9/abYElPhYcstVnCjrAX4aJrgfwN3SSOi/aFXRHfmoHHQ
 KieWKrU3/AlNLArqYMjHIkhyQsWX1bKkMj3Cy05J0In/IglcbWMeOzdgPfEQ0JGXeEoY
 Ly8MkBlzdNqEkscNPaJWQMwsgNSQlneFvr9c8uj4bdNHLyBOD/RBlbMtEuOazxlROCZB
 zyRh9eBTf+T5h7F0DsfDbwugnqO2BG3TTeTK3V4q3V4OIwNA9nqI0gB3HUkg38F+hxDJ
 teov5TcNbR1trLL4uRTSp93QzxHScrbmgI4+kb4NNWtFM76u7MkDK4dHz6hgdWR4Tbys
 xqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AMvf0aJLSBw670rdzFO9x6SzJk02/YpUBF290pMe194=;
 b=fzCfkrymHrEQlQAHKHYK0lbmIyYD40tnOWeb+cI0Q0DNDp+qV413Gsg7qCKD1ZVLyz
 I76dQbxm+8nBQPES641MefeS0o+b3GD7u24XHJms41aq6xh9DCMPoi6lYIlLAuzCGuFz
 TR9fXISzoKmvhWyhbtLfojkGjypsgdy52LPNvZba+FtXDEAow4EtoWutheArF9CSf6m+
 LHkQ6m14gB9E2GIq5T6QO4eFLZafQjUopHHaOVqzs5QlWfsl45le0FQdI7X83CAeZn+L
 b7aYy3hlkGQfccIwIawTiDl+FL9nko+Py6GedyP0Ep6cUCVPK14ADyvmHMg4Fxt6f66L
 K0dA==
X-Gm-Message-State: APjAAAUCVniv3/r0TD/L+VyssWwg11ftcQnUqSlrWLHj1SCDWcZuvKLK
 qpw+xztN1iAesUcnsBQKWWNFYmgNx2z132OELs2nqQ==
X-Google-Smtp-Source: APXvYqwFoFBboIPgwzdCmxDRfbxS1fhkFS38SreFnzfJ31NLXbmDoVntXc3bbJ78f872NGqPaK/9xydoPhVnoDLPfKk=
X-Received: by 2002:a67:f0dd:: with SMTP id j29mr4889144vsl.92.1569850491648; 
 Mon, 30 Sep 2019 06:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <1568822505-19297-1-git-send-email-sagar.kadam@sifive.com>
In-Reply-To: <1568822505-19297-1-git-send-email-sagar.kadam@sifive.com>
From: Sagar Kadam <sagar.kadam@sifive.com>
Date: Mon, 30 Sep 2019 19:04:40 +0530
Message-ID: <CAARK3HkOwyvg=xr7fw1SrP_=B+Gj+waQmtZvgiK4AUpQrbM41Q@mail.gmail.com>
Subject: Re: [PATCH v9 0/2] mtd: spi-nor: add support for is25wp256 spi-nor
 flash
To: Marek Vasut <marek.vasut@gmail.com>, tudor.ambarus@microchip.com, 
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190930_063453_246911_D3C51D92 
X-CRM114-Status: GOOD (  23.77  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, Sep 18, 2019 at 9:32 PM Sagar Shrikant Kadam
<sagar.kadam@sifive.com> wrote:
>
> The patch series adds basic support for 32MiB spi-nor is25wp256 present on HiFive
> Unleashed A00 board. The flash device gets BFPT_DWORD1_ADDRESS_BYTES_3_ONLY
> from BFPT table for address width, whereas the flash can support 4 byte
> address width, so the address width is configured by using the post bfpt
> fixup hook as done for is25lp256 device in
> commit cf580a924005 ("mtd: spi-nor: fix nor->addr_width when its value
> configured from SFDP does not match the actual width")
>
> Patches are based on original work done by Wesley Terpstra and/or
> Palmer Dabbelt:
> https://github.com/riscv/riscv-linux/commit/c94e267766d62bc9a669611c3d0c8ed5ea26569b
>
> Erase/Read/Write operations are verified on HiFive Unleashed board using  mtd and
> flash utils (v1.5.2):
> 1. mtd_debug    : Options available are : erase/read/write.
> 2. flashcp      : Single utility that erases flash, writes a file to flash and verifies the data back.
>
> The changes are available under branch dev/sagark/spi-nor-v9 at
> https://github.com/sagsifive/riscv-linux-hifive
>
> Revision history:
> V8<->V9:
> -Rebased this series to mainline v5.3-rc8
> -Corrected number of sectors in the spi nor id table for is25wp256 device as suggested in the review.
> -The lock/unlock scheme in the V8 version of this series needs to have a more generic approach.
>  These protection scheme patches are not included in this series, will submit those separately.
>

A gentle reminder!!
Any comments on this series?

Thanks & BR,
Sagar Kadam

> V7<->V8:
> -Rebased this series on mainline v5.3-rc4.
> -Removed remaining func_reg reference from issi_lock as updating OTP region was dropped as part of V6.
> -Updated Reviewed-By tags to 1st and 2nd patch.
>
> V6<->V7:
> -Incorporated review comments from Vignesh.
> -Used post bfpt fixup hook as suggested by Vignesh.
> -Introduce SPI_NOR_HAS_BP3 to identify whether the flash has 4th bit protect bit.
> -Prefix generic flash access functions with spi_nor_xxxx.
>
> V5<->V6:
> -Incorporated review comments from Vignesh.
> -Set addr width based on device size and if SPI_NOR_4B_OPCODES is set.
> -Added 4th block protect identifier (SPI_NOR_HAS_BP3) to flash_info structure
> -Changed flash_info: flag from u16 to u32 to accommodate SPI_NOR_HAS_BP3
> -Prefix newly added function with spi_nor_xxx.
> -Dropped write_fr function, as updating OTP bit's present in function register doesn't seem to be a good idea.
> -Set lock/unlock schemes based on whether the ISSI device has locking support and  BP3 bit present.
>
> V4<->V5:
> -Rebased to linux version v5.2-rc1.
> -Updated heading of this cover letter with sub-system, instead of just plain "add support for is25wp256..."
>
> V3<->V4:
> -Extracted comman code and renamed few stm functions so that it can be reused for issi lock implementation.
> -Added function's to read and write FR register, for selecting Top/Bottom area.
>
> V2<->V3:
> -Rebased patch to mainline v5.1 from earlier v5.1-rc5.
> -Updated commit messages, and cover letter with reference to git URL and author information.
> -Deferred flash_lock mechanism and can go as separate patch.
>
> V1<-> V2:
> -Incorporated changes suggested by reviewers regarding patch/cover letter versioning, references of patch.
> -Updated cover letter with description for flash operations verified with these changes.
> -Add support for unlocking is25xxxxxx device.
> -Add support for locking is25xxxxxx device.
>
> v1:
> -Add support for is25wp256 device.
>
> Sagar Shrikant Kadam (2):
>   mtd: spi-nor: add support for is25wp256
>   mtd: spi-nor: fix nor->addr_width for is25wp256
>
>  drivers/mtd/spi-nor/spi-nor.c | 9 ++++++++-
>  include/linux/mtd/spi-nor.h   | 1 +
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> --
> 1.9.1
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
