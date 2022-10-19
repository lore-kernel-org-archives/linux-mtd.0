Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401FFC4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Oct 2022 09:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RY7h/9kqemFBhQLe9uO9x4UoH/1ZrzllTD5FlnIO6M=; b=Vkpjr3rULi2KqX2vvSb2WjkoA+
	XfdsvoyXR7gv9Ay5EmJYxn1y8UzX5x/GbzQEVnNEHEu6Wqx2DmhgySNcOFwuMHv9NrNtqpAQ5Y3DX
	KfHFXE2iVLKikAF1gsE0H0OBGRWARwkinCDMEJlx7A/qiYWcOX2r69jvLldqafkL0tEjc58ObtBd5
	JOgQ5ihv1Pe407qWsN6M9X+I+Hkv4dJBoWY0ptQjRKPrEyng3ZSVQHDQYmgQBYOyl61+Gq1tvkwBH
	1GwyQ5PXpKRoQdF15CrMfBeBZwVgmRK4X0j6MS0gspVIcGtjJzcW9M+TYd9EiICVJg1LRHi4joUB8
	93A4dApA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5Ye-00HQZ7-G6; Wed, 19 Oct 2022 09:40:16 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5YY-00HPsa-Gx
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2022 09:40:14 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 6C00B1D42;
	Wed, 19 Oct 2022 11:38:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1666172328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1vUP7EaiupmjLjnWhpFPdqHFtResgU15SEluT122fdQ=;
	b=XRsHA19icJnAD9cmqkJsdQVJOed46ZkF21bvfDwgEPPMH05HVIMfqCkCGzbDaIIBo7ZMwF
	08UusgwppYT2PyZtagSxCGP5U7AXgPDlVrEr9z8dzK9FMjMeSk6IpSUxghN81sQvLMVg2x
	nr55yiulbLgztR7p++2zfaaVEcxvGxxwiU7Y5G/USMiJSEM8z2Sf9bNVH7XdpGhIN2VCIa
	jiPmkuY3Bp9EEMLRC59kWRrdsagY9vz8NhAzApbnwEUoQbjZydTxBKWERvju5Lb1Lu/gwQ
	zsV4Tq+uTFtqiqUUsjVPld/HmUiqukYnDF9wHiQkMbEF5KPWaAT/L6hslMXtpQ==
MIME-Version: 1.0
Date: Wed, 19 Oct 2022 11:38:48 +0200
From: Michael Walle <michael@walle.cc>
To: "Farber, Eliav" <farbere@amazon.com>
Cc: tudor.ambarus@microchip.com, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 talel@amazon.com, jonnyc@amazon.com, hhhawa@amazon.com, hanochu@amazon.com,
 itamark@amazon.com, shellykz@amazon.com, amitlavi@amazon.com, dkl@amazon.com
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: micron-st: Enable locking for
 n25q256ax1/mt25qu256a
In-Reply-To: <1ba2e7ff-cf6c-1292-72e0-14b5b5b9282c@amazon.com>
References: <20221019071631.15191-1-farbere@amazon.com>
 <73bfa5ae90e2269387540019806c2839@walle.cc>
 <1ba2e7ff-cf6c-1292-72e0-14b5b5b9282c@amazon.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <f489048bd1fa65db1a050f1321c640de@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_024010_751933_6D5BA51A 
X-CRM114-Status: GOOD (  16.25  )
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

Am 2022-10-19 11:25, schrieb Farber, Eliav:
> On 10/19/2022 11:21 AM, Michael Walle wrote:
>> Hi,
>> 
>> Am 2022-10-19 09:16, schrieb Eliav Farber:
>>> n25q256ax1 [1] and mt25qu256a [2] (both have same jedec_id - 
>>> 0x20bb19)
>>> use the 4 bit Block Protection scheme and support Top/Bottom 
>>> protection
>>> via the BP and TB bits of the Status Register.
>>> BP3 is located in bit 6 of the Status Register.
>>> Tested on both n25q256ax1 and mt25qu256a.
>>> 
>>> [1]
>>> https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/n25q/n25q_256mb_3v.pdf 
>>> [2]
>>> https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-a/mt25q_qljs_u_256_aba_0.pdf
>> 
>> If you respin, you can use a "Link:" tag for the URL above.
> 
> Ack.
> 
>>> Signed-off-by: Eliav Farber <farbere@amazon.com>
>>> ---
>>> xxd -p
>>> /sys/devices/platform/soc/fd882000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp 
>>> 53464450060101ff00060110300000ff84000102800000ffffffffffffff
>>> ffffffffffffffffffffffffffffffffffffe520fbffffffff0f29eb276b
>>> 273b27bbffffffffffff27bbffff29eb0c2010d80f520000244a99008b8e
>>> 03d4ac0127387a757a75fbbdd55c4a0f82ff81bd3d36ffffffffffffffff
>>> ffffffffffffffffffe7ffff21dcffff
>>> 
>>> md5sum
>>> /sys/devices/platform/soc/fd882000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp 
>>> 5ea738216f68c9f98987bb3725699a32
>>> /sys/devices/platform/soc/fd882000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp 
>>> cat
>>> /sys/devices/platform/soc/fd882000.spi/spi_master/spi0/spi0.0/spi-nor/jedec_id 
>>> 20bb19104400
>>> 
>>> cat
>>> /sys/devices/platform/soc/fd882000.spi/spi_master/spi0/spi0.0/spi-nor/partname 
>>> mt25qu256a
>>> 
>>> cat
>>> /sys/devices/platform/soc/fd882000.spi/spi_master/spi0/spi0.0/spi-nor/manufacturer 
>>> st
>> 
>> That's the mt25qu256a SFDP. What about the n25q256ax1?
> 
> On the same card, with same NOR flash memory I'm running two different
> kernel versions.
> First version is quite old - 4.19.239 which does not support mt25qu256a
> and therefore device is detected as n25q256ax1.
> Second version is 6.1.0-rc1 and it detects the same device as 
> mt25qu256a.
> So I was able to dump SFDP when running version 6.1.0-rc1, but not when
> running 4.19.239 which does not support the sysfs to dump the SFPD
> information.
> I checked that locking works with my changes when running on both 
> kernel
> versions.

So you've only tested on an mt25qu256a, correct? Then you should only
add the locking to this flash device. (and maybe backport the mt25qu256a
to your older kernel).

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
