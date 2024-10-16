Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FE5D206A7
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2024 07:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e4AyBCM/f/kXVRU1pQfTbkpfyDdNR6Z5aX8f3F9kNDc=; b=Xx/wFjECBk+GxD
	Ya1LcY0Sfi3vC9B9zFxz3pZ+H2UM34fPYk+MAYShnJgaXqqYgfUXCFPe6pSYahrt1Ih0FDgZmudHB
	3D7m6hq2PeK4OayTCnyyvkOWopaO1sZPUyhkyPTEuy+YeqKOYyqeKr1yI3uCS4GGPzVfFKQaFlefW
	NeelW8MRUB7cRx95wb8/hOv/jqDFiTtxN4PQGATiadqXZiKY6T/whcMUdeJbir1c14lAP0EPjmlxg
	MvHColVwfjH8coadu6oG0Y+znn2xCbL328qrjEd3Tw170qWnn3zwqcwleWxv5cILVOps5A/QMc5Aa
	OheBkz71t9ewsqVSgkNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0yXc-0000000Aq9n-3uSG;
	Wed, 16 Oct 2024 07:33:56 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0yXa-0000000Aq8g-02rZ
	for linux-mtd@lists.infradead.org;
	Wed, 16 Oct 2024 07:33:56 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5c9428152c0so8002351a12.1
        for <linux-mtd@lists.infradead.org>; Wed, 16 Oct 2024 00:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729064031; x=1729668831; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cXa1hSmQlBz3jTyKXhPdDBCqIFGgPKP+x3HVoQSXBrA=;
        b=MG7MrV+dOeFkKbl11B/ZisvNrNHIV0/zuU22XqtQqUhyi6xIYrrszUjLON6sMKGv6M
         T/4etbhkXdfDD3b/jpnQ35pBUi6Z6lv2urssj2i6Y1c4gbvyEZ/fB0Hs5xBPKPBc8GnJ
         dpjTvj/HUu0W6yqzLaDkjKHymciavjxq/KxbtZaJIKguoDSljdyE+7LBwoOm/YHIiyZj
         KA8wj0QQrLA1aE+LpHhFw6qkh4YqlLGave0ANgBwA+GZAhD2bkk3oYFGoBRLGfy6paUc
         QgXkEJzqiYeTuDXfOajMjB5aH8KqAPRBHRIKrKCM7549NMicaC7wesoNuGLg+bwWBzO8
         CArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729064031; x=1729668831;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXa1hSmQlBz3jTyKXhPdDBCqIFGgPKP+x3HVoQSXBrA=;
        b=ElOmbItoTZVwQLANMdFsfVaZHG/v4pJhSluvTTGuHf3hvg5cBIOxvCucDagM8U6/eO
         w1rZ6belooCgWboPBX4Z+FZc9d8ucvAps0g17zkmxb47p2QD9av79GKM0L2AlDOKIer2
         A65vTzgrXEY0EwnYXds2QNvXE6bL65vM4Y8RkHA7e6PfEkSEyPPL9y0fl3N0pJ+TavR9
         8PIuXn7wKeYLx0NtFxp/5YF4QEMUDSMRw47RwL4iFTcgL2w/W2khIdSNcndPbTGbw71b
         d+QXQfNlJujwMidEB1hXwgxwqo3zYz5GWAbdQKgZoXs5oPdYd2yRfpHD+qkgh/oKW5aZ
         Swdw==
X-Forwarded-Encrypted: i=1; AJvYcCX/dwjJTx0ZMdLpTupoyPolTc+RvxAmpxRLHXst4bvV7G70J+aQMkcrpYTADlJtgwMvEYXWseoXKTI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsF8MRAwPu5TQIyGFkJIe5avNwwzGvaq3dAGWEhIRVwNLzsa6+
	6GDs/+jVxRG5Rnw5BP2BX5byPPHFmw8EcPl7cdx4TCLFr8di9ByN
X-Google-Smtp-Source: AGHT+IHjg+HCf0vA3R+CEKZXyod/7JNMTqttYepOdFYYHMkdEMBARuAb7yvcJsVGJ6k7L44AOzsbeA==
X-Received: by 2002:a17:907:c8a2:b0:a9a:161:8da4 with SMTP id a640c23a62f3a-a9a34f0d1ebmr238639766b.55.1729064031009;
        Wed, 16 Oct 2024 00:33:51 -0700 (PDT)
Received: from Ansuel-XPS. ([176.200.96.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a2971715fsm148567266b.26.2024.10.16.00.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 00:33:50 -0700 (PDT)
Message-ID: <670f6c5e.170a0220.373da5.7bb7@mx.google.com>
X-Google-Original-Message-ID: <Zw9sWo8pfBocRc1T@Ansuel-XPS.>
Date: Wed, 16 Oct 2024 09:33:46 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>,
	upstream@airoha.com
Subject: Re: [PATCH 2/3] dt-bindings: mtd: Add Documentation for Airoha
 fixed-partitions
References: <20240925101422.8373-3-ansuelsmth@gmail.com>
 <20240925133003.619c40c4@xps-13>
 <66f3f58e.5d0a0220.5d655.b48a@mx.google.com>
 <20240925135256.32d3a0f7@xps-13>
 <66f3fcb7.5d0a0220.3ca4c2.ba83@mx.google.com>
 <20240930114819.609f9341@xps-13>
 <66fa7915.050a0220.1da288.aeca@mx.google.com>
 <20241001104225.67483dab@xps-13>
 <66fbcee8.df0a0220.2ad0cb.4f6a@mx.google.com>
 <20241002100006.5995fd10@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241002100006.5995fd10@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_003354_201167_D9BF84FE 
X-CRM114-Status: GOOD (  58.02  )
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

On Wed, Oct 02, 2024 at 10:00:06AM +0200, Miquel Raynal wrote:
> Hi Christian,
> 
> > > > > > Ok probably the description isn't clear enough. The missing info that
> > > > > > require this parser is the flash end.
> > > > > > 
> > > > > > Following the example we know the size of rootfs_data and start offset
> > > > > > AND we know the size of the ART partition.
> > > > > > 
> > > > > > There might be a space in the middle unused between the rootfs_data
> > > > > > partition and the art partition. What is derived is the starting offset
> > > > > > of the art partition that is flash end - art partition size.
> > > > > > (where flash end change and is not always the same due to how the special
> > > > > > bad block managament table reserved space is handled)
> > > > > > 
> > > > > > This is why 0xffffffff, used as a dummy offset to signal it will be parsed at
> > > > > > runtime. On second tought tho maybe using this dummy offset is wrong and
> > > > > > I should just have something like
> > > > > > 
> > > > > > length = <0x300000>;
> > > > > > 
> > > > > > Is it clear now? Sorry for any confusion.    
> > > > > 
> > > > > I'm sorry but not really. You know the end of the physical device and
> > > > > the size of the ART partition, so you must know its start as well?
> > > > >    
> > > > 
> > > > Before the system boot we know:
> > > > - size of the ART partition
> > > > - real size of the physical device (512mb... 1G... 64mb...)
> > > > 
> > > > When the physical device is probed (nand) a special driver is loaded
> > > > (before mtd parsing logic) that change the physical size of the device
> > > > (mtd->size) as at the end of the nand some space is reserved for bad
> > > > block management and other metadata info.  
> > > 
> > > Here you are explaining what you intend Linux to do, right? I would
> > > like to understand what you are trying to solve. I dont understand why
> > > you need the size change, I don't understand why you don't know the
> > > start of the ART partition, I don't understand what the data you are
> > > hiding contains and who uses it :-) I'm sorry, this is too unclear yet.  
> > 
> > Totally not a problem and thanks a lot for you keep asking them... More
> > than happy to clear things, I'm trying to solve a problem present on
> > Airoha SoC and upstreaming a correct parser for it.
> > 
> > What I'm trying to solve:
> > 
> > Correct access to this partition at the end of the flash in an automated
> > way.
> > 
> > The content of this partition is the usual ART partition found on lots of
> > embedded devices. MAC address, wifi calibration data, serial. Usage is
> > NVMEM cells and userspace with dd command to extract data from.
> > 
> > Airoha use something also used by some mediatek SoC. They call it BMT
> > and it's currently used downstream in OpenWrt and they firmware. This is
> > also used in the bootloader.
> > 
> > The usage of BMT is a custom way to handle bad blocks entirely by
> > software. At the end of the flash some space is reserved where info
> > about all the blocks of the flash are put. I'm not 100% sure about the
> > functionality of this but it can relocate block and do magic things to
> > handle bad blocks. For the scope of this change, the important info is
> > that after the BMT is probed, the operation of "reserving space" is done
> > by reducing the MTD flash size. So from the MTD subsystem, it does see a
> > smaller flash than it actually is.
> > 
> > The reserved space change! Across SoC or even devices but the BMT is a
> > must where it's used as bootloader makes use of it and writing to it
> > might confuse the bootloader corrupting data. (one block might be
> > flagged as bad ad data moved, BMT driver validates his table and do
> > operation)
> 
> Ok, I think that's way clearer now.
>

Hi sorry for the delay, very happy this is better now.

> So the BMT driver does not exist in mainline Linux, but you would like
> to skip this part of the MTD device to avoid smashing it. And it is in
> use by the vendor Bootloader I guess?

Yes correct, idea is to permit easier access to the partition. I hope
(and assume) this driver will come upstream.

> 
> Is it some kind of table that is written by the chip itself in order to
> maintain a list of auto-replacement blocks for bad blocks? Can the size
> of this table move with the use of the device? (if yes, it's
> problematic, we don't want to resize MTD partitions without noticing,
> it would break eg. UBI).
> 

No chip hw bad block is disabled with this implementation and the table
size doesn't move/change so MTD partitions will stay at the same offset
after the first parse on boot.

> I believe this BMT block is going against the bad block handling in
> Linux, so I really wonder how one can use both mechanisms in a system.
> If the BMT layer takes "one random block" to map a corrupted one on it,
> it totally defeats the current bad block model we have in MTD/UBI
> and simply cannot be supported at all. Just skipping the
> currently-used-for-BMT blocks sounds like a very bad idea that will
> break your system, later.
>

Well we disable it and since it's reserved, from the system side you can
do all kind of magic since the space used for the driver is not
available to the system but I will try to gather more info about this in
the next few days.

-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
