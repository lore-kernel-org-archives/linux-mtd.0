Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DCDC83F1B
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jul 2025 13:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQj/7s9rVa9Q+7oEhcaz0I5RDcZvH5q75ZJq4a7DooE=; b=dCiad00LuEzgGW
	DwZldIkmQ9CXi9KhYsy6JVbwHtzPSRZDPvo1vdhr79gLOjDxGlSMxPJtuHQQwDnbMermlzShK+KjD
	dM5mMWGbI4CkWpUF24vDeDhMlQ4v/tRUjxxOqJ4hWa+89N6x+sT4SfoFOyaqccqUDvcq9XzbGiteH
	cLgVAT+EAj3NcGq1PFNQgg2cjPHyP7u80mAtUFuTOZF/lyVI1omOhz0I0h4zawSj8gcaB664WAyjl
	yhdkAKK+yt6xbpE3Qiu6EBftZ3urdao5gEf6DSekBUIraXYkmJ6LQI8h5VCsG8fPtq5eV/QBhh4XB
	oxG4Okmy/rBFoCkHERcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc2Of-00000007ots-44EM;
	Wed, 16 Jul 2025 13:42:09 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc2Oc-00000007otL-2tIE
	for linux-mtd@lists.infradead.org;
	Wed, 16 Jul 2025 13:42:08 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so13545873a12.3
        for <linux-mtd@lists.infradead.org>; Wed, 16 Jul 2025 06:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752673324; x=1753278124; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ay2CBrr5SAiMij0S9ZmM/IIFXGaNKeZsPyNjCGRrP5c=;
        b=kpimu31tgytRRWcI9Trdwenl4xXuCfepgBP/TRRiLSN3IIEqM+djDH5tKdeUe+YcvM
         CMh4O3FQKRLT6QU0FfiizSekwFvGHUthUeesY+qFsDGz1X81T8zwlMu7bJUnCR2c9zHY
         PPWX1BSDwhlxJTmgr3kSwSEdigB5RFklQjasD4jEWab1cobczeXDS9/ZEyO8b9d4NZFr
         k7VJwxKNqaZJZNYzDUmp4G3bBRfkidVOUi2hQg/G6UhEHnLYhoTBXPVmdYSmfDcVMaAh
         7WTuT4Ijyc15dfAW/gEdRpLZD6Xq1lRtvrq0XLf2bXFB4F3nDDpcPAstXPAl6eLUAb8V
         rDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752673324; x=1753278124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ay2CBrr5SAiMij0S9ZmM/IIFXGaNKeZsPyNjCGRrP5c=;
        b=xLyFCYSCkm5K7H6dbH/+vnHCPqGHrTLLR3jPMWybWAsUBtlb9AGqCn0Orqu9zBApBu
         tg+HM6DqDO667yerj2X3N3XvSVuz0ESGT3RWHA54ch12UTWyPMFpNqt0ir1MbdvTZmpW
         Fu0g23VzW0VKcnP5ipcY3ebD9ttEeZw5+aD8cLYHLVDuWqPyCb63voVJyPDNsnzMb9/Z
         T0ARPKfpSIiOdfnZ5/iL9iPYKZbKvAKUGpn2rdOruJHMqGprQPCqwACIKjYBhucdIbOn
         IoOVAP44MJ+oGNr4GKxfbicZ1/5kYKMOTG+0XPmUI1LhPkNKHfqeG4pU/59CCanS9mz8
         cEZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw6VN3Hmt8xG0j86ek5yR4a8enyXSdWFpqK0sIhFHsxhnlu8Ct6ubESIzHdNZ3si0GZQrM8pxL6xo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTKCQd0t2zkdnOe1qgv3fO1N/p1KUniCOnksBYx7IEWgimn6yA
	RYnDFbcNT6FA1VeSMpwF6r6SL8Y0AJkZfksPSazroyih7ON/EVyr2ujI8sgWU98Cxqw=
X-Gm-Gg: ASbGncv37ZnZPBw8QnbTZuajEFdyH1VxVbyQUKF8m0y3QmjhEck40P+O7K9kdErzgEY
	kImEivlMTGP+jZ+V9ziMjgQ889cInwOgTWCLm0sL2yQEb3biJDGewH8Qn9jcT+W2EL+WA3+mSHG
	TaMwUVXbwvC6tknRyIRsB7cckfTDnw3MVmdsA578c6TRkpUs9fFE2rVPVup6AnRZWCIsgUl47XY
	9G606YbANi0oLLdU85qovCM/xSS0RyfbBM7SDCr71lOAGjbtfKNkVfNND8oX1yp5j3AVLGNis9M
	/MZ4Me3V/5E7vlnVrxBceDVd99yW7CGkLHoBKzIZzvkpTx/gahAWk/uFd6KgHG96WV53kLFhpu4
	LvqQMv0FK+Aud5Rn1FUg5JTDI568ZPUV1vpKjXMUCDSM=
X-Google-Smtp-Source: AGHT+IFbya9TOmBfAgj3lgjPHAUIJzhW/nysaH73dCJqkI24IeDTryUKXcHsJ9wAgS77T8KKc042Cg==
X-Received: by 2002:a17:907:1c98:b0:ae6:c7a7:204 with SMTP id a640c23a62f3a-ae9cdd86039mr317538266b.5.1752673324436;
        Wed, 16 Jul 2025 06:42:04 -0700 (PDT)
Received: from [192.168.0.251] ([188.27.143.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c976ecb6sm8705675a12.56.2025.07.16.06.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 06:42:03 -0700 (PDT)
Message-ID: <a487c6f8-d3e7-4bdf-a30e-eb69a6446749@linaro.org>
Date: Wed, 16 Jul 2025 14:42:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] mtd: spi-nor: Add support for XM25LU64C
To: Ssunk <ssunkkan@gmail.com>
Cc: hhlee@google.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, mwalle@kernel.org, pratyush@kernel.org,
 richard@nod.at, roccochen@google.com, vigneshr@ti.com
References: <20250707121428.3683-1-ssunkkan@gmail.com>
 <20250711084342.4594-1-ssunkkan@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250711084342.4594-1-ssunkkan@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_064206_751368_7D65AF64 
X-CRM114-Status: GOOD (  28.44  )
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



On 7/11/25 9:43 AM, Ssunk wrote:
> The XM25LU64C is a 64Mbit (8MB) SPI-NOR flash memory manufactured by
> Wuhan Xinxin Semiconductor Manufacturing Corp. (XMC). This device
> supports SFDP. However, additional flashflags beyond SFDP are required
> to fully describe its capabilities.

what flags are you referring to?
> This patch adds an explicit entry for the XM25LU64C, marking support for:
> 
>   - 4KiB sector erase (SECT_4K)
won't need it, defined in sfdp
>   - Dual and Quad read modes (DUAL_READ, QUAD_READ)
defined in sfdp

>   - Block-level lock/unlock support (HAS_LOCK)
>   - Top/Bottom protection bits (HAS_TB)

these shall be ok
> 
> These flash capabilities were confirmed against the vendor datasheet:
> 
>   https://www.xmcwh.com/uploads/954/XM25LU64C_V1.5.pdf
> 
> ### Testing:

you can add the testing comments in the "---" comment section

> Tested according to the "Minimum testing requirements" described in:
> 
>   https://docs.kernel.org/driver-api/mtd/spi-nor.html
> 
> - This flash is populated on the MT8189-chromebook board and was tested at 52M
> - frequency using the jedec,spi-nor SPI controller.

this is the compatible for the SPI NOR flash, not the SPI controller :)

> - Detected correctly by Linux MTD subsystem:
> 
>     # cat /sys/bus/spi/devices/spi5.0/spi-nor/partname
>     XM25LU64C
> 
>     # cat /sys/bus/spi/devices/spi5.0/spi-nor/jedec_id
>     204117
> 
>     # cat /sys/bus/spi/devices/spi5.0/spi-nor/manufacturer
>     xmc
> 
> - Verified SFDP table presence and correctness:
> 
>     # xxd -p /sys/bus/spi/devices/spi5.0/spi-nor/sfdp
>     53464450060102ff00060110300000ff20000104d00000ff84000102c0...

we need the full output. We'll reference it in case there will be updates
to this flash entry. Please send the full output.

>     # sha256sum /sys/bus/spi/devices/spi5.0/spi-nor/sfdp
>     27ef209af54d6fef4f51f14300e50db95f13180024f3e1aa1c4202edb4914be5
>     
> - Dump debugfs data:
>     # cat /sys/kernel/debug/spi-nor/spi5.0/capabilities
>     Supported read modes by the flash
>      1S-1S-1S
>       opcode	0x03
>       mode cycles	0
>       dummy cycles	0
>      1S-1S-2S
>       opcode	0x3b
>       mode cycles	0
>       dummy cycles	8
>      1S-2S-2S
>       opcode	0xbb
>       mode cycles	2
>       dummy cycles	2
>      1S-1S-4S
>       opcode	0x6b
>       mode cycles	0
>       dummy cycles	8
>      1S-4S-4S
>       opcode	0xeb
>       mode cycles	2
>       dummy cycles	4
>      4S-4S-4S
>       opcode	0xeb
>       mode cycles	2
>       dummy cycles	0
>     Supported page program modes by the flash
>      1S-1S-1S
>       opcode		0x02
>     Supported page program modes by the flash
>      1S-1S-1S
>      opcode		0x02
>       
>     # cat /sys/kernel/debug/spi-nor/spi5.0/params
>     name		XM25LU64C
>     id			20 41 17 20 41 17
>     size		8.00 MiB
>     write size		1
>     page size		256
>     address nbytes	3
>     flags		HAS_16BIT_SR | SOFT_RESET
> 
>     opcodes
>      read		0xbb
>      dummy cycles	4
>      erase		0x20
>      program		0x02
>      8D extension	none
> 
>     protocols
>      read		1S-2S-2S
>      write		1S-1S-1S
>      register		1S-1S-1S
> 
>     erase commands
>      20 (4.00 KiB) [1]
>      52 (32.0 KiB) [2]
>      d8 (64.0 KiB) [3]
>      c7 (8.00 MiB)
> 
>     sector map
>      region (in hex)   | erase mask | flags
>      ------------------+------------+----------
>      00000000-007fffff |     [ 123] |
> 
> - Vrify write:
>     # dd if=/dev/urandom of=./spi_test bs=1M count=2
>     2+0 records in
>     2+0 records out
>     2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.0334051 s, 62.8 MB/s

here you just generated a file of 2 MB
>     
>     # sha256sum spi*
>     be845b59c00525b0e0d570468c7b014bc8e9895c61ce74e8ca4cfc00e34d08aa  spi_test
> 

and here you get the sha256sum of it. you haven't verified the correctness
of a flash write. Please follow the testing steps in their fullness. 

> Signed-off-by: Kankan Sun <ssunkkan@gmail.com>
> 
> ---
> 
> Changes since v2:
> - Fixed broken datasheet URL
> - Rewrote commit message to clarify SFDP usage and flash flags
> - Removed irrelevant internal vendor references
> - Added test information of Minimum testing requirements
> 
> ---
>  drivers/mtd/spi-nor/xmc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
> index d5a06054b0dd..f1f2a9ba353e 100644
> --- a/drivers/mtd/spi-nor/xmc.c
> +++ b/drivers/mtd/spi-nor/xmc.c
> @@ -19,6 +19,12 @@ static const struct flash_info xmc_nor_parts[] = {
>  		.name = "XM25QH128A",
>  		.size = SZ_16M,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +	}, {
> +		.id = SNOR_ID(0x20, 0x41, 0x17),
> +		.name = "XM25LU64C",

remove name, but add it as a comment. See commits of recent flash additions.
> +		.size = SZ_8M,

if the flash defines SFDP, you won't need the size field.

> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB

these are ok, if tested. Did you test locking?
,
> +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,

you won't need this, they'll be discovered at sfdp parsing.
>  	},
>  };
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
