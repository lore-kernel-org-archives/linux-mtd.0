Return-Path: <SRS0=ZSp+=JN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1FFC433B4
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 19:25:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7252C6137D
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 19:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7252C6137D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=david-bauer.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ug6TvVv9RrYpmRvpUJA8fYGIa4iz5ILgZ/vMW8VJlgg=; b=kk3NlvjeiLRhqROIs/hyke2EJ
	Kb1E4q/Xx+S5MXewOL+6bPK462UkKcF5R5B4GIhP1WWJcBAO2ruZgBQlYl/jrwohoV2tBgtRwxfWq
	1kzIyhc6hACJpKy8Zxnx2AxtlQZMeQcQG7oluYqHsDOYKgHBLoAD0QRTz1SAYG8RfY2UJIMxDmCdZ
	wkppb1WjK4jjxjIPSTt6NTKa9eEYGEz2SBRWlhues6S5MazljewS6E1OAdwE8fwRy5wYd1P8WTxhr
	f0P/Q1/akG9O0isI4CapbAOxWQn2vjtjuS1+okSg7KGtbUjeu4Fdt/v9x6eyA2aASo4x2QmpTliUv
	srVx7JRpA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXU5E-003DGH-LW; Fri, 16 Apr 2021 19:24:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXU5A-003DFU-G6
 for linux-mtd@desiato.infradead.org; Fri, 16 Apr 2021 19:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=aMd+6+9MMrGmG4X5oLYCGyWRjcD5xm/Dh3GUccZsGT8=; b=niGfMXspNYJrUDEDhxPzN9CmJY
 I7kStDA6h2hhUpnb9ini62yKiDCFlXX8L0vzC4oNbVuvOA5BAL3lSICspbrJqyPjRPRYsQJrsUxxl
 MqcPSaPjqafWkWrGm4eZ6Y0eE0l7RNHPYJi/asIulb4YAajUpTYzxuf1ESk3AvhIYyGt0Vm4ZKNiS
 sq+x+PetMe7/GGtcDRvPjMHLEgrDmqnas7W/7k16i07Qqff+8h9fOmHLCsonJIMcix/olKyVRqzLK
 eX3IkPxfalkiDkQI4fsHgXSrDQeQ948oNDSSoripXj+C/h87nr6EKPRtZPZxMG993gjlqmZs6nT7P
 Jx0EWH7A==;
Received: from perseus.uberspace.de ([95.143.172.134])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXU56-009edw-PJ
 for linux-mtd@lists.infradead.org; Fri, 16 Apr 2021 19:24:47 +0000
Received: (qmail 24772 invoked from network); 16 Apr 2021 19:24:41 -0000
Received: from localhost (HELO localhost) (127.0.0.1)
 by perseus.uberspace.de with SMTP; 16 Apr 2021 19:24:41 -0000
Subject: Re: [PATCH] mtd: spi-nor: add support for Winbond W25Q512JV
To: Shuhao Mai <shuhao.mai.1990@gmail.com>, Tudor.Ambarus@microchip.com
Cc: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at, 
 vigneshr@ti.com
References: <20210213151047.11700-1-mail@david-bauer.net>
 <00fdc79c-2a7f-c02f-3398-8102e5a68a53@microchip.com>
 <e9626369-dc44-8f64-606b-88098157bc7a@david-bauer.net>
 <8833cce1-a843-9b56-53ed-e9a2fd42d990@microchip.com>
 <20210310074120.GA63@an990131127.quanta.corp>
From: David Bauer <mail@david-bauer.net>
Message-ID: <9150b806-17bb-cdfe-277b-0ca473a41e21@david-bauer.net>
Date: Fri, 16 Apr 2021 21:24:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210310074120.GA63@an990131127.quanta.corp>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_122445_143615_1A00EE14 
X-CRM114-Status: GOOD (  18.31  )
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

Hi Shuhao,

Sorry for coming back late to this.

On 3/10/21 8:41 AM, Shuhao Mai wrote:
> On Tue, Mar 09, 2021 at 07:53:59AM +0000, Tudor.Ambarus@microchip.com wrote:
>> On 3/8/21 8:03 PM, David Bauer wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Hi Tudor,
>>>
>>> On 3/8/21 6:50 AM, Tudor.Ambarus@microchip.com wrote:
>>>> On 2/13/21 5:10 PM, David Bauer wrote:
>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>
>>>>> The Winbond W25Q512JV is a 512mb SPI-NOR chip. It supports 4K
>>>>> sectors as well as block protection and Dual-/Quad-read.
>>>>>
>>>>> Tested on: Ubiquiti UniFi 6 LR
>>>>>
>>>>> Signed-off-by: David Bauer <mail@david-bauer.net>
>>>>
>>>> David, I'll take Shuhao's patch because he sent it first:
>>>> https://patchwork.ozlabs.org/project/linux-mtd/patch/20210208075303.4200-1-shuhao.mai.1990@gmail.com/
>>>
>>> Fine with me, I have not found this patch :)
>>>
>>>>
>>>> Would you make an incremental patch on top op Shuhao's, to add the
>>>> locking support?
>>>
>>> Sure, It's necessary for the board (UniFi 6 LR), as the bootloader locks the flash on boot.
>>
>> Is it necessary to unlock the flash at boot time?
>> You can unlock the flash from user-space, using mtd-utils.
>>
>> Have you tried to lock/unlock portions of the flash using mtd-utils,
>> and check if what was locked corresponds to what the datasheet indicates?
>>
>>>
>>> I'll send a new patch for the lock support.
>>>
>> Great, thanks!
>> ta
> 
> Hi Tudor and David,
> 
> 
> I made a quick test on flash_lock with kernel 5.8.18 and mtd-utils
> v2.1.2. It returns "could not lock device: /dev/mtd0" and "error 22
> (Invalid argument)".
> 
> Could be the error caused by my test environment, if it's functional on
> UniFi 6 LR.
Were these partitions starting with the first / ending with the last block on the flash chip?
Locking / unlocking mtd partitions not aligned at the beginning / end of the chip sound will
return invalid argument.

For the UniFi 6 LR, these flags are required, as otherwise the lower half of the flash
remains write protected (the bootloader actively enables this protection for whatever reason).

I'll send a rebased patch adding the required flags shortly.

Best wishes
David

> 
> 
> Sincerely
> Shuhao
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
