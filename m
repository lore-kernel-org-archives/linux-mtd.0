Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B23AC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 12:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TdomORSv5OMaa4kFoMsZZ+lUeRDgXrZDTY/pbft9SzQ=; b=1/MLyuCSuJNOuQ
	FltZf4CXDC6Wqp7axiwrT1SzwSoVfv3GgyWhUewfnWl9fbFodkI0oGrJnOEbD/zo8BZWuZTin3EOj
	OjjOGkWiBwH8G9sPdePgcLdGiTcvm86swhM/Xkcr360WO+UE6xtHlzd0egze9PcVHtCBCmJgFxd65
	5ts1CaV4oGJbxIgoAurD46hDWDEWMUNA0IdegM+mpXyR81uQ29h6gEbFAAsfUx3wwYgBqJNiTGKXp
	JqoSGYpaty1h0i6Q5ccnkV3RF4+3nzR6OWMFFcFvRsW+MDOfQ4koEAStm28e2AEd74aByW+CZRi0n
	IFdtKbSxMiE0WU6RCoBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt7Ff-004BCA-N3; Mon, 23 May 2022 12:33:36 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt71F-0043tx-2i
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 12:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653308321; x=1684844321;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CgscfHbRv1zAuiZTsJog1ODh28vnfZ4B3mVu+ZHpAYM=;
 b=K83b2J6u6SmWGMZ1IcS5SGnkWpEqheM84iC9/Ashst3UWuWfA2zmWW3i
 1NWlVT1vjIJ6TxZyRqwjAxPn1odxMIc8bREXg5fyxa/mSFzGjN2LAkRma
 /ord6HdmSb/fFj9IS+04tAS2L3pvuvVx/gKb05/EFMvQIx3zPcsAa47y/
 QUgz5AS7DI0iJ7+upLqTcjEAWmDcEMbj2Obunb3UoGQ0nXzorgHdbdY6s
 a9sW4AEsWjiGIQW8eDNyKq4b+MUwlYw8OGR48tr+TQlblA3Cgcj3aLZr/
 /l/TMUqmTz8CYLGozpRsEC5UkHq4lgESDmQ9Njo1O/QXsxuo673cjpzWC g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="253078389"
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="253078389"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 05:18:37 -0700
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="600620980"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.249.171.16])
 ([10.249.171.16])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 05:18:35 -0700
Message-ID: <2b859cff-2403-0526-f3ae-749920b3fd8b@linux.intel.com>
Date: Mon, 23 May 2022 20:18:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/2] mtd: spi-nor: macronix: Add support for mx66l2g45g
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 linux-kernel@vger.kernel.org
References: <20220522054802.1719443-1-jiaqing.zhao@linux.intel.com>
 <04c432289041752d113c15245361ade8@walle.cc>
 <b3e85d41-9415-b911-6f61-941885af1955@linux.intel.com>
 <fac4b7877f600a4067534fca672dc842@walle.cc>
 <2bf3394e-0a78-c760-16ce-936c12b66b93@linux.intel.com>
 <24cf182693a522ed1f7afd61c7c37029@walle.cc>
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <24cf182693a522ed1f7afd61c7c37029@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_051841_289583_48A6CD72 
X-CRM114-Status: GOOD (  15.44  )
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

Okay I've found this was a driver issue. After switching to the new aspeed
spi-mem driver[1], the sysfs interface works.

# xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060102ff00060110300000ffc2000104100100ff84000102c000
00ffffffffffffffffffffffffffffffffffe520fbffffffff7f44eb086b
083b04bbfeffffffffff00ffffff44eb0c200f5210d800ff8749bd0084d2
04e24403673830b030b0f7bdff5c4a9e29fff050f985ffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffff7f8fffff215cdcffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffff003600279df9c06485cbffffffffffff
# md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
bc3c1443db0c6359432c3cccb6f97943  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
# cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c2201c
# cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
mx66l2g45g
# cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix

Since I'm using kernel 5.15, I copied the /drivers/mtd/spi-nor from 5.18-rc7
(I know this it not a clean way, but it works), and applied the SNOR_ID3()
patch. Verified using SNOR_ID3() macro works with this mx66l2g45g and the
values dumped from sysfs are the same.

[    1.696350] spi spi0.0: setup: ignoring unsupported mode bits 200
[    1.703786] spi-nor spi0.0: mx66l2g45g (262144 Kbytes)
[    1.764440] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c0641]

Due to the lockdown in Shanghai, I am unable to test my 2nd patch at this
time, please temporarily ignore it.

I will perform more tests and update the patch later.

[1] https://lore.kernel.org/linux-mtd/a17b2446-f5a6-d606-8ef4-3931b8bc94da@kaod.org/

Thanks,
Jiaqing

On 2022-05-23 19:59, Michael Walle wrote:
> Hi,
> 
> Am 2022-05-23 12:12, schrieb Jiaqing Zhao:
>>> Am 2022-05-23 10:50, schrieb Jiaqing Zhao:
>>>> Yes this one supports SFDP according to its spec.
>>>>
>>>> On my setup, I cannot see the sysfs object. Do I need to enable some specific
>>>> kernel config or it's SPI controller related? My setup is running kernel 5.15.
>>>
>>> No, it should be there since v5.14. See commit 36ac02286265. And you shouldn't
>>> need to enable any special configuration option.
>>>
>>> Did you do a "find /sys -name sfdp"?
>>>
>>> -michael
>>
>> I tried, it give empty result. The system I'm working on disables kernel module,
>> and the SPI controller driver calls spi_nor_probe() directly, will this be the
>> issue?
>>
>> And is it possible to manually load the spi-nor driver via the bind interface?
>> If it is possible, what should the parameters be?
> 
> Is your spi flash probed at all?
> 
> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
