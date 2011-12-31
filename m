Message-ID: <4EFE8215.8030301@freescale.com>
Date: Sat, 31 Dec 2011 11:31:33 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH v2] MTD/GPMI bugfix : reset the BCH module when it is
 not MX23
References: <1325233646-3343-1-git-send-email-b32955@freescale.com>
 <20111230143658.GA9141@pengutronix.de> <4EFE7236.10609@freescale.com>
 <201112310415.02867.marek.vasut@gmail.com>
In-Reply-To: <201112310415.02867.marek.vasut@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: baruch@tkos.co.il, koen.beel.barco@gmail.com,
 Wolfram Sang <w.sang@pengutronix.de>, linux-mtd@lists.infradead.org,
 Artem.Bityutskiy@intel.com, shijie8@gmail.com,
 linux-arm-kernel@lists.infradead.org, LW@karo-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,
>> Hi,
>>
>>> On Fri, Dec 30, 2011 at 04:27:26PM +0800, Huang Shijie wrote:
>>>> In MX28, if we do not reset the BCH module. The BCH module may
>>>> becomes unstable when the board reboots for several thousands times.
>>> Do you have more details when and why this happens? What happens on MX23
>>> then?
>> In one customer's 3G router which uses the MX28:
>> [0] NAND boot mode, mount the UBIFS in the NAND partition.
>> [1] We used the gpmi_reset_block(r->bch_regs, true) to init the BCH module.
>> [2] The board will automatically reboot again after it booted by NAND
>> boot mode.
>> [3] After reboot more then thousands times(cost nearly one day), the BCH
>> mode became UNSTABLE,
>> the data read out was not right, so the system could not mount the UBIFS.
>>
>> After we use gpmi_reset_block(r->bch_regs, false) to init the BCH
>> module, the bug never happens.
>>
>>
>>
>> The gpmi_reset_block() was coded to avoid the NAND boot bug in MX23. So
>> MX23 does not have the bug.
>>
>>>> Signed-off-by: Huang Shijie<b32955@freescale.com>
>>> Is this Bug 2847 from the errata? Should be mentioned in the commit
>>> message and
>> Yes, this is the bug 2847 from the mx23's errata.
>>
>> I will add some comments to it.
>>
>> Best Regards
>> Huang Shijie
>>
>>> comments of the patch if so.
>>>
>>> Regards,
>>>
>>>     Wolfram
> Ah, so you confirmed it's a problem with the silicon. Good
>
yes, the bug in mx23 is really a hardware bug.

BR
Huang Shijie
