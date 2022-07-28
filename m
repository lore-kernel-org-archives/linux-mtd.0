Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD9DC04A68
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jul 2022 02:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cg2QON2E7rA91Fv+sBFWzySszyfNnhxsV/L6SHxZdEo=; b=nvHsHD/yIpjX7g
	CT0Ca+5uQjRzvJRYqwM0zBaS9UgYtU5Bc9G+TERweevwIo8xu1wGwarJaLhHf8eOIvOBAMvnLV7+v
	RmwC5oSxnx+TwhSajDepcK+9Qc9e5wJtyh5orejuliUhmbPpQrFJnWS6JCP30+MPr4KBVENpw1rIE
	ul96LlPeXlELuWlKVJzuPLcpaOmudO5Weh/KTQQVdO3EcdRadtTxIy+ZuzZj2s64QXZeVUpLvglzS
	0s67XYTyVTAO/DodrmTU4kYha4rJ7sSsHksN/WR26G6B4R3dLMI1vSLSJVC7/Xi4wTzW5MtbqbUkc
	/rzoN03yM8ut0Zi6wB+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGtBp-002oax-Pe; Thu, 28 Jul 2022 02:23:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGtBj-002oS4-SV
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2022 02:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658975027; x=1690511027;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mo9mynxryvdXiiS4C5lXFJk9m2CyqVWDTeehwlCn96k=;
  b=A21njeipZp61EEHu5jVKDn0cbSZYg3C5TirrwfkLmfnj/2kMC7Ru0Yfg
   nqPz8S9YViv8Jky+AjBtmChLMtH+W6HuM2nmOmqzO/eXC8Rgz8LPTNqMD
   K8FFJtsBJ/JCZAjxKeD92IuOiZmAA63M4vfz4E5xjr8YIkarNNAMzQk35
   KIv7AM2hm/YJ9epjqVyl5yZuWXHkdhXxmMI7zHZOAlNIuP5XPn6TOK+s+
   nGD5fR1oI56vdLbWAl1xpjuV8jb36gy5p3d6L4gvDpi+EcgXWyO3bgI4j
   InnSg+XXfqTJVGMzs3SBbZ0K40mSyitQ1I3D2DCwgkJvwu3sXxZttT689
   A==;
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="169846675"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2022 19:23:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 19:23:37 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.28 via Frontend Transport; Wed, 27 Jul 2022 19:23:35 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <linux-mtd@lists.infradead.org>, <tkuw584924@gmail.com>,
	<Takahiro.Kuwano@infineon.com>, <tudor.ambarus@microchip.com>,
	<p.yadav@ti.com>, <michael@walle.cc>
CC: <vigneshr@ti.com>, <Bacem.Daassi@infineon.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>
Subject: Re: [PATCH v17 0/7] mtd: spi-nor: Add support for Infineon s25hl-t/s25hs-t
Date: Thu, 28 Jul 2022 05:23:30 +0300
Message-ID: <165897487177.51423.13629273850895321628.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220725092505.446315-1-tudor.ambarus@microchip.com>
References: <20220725092505.446315-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_192348_066959_20906388 
X-CRM114-Status: GOOD (  15.60  )
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

On Mon, 25 Jul 2022 12:24:58 +0300, Tudor Ambarus wrote:
> v17 introduces nor->params->addr_mode_nbytes in order to track the number
> of address bytes of current address mode. This is useful when the flash
> operates with 4B opcodes but needs the internal address mode for opcodes
> that don't have a 4B opcode correspondent. Such an example is the Infineon
> Semper chips which provide 4B opcodes for read/program/erase but do not
> provide 4B opcodes for Read/Write Any Register. These registers are indexed
> by address and require the internal address mode of the flash before
> Read/Write Any Register opcodes are issued.
> 4B opcodes are preferred over changing the flash's address mode to 4byte,
> as set_4byte_addr_mode could be done in a non-volatile way and could break
> the boot sequence. Thus we need to track the flash's internal address mode
> so that we can use the 4B opcodes together with the opcodes that don't
> have a 4B opcode correspondent.
> All other minor comments were addressed as well:
> - s/address width/ address nbytes where needed
> - "mtd: spi-nor: spansion: Add local function to discover page size" no
> longer replaces the hardcoded value of 3 for the number of address bytes.
> - few patches were dropped as they no longer made sense with the
> introduction of nor->params->addr_mode_nbytes.
> 
> [...]

Moved params->addr_mode_nbytes initialization to dedicated line,
s/int i;/unsigned int i; and applied to spi-nor/next, thanks!

[1/7] mtd: spi-nor: s/addr_width/addr_nbytes
      https://git.kernel.org/mtd/c/c452d49849d4
[2/7] mtd: spi-nor: core: Shrink the storage size of the flash_info's addr_nbytes
      https://git.kernel.org/mtd/c/aa5d980a144c
[3/7] mtd: spi-nor: Do not change nor->addr_nbytes at SFDP parsing time
      https://git.kernel.org/mtd/c/47c6f8a67f2c
[4/7] mtd: spi-nor: core: Return error code from set_4byte_addr_mode()
      https://git.kernel.org/mtd/c/08412e72afba
[5/7] mtd: spi-nor: core: Track flash's internal address mode
      https://git.kernel.org/mtd/c/d7931a215063
[6/7] mtd: spi-nor: spansion: Add local function to discover page size
      https://git.kernel.org/mtd/c/a6b50aa12796
[7/7] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and fixups
      https://git.kernel.org/mtd/c/b6b23833fc42

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
