Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C6FC54ED1
	for <linux-mtd@archiver.kernel.org>; Fri, 23 May 2025 16:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6XOmsrBqs+/i8E8//FJQXbeI2JAEquGDUgVMyo5Pre0=; b=jxT9YMZj0u6PI9
	f6EALHBRDdqAwIU6OWv8dwP9b9Y5P5lql//FKjlp/HtRy3SKkoZm/WLVJamubMlKCz8ivpEVz+1O0
	TugJkrb/1yLJDfLpgSvFypir4a53HBF4vrd9VbM2ybcdVQrAC+B6AgNjt9edhqL0vCYWubp3m4b2+
	gV0dvFTB2G143iF3S8zq6/rZUnF1jjLw6OyJ++c5e3oZt90ng5Jji0sVkhIz57DKcJArGdeb6ECVb
	mJwbA9LkvvWf8/LekerbRAceyd2MZBV3eHTykvsxyZ6uYJwQOQjkY8ZOC8gpCrlKSt7fXy7Yv3SPP
	cwQ+d+zuHlGOWe0Fntiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVWZ-00000004REq-0A1E;
	Fri, 23 May 2025 16:45:35 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIV6t-00000004NAd-3Ywp;
	Fri, 23 May 2025 16:19:05 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-231f6af929eso638345ad.2;
        Fri, 23 May 2025 09:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748017143; x=1748621943; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GR9c+io02jCTq+nSl/IWIXfnXKi6xCCxyUhr5PW4R4U=;
        b=jHRN5c/P/v00S1ernK90S/5D/jAOwwYJqWxxxr66rHavM2s9OdVdyXN7GEKnrqZ7us
         YA9/fVkXndJXkvLtwQQLSpOVUmlNFOWjZliSDrBLWHfUBa4lZkVjkNOl4wvR56SIhxmP
         6NMrrqI8DYnOlb9vtyflB+/vcUhwwkX7cGymzqwFtxLfqB/c2hAs6IyG6cvJunCs0Yw3
         0vpMs6QlRBGRCth+NGZA6sUbSUGelUX5Bj06KX3Av38vejDELvJpQCrgyTS/GRddJA/B
         TTdHWSbxDT28Pm1SIjA84H36ViZ5ZvK5sDrJj/AZz3lX6owmZlstoBSTwn5iJhpfqrqc
         G+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748017143; x=1748621943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GR9c+io02jCTq+nSl/IWIXfnXKi6xCCxyUhr5PW4R4U=;
        b=rNc+0yv444oSBRlKDg5XDkMhBUjBvVuwTlYDz30ta2iP7t3twYZGJOW0OYnuANAhyQ
         2LP0vLk2tNpPcmDA9JTNCLiER8K4wWkAUW1zmq7H5VBOO95Z3aVhbKw1t9wFAYwPTOUH
         8W99ky0bTRJS3GUxtAyuWE/bGqFcy79QY/bAVI25fKQtbZGcU8dMFjgVAKpPZ6Y4Tk6x
         4J2mYUAZ4AKiPxhAtKYMaiUBe+8MX0ydx6GU2/jxeupxgFjWJumIOgxxLlSCp0oDWvfc
         bdIw2wBCjq14PoDvJ14JElja89l/lrGvb7kUdc4+tbpac6KNUbIkfsWfS5RnLj9Rv6di
         Pzlw==
X-Forwarded-Encrypted: i=1; AJvYcCVTKKcPT2BK3xmQYJf3P2QEPpmzG6ilNkp7vJDYRaQweeAKcZ9zQgar8jFq0HXUcC4gamNV++Qc583hsA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw1MYxkDQzKM3OE4cI1ic/FpQRNPWfo58KPDlJqs5rQfYYEyrQ
	9PjZTSlIqYUZ3hzL7fLu7E2SwV8IT3rh3fwH2PD1jiGozzBgDA+QWBJY
X-Gm-Gg: ASbGncu4JvzYJ5yUW1jH0a4Prk+aW0f4nc6yqKyCb2Vh8sn3KaIQ5rO0Di060SgszVN
	x+bd5Mgza6BV62UrFQzmZS0QEhzonS+Zk8CjQMMrGYSarwQL+8P9u5X9bX2XzGxaCyw6HIzd48R
	CqBEZTETX5RdcBbUpWESv84CbgxBTzaCqeuMojqFuaU5JELBIzZErmGJJFrzRZpnZQRRHvA6F2P
	x3KvcL/xbVCuqqR0ZJQlfYjrrWwyimn91ftZqhZmsNX7FSg1CDW11vj7qdwa9MKHrixCoCB2u/2
	raLR5GKOcIKLj1IpjAP6ThOK3Pc7aTcagqATCoQLM7S53iUK18I=
X-Google-Smtp-Source: AGHT+IGVlhz4RAvPDmSsoQifrgEklOGtjfVdQDVUosQRKkGJ73NY9m813v7XM0j4bfszd9ayY9WGbQ==
X-Received: by 2002:a17:903:1968:b0:231:c05f:29d5 with SMTP id d9443c01a7336-233f2189405mr47801245ad.6.1748017142469;
        Fri, 23 May 2025 09:19:02 -0700 (PDT)
Received: from localhost ([2001:250:5800:1000::3fc8])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-233abb99a06sm50503205ad.254.2025.05.23.09.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:19:02 -0700 (PDT)
Date: Sat, 24 May 2025 00:18:59 +0800
From: Zixian Zeng <sycamoremoon376@gmail.com>
To: Michael Walle <mwalle@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	dlan@gentoo.org, ziyao@disroot.org
Subject: Re: [PATCH 2/3] mtd: spi-nor: Add GD25LB512ME GigaDevice flash_info
Message-ID: <aDCf84cRw0tmcAbm@calculate>
References: <20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com>
 <20250523-sfg-spifmc-v1-2-4cf16cf3fd2a@gmail.com>
 <DA3HXNN7HTD2.2NUKORU5V6CS2@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DA3HXNN7HTD2.2NUKORU5V6CS2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_091903_888673_22204D96 
X-CRM114-Status: GOOD (  17.50  )
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

Hi, Michael, Thank you for your reviews.

On Fri, May 23, 2025 at 01:16:50PM +0200, Michael Walle wrote:
> Hi,
> 
> > Add GD25LB512ME SPI-NOR flash information
> 
> Please have a look at [1].
> 
> This flash supports SFDP, do you really need a new entry in the
> flashdb? Could you try without it?
> 
> In any case, could you please dump the SFDP see [1], too.
> 
> [1] https://docs.kernel.org/driver-api/mtd/spi-nor.html
> 
> -michael

I was following the testing requirements from [1].
Before that, I have applied the patch:
"mtd: spi-nor: Add GD25LB512ME GigaDevice flash_info"
Because without this patch, the spi-nor device cannot be detected normally.

------------------------------- LOG ------------------------------------
root@localhost ~ # dmesg | grep -i spi
[   10.199526] spi-nor spi0.0: supply vcc not found, using dummy regulator
[   11.206477] spi-nor spi0.0: unrecognized JEDEC id bytes: c8 67 1a ff c8 67
[   11.213691] spi-nor spi1.0: supply vcc not found, using dummy regulator
[   12.220614] spi-nor spi1.0: unrecognized JEDEC id bytes: c8 67 1a ff c8 67
root@localhost ~ # cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
cat: /sys/bus/spi/devices/spi0.0/spi-nor/partname: No such file or directory

Testing output atfer that patch:

------------------------------------------------------------------------
This flash is populated on the SG2042 Pioneer board and was tested at
100MHz frequency using the spi-sg2044-nor SPI controller.

root@localhost ~ # cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
gd25lb512me
root@localhost ~ # cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c8671a
root@localhost ~ # cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
gigadevice
root@localhost ~ # xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060102ff00060110300000ffc8000103900000ff84000102c000
00ffffffffffffffffffffffffffffffffffe520eaffffffff1f44eb086b
003b00bbfeffffffffff00ffffff44eb0c200f5210d800ffd531b1fe83d6
1458ec6006337a757a7504bdd55c2906740008500001ffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffff002050169df9
8156d9c8ffffffffffffffffffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffff38ff0ff215cdcff
root@localhost ~ # sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
859eb314b0500aa3e3dc5a1ad514f1013387c7aaa40147ed2d616ffc4b6d851c  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
root@localhost ~ # #Dump debugfs data
root@localhost ~ # cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x13
  mode cycles	0
  dummy cycles	0
 1S-1S-4S
  opcode	0x6c
  mode cycles	0
  dummy cycles	8
 1S-4S-4S
  opcode	0xec
  mode cycles	2
  dummy cycles	4
 4S-4S-4S
  opcode	0xec
  mode cycles	2
  dummy cycles	4

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x12
 1S-1S-4S
  opcode	0x34
 1S-4S-4S
  opcode	0x3e
root@localhost ~ # cat /sys/kernel/debug/spi-nor/spi0.0/params
name		gd25lb512me
id		c8 67 1a ff c8 67
size		64.0 MiB
write size	1
page size	256
address nbytes	4
flags		HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR | SOFT_RESET

opcodes
 read		0x13
  dummy cycles	0
 erase		0x21
 program	0x12
 8D extension	none

protocols
 read		1S-1S-1S
 write		1S-1S-1S
 register	1S-1S-1S

erase commands
 21 (4.00 KiB) [1]
 5c (32.0 KiB) [2]
 dc (64.0 KiB) [3]
 c7 (64.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-03ffffff |     [ 1  ] | no
root@localhost ~ # dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.0279486 s, 75.0 MB/s
root@localhost ~ # mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
root@localhost ~ # mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
root@localhost ~ # hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
root@localhost ~ # sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
root@localhost ~ # mtd_debug write /dev/mtd0 0 2097152 spi_test
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
root@localhost ~ # mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
root@localhost ~ # sha256sum spi*
a2ebfaebe38974847a4efb628b29a72f1d50e78c17318869d8954b033dc32e5d  spi_read
a2ebfaebe38974847a4efb628b29a72f1d50e78c17318869d8954b033dc32e5d  spi_test
root@localhost ~ # mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 67108864 (64M)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0
------------------------------------------------------------------------

Best regards,
Zixian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
