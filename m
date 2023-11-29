Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E54C46CA3
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Nov 2023 13:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2doNSp60oExH/tbCycybBsBBGSZPzxYXrhPCM074Hrw=; b=jn0UjQS2BNC24g2ImrKAwI7s0+
	pmlgu8/ze7O+XoUUynmlpEgyKl1kamQl2Twm27oHkOOIpGSlooF/KPcg7TAKMeKbJ9KgFWq0c+9EA
	x24Zth+a42Gp0Ol/D1kGQkxtQOOf4l2GkaCU7Gb4THvrTU5R7IoMziVik7dkzHH5OCyXpx12JppFw
	MGb6GJplvUeXDC/uLeyroYwjrif85YzljL1gMy6a6hgsmtxYx2qxQmiiGPfOD/qOYCxvXWaXYaKBG
	SXjNemAdqXeZHxcKyIGNjNXZMDU1v3hzfyDJMX5sN5IH/uF2aDfSElFKyOImnZMcXSF8Z7qwSmH+c
	icXlpkcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8KGB-008Q0x-1c;
	Wed, 29 Nov 2023 13:05:47 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8KG8-008PzY-0e
	for linux-mtd@lists.infradead.org;
	Wed, 29 Nov 2023 13:05:45 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id EDBDD957;
	Wed, 29 Nov 2023 14:05:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1701263138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9SblSzxpofP2hDrymhDMMQF3FF11knUQb/jaSOSo4hs=;
	b=XstcDe19tFQavza0YkuDOsi5A1Nkc0sWNOZ6/PKIHKXkXD0wg8LTdG0mrkFjtSRYTLUo/e
	BcCWwOHkYXojQ+mn4FYxzkhi9I9uPvTsy/SUib0pqM5zlpeSOM9iUF3lQ4f1EkZ8Irmjd2
	nhOG4inXoL83qTSWoGmTnQLP3DpEFZwWQh3yCfTpuK3+8PLROuH8a0QyBoOCk+lJajwyij
	Qwp9mwFkaDefICLh/khHIRCMB700lNrUdHmtraYbMJdWDPSDrkLIiWbuUA/i8uqzdIW66u
	YPL4Ee0PfRMmVKmsh33oVA5zE2+wirxgKk//2N0B8niXpwE2SAKrt8XQCHii3w==
MIME-Version: 1.0
Date: Wed, 29 Nov 2023 14:05:37 +0100
From: Michael Walle <michael@walle.cc>
To: "Boyapally, Srikanth" <Srikanth.Boyapally@amd.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, tudor.ambarus@linaro.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, "git
 (AMD-Xilinx)" <git@amd.com>
Subject: Re: [PATCH] mtd: spi-nor: issi: Add support for is25lp02g
In-Reply-To: <BN9PR12MB5196EF2D4EFF36F6FCD7BDC19E83A@BN9PR12MB5196.namprd12.prod.outlook.com>
References: <20231123054713.361101-1-srikanth.boyapally@amd.com>
 <mafs0jzq7dx8l.fsf@kernel.org>
 <BN9PR12MB51966705C3E306502ABABA6E9EBCA@BN9PR12MB5196.namprd12.prod.outlook.com>
 <6342ad8a798ef811d37775b7269623a3@walle.cc>
 <BN9PR12MB5196EF2D4EFF36F6FCD7BDC19E83A@BN9PR12MB5196.namprd12.prod.outlook.com>
Message-ID: <542998283b464d19fa5f354898de79df@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_050544_387043_45D20EB3 
X-CRM114-Status: GOOD (  12.17  )
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

Hi,

>> >> > Add support for issi is25lp02g.
>> >> >
>> >> > Verified on AMD-Xilinx versal platform and executed mtd_debug
>> >> > read/write test.
>> >> >
>> >> > Signed-off-by: Srikanth Boyapally <srikanth.boyapally@amd.com>
>> >>
>> >> Based on a datasheet [0] I found online, this flash seems to have
>> >> SFDP.
>> >> And since you do not add any flash specific fixups, it likely does
>> >> not need an entry and would work fine with the generic flash driver.
>> >> Did you try using that? See [1] for more info on contribution
>> >> guidelines.
>> >>
>> >> [0] https://www.issi.com/WW/pdf/25LP-WP02GG.pdf
>> >> [1] https://lore.kernel.org/linux-mtd/20231123160721.64561-2-
>> >> tudor.ambarus@linaro.org/
>> >>
>> > I ran mtd_debug read/write tests on this flash, without adding flash
>> > entry, it worked fine for me. Please ignore this patch.
>> 
>> Great! Could you please still dump and post your SFDP just for us to 
>> have more
>> SFDP of diferent flashes? See [1].
>> 
> SFDP dump:
> versal-generic:/home/petalinux# hexdump -C 
> /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 00000000  53 46 44 50 06 01 01 ff  00 06 01 10 30 00 00 ff  
> |SFDP........0...|
> 00000010  84 00 01 02 80 00 00 ff  ff ff ff ff ff ff ff ff  
> |................|
> 00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  
> |................|
> 00000030  e5 20 fb ff ff ff ff 7f  44 eb 08 6b 08 3b 80 bb  |. 
> ......D..k.;..|
> 00000040  fe ff ff ff ff ff 00 ff  ff ff 44 eb 0c 20 0f 52  
> |..........D.. .R|
> 00000050  10 d8 00 ff 62 42 a9 00  82 64 02 e2 ec 8d 69 4c  
> |....bB...d....iL|
> 00000060  7a 75 7a 75 f7 a2 d5 5c  4a c2 2c ff e8 30 fa a9  
> |zuzu...\J.,..0..|
> 00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  
> |................|
> 00000080  ff ee ff ff 21 5c dc ff                           |....!\..|
> 00000088

Thanks!

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
