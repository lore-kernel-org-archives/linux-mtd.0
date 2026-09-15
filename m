Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B45C88E75
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2026 06:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TigoLFnCNB4wluGHI+yQKE8CDInW2y8nG4xzWPB44c4=; b=laTWGfEnQyYcag
	SU9RWqPz14a6Umeyd5ts05qzHSin1+ysN8DUvBUHVUnSpFiIL7mO4JdXJWxJwfFydhx3ZRHJIpyWl
	saAkXYfA0O4hckA3EjTY4m9ZS9BhYOHTL5cSLdS56QdvSSs9kjOIOdya3MjiUrIPyJMElRUptzFqf
	1PMcYOC5e6TpzSE0Uxe/uuyqbi3yJ3z8CUjnRlK0jf7XePyJYHdcEEWnEbQnX0XZFlhcApHdXYmEf
	cwECmwHlGjsElidcNtd+cIBYZ4bndwXADDwfDL0YTOna51I9S36LzcDFfanXjBTB6RR1lCJ0bUrbt
	aSfKcUCy4i5LXFau95Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6MQd-00000005Krl-06Oa;
	Tue, 15 Sep 2026 06:14:03 +0000
Received: from smtp14.infineon.com ([2a00:18f0:1e00:4::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6MQa-00000005KrH-19z2
	for linux-mtd@lists.infradead.org;
	Tue, 15 Sep 2026 06:14:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1789452840; x=1820988840;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Iozr+iVqFM+0mU78oV100tjTbmjOLgKxjCBYX13fizk=;
  b=KjFsY9ONyL3JAyo9tYXxVYvUkanF2OXv/sLusNz/odqAbjPNZfFvMgGI
   ySyXKHd7IFLbfmWTuc+JkO4nolmEONaLYcAQKnUZTWuMkL9pU0eWGBEqR
   1YhnSMYxlJOKQqlXSv6MtQnoX9KnsvfDNUmPyjvY8qP+Rl3bsexQ2VUcn
   k=;
X-CSE-ConnectionGUID: qnCh4kfCRdWxKBR6gOLfgA==
X-CSE-MsgGUID: pFN8NOrMQ4OYyqrW4l8tIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="147058621"
X-IronPort-AV: E=Sophos;i="6.27,103,1787004000"; 
   d="scan'208";a="147058621"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE814.infineon.com) ([172.23.29.40])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 08:13:58 +0200
Received: from MUCSE813.infineon.com (172.23.29.39) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 15 Sep
 2026 08:13:57 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE813.infineon.com
 (172.23.29.39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 15 Sep
 2026 08:13:57 +0200
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.046; Tue, 15 Sep 2026 08:13:57 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <mwalle@kernel.org>, <pratyush@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <tudor.ambarus@linaro.org>,
	<alex@sverdlin.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] mtd: spi-nor: spansion: Assign .fixups to s25fs256s1
Thread-Topic: [PATCH 2/2] mtd: spi-nor: spansion: Assign .fixups to s25fs256s1
Thread-Index: AQHdRASdQI/rAfbWgkienan9hYKZEbbNfGoAgAAmnTCAAAyXAIABdAOQ
Date: Tue, 15 Sep 2026 06:13:57 +0000
Message-ID: <e15daee278f346cd8dae030e2409445e@infineon.com>
References: <20260914-s25fs256s-fixup-v1-0-e94019455c1e@infineon.com>
 <20260914-s25fs256s-fixup-v1-2-e94019455c1e@infineon.com>
 <DLETVUMUX3AN.3SSH7NN2CKAIU@kernel.org>
 <fb4398e88939472eaa86cdc098a3d265@infineon.com>
 <DLEXS5VCYB1P.1NJI7ZU6HYUHF@kernel.org>
In-Reply-To: <DLEXS5VCYB1P.1NJI7ZU6HYUHF@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_231400_634430_1AF95CB7 
X-CRM114-Status: GOOD (  22.41  )
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

Hi Michael,

> Hi Takahiro,
> 
> On Mon Sep 14, 2026 at 9:11 AM CEST, Takahiro.Kuwano wrote:
> > Hi Michael,
> >
> >> On Mon Sep 14, 2026 at 6:50 AM CEST, Takahiro Kuwano via B4 Relay wrote:
> >> > From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
> >> >
> >> > s25fs256s1 has incorrect SFDP entries, like s25fs512s and s25fs128s1.
> >> > Assign the common s25fs_s_nor_fixups to s25fs256s1 to fix its page size
> >> > and sector map.
> >>
> >> Do you have an SFDP dump by chance? I haven't found one on the list
> >> for this flash.
> >>
> >
> > Yes, but param tables are located beyond PAGE_SIZE(1000h)...
> 
> Could you test the following patch if that helps?
> 
> --- a/drivers/mtd/spi-nor/sysfs.c
> +++ b/drivers/mtd/spi-nor/sysfs.c
> @@ -99,10 +99,26 @@ static umode_t spi_nor_sysfs_is_bin_visible(struct kobject *kobj,
>  	return 0;
>  }
> 
> +static size_t spi_nor_sysfs_bin_size(struct kobject *kobj, const struct bin_attribute *attr, int n)
> +{
> +	struct spi_device *spi = to_spi_device(kobj_to_dev(kobj));
> +	struct spi_mem *spimem = spi_get_drvdata(spi);
> +	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
> +	struct sfdp *sfdp = nor->sfdp;
> +	size_t sfdp_size = sfdp->num_dwords * sizeof(*sfdp->dwords);
> +
> +	if (attr == &bin_attr_sfdp)
> +		return sfdp_size;
> +
> +	return 0;
> +}
> +
> +
>  static const struct attribute_group spi_nor_sysfs_group = {
>  	.name		= "spi-nor",
>  	.is_visible	= spi_nor_sysfs_is_visible,
>  	.is_bin_visible	= spi_nor_sysfs_is_bin_visible,
> +	.bin_size	= spi_nor_sysfs_bin_size,
>  	.attrs		= spi_nor_sysfs_entries,
>  	.bin_attrs	= spi_nor_sysfs_bin_entries,
>  };

This didn't help as SFDP cache size is truncated to PAGE_SIZE in sfdp.c:

	/*
	 * Limit the total size to a reasonable value to avoid allocating too
	 * much memory just of because the flash returned some insane values.
	 */
	if (sfdp_size > PAGE_SIZE) {
		dev_dbg(dev, "SFDP data (%zu) too big, truncating\n",
			 sfdp_size);
		sfdp_size = PAGE_SIZE;
	}

With skipping above part,

zynq> hexdump /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
0000000 4653 5044 0106 ff05 0000 0901 1090 ff00
0000010 0500 1001 1090 ff00 0600 1001 1090 ff00
0000020 0081 1a01 10d8 ff00 0084 0201 10d0 ff00
0000030 0101 5001 1000 0100 ffff ffff ffff ffff
0000040 ffff ffff ffff ffff ffff ffff ffff ffff
*
0001000 0201 4d19 8101 3030 ff84 ffff ffff ffff
0001010 5251 0259 4000 5300 5146 1700 0019 0900
0001020 0809 0211 0502 1903 0102 0008 0703 1000
0001030 0000 8000 fe00 0001 ff01 ffff ffff ffff
0001040 5250 3149 2133 0102 0800 0100 0003 0700
0001050 4101 544c 3032 1000 3253 4635 3253 3635
0001060 ff53 ffff ffff 3030 0180 84eb 7508 7a28
0001070 7564 7a28 8864 0a04 0001 8c01 9606 2301
0001080 2300 f000 ff09 ffff ffff ffff ffff b0a5
0001090 ffe7 ffb2 ffff 0fff eb48 ffff ffff bb88
00010a0 fffe ffff ffff ffff ffff eb48 200c d810
00010b0 d812 ff00 72e2 ff1d 2691 dd07 83ec 4418
00010c0 858a 757a bdf7 5cd5 f68c ff5d 30f0 a1f8
00010d0 8e6b ffff dc21 ffdc 65fc 08ff 0004 0000
00010e0 65fc 04ff 0002 0000 65fd 02ff 0004 0000
00010f0 00fe ff02 7ff1 0000 7ff2 0000 fff2 01fe
0001100 02fe ff02 fff2 01fe 7ff2 0000 7ff1 0000
0001110 01fe ff02 7ff1 0000 7ff4 0003 fff4 01fb
0001120 03fe ff02 fff4 01fb 7ff4 0003 7ff1 0000
0001130 04fe ff00 fff2 01ff 05ff ff00 fff4 01ff
0001140

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
