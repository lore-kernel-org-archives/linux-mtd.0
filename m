Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XPTd7-00085D-I3
 for linux-mtd@lists.infradead.org; Thu, 04 Sep 2014 09:47:02 +0000
Message-ID: <540834F9.8080902@ti.com>
Date: Thu, 4 Sep 2014 12:46:33 +0300
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: pekon <pekon@pek-sem.com>
Subject: Re: [PATCH 3/6] ARM: dts: am437x-gp-evm: Don't use read/write wait
 monitoring
References: <1409666227-20622-1-git-send-email-rogerq@ti.com>
 <1409666227-20622-4-git-send-email-rogerq@ti.com>
 <54061439.1030909@pek-sem.com> <5406D213.6020603@ti.com>
 <54074FFA.2020406@pek-sem.com>
In-Reply-To: <54074FFA.2020406@pek-sem.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: tony@atomide.com, "Nori, Sekhar" <nsekhar@ti.com>,
 linux-omap@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Sekhar.

Hi Pekon,

On 09/03/2014 08:29 PM, pekon wrote:
> Hi Roger,
> 
> On Wednesday 03 September 2014 02:02 PM, Roger Quadros wrote:
>> Hi Pekon,
>>
>> On 09/02/2014 10:02 PM, pekon wrote:
>>> Hi Roger,
>>>
>>>
>>> On Tuesday 02 September 2014 07:27 PM, Roger Quadros wrote:
>>>> NAND uses wait pin only to indicate device readiness after
>>>> a block/page operation. It is not use to extend individual
>>>> read/write cycle and so read/write wait pin monitoring must
>>>> be disabled for NAND.
>>>>
>>> I think this is incorrect assumption. NAND framework allows
>>> wait-pin monitoring at end of each read/write cycle. Please
>>> refer following code in drivers/mtd/nand/nand_base.c
>>>      @@ void nand_wait_ready(...)
>>>
>>> - nand_wait_ready() calls controller-driver specific call-back
>>>    for chip->dev_ready().
>>
>> It is important to note that this NAND device ready mechanism is different from
>> GPMC inter cycle wait state mechanism controlled by the read/write monitoring
>> bits. The same WAIT pin is used in both the cases.
>>
>> For more details about NAND use case refer to
>>
>> AM437x TRM:
>> Section: 9.1.3.3.12.2 NAND Device-Ready Pin
>>
>> below excerpt from there
>> "To avoid a time-out caused by a block/page opening delay in NAND flash, disable the wait pin monitoring
>> for read and write accesses (that is, set the GPMC_CONFIG1_i[[21] WAITWRITEMONITORING and
>> GPMC_CONFIG1_i[[22] WAITREADMONITORING bits to 0):
>>
> 
> I re-read the AM437x TRM, and the section you mentioned above.
> 
> -----------------
> *9.1.3.3.12.2 NAND Device-Ready Pin*
> The NAND memory device provides a ready pin to indicate data availability after a block/page opening and to indicate that data programming is complete. The ready pin can be connected to one of the WAIT GPMC input pins; data read accesses must not be tried when the ready pin is sampled inactive (device is not ready) even if the associated chip-select WAITREADMONITORING bit field is set. The duration of the NAND device busy state after the block/page opening is so long (up to 50 μs) that accesses occurring when the ready pin is sampled inactive can stall GPMC access and eventually cause a system time-out.
> If a read access to a NAND flash is done using the wait monitoring mode, the device is blocked during a page opening, and so is the GPMC. If the correct settings are used, other chip-selects can be used while
> the memory processes the page opening command.
> ...
> -----------------
> 
> It's clearly written that wait-pin monitoring is used for read/write (programs) access, and GPMC is blocked till wait signal is asserted during reads.

And you cut out the most important part where it says keep read/write wait monitoring disabled for NAND.

pasting again here.

"To avoid a time-out caused by a block/page opening delay in NAND flash, disable the wait pin monitoring
for read and write accesses (that is, set the GPMC_CONFIG1_i[[21] WAITWRITEMONITORING and
GPMC_CONFIG1_i[[22] WAITREADMONITORING bits to 0 and use one of the following methods
instead:
•Use software to poll the WAITnSTS bit (n = 0 to 1) of the GPMC_STS register.
•Configure an interrupt that is generated on the WAIT signal change (through the GPMC_IRQEN [11-8] bits).

Even if the READWAITMONITORING bit is not set, the external memory nR/B pinstatus is captured in the
programmed WAIT bit in the GPMC_STS register.
The READWAITMONITORING bit method must be used for other memories than NAND flash, if they require the use of a WAIT signal."

> Also, on NAND there can be no read/write access except at page-level

And how are command/address inputs sent? ;)

> so wait-pin monitoring is implicitly related to read/write accesses.
> However, whether you use it or not is purely user's choice, but it
> has performance impact.

I don't know what you are talking about. I have tried to explain many times but you fail to understand.
Nand device ready pin is not same as the wait pin used on other memories where it is used to
extend each read/write cycle (by inserting wait state). It is only used to indicate that
the NAND device is busy during a block/page operation, so that new commands won't be sent to it
by the host processor. This is different from TI GPMC wait monitoring. You have to monitor this
device ready pin out of band like polling the status bit or using GPMC interrupt on wait pin transition.

Looks like you are getting confused because the same WAIT pin on the SoC is used to get this
device ready pin status into the SoC.

> 
> You are probably seeing timeout condition when enabling wait-pin
> monitoring, and this can be due to multiple reasons like;
> (1) incorrect pin-mux configuration (like directions, pull-up etc)
> (2) incorrect board-level pull-up
> (3) incorrect driver setting, like though wait-pin is enabled but
>     wrong wait-pin is being monitored.

No for all the 3.

> 
> I request you to fix this instead of disabling it completely,
> as you should see significant NAND throughput increase once this
> feature works correctly.
> 
>>>
>>> - chip->dev_ready in-case of OMAP NAND drivers is set in
>>>    drivers/mtd/nand/omap2.c  during probe.
>>>      if (pdata->dev_ready) {
>>>          nand_chip->dev_ready = omap_dev_ready;
>>>          nand_chip->chip_delay = 0;
>>>      }
>>>
>>> Problem is we don't set pdata->dev_ready correctly as part
>>> of platform-data dring GPMC initialization. This was what my
>>> earlier patch for wait-pin monitoring about. But it was a
>>> quick fix for NAND devices.
>>>
>>> So, I suggest to fix wait-pin monitoring instead of de-scoping
>>> it from DTS as wait-pin monitoring should boast the NAND
>>> performance significantly.
>>> (please see if you can find an old mail thread which had some
>>> good feedbacks from Ezequiel and Javier about wait-pin monitoring).

This patch is for the 3.17 bug fix cycle. Implementing NAND device ready mechanism
is a new feature (for DT case) and I will work on it for future versions.

Also I'm not de-scoping wait-pin (or more correctly device ready) mechanism for NAND.
The dts file still contains "wait-pin = <0>" property. This will be used to
monitor the NAND device ready status via GPMC status or GPMC interrupt.
But this is not for 3.17 bug fix cycle.

see omap_dev_ready()
http://lxr.free-electrons.com/source/drivers/mtd/nand/omap2.c#L1025

>>
>> This is to get the device ready mechanism work and has nothing to do with
>> GPMC wait monitoring. Instead the WAIT pin is used to generate the GPMC
>> interrupt based on the WAIT pin polarity.
>>
>> To monitor NAND device ready status
>> from TRM
>> "-Use software to poll the WAITnSTS bit (n = 0 to 1) of the GPMC_STS register.
>> OR
>> -Configure an interrupt that is generated on the WAIT signal change (through the GPMC_IRQEN [11-8] bits)"
>>
>>>
>>> [...]
>>>
>>>> This patch also gets rid of the below warning when NAND is
>>>> accessed for the first time.
>>>>
>>>> omap_l3_noc 44000000.ocp: L3 application error: target 13 mod:1 (unclearable)
>>>>
>>> Can you debug this further.
>>> This warning probably comes when driver tries to access some
>>> "reserved" addresses. Or violate read/write bits.
>>
>> It is caused because of incorrectly enabled the GPMC wait monitoring. Disabling the
>> wait monitoring gets rid of this error. I don't understand what else I should debug
> 
> I'm not sure how a NAND or GPMC feature can cause omap_l3_noc: L3 application error ?
> But now as I re-read the text, its probably the L3 interconnect timeout
> error due to no response from GPMC. There is a timer in L3 which monitors if the L3 interconnect is stalled/blocked waiting for response
> from a target. I think it's that timer which is getting timeout. (but just my guess).

Yes that indeed is the case.

> 
> 
>> and why.
>>
> As there were number of users on linux-mtd list wanted to use
> NAND wait-pin monitoring on OMAP devices, so I have just looped
> them if they see any concerns.


It is called NAND device ready mechanism (not wait-pin monitoring). It never worked till now with DT so it is a new feature.

> Otherwise, no further concerns from me.

Thanks.

cheers,
-roger
