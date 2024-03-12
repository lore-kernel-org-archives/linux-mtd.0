Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA78C54E58
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2024 12:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sMPQfpcjUki/deCFDQFZNxIRBz3lntSYN1P3jp792FY=; b=WRLGON/SlKOzXl
	7G+fG14oe47noCewduIJDbcwFUiFinbsBrsLoNapPoXgQe2eFBU7y8ZY2eJ7+udAoM0focClA4MBW
	zeec5cRSJ1bOy718cKLn+tlAIsMhPyCGIuykPNjSvD9f8I5KPnuumr8N7H4lQpkhToNtvfKoAfumu
	ul0tL+9lLr3MSyac5YosghK+r3lo28z50o9t/Ki5fvcKlOja7LNAg/N1skCFkPXI891ZSw0dYgmZe
	7BDYeT/C0HjZkhwhtBfnx938rRRvAqJTjXa1mobIlb0QZDC7Nbp2bPd1Ml7vPYQFZgkq39IrP1WI+
	PGtJfgoNd47rmDj7zWoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk135-00000005hRe-0VBw;
	Tue, 12 Mar 2024 12:16:03 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk131-00000005hPL-44MK
	for linux-mtd@lists.infradead.org;
	Tue, 12 Mar 2024 12:16:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710245756;
	bh=eWOfUZKmPNZhyLKzOWRxcFwX/pcgSuoNoaDv6gFnoaY=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=adYU1hc0/HUIwUycHrtd4GegMyOYxLD39anPc8saT3TETvOqtNyQ1llQF2VUsLSr7
	 7GeJ+1fEoSnY9Hm3uUOvfQWEoit6kSpS3/72J3TcBaVhHpu2qgZROsZcIgS0vv0xGd
	 wBS69XgiEJRrrZIJ4abtOSNXdr2i8lmsR4hMzIVt1b1S5Ns7pwZisRAXt29+Z2OsHe
	 ASDxfuus5r7Mm0Wmlt0btj7g0xR+3wE7Ki0Xj+x3DIrXKuf/KoQxi9+E0sQrT3ZfhR
	 XMtJnwEj6Ql9qIpQHQ5PwM/rfWFjH3ngRjtEGLwPNFZsgsjczDJqL40bY2jUv1/Wkt
	 6HgrTtkgafApw==
Received: from [10.193.1.1] (broslavsky.collaboradmins.com [68.183.210.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0E2D3378207B;
	Tue, 12 Mar 2024 12:15:53 +0000 (UTC)
Message-ID: <d690b7d7-2568-4a47-a653-eb25671fb138@collabora.com>
Date: Tue, 12 Mar 2024 17:16:23 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, kernel@collabora.com,
 kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: core: correct type of i
Content-Language: en-US
To: Pratyush Yadav <pratyush@kernel.org>
References: <20240304090103.818092-1-usama.anjum@collabora.com>
 <865fc24b-ae27-4084-893b-c5c389480a09@collabora.com>
 <mafs0r0gf8x6c.fsf@kernel.org>
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <mafs0r0gf8x6c.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_051600_247943_40EE10C0 
X-CRM114-Status: GOOD (  12.68  )
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

On 3/12/24 5:14 PM, Pratyush Yadav wrote:
> Hi,
> 
> On Mon, Mar 11 2024, Muhammad Usama Anjum wrote:
> 
>> Soft reminder
> 
> Miquel should pick up the patch when sending out his pull request [0].
> 
> [0] https://lore.kernel.org/linux-mtd/20240307180919.4cb7a4cb@xps-13/
Thanks Pratyush!

> 
>>
>> On 3/4/24 2:01 PM, Muhammad Usama Anjum wrote:
>>> The i should be signed to find out the end of the loop. Otherwise,
>>> i >= 0 is always true and loop becomes infinite. Make its type to be
>>> int.
>>>
>>> Fixes: 6a9eda34418f ("mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map")
>>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>>> ---
>>> Changes since v1:
>>> - Make i int instead of u8
>>> ---
>>>  drivers/mtd/spi-nor/core.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>> index 65b32ea59afc6..3e1f1913536bf 100644
>>> --- a/drivers/mtd/spi-nor/core.c
>>> +++ b/drivers/mtd/spi-nor/core.c
>>> @@ -3373,7 +3373,7 @@ static u32
>>>  spi_nor_get_region_erasesize(const struct spi_nor_erase_region *region,
>>>  			     const struct spi_nor_erase_type *erase_type)
>>>  {
>>> -	u8 i;
>>> +	int i;
>>>  
>>>  	if (region->overlaid)
>>>  		return region->size;
> 

-- 
BR,
Muhammad Usama Anjum

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
