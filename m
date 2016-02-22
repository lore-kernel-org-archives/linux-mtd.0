Received: from mail-ig0-x22b.google.com ([2607:f8b0:4001:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aXwr5-0006X8-HN
 for linux-mtd@lists.infradead.org; Mon, 22 Feb 2016 20:13:16 +0000
Received: by mail-ig0-x22b.google.com with SMTP id 5so90286953igt.0
 for <linux-mtd@lists.infradead.org>; Mon, 22 Feb 2016 12:12:54 -0800 (PST)
Subject: Re: [PATCH v5 00/26] memory: omap-gpmc: mtd: nand: Support GPMC NAND
 on non-OMAP platforms
To: Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>
References: <1455916548-3441-1-git-send-email-rogerq@ti.com>
 <20160219220442.GR21202@atomide.com> <56CADFD5.2040205@ti.com>
 <20160222164234.GD13417@atomide.com> <56CB69F4.8040306@ti.com>
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 ezequiel@vanguardiasur.com.ar, javier@dowhile0.org,
 computersforpeace@gmail.com, dwmw2@infradead.org, fcooper@ti.com
From: nick <xerofoify@gmail.com>
Message-ID: <56CB6BC4.7060806@gmail.com>
Date: Mon, 22 Feb 2016 15:12:52 -0500
MIME-Version: 1.0
In-Reply-To: <56CB69F4.8040306@ti.com>
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



On 2016-02-22 03:05 PM, Roger Quadros wrote:
> On 22/02/16 18:42, Tony Lindgren wrote:
>> * Roger Quadros <rogerq@ti.com> [160222 02:16]:
>>> On 20/02/16 00:04, Tony Lindgren wrote:
>>>> * Roger Quadros <rogerq@ti.com> [160219 13:27]:
>>>>> Hi,
>>>>>
>>>>> @Tony
>>>>> Patches 15 and 24 are new and will need your review.
>>>>> I've modified patch 22 to include the new am335x boards introduced since v4.4.
>>>>>
>>>>> Patches are based on top of omap-for-v4.6/dt so that the DT changes apply cleanly.
>>>>
>>>> Looks OK to me. Can we merge the dts changes separately? Otherwise
>>>> we will easily end up with tons of conflicts..
>>>
>>> I agree. But we just need to keep in mind that NAND functionality will be
>>> broken till all the patches in this series are merged. We don't maintain
>>> backward compatibility with the old DT implementation.
>>
>> Please let's not do that! That breaks booting and git bisect.
>> It's better to have a minimal branch where each patch boots fine.
> 
> Understood. I'll send out a patch set with only the minimal DT changes
> that doesn't break anything. This should be a preparatory step for
> the DT clean up.
> 
Would you mind and try testing this on a few boards as even miminal DT
changes can break things and thus I would like to see you test it if
possible on the boards affected by the DT change.
>>
>> Also, I think you should at least print a warning for the old
>> binding. Otherwise people with out of tree boards will have
>> hard time updating their patches to send to mainline tree.
> 
Second that I agree with Tony on this it's just the reality.
Nick
> OK. I'll add this warning mechanism to the omap-gpmc driver.
> 
> cheers,
> -roger
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
