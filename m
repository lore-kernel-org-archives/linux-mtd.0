Received: from devils.ext.ti.com ([198.47.26.153])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XRhbZ-0005k1-2y
 for linux-mtd@lists.infradead.org; Wed, 10 Sep 2014 13:06:38 +0000
Message-ID: <54104CB4.4020703@ti.com>
Date: Wed, 10 Sep 2014 16:05:56 +0300
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH 2/3] nand: omap2: Remove horrible ifdefs to fix module
 probe
References: <1410033389-32357-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1410033389-32357-3-git-send-email-ezequiel@vanguardiasur.com.ar>
 <540D6CAB.7020501@ti.com> <540D8A92.2040209@ti.com>
 <20140910124849.GA25308@arch.hh.imgtec.org>
In-Reply-To: <20140910124849.GA25308@arch.hh.imgtec.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Tony Lindgren <tony@atomide.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 =?ISO-8859-1?Q?Guido_Mart=EDnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/10/2014 03:48 PM, Ezequiel Garcia wrote:
> On 08 Sep 01:53 PM, Roger Quadros wrote:
>> On 09/08/2014 11:45 AM, Roger Quadros wrote:
>>> On 09/06/2014 10:56 PM, Ezequiel Garcia wrote:
> [..]
>>>> diff --git a/include/linux/platform_data/elm.h b/include/linux/platform_data/elm.h
>>>> index 780d1e9..25d1bca 100644
>>>> --- a/include/linux/platform_data/elm.h
>>>> +++ b/include/linux/platform_data/elm.h
>>>> @@ -42,8 +42,22 @@ struct elm_errorvec {
>>>>  	int error_loc[16];
>>>>  };
>>>>  
>>>> +#if IS_ENABLED(CONFIG_MTD_NAND_OMAP_BCH)
>>
>> I still get the following error if I set CONFIG_MTD_NAND_OMAP2 to y and
>> CONFIG_MTD_NAND_OMAP_BCH to m.
>>
>> CONFIG_MTD_NAND_OMAP_BCH is used to select the ELM driver and it must be limited to
>> be built-in if CONFIG_MTD_NAND_OMAP2 is built-in.
>>
> 
> Hm, yup. Any ideas on how to accomplish that? My Kconfig-foo is not strong enough :(
>  
> 
Mine neither ;). I'm unaware of any other method than making CONFIG_MTD_NAND_OMAP_BCH to bool.

cheers,
-roger
