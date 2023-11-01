Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD042C4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Nov 2023 16:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4bfLL02m52YW79kVYCNteiDANzvKDetSMFq0veHI34=; b=C7oty13CW8vDssAJfYY7NMguPm
	HWbEafVRLEHlR6yRYhk+aQ0rJIDDjTKBENk/eouVHmqlv5wjCX70+xfM25ojBg8QxrH+5ih3wuHuv
	mV2VtZc4vVcB239LzCQjj/O6tC4fjwezY+ZuiPxtqiCyvmVUp6OiXf4J2/++GUtIOOrXctpWAolOR
	9KLPk+Jwg3bBvuUl4xOTJBFAvcGOO23AGRZx4CsmDNBYiIvgCzejEoxQNWo/G47eKlPuHgLKsevaP
	lKNJqnXsXQNxTIE4tBPbmmn9TMuWYBoYB+MpRy/Silq4HRbbrgB9NCuV7t4elK62UJBmqI9KBor9z
	gYoChtdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyDuX-007nmk-09;
	Wed, 01 Nov 2023 16:17:41 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyDuQ-007nls-15;
	Wed, 01 Nov 2023 16:17:38 +0000
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id AB6158768C;
	Wed,  1 Nov 2023 17:17:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1698855452;
	bh=xP3OgnNtdv3dtOIzqmWSC4IhLMsLSPjzgz1ibu2JGu8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XiuMMIuRQtRdjKoztZf9CaWWvxKtkPQbRd0sRj5nMsI3RwIF41QsfQG+TI4Jt6e/3
	 PmuspDqRk9+g/N+N1tpLxU+cVwU7U69V+Hq2Md2sxzrfpTPAr9f6jTcrQ8MAX+kTdx
	 fhoO9aFH+i8Sh/C/YyMMLi11qkCV9oqsdXPtxx9kIE7bRUvOGZXHswaRzBfEHv180r
	 sKrG8MLMA5VhLlEmky6MDltlBqMF83XhuMUgENjwy0f3mNmz+DQBjOONzGOoG5uwXi
	 FhA18yoUe/8UZFaeQTW+91NFNYfmo/1V27hWyVJwsdFXIUsUbJ0PkIX62kPOQgJ5aV
	 AmQAHVnf/Jhkg==
MIME-Version: 1.0
Date: Wed, 01 Nov 2023 13:17:32 -0300
From: Fabio Estevam <festevam@denx.de>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: michael@walle.cc, takahiro.kuwano@infineon.com, pratyush@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bacem.daassi@infineon.com, miquel.raynal@bootlin.com, richard@nod.at
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
In-Reply-To: <7fc95ddf-c860-49b9-93de-ef32b9383e42@linaro.org>
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
 <20231101145853.524045-3-tudor.ambarus@linaro.org>
 <7fc95ddf-c860-49b9-93de-ef32b9383e42@linaro.org>
Message-ID: <216d99d671caa2465519fcc3360c5001@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_091734_666027_9B118997 
X-CRM114-Status: UNSURE (   9.23  )
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

Hi Tudor,

On 01/11/2023 13:04, Tudor Ambarus wrote:

> this is wrong, it should have been
> 	bool multi_die = nor->mtd.size != die_size;


I applied the following changes on top of v2:

--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1067,12 +1067,17 @@ static int spi_nor_read_sr2(struct spi_nor *nor, 
u8 *sr2)
   */
  static int spi_nor_erase_die(struct spi_nor *nor, loff_t addr, size_t 
die_size)
  {
-       bool multi_die = nor->mtd.size == die_size;
+       bool multi_die = nor->mtd.size != die_size;
         int ret;

-       dev_dbg(nor->dev, " %lldKiB\n", (long long)(die_size >> 10));
+       dev_info(nor->dev, " %lldKiB\n", (long long)(die_size >> 10));

         if (nor->spimem) {
+               dev_info(nor->dev, "***** nor->params->die_erase_opcode: 
0x%x\n", nor->params->die_erase_opcode);
+               dev_info(nor->dev, "***** nor->addr_nbytes: %d\n", 
nor->addr_nbytes);
+               dev_info(nor->dev, "***** addr 0x%llx\n", addr);
+               dev_info(nor->dev, "***** multi_die: %d\n", multi_die);
+
                 struct spi_mem_op op =
                         
SPI_NOR_DIE_ERASE_OP(nor->params->die_erase_opcode,
                                              nor->addr_nbytes, addr, 
multi_die);
, but erase is still not working:


~# time flash_erase /dev/mtd0 0 0
Erasing 131072 Kibyte @ 0 --  0 [   14.733446] spi-nor spi0.0:  65536KiB
% complete [   14.739932] spi-nor spi0.0: ***** 
nor->params->die_erase_opcode: 0xc4
[   14.747311] spi-nor spi0.0: ***** nor->addr_nbytes: 4
[   14.752402] spi-nor spi0.0: ***** addr 0x0
[   14.756524] spi-nor spi0.0: ***** multi_die: 1
[   14.761121] spi-nor spi0.0:  65536KiB
[   14.764807] spi-nor spi0.0: ***** nor->params->die_erase_opcode: 0xc4
[   14.771289] spi-nor spi0.0: ***** nor->addr_nbytes: 4
[   14.776369] spi-nor spi0.0: ***** addr 0x4000000
[   14.781004] spi-nor spi0.0: ***** multi_die: 1
Erasing 131072 Kibyte @ 0 -- 100 % complete

real	0m0.061s
user	0m0.006s
sys	0m0.053s

~# hexdump -C /dev/mtd0
00000000  d4 a1 8c 16 ad 4d b2 df  3d 2a af c2 ae 0a 8a c1  
|.....M..=*......|
00000010  5f 2d 7a 17 9f c3 a4 46  cd f9 80 b8 1e 33 43 25  
|_-z....F.....3C%|
....

Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
