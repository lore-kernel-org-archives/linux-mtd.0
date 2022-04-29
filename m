Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A4CC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 11:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NGOZRnOApKJc4HZ0TAx8QfgOmaHYD/Rph+xWYl+rwEQ=; b=fA/jhrVNGgdhOL
	UVAfxWesvf+VVD7uC6eU2ufxzTnV/kkXSHGUF/mMkEN1gH2K0ELDb3TCRpZNsBcB8NNrniEbZKfj0
	ElDMWMfCZybNK2YOYFNiTJp4IkEfwDWE3fJWsKt9YZwAyWnYg5iauBPYgKdJHJC/cK2E5LfIkRuTU
	R+VqV3RSqh2AZHjbIYgHdzV9MLlTfmiMylj7VQ++qEG+ZxdbKeAjJwjilXC9FjPdcTTYD9BJqNCba
	srDlAqW9VT/kxnHPzr1tMeo/rJU7LbhxZuJaEu3dicQPhLAxd5yns+/58EInVC1WrAcpnVeLS1Ah1
	ITiblRFsN0+IRPPVqHCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkOuM-00AyAS-6N; Fri, 29 Apr 2022 11:35:34 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkOuH-00Ay8J-VU
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2022 11:35:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651232130; x=1682768130;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pWWBYUIfbNL6pVdVQ9Id6I9rWKUkU4jATV2T05bb6xg=;
 b=boulGoDG3sI4OPy17JgWWf8XvVBKtSF7y9TdE1FQB9unqW5gKRTF1F0s
 SRgCkyKRzuWdRwzHgR0m6Son4YVjsyATbz50dmWDzLAR7kXImQj8CioQd
 dvqN6Kzm8LkA41Ut70zB7iBxWvpYRrWvJXpNMbHrgBDJLwXca4Qb6by7Y c=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 29 Apr 2022 04:35:28 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 04:35:28 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 29 Apr 2022 04:35:27 -0700
Received: from [10.216.46.40] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 29 Apr
 2022 04:35:22 -0700
Message-ID: <cb5ed4e9-86ab-4df3-9ae6-f9d907f949d8@quicinc.com>
Date: Fri, 29 Apr 2022 17:05:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH V8] mtd: spi-nor: winbond: add support for W25Q512NW-IM
Content-Language: en-US
To: <Tudor.Ambarus@microchip.com>, <p.yadav@ti.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <quic_asutoshd@quicinc.com>,
 <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
 <quic_sartgarg@quicinc.com>, <quic_nitirawa@quicinc.com>,
 <quic_sayalil@quicinc.com>
References: <1648191975-1366-1-git-send-email-quic_c_sbhanu@quicinc.com>
 <20220419042742.qqfj6wurpxxqhr6l@ti.com>
 <4324bf7f-e397-7510-96a2-5a309e30d76c@microchip.com>
From: "Sajida Bhanu (Temp)" <quic_c_sbhanu@quicinc.com>
In-Reply-To: <4324bf7f-e397-7510-96a2-5a309e30d76c@microchip.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_043530_120138_CF4EA026 
X-CRM114-Status: GOOD (  12.04  )
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

Thanks for the review.

Please find the inline comments.

Thanks,
Sajida

On 4/19/2022 1:02 PM, Tudor.Ambarus@microchip.com wrote:

> On 4/19/22 07:27, Pratyush Yadav wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 25/03/22 12:36PM, Shaik Sajida Bhanu wrote:
>>> Add support for winbond W25Q512NW-IM chip.
>>>
>>> Below are the tests done:
>>>
>>> 1. Verified flashing binary image on spi card using flashrom tool.
>>> 2. Verified OTP support, below are the test results:
>>>
>>>   localhost / # cat
>>>   /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi16/
>>>   spi16.0/spi-nor/jedec_id
>>>   ef8020
>>>
>>>   localhost / # cat
>>>   /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi16/
>>>   spi16.0/spi-nor/manufacturer
>>>   winbond
>>>
>>>   localhost / # cat
>>>   /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi16/
>>>   spi16.0/spi-nor/partname
>>>   w25q512nwm
>>>
>>>   localhost / # hexdump
>>>   /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/sp
>>>   i16/spi16.0/spi-nor/sfdp
>>>   0000000 4653 5044 0106 ff01 0600 1001 0080 ff00
>>>   0000010 0084 0201 00d0 ff00 ffff ffff ffff ffff
>>>   0000020 6800 6c65 6f6c 7720 726f 646c ffff ffff
>>>   0000030 ffff ffff ffff ffff ffff ffff ffff ffff
>>>   *
>>>   0000080 20e5 fffb ffff 1fff eb44 6b08 3b08 bb42
>>>   0000090 fffe ffff ffff 0000 ffff eb40 200c 520f
>>>   00000a0 d810 0000 0233 00a6 e781 d914 63e9 3376
>>>   00000b0 757a 757a bdf7 5cd5 f719 ff5d 70e9 a5f9
>>>   00000c0 ffff ffff ffff ffff ffff ffff ffff ffff
>>>   00000d0 0aff fff0 ff21 ffdc
>>>   00000d8
>>>
>>>   localhost / # md5sum
>>>   /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi
>>>   16/spi16.0/spi-nor/sfdp
>>>   106d89d6c049110bc94c01517cb4ce24
>>>   /sys/bus/platform/devices/soc@0/88dc000.spi/
>>>   spi_master/spi16/spi16.0/spi-nor/sfdp
>>>
>>> 3. Tested flash lock, below are the test results (looks like the lock is
>>>   not working as expected, so when we do lock the whole card and tried to
>>>   write, write was successful without any errors.)
>> What should we do with this then? Drop the locking support? Or is there
>> something wrong/missing in SPI NOR core that needs to be fixed first so
>> locking for this flash works?
>>
> If the locking isn't working for this flash, please drop the locking flags
> until you identify the problem and fix it.
Okay for now dropping locking flag.
>>>   localhost ~ # flash_lock -i /dev/mtd0
>>>   Device: /dev/mtd0
>>>   Start: 0
>>>   Len: 0x4000000
>>>   Lock status: locked
>>>   Return code: 1
>>>   localhost ~ # mtd_debug erase /dev/mtd0 0x400000 4096
>>>   Erased 4096 bytes from address 0x00400000 in flash
>>>   localhost ~ # mtd_debug read /dev/mtd0 0x400000 4096
>>>   temp
>>>   Copied 4096 bytes from address 0x00400000 in flash
>>>   to temp
>>>   localhost ~ # mtd_debug write /dev/mtd0 0x400000
>>>   4096 temp
>>>   Copied 4096 bytes from temp to address 0x00400000
>>>   in flash
>>>   localhost ~ # flash_lock -u /dev/mtd0
>>>   localhost ~ # flash_lock -i /dev/mtd0
>>>   Device: /dev/mtd0
>>>   Start: 0
>>>   Len: 0x4000000
>>>   Lock status: unlocked
>>>   Return code: 0
>>>   localhost ~ # mtd_debug erase /dev/mtd0 0x400000 4096
>>>   Erased 4096 bytes from address 0x00400000 in flash
>>>   localhost ~ # mtd_debug read /dev/mtd0 0x400000
>>>   4096 tempCopied 4096 bytes from address 0x00400000 in
>>>   flash to temp
>>>   localhost ~ # mtd_debug write /dev/mtd0 0x400000 4096 temp
>>>   Copied 4096 bytes from temp to address 0x00400000 in flash
>>>   localhost ~ #
>>>
>>> Signed-off-by: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
>>> Reviewed-by: Doug Anderson <dianders@chromium.org>
>>> Reviewed-by: Michael Walle <michael@walle.cc>
>> [...]
>>
>> --
>> Regards,
>> Pratyush Yadav
>> Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
