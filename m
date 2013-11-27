Message-ID: <5295EE7B.6030504@ti.com>
Date: Wed, 27 Nov 2013 18:37:07 +0530
From: Sekhar Nori <nsekhar@ti.com>
MIME-Version: 1.0
To: "ivan.khoronzhuk" <ivan.khoronzhuk@ti.com>
Subject: Re: [PATCH] ARM: davinci: aemif: get rid of davinci-nand driver
 dependency on aemif
References: <5291CB01.1010506@ti.com>
 <1385409654-19006-1-git-send-email-ivan.khoronzhuk@ti.com>
 <5295AECB.7040503@ti.com> <5295D102.2010101@ti.com>
In-Reply-To: <5295D102.2010101@ti.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com,
 linux@arm.linux.org.uk, pawel.moll@arm.com, swarren@wwwdotorg.org,
 ijc+devicetree@hellion.org.uk, galak@kernel.crashing.org,
 rob.herring@calxeda.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, rob@landley.net,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 27 November 2013 04:31 PM, ivan.khoronzhuk wrote:
>>> @@ -192,9 +193,15 @@ static __init void davinci_ntosd2_init(void)
>>>           davinci_cfg_reg(DM644X_ATAEN_DISABLE);
>>>
>>>           /* only one device will be jumpered and detected */
>>> -        if (HAS_NAND)
>>> +        if (HAS_NAND) {
>>>               platform_device_register(
>>>                       &davinci_ntosd2_nandflash_device);
>>> +
>>> +            if (davinci_aemif_setup(
>>> +                &davinci_ntosd2_nandflash_device))
>>> +                pr_warn("%s: Cannot configure AEMIF.\n",
>>> +                    __func__);
>>
>> This is looking really ugly. Can you shorten
>> davinci_ntosd2_nandflash_device to just "ntosd2_nandflash" or similar?
> 
> The rename is not related to the patch, so I won't do this.

The reason I asked you to rename is not because I want to push some
random clean-up into this patch. You had to introduce a line so broken
that its almost unreadable. I offered the suggestion as a way to improve
the readability of the code you are introducing in *this* patch.

Thanks,
Sekhar
