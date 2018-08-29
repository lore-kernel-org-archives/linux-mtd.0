Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuz6E-00026l-Sq
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2018 11:57:39 +0000
Received: by mail-wr1-x444.google.com with SMTP id o37-v6so4548470wrf.6
 for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2018 04:57:16 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: fix options for mx66l51235f
To: Alexander Amelkin <a.amelkin@yadro.com>, linux-mtd@lists.infradead.org
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, leroi.lists@gmail.com
References: <c27b9cb1-33a1-221d-abd8-30050fe2b23b@yadro.com>
 <b2ff17cc-96ca-3acb-6dc2-f7a8688a0742@gmail.com>
 <65072cc4-601b-250b-f797-604368776c3c@yadro.com>
 <f21bc842-47c8-eefd-1af5-3811c2bd25b0@gmail.com>
 <286877dc-22fe-9f49-458a-6a6a0ce0b1c0@yadro.com>
 <c02dc76b-adc7-4c6f-f3c1-3131ce86e0b0@gmail.com>
 <a5ae1f53-b7ae-4054-f11e-d8c44b5931cb@yadro.com>
 <c146b739-6ab8-7b2f-9923-588beff7b9d6@gmail.com>
 <8bc767cd-0000-7e6b-aa1f-0e2a71841f82@yadro.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <5678bf9c-6d9d-294d-3029-710988108bc3@gmail.com>
Date: Wed, 29 Aug 2018 13:46:50 +0200
MIME-Version: 1.0
In-Reply-To: <8bc767cd-0000-7e6b-aa1f-0e2a71841f82@yadro.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/29/2018 01:00 PM, Alexander Amelkin wrote:
> 
> 28.08.2018 19:03, Marek Vasut wrote:
>> 
>>>>> Probably it would be best not to merge this patch into Linux 
>>>>> kernel. I'll discuss it with colleagues from OpenPOWER
>>>>> community and we'll probably fix it on SBE side.
>>>> Can you fix the firmware ? If so, that'd be amazing.
>>> It turns out that it is impossible to fix that on firmware side 
>>> mainly because the firmware does not send any opcodes over SPI
>>> at all. It relies on the SPI flash controller to do the address
>>> mapping so the firmware accesses the chip as a usual memory
>>> address range. The flash controller is located in our case inside
>>> Aspeed AST2400 BMC SoC and does not support 4B opcodes. It
>>> expects the chip to respond to generic READ and WRITE opcodes
>>> with (configurable) either 3 or 4 address byte cycles. So the
>>> only way to make it work is put the chip in EN4B mode when BMC
>>> boots.
>> And who does that ? Or is the EN4B set by default and U-Boot/Linux 
>> _clears_ it , thus making the board unbootable ?
>> 
>> Doesn't it simply mean your board is missing SPI NOR hardware reset
>> line?
> 
> No, you're probably just missing it. In servers the BMC is always on
> when PSUs are connected to mains. The flash chip in question is the
> one used to boot the host (OpenPOWER P8), not the BMC (ASpeed
> AST2400).

OK

> U-boot on AST2400 has nothing to do with the chip. When BMC
> boots, it loads a driver for the host's chip (because it is connected
> to the BMC SoC for the BMC to be able to upgrade the host's
> firmware), and the driver initializes the chip to the right mode. The
> BMC reads host firmware version info, etc. from the chip. It may also
> update the firmware or parts of it. Then it powers up the host and
> the host reads the chip via the memory window mapped on LPC bus by
> the BMC.

OK

> The BMC hardware (AST2400 in our case) translates memory
> transactions into SPI Flash commands. Unfortunately for us, AST2400
> (unlike newer models) only supports generic 3-byte commands (READ,
> READ FAST, PP, etc.), but has a 'hack' that allows for using 4-byte
> addresses with those commands. Thus if an over-16MB flash chip is
> connected (and the firmware image itself is over 16MB), and thus
> AST2400 is configured in 4-byte address cycle mode, it is crucial
> that the flash chip is in EN4B mode as well. That's what was provided
> by the spi-nor driver before Roman Yeryomin's commit and by this
> patch that reverts that commit. When OpenBMC project upgraded from
> kernel 4.13 to 4.17, it sucked in the commit made in version 4.15 and
> thus broke the mechanism I described above.

Ah, so the whole problem is, the ASpeed 2400 SPI NOR controller does
memory-mapped read from the flash and that has some limitations when the
flash is over 16 MiB in size -- it sends 3 byte standard opcodes with 4
byte address ?

> The flash chip in question does have a hardware reset line, but it
> does not matter in this case at all. Resetting the chip will bring it
> into EX4B (3-byte) mode, and that's not what is needed. Basically,
> that's exactly what is happening now (without this patch).
> 
> By the way, the newer AST2500 BMC chip has support for 4-byte
> commands and most probably does not have this problem.

I see

>>> As this is quite a specific case, I guess you won't be willing to
>>> remove the SPI_NOR_4B_OPCODES option globally. We'll have to keep
>>> the patch local to openbmc project
>> I am more worried about this being actually unfixable in reliable
>> way.
> Well, configuring the chip for EN4B mode before powering on the host
> is quite reliable. There is no-one to interfere with this setup
> in-between and even after the host is booted, as there is no driver
> in Linux for AST2400-based SPI controller on LPC bus (as seen from
> the host). There is only driver for that peripheral as seen from
> BMC.

To simplify the situation, if the ASpeed 2400 SPI NOR controller tried
reading the SPI flash past 16 MiB, it would also require that the flash
is in EN4B mode, yes ?

>>>> But still, there can be a software which does rogue
>>>> transmission on the SPI bus and flips the flash into 3B mode
>>>> before reset, so the system will not boot anyway. Do you have a
>>>> way to deal with that somehow ?
>>> Sure. As I said, there is no way to turn on the host without BMC 
>>> knowing/controlling it. The BMC ensures the chip is in the right 
>>> mode. That's actually the reason why this patch appeared in the
>>> first place. Also, there is no rogue software on BMC.
>> OK, but if the BMC puts the chip in a defined state, how come the
>> system will refuse to (re)boot if Linux interferes with the chip's
>> volatile register settings ?
>
> Because it was BMC's Linux that got broken, not host's. The commit
> fetched into BMC's linux while upgrading 4.13 to 4.17 resulted in
> putting the chip in a wrong state.
> 
> I start thinking about maybe adding an option to "jedec,spi-nor" DTS
> binding like "enable-4byte-mode", so that we could get rid of our
> local patch and just specify that option in the devicetree. The
> option would force EN4B on the chip if it supports that mode. What do
> you think? How do I do it if you approve? Send patches separately in
> here and in the devicetree mailing list or cross-post both patches to
> both lists?

That's an option. But what I think this is really about is a fact that
we completely lack any way to negotiate limitations between the SPI NOR
and the controller.

-- 
Best regards,
Marek Vasut
