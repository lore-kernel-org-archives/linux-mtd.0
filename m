Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB1AC44533
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2026 07:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EfQwaD82JWVqWrGbjUBolYrh4jHZgLYnwEEi0immDlM=; b=QTqAKzltdIdsoavcmTb0qCv4e7
	uTpJfoNkLlobIQyZAtuY7AZEuOcwS5eaXQ0wEd6/JsmrgtQ1kSI0dlvzNRvfyrJT5wSztFV5P8xGj
	dGbjhNK/qlaHCfxNTlL7FjTB/YUwk9MITm2VKHg/pI3jZtdAqe2huH+FwiS9zJsa6nqxsdcWDu1O4
	yKVbsB4mSk/9w7hSSth5UNS9w1oAPJFJcWGaAaoCtOg8PIqSw6qf5afmsqf5bD3Hd2g3zoTUaTLGA
	bfzc4QCouN3F3gIToiX92zR7zhh0wy/NKXL/b5jdkCzlaSh0Rc3WJ0rCJ4EJehbc3ZFsFDGHbl+aX
	9/fa/5Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRcI-0000000B7oF-2Ox8;
	Wed, 22 Jul 2026 07:43:46 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRcC-0000000B7SD-0cPG
	for linux-mtd@lists.infradead.org;
	Wed, 22 Jul 2026 07:43:44 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id F35EC1D000AA;
	Wed, 22 Jul 2026 03:43:36 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 22 Jul 2026 03:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784706216;
	 x=1784792616; bh=mJSFxWD2Ht/+LtlvjnoJwLI7bNV1NQZCDsIyan5N6Vg=; b=
	nWvVJ74Ww8QOP5iNsRJoqAu1ReQLsUhMSft8cfIPxVUeyrXU932mSYidegFXD4eW
	HvrpiGWJc5SJ7UGjHRrg+LlRHalji+oAdxvpauIZQu7fIoHzich1zc99zxfnAgJe
	H+cy3gxtlMDEwWbAdpK39rpH3ol+c735PiCQx4PRFjS0JB79T6I8In45ze4iktjs
	NISbxyPt9bMJ/GaOkfrJcZhRSkDUc9Oa3ykpSSbVnCPvZK+A6IIuscreJiZ2UNqk
	1XKeireq0ggaKhxwtMPwC93DvOgVsdP+xHw7uDCveZr6cskA8C/I7UWKmGX0dAuh
	EtQ3AV8V4TI0PWaZq/KGRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784706216; x=
	1784792616; bh=mJSFxWD2Ht/+LtlvjnoJwLI7bNV1NQZCDsIyan5N6Vg=; b=h
	tA6EAJwWtq1cW6VlEnJ7tqjZkZcGfYGrNBjwTflYuPbe3Kryug4hNHp36t8iVNuy
	OxB+ZOQXpGVToQeMy52cpQKYhYCd4mqBzZDMxnY8gtySM/m7GIFBWgy1ihptLn2/
	y5N/2HAUamqsDX+EW+lH7SGZa12FwY+LzRXf9/yOMgsiHRxKogdpLtymGZNVyT/t
	+OWCKiYJi6xUUZzHku+RGi5TiCzYsVar1VVhfc8bWGMS5ZY8a/QS3Sc8NgJ+Xek8
	eiOEe+ORHGKg7Zdwi7H/o5vTbcLIW8Uc4cFSfSJQdAZcwO8JHAGiyCSYuaS3DaCo
	JQwP65BPnt+lJcuzDzIXQ==
X-ME-Sender: <xms:p3Rgava-wobGPcwY1HLWiMDf5AiVPPzcqZlMboHXjZjJE8NNKFjJ1A>
    <xme:p3RgapMm05LkPIw_vhoQhvmfxqKB4I9TeVfn4YIagrPi1gqWkstwyKqw4UlOPB_vR
    -wt__49AAvheVngThKQT7Q7846H-RgYLaOVlwVwbEl-g3CQmXkYNCA>
X-ME-Proxy-Cause: dmFkZTEhS2rIyrFnvwDJMpjJoM/AddmAfi8Vn2BuXnWxvyapXuarBDtWZEmCXQzH7VlP0e
    ax02YUfliNEOXBZGgY9HuKPOR27ufULpgj+VKpClSvSyLIL7l3rD26nJ3ZhSoi1Nq1GnWD
    J7ymR2h04Km4N32wg7nayEoXPOhM6OBkVixomX7wWZNJ7cQS51Xh/09koj+NbD8EeY/8x6
    mliLC+tPMW1W8KdmvXWPzUmS+8ALlDOi9NtYvi4aNdqTXdPYU4X+vPu5v7cr3Qa0aXsBik
    yTZ+dPoMWzonxDfH1hQyetPLU6llwPft0xuJz+6Ylgj0WMz2I2jQ2nsq5ELsHBHeeVHCl5
    keLqRVYzbpt75WR1gSPwBsMQyIDFRqW8kc8I2Okbtixkb/PiIU13Z+6ZyqwOlZKXulY81M
    xxbDWdXqUsvZaOV5/5rSGWeJPmrNbUkoCzHl5Muf5MaWCYVXsJmmOBfnB45Rr/ONY+38Tc
    JppDjfZ1HFd2MUcoIbHYHYRseNEklKggneHv+R10xyimiay+bnjk4gXLFCJWyehtrjdVwI
    DXtlX2Z/OQr0HzG2B/ER0sQRTVTpVRGTAs5jXQt8as6NlCEOGzUmiXbhqF/igbkiL2oXWx
    dxkYXW/y1BVL3rJAKhTQX0mhRAmgu8il2Bh/G3H/ED/c37fq05HgPiDrpq8w
X-ME-Proxy: <xmx:p3Rgao_-p1ywTU2P5jSWTbmJS088u3_N-Si563mTBzfziv-po13UKA>
    <xmx:p3Rgao7tgdJzlfQvr1c0TYfUTS7zMwbEE2PbMQQpJ5Dn3VNWWujmGQ>
    <xmx:p3Rgapl7Igmr_2rj_ADXUv28fzk940kCAQkzWSCRCLAsEnd8cplWNg>
    <xmx:p3RgajGcPuBfu9n3MgUfE-NGsDAYRRy-V6-DIKbgmxmYxkdduyt11w>
    <xmx:qHRgamNm2FCVPBMbDv2FeWTSgkA3aKO7ma-hxsOcZjARr5dpVd7YPnVb>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7B34F182007E; Wed, 22 Jul 2026 03:43:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AOU3aoS2vECw
Date: Wed, 22 Jul 2026 09:42:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Braha" <julianbraha@gmail.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: "Sean Young" <sean@mess.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Randy Dunlap" <rdunlap@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Linus Walleij" <linusw@kernel.org>
Message-Id: <73b310a6-e97c-4bcc-ba82-9ed781f4bba6@app.fastmail.com>
In-Reply-To: <20260722001003.36598-1-julianbraha@gmail.com>
References: <20260722001003.36598-1-julianbraha@gmail.com>
Subject: Re: [PATCH] mtd: maps: fix dead select of MTD_CFI_BE_BYTE_SWAP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_004340_529178_A30C6C4E 
X-CRM114-Status: GOOD (  28.54  )
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

On Wed, Jul 22, 2026, at 02:10, Julian Braha wrote:
> 'select' does not work on config options in a 'choice', so currently it is
> possible to enable MTD_PHYSMAP_IXP4XX without MTD_CFI_BE_BYTE_SWAP.
>
> Let's replace the select with 'depends on'.
>
> Note that, if we remove the select / dependency, the kernel will compile
> with MTD_PHYSMAP_IXP4XX=y and MTD_CFI_BE_BYTE_SWAP=n so if it would be
> better to remove the select, please advise as I do not have the hardware
> to runtime test this.
>
> This dead select was found by kconfirm, a static analysis tool for Kconfig.

The choice is forced to be MTD_CFI_BE_BYTE_SWAP when building for
big-endian IXP4XX, which I think means this will currently always
work correctly:

config MTD_CFI_NOSWAP
        depends on !ARCH_IXP4XX || CPU_BIG_ENDIAN
        bool "NO"

config MTD_CFI_BE_BYTE_SWAP
        bool "BIG_ENDIAN_BYTE"

config MTD_CFI_LE_BYTE_SWAP
        depends on !ARCH_IXP4XX
        bool "LITTLE_ENDIAN_BYTE"

endchoice

However, this is about to change, as we are in the process of
merging the patch to allow little-endian ARCH_IXP4XX builds
again, and we probably want a different solution here.

Importantly, the logic above is now broken when building for
any multiplatform target that includes both IXP4xx and
some other target using CFI with a different default endianess.
This has not been possible in any release version but will
be in linux-7.3.

> diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
> index f447902d707e..f300953cf9fa 100644
> --- a/drivers/mtd/maps/Kconfig
> +++ b/drivers/mtd/maps/Kconfig
> @@ -100,8 +100,8 @@ config MTD_PHYSMAP_IXP4XX
>  	bool "Intel IXP4xx OF-based physical memory map handling"
>  	depends on MTD_PHYSMAP_OF
>  	depends on ARM
> +	depends on MTD_CFI_BE_BYTE_SWAP if CPU_BIG_ENDIAN
>  	select MTD_COMPLEX_MAPPINGS
> -	select MTD_CFI_BE_BYTE_SWAP if CPU_BIG_ENDIAN
>  	default ARCH_IXP4XX
>  	help
>  	  This provides some extra DT physmap parsing for the Intel IXP4xx

I would think we want to remove the select here without a
replacement and enforce this at runtime by overriding
map->swap like

--- a/drivers/mtd/maps/physmap-ixp4xx.c
+++ b/drivers/mtd/maps/physmap-ixp4xx.c
@@ -125,6 +125,7 @@ int of_flash_probe_ixp4xx(struct platform_device *pdev,
        map->write = ixp4xx_write16;
        map->copy_from = ixp4xx_copy_from;
        map->copy_to = NULL;
+       map->swap = CFI_BIG_ENDIAN; /* or whichever one we need */
 
        dev_info(dev, "initialized Intel IXP4xx-specific physmap control\n");
 
This will force the CFI layer to always perform the same type of
swapping for the ixp4xx driver, regardless of CONFIG_MTD_CFI_*SWAP,
and regardless of any 'big-endian' or 'little-endian' properties
in the cfi-flash DT node that don't work on ARMv5/BE32.

Since there is extra swizzling in both ixp4xx_copy_from()
and in the ixp4xx LE flash_read16()/flash_write16(), I can
no longer work out whether CFI_HOST_ENDIAN is the correct
number of swaps, or if we want CFI_BIG_ENDIAN instead.

If I got the number of swaps correctly, we may actually be
able to simplify this all to the diff below, 

      Arnd

diff --git a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
index 19726ebd973d..aef14990e5f7 100644
--- a/drivers/mtd/chips/Kconfig
+++ b/drivers/mtd/chips/Kconfig
@@ -55,14 +55,12 @@ choice
 	  LITTLE_ENDIAN_BYTE, if the bytes are reversed.
 
 config MTD_CFI_NOSWAP
-	depends on !ARCH_IXP4XX || CPU_BIG_ENDIAN
 	bool "NO"
 
 config MTD_CFI_BE_BYTE_SWAP
 	bool "BIG_ENDIAN_BYTE"
 
 config MTD_CFI_LE_BYTE_SWAP
-	depends on !ARCH_IXP4XX
 	bool "LITTLE_ENDIAN_BYTE"
 
 endchoice
diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 9cefa3f9e5cb..e898150e82e0 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -101,7 +101,6 @@ config MTD_PHYSMAP_IXP4XX
 	depends on MTD_PHYSMAP_OF
 	depends on ARM
 	select MTD_COMPLEX_MAPPINGS
-	select MTD_CFI_BE_BYTE_SWAP if CPU_BIG_ENDIAN
 	default ARCH_IXP4XX
 	help
 	  This provides some extra DT physmap parsing for the Intel IXP4xx
diff --git a/drivers/mtd/maps/physmap-ixp4xx.c b/drivers/mtd/maps/physmap-ixp4xx.c
index c561468f95f6..139528585f25 100644
--- a/drivers/mtd/maps/physmap-ixp4xx.c
+++ b/drivers/mtd/maps/physmap-ixp4xx.c
@@ -39,17 +39,14 @@
 
 static inline u16 flash_read16(void __iomem *addr)
 {
-	return be16_to_cpu(__raw_readw((void __iomem *)((unsigned long)addr ^ 0x2)));
+	return __raw_readw((void __iomem *)((unsigned long)addr ^ 0x2));
 }
 
 static inline void flash_write16(u16 d, void __iomem *addr)
 {
-	__raw_writew(cpu_to_be16(d), (void __iomem *)((unsigned long)addr ^ 0x2));
+	__raw_writew(d, (void __iomem *)((unsigned long)addr ^ 0x2));
 }
 
-#define	BYTE0(h)	((h) & 0xFF)
-#define	BYTE1(h)	(((h) >> 8) & 0xFF)
-
 #else
 
 static inline u16 flash_read16(const void __iomem *addr)
@@ -62,8 +59,6 @@ static inline void flash_write16(u16 d, void __iomem *addr)
 	__raw_writew(d, addr);
 }
 
-#define	BYTE0(h)	(((h) >> 8) & 0xFF)
-#define	BYTE1(h)	((h) & 0xFF)
 #endif
 
 static map_word ixp4xx_read16(struct map_info *map, unsigned long ofs)
@@ -79,6 +74,9 @@ static map_word ixp4xx_read16(struct map_info *map, unsigned long ofs)
  * when attached to a 16-bit wide device (such as the 28F128J3A),
  * so we can't just memcpy_fromio().
  */
+#define	BYTE0(h)	(((h) >> 8) & 0xFF)
+#define	BYTE1(h)	((h) & 0xFF)
+
 static void ixp4xx_copy_from(struct map_info *map, void *to,
 			     unsigned long from, ssize_t len)
 {
@@ -125,6 +123,7 @@ int of_flash_probe_ixp4xx(struct platform_device *pdev,
 	map->write = ixp4xx_write16;
 	map->copy_from = ixp4xx_copy_from;
 	map->copy_to = NULL;
+	map->swap = CFI_HOST_ENDIAN;
 
 	dev_info(dev, "initialized Intel IXP4xx-specific physmap control\n");
 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
