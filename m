Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byf1Q-0003LY-Is
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 13:10:43 +0000
Received: by mail-wm0-x244.google.com with SMTP id f193so9759935wmg.3
 for <linux-mtd@lists.infradead.org>; Mon, 24 Oct 2016 06:10:17 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: Add possibility to disable chip erase
To: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <1477054546-2548-1-git-send-email-marcin.krzeminski@nokia.com>
 <3b23706b-bf46-8d3b-e9b0-01194eec5e11@gmail.com>
 <AM4PR0701MB21309FFCFE8370E3153ED66AFEA90@AM4PR0701MB2130.eurprd07.prod.outlook.com>
Cc: "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "cyrille.pitchen@atmel.com" <cyrille.pitchen@atmel.com>,
 "rfsw-patches@mlist.nokia.com" <rfsw-patches@mlist.nokia.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <f70cf025-c8ef-1c9a-f8cc-2104e6752b13@gmail.com>
Date: Mon, 24 Oct 2016 15:10:07 +0200
MIME-Version: 1.0
In-Reply-To: <AM4PR0701MB21309FFCFE8370E3153ED66AFEA90@AM4PR0701MB2130.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/24/2016 08:10 AM, Krzeminski, Marcin (Nokia - PL/Wroclaw) wrote:
> Hi Marek,
> 
>> -----Original Message-----
>> From: Marek Vasut [mailto:marek.vasut@gmail.com]
>> Sent: Friday, October 21, 2016 7:53 PM
>> To: Krzeminski, Marcin (Nokia - PL/Wroclaw)
>> <marcin.krzeminski@nokia.com>; linux-mtd@lists.infradead.org
>> Cc: computersforpeace@gmail.com; cyrille.pitchen@atmel.com; rfsw-
>> patches@mlist.nokia.com; dwmw2@infradead.org
>> Subject: Re: [PATCH] mtd: spi-nor: Add possibility to disable chip erase
>>
>> On 10/21/2016 02:55 PM, marcin.krzeminski@nokia.com wrote:
>>> From: Marcin Krzeminski <marcin.krzeminski@nokia.com>
>>>
>>> n25q00 does not support chip erase command (0xC7), but spi-nor
>>> framework still send if if user want to erase whole flash. This patch
>>> adds option to disable chip erase command and enable in on n25q00.
>>
>> That's true and it's a pretty nasty issue.
>> Can you instead implement logic to send multiple die-erase commands ?
>> They do make erasing faster afterall.
>>
> As we talked I would like to have die erase. I post is after tests,
> It will be a difference series since functionality will be different.
> In my MT25Q00 difference between die erase and sector at time erase
> is about 40 second.

Cool, thanks!

-- 
Best regards,
Marek Vasut
