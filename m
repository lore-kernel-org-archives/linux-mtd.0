Received: from us2.outbound.mailhostbox.com ([162.210.70.54])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XRoJ1-00038p-Pq
 for linux-mtd@lists.infradead.org; Wed, 10 Sep 2014 20:15:56 +0000
Message-ID: <5410B153.80303@pek-sem.com>
Date: Thu, 11 Sep 2014 01:45:15 +0530
From: pekon <pekon@pek-sem.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 2/3] nand: omap2: Remove horrible ifdefs to fix module
 probe
References: <1410033389-32357-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1410033389-32357-3-git-send-email-ezequiel@vanguardiasur.com.ar>
 <540D6CAB.7020501@ti.com> <540D8A92.2040209@ti.com>
 <20140910124849.GA25308@arch.hh.imgtec.org>
In-Reply-To: <20140910124849.GA25308@arch.hh.imgtec.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

On Wednesday 10 September 2014 06:18 PM, Ezequiel Garcia wrote:
> On 08 Sep 01:53 PM, Roger Quadros wrote:
>> On 09/08/2014 11:45 AM, Roger Quadros wrote:
>>> On 09/06/2014 10:56 PM, Ezequiel Garcia wrote:
> [..]
>>>> diff --git a/include/linux/platform_data/elm.h b/include/linux/platform_data/elm.h
>>>> index 780d1e9..25d1bca 100644
>>>> --- a/include/linux/platform_data/elm.h
>>>> +++ b/include/linux/platform_data/elm.h
>>>> @@ -42,8 +42,22 @@ struct elm_errorvec {
>>>>   	int error_loc[16];
>>>>   };
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
Does following work ?
config MTD_NAND_OMAP_BCH
	depends on MTD_NAND_OMAP2
	tristate "<message>" if (MTD_NAND_OMAP2 && m)
	bool	 "<message>" if (MTD_NAND_OMAP2 && y)
	default n
	...

Sorry, I don't have tools to check myself. If not following should help:
$KERNEL/Documentation/kbuild/kconfig-language.txt


with regards, pekon

------------------------
Powered by BigRock.com
