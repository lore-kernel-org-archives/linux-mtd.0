Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BCEEB64D8
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 04:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rI9vplRJKMT9nOGfBBqRwU60e3R79qr1ghZSv/OUT7s=; b=n0WlngHoNJqwBn
	v6IDVVK6NUTmbJ8VGOMHhRb+qy2U5Jbmpgr9L0MKrj+npxwfnFhWCwvK1a1rqG68rzRowzP0RzHkY
	ZNEhxZl3YXCXCPIu7O6ziqzRNpP2cZMPNEvvQBpiaLBLNYqxa4sLiteG4VyJT7RSw/BhsPhOxcLUQ
	ky6/Avi2S5iK+r3xbY7PMtuk4INfLSn7MO3eCNz/DxkKRxiZGBmNzhawa6qTchItpBI8oAUxcYVQk
	FqlbHCVJobk2MZd8HeY1GrPFrR9SedD8nN2fmJ931l5TXxGcq5GM7dQEhdarlxYjna7xf7TBwJ1X1
	/UcZTBFgoHb3vbFzWgVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCBwM-00GnBb-2Z;
	Thu, 22 Jun 2023 04:29:02 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCBwK-00GnAq-0G
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 04:29:01 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-543ae6ce8d1so5322542a12.2
        for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2023 21:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687408138; x=1690000138;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OK+CXuyFLwF44/27I2as5mqeWxwcMg3WlGZonvd6nV8=;
        b=dNVx5yrY4KXXoJs8JhWWjAXhtEzg4NDMHTx+5nrRRMVRfRcs80NPvNdVi74BL84Fyu
         OcmdhgjKLsW0tq3RH1ohPk3iTOkMq/tPRs3EK/oyuddmncwO0ByNSIsJtnOu+UNQRI2I
         lKGr8VSTyD3va6S5APUyLLC5tIGhzGUYjw9DUjyYaqjoF9xukBi5XDIQgQQoCn+GOIwL
         EYKfAr84RzMTOIrZ6dZmQUn6Ypk3LuKycSoPurmh9qDFAxuFEZwwGNcQwgGbbxTgXefv
         m7+2WCjrJMVz+L9TDdXt8/cJShXYc7WpYsta4Tdz8uaK62azgBM9w/jGj3dT9dpXgv0r
         m78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687408138; x=1690000138;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OK+CXuyFLwF44/27I2as5mqeWxwcMg3WlGZonvd6nV8=;
        b=GwFV0rAnM8DVn/86jsnWEemAupy4rxm3riGJqhA9ZfLQrWtmemLX6FqLrUPOGKax5u
         91OuSJkNOf169iO+3e3E3rK134htY4j1i5r7qEAl1Ah6JhEXB4N2GDvTSL/5mOSJzHMp
         v0T+Qvt6tzaw4Zx2ed2EhPmocjqQADT70rYm3J72fDBFTq3pPdGpjDZu6wDLAAC9SH9j
         BJytnNzi9FGf315ZLdyhUitA/594MRBV2aRxjpTZ43XrCkuJ+xbmBUoxC5n6X8LFacWh
         SlXVtwE8JihdYbKeLhSVt12gllEmcQ6aARa3lED1CRbWCiCiHqzD/5rOS7m+Ta0MqfQt
         tWYw==
X-Gm-Message-State: AC+VfDwBHb8pBz/Nv2p0e+Pz3h0pYzX7NIJzkn/d8A6Oa4V03bykXdIC
	cq4tA+hhx5sWCbrKHpRwelk=
X-Google-Smtp-Source: ACHHUZ4+ZMoJr7SnY11jKCs2czSTRYO57d2qFyw6J6x2UuheAlVyskFDDBj2KxGUrXVcomI0QhCtBA==
X-Received: by 2002:a05:6a20:3d92:b0:11d:38ea:7586 with SMTP id s18-20020a056a203d9200b0011d38ea7586mr22888787pzi.9.1687408138593;
        Wed, 21 Jun 2023 21:28:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a17-20020aa780d1000000b00666e2dac482sm3605318pfn.124.2023.06.21.21.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 21:28:57 -0700 (PDT)
Message-ID: <2205ef1e-9bb6-fb1e-9ca3-367c1afe12ac@roeck-us.net>
Date: Wed, 21 Jun 2023 21:28:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Mike Snitzer <snitzer@kernel.org>,
 Joern Engel <joern@lazybastard.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pavel Machek <pavel@ucw.cz>, dm-devel@redhat.com,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org
References: <20230523074535.249802-1-hch@lst.de>
 <20230523074535.249802-15-hch@lst.de>
 <8c1992bc-110a-4dad-8643-766c14bf6fd4@roeck-us.net>
 <20230622035149.GA4667@lst.de>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 14/24] init: clear root_wait on all invalid root= strings
In-Reply-To: <20230622035149.GA4667@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_212900_140517_E6D3E771 
X-CRM114-Status: GOOD (  16.34  )
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

On 6/21/23 20:51, Christoph Hellwig wrote:
> On Wed, Jun 21, 2023 at 02:07:13PM -0700, Guenter Roeck wrote:
>> On Tue, May 23, 2023 at 09:45:25AM +0200, Christoph Hellwig wrote:
>>> Instead of only clearing root_wait in devt_from_partuuid when the UUID
>>> format was invalid, do that in parse_root_device for all strings that
>>> failed to parse.
>>>
>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>
>> In linux-next, almost all of my boot tests from usb drives as well
>> as a few others fail with "Disabling rootwait; root= is invalid."
>> in the log. Bisect points to this patch.
> 
> Can you send such a log, and the command line you've used?
> 


There are lots of logs at https://kerneltests.org/builders, in the 'next'
column of qemu tests. One example is
https://kerneltests.org/builders/qemu-arm-v7-next/builds/511/steps/qemubuildcommand/logs/stdio

Sample command line:

qemu-system-arm -M mcimx7d-sabre \
      -kernel arch/arm/boot/zImage -no-reboot -snapshot \
      -usb -device usb-storage,drive=d0,bus=usb-bus.1 \
      -drive file=rootfs-armv7a.ext2,if=none,id=d0,format=raw \
      -m 256 -nic user -display none \
      --append "root=/dev/sda rootwait earlycon=ec_imx6q,mmio,0x30860000,115200n8 console=ttymxc0,115200" \
      -dtb arch/arm/boot/dts/imx7d-sdb.dtb \
      -nographic -monitor null -serial stdio

This is with a modified imx_v6_v7_defconfig and root file system from
https://github.com/groeck/linux-build-test/blob/master/rootfs/arm-v7/rootfs-armv7a.ext2.gz

The -EINVAL return value is from

	if (p < s + 2 || !isdigit(p[-2]) || p[-1] != 'p')

in devt_from_devname().

Guenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
