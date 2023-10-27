Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173CCC25B67
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Oct 2023 06:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SgcL9u/k+AvAZ2kZqMH/1UzXLL73D39OXeb1vXZ081A=; b=bgNzjOEU8weDtQ
	l8LQVH+q5y6SEdJC4YZcgrjb/48QwGIoQzdqiT7A4vdSy/iKqEjPXsE6E+LiNEgb6qhmmBBFu2ZnV
	vnYjyG27wQNFf8AKcZ7cl2RbrA13QxPFeZA2TJ/JM3xGxK7c3i0rUDSlRzOmG+6KY0vCQqS6XSG1+
	zYycsfEuxHdw3VPeZGPRRB2QUfOP0V8+Zdy68Rlg7rRB5ER/j3NydfOV/ejmZZlaMd2ziS7+nGmOG
	rmYreMzZwpzAl8nlLzAF9jxwHTS+zxSJH/Nb8HgVPg/NyQB0qSMO3YUzO49aW/qCtLF4RLG3Cnw0q
	EXCtpPKuDTw0dE9Y4DAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwGom-00FiZA-0v;
	Fri, 27 Oct 2023 06:59:40 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwGoi-00FiYU-0p
	for linux-mtd@lists.infradead.org;
	Fri, 27 Oct 2023 06:59:38 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9c5b313b3ffso249909466b.0
        for <linux-mtd@lists.infradead.org>; Thu, 26 Oct 2023 23:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698389973; x=1698994773; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ux+tqyOnVPQIR1Hx7khxBku/qfvsyex+G9huy/pUJSY=;
        b=cVVzX2bgP0cKCJ+qE1UPKHSmD8Wd55qntoYMbEL9jQnNvSg7r0qNsXhlqVylZWZuV9
         7RcKVukPpfkjSQxa3GxpLzCylOryjHTrdSaUBgXrk4cG1Jc3Di3a+co0ZBi+PLjLL3VT
         txZg0s+9jA8pXwpjKfXEb0gNaa2T7ouhNlZg1VOKFZRC2t/iT04WvSxQUWmxzdNAOrRw
         A5+pJOz8ehlXCarWfYjAarh21jGQJ7JlaWUJoc9B7Yf/WOWwWaIfnlwcE2RF/REjLJ9K
         E+OtuQY7WxCR2bMHTDFv66dT96e2in6XmFFvgwp21wyVV2RHWTVH1wNOAIZ7FSdHXOTW
         vUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698389973; x=1698994773;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ux+tqyOnVPQIR1Hx7khxBku/qfvsyex+G9huy/pUJSY=;
        b=ca3KRw31V2dDjHIAQUtjvxxJqC37Q71GaCeamJ0S5cCCFsTzPqXJtrCGo817nW7tB2
         DHT6uFpP9fPha/Yt5xD0RqUeQKRTh7r/0j4MDS7MTSXQyTt8vPH4kzchN74CnehDVl1K
         ZGbSPpb1x/LKWDle7MjWndIt0utISondlBVq4UmWSHdloKfjdlewpMADdbrwDOWWY+Sc
         V0RwyGsbcxNyfLrFLEZYx8mz45D7tRntAsmwY0GOvJkoTL2hXX80t0UbVsYfn8zku4Mj
         mP9VHuwV4Hy99foXP6txe4fKiiVb5vjANa0/bsKDWMhXoVF/ZROsxuLsI9ZsLfaSR4P9
         wQLA==
X-Gm-Message-State: AOJu0Yy9RxGUt3/46oNq4Zr0oLDCCUzo47sKZwhmNoNt4RCfETEUbFC5
	bYwvbH/VwUyYtbwGUZkQL8BCOA==
X-Google-Smtp-Source: AGHT+IGTVSEOA9YZqGYnB3cDWo5hSYdsElGv6jHrkpcycRlmlErIVtgNmT91WWGs3Qh3t4/BXH3NGQ==
X-Received: by 2002:a17:906:da87:b0:9c6:306f:677f with SMTP id xh7-20020a170906da8700b009c6306f677fmr1500356ejb.47.1698389972957;
        Thu, 26 Oct 2023 23:59:32 -0700 (PDT)
Received: from [192.168.2.173] ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id fy19-20020a170906b7d300b009a1be9c29d7sm712935ejb.179.2023.10.26.23.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 23:59:32 -0700 (PDT)
Message-ID: <82fb8908-f24f-4918-810f-1c83b06ebe08@linaro.org>
Date: Fri, 27 Oct 2023 09:59:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: micron-st: Add support for mt25qu01g
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>
Cc: michael@walle.cc, pratyush@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 tkuw584924@gmail.com, Fabio Estevam <festevam@denx.de>
References: <20231026112312.3217502-1-festevam@gmail.com>
 <20231026112312.3217502-2-festevam@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231026112312.3217502-2-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_235936_320045_6C898467 
X-CRM114-Status: GOOD (  28.22  )
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

Hi, Fabio,

The entire patch looks very suspicious to me. I'd like some more tests
please, see my reasoning below.

On 26.10.2023 14:23, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Add support for the MT25QU01G 128MB Micron Serial NOR Flash Memory
> model.
> 
> Datasheet:
> https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_01g_bbb_0.pdf
> 
> Tested on a i.MX8MP based board:
> 
> ~# cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/jedec_id
> 20bb21104400
> 
> ~# cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/manufacturer
> st
> 
> ~# cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/partname
> mt25qu01g
> 
> ~# xxd -p  /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
> 53464450060101ff00060110300000ff84000102800000ffffffffffffff
> ffffffffffffffffffffffffffffffffffffe520fbffffffff3f29eb276b
> 273b27bbffffffffffff27bbffff29eb0c2010d80f520000244a99008b8e
> 03e1ac0127387a757a75fbbdd55c4a0f82ff81bd3d36ffffffffffffffff
> ffffffffffffffffffe7ffff21dcffff
> 
> ~# md5sum  /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
> 9d28d1b11de8b15ba9152644219d9a78 /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
> 
> ~# dd if=/dev/urandom of=spi_test bs=1M count=128
> 128+0 records in
> 128+0 records out
> 134217728 bytes (134 MB, 128 MiB) copied, 4.77424 s, 28.1 MB/s
> 
> ~# mtd_debug write /dev/mtd0 0 134217728 spi_test
> Copied 134217728 bytes from spi_test to address 0x00000000 in flash
> 
> ~# mtd_debug read /dev/mtd0 0 134217728 spi_read
> Copied 134217728 bytes from address 0x00000000 in flash to spi_read
> 
> ~# sha1sum spi_test spi_read
> 6778615a7b7db2d3c3fa122721d940082eb67039  spi_test
> 6778615a7b7db2d3c3fa122721d940082eb67039  spi_read
> 
> ~# flash_erase /dev/mtd0 0 0
> Erasing 131072 Kibyte @ 0 -- 100 % complete 
> 
> ~# hexdump -C /dev/mtd0
> 00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
> *
> 08000000

This doesn't prove the flash works because if the entire flash is
already erased and all the ops are noops, the test passes.

Would you please do the following tests instead?

1/ dd if=/dev/urandom of=spi_test bs=1M count=128
2/ mtd_debug write /dev/mtd0 0 134217728 spi_test
3/ just make sure that we wrote something and the flash does not
contains just 0xff data. Read 246 bytes from both dies and dump them.
mtd_debug read /dev/mtd0 0 256 first-die
cat first-die
mtd_debug read /dev/mtd0 67108864 256 second-die
cat second-die
4/ now that we are sure we have some data in it and not just 0xff, erase
the entire flash and make sure we get just 0xff when reading
flash_erase /dev/mtd0 0 0
hexdump -C /dev/mtd0
6/ now do the write-readback-verify test
mtd_debug write /dev/mtd0 0 134217728 spi_test
mtd_debug read /dev/mtd0 0 134217728 spi_read
sha1sum spi_test spi_read

> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v2:
> - Added fixups to report the correct n_dice information.
> - Removed .flags = NO_CHIP_ERASE (Michael)
> - Removed .mfr_flags = USE_FSR (Michael)

Not a good idea to remove USE_FSR. FSR is used to determine page program
and erase errors, please keep it.
> 
>  drivers/mtd/spi-nor/micron-st.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index 8920547c12bf..31839d6bc3ac 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -192,6 +192,20 @@ static struct spi_nor_fixups mt25qu512a_fixups = {
>  	.post_bfpt = mt25qu512a_post_bfpt_fixup,
>  };
>  
> +static int mt25qu01g_post_sfdp_fixup(struct spi_nor *nor)
> +{
> +	struct spi_nor_flash_parameter *params = nor->params;
> +
> +	/* MT25QU01G does not define the SCCR entry, so pass n_dice manually. */
> +	params->n_dice = 2;
> +

I wonder why this is needed if it's not used anywhere. Do you set this
just so that based on it to set the no-chip-erase flag? If yes, set the
no chip erase flag directly and drop the entire fixup hook. Would be
good to introduce the die erase capability if you care about erase speed.

Skimming over the datasheet you pointed out didn't help me remove my
concerns.
See "Table 24: 4-BYTE READ MEMORY Operations", it says "a die can be
read with a single command", but we don't consider this anywhere in the
code.

If the flash works with the current code, why does it work?
Please enable dev_dbg, we have one in spi_nor_read(), we shall see
what's going on.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
