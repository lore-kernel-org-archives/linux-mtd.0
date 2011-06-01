Message-ID: <4DE66997.1060808@ru.mvista.com>
Date: Wed, 01 Jun 2011 20:32:23 +0400
From: Sergei Shtylyov <sshtylyov@mvista.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH v6 1/8] MTD: Add integrator-flash feature to physmap
References: <1305637877-24436-1-git-send-email-marc.zyngier@arm.com>	
	<1305637877-24436-2-git-send-email-marc.zyngier@arm.com>	
	<4DE53D52.4040508@ru.mvista.com>	
	<20110531224428.6636e283@taxman.wild-wind.fr.eu.org>	
	<BANLkTim0xrx+33BeoSbXbQcu2Ab6Oin=Wg@mail.gmail.com>
	<1306914166.4405.47.camel@localhost>
In-Reply-To: <1306914166.4405.47.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Mike Frysinger <vapier.adi@gmail.com>,
	Sergei Shtylyov <sshtylyov@mvista.com>,
	Marc Zyngier <marc.zyngier@arm.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

Artem Bityutskiy wrote:

>>>>> In the process of moving platforms away from integrator-flash
>>>>> (aka armflash), add to physmap the few features that make
>>>>> armflash unique:
>>>>> - optionnal probing for the AFS partition type
>>>>> - init() and exit() methods, used by Integrator to control
>>>>>   write access to the various onboard programmable components
>>>>> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
>>>>> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
>>>>> Cc: David Woodhouse <dwmw2@infradead.org>
>>>> [...]

>>>>> diff --git a/include/linux/mtd/physmap.h b/include/linux/mtd/physmap.h
>>>>> index bcfd9f7..d37cca0 100644
>>>>> --- a/include/linux/mtd/physmap.h
>>>>> +++ b/include/linux/mtd/physmap.h
>>>>> @@ -22,6 +22,8 @@ struct map_info;
>>>>>
>>>>>  struct physmap_flash_data {
>>>>>     unsigned int            width;
>>>>> +   int                     (*init)(struct platform_device *);
>>>>> +   void                    (*exit)(struct platform_device *);
>>>>     How about a declaration for 'struct platform_device' beforehand? This breaks
>>>> build on other platforms at least...

>>> Sure. Please send a patch.

>> uhh, what ?  you broke things, so you fix them.  i already pointed out
>> this breakage to you over a week ago.
>> -mike

> The change went in via Russell's tree, I sent him a fix. It looks like
> he did not merge it.

    Russell doesn't merge patches sent to him AFAIK, they need to be put into 
his patch system first.

WBR, Sergei
