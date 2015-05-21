Received: from mail-ig0-x234.google.com ([2607:f8b0:4001:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvLGP-0006YX-Cx
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 07:51:34 +0000
Received: by igbpi8 with SMTP id pi8so3700814igb.0
 for <linux-mtd@lists.infradead.org>; Thu, 21 May 2015 00:51:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150520184028.GF11598@ld-irv-0074>
References: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
 <1431877266-28566-6-git-send-email-hauke@hauke-m.de>
 <20150520003402.GC11598@ld-irv-0074>
 <CACna6rzBn3yzzER56aAmk+VPNiMh9ikA3B1YZmMesF=3DWdq+A@mail.gmail.com>
 <20150520184028.GF11598@ld-irv-0074>
Date: Thu, 21 May 2015 09:51:11 +0200
Message-ID: <CACna6rwc=Qudqw8e3N9SO7xEGZCx=LgwrBEVqzJHi9KMSjhyVw@mail.gmail.com>
Subject: Re: [PATCH 5/7] mtd: brcmnand: add bcma driver
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Ray Jui <rjui@broadcom.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 20 May 2015 at 20:40, Brian Norris <computersforpeace@gmail.com> wrote:
> On Wed, May 20, 2015 at 08:39:06AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> On 20 May 2015 at 02:34, Brian Norris <computersforpeace@gmail.com> wrot=
e:
>> > On Sun, May 17, 2015 at 05:41:04PM +0200, Hauke Mehrtens wrote:
>> >> This driver registers at the bcma bus and drives the NAND core if it
>> >> was found on this bus. The bcma bus with this NAND core is used on th=
e
>> >> bcm53xx and bcm47xx Northstar SoC with ARM CPU cores. The memory rang=
es
>> >> are automatically detected by bcma and the irq numbers read from devi=
ce
>> >> tree by bcma bus driver.
>> >
>> > If you're going to use device tree for part of it (IRQs) why not the
>> > whole thing?
>> >
>> >> This is based on the iproc driver.
>> >
>> > This looks like you could probably get by with just using iproc_nand.c
>> > as-is. The main NAND core is apparently MMIO-accessible on your chips,
>> > so aren't the BCMA bits you're touching also?
>>
>> That's right, in case of SoCs cores are MMIO-accessible, however I see
>> few reasons for writing this driver as bcma based:
>> 1) MMIO access isn't available for bcma bus /hosted/ on PCIe devices.
>> By using bcma layer we write generic drivers.
>
> I strongly doubt that this NAND core is ever put on a PCIe endpoint.

Sure, but I still don't understand why you want to bypass some layer
that helps with stuff. When I tried to implement whole SPI stuff in
bcm53xxspiflash, I was told to work on separated SPI host driver
instead. I did. When someone recently tried to workaround some SPI
host data limit, he was told to fix SPI host driver.
I don't see a reason why we're trying to skip the bcma layer for brcmnand.


>> 2) bcma detects cores and their MMIO addresses automatically, if we
>> are a bit lazy, it's easier to use it rather than keep hardcoding all
>> addresses
>
> Laziness is a pretty bad excuse. You already have to do 60% of the work
> by putting the IRQs and base NAND register range into the device tree.
> Finding those remaining two register addresses is not so hard.

Lazy I was not checking dictionary for a better word.
IRQs are indeed read from DT, because hardware doesn't provide info about t=
hem.

However it's a different story for register ranges. We read them from
device's (bus's) EEPROM, not DT. Why is it important? One Broadcom SoC
chipset may have various cores (SoC devices)
available/enabled/disabled depending on the manufacturer. It means we
*can't* store list of cores (SoC devices) per chip as it varies. An
example: some BCM4708 SoCs have 2 PCIe host cores, some have 3 of
them. Reading info about cores from hardware (EEPROM) gives you an
answer. I can't really imagine storing such info per every possible
market device nor building such DTs. I would need to ask device owner
to use bcma to read info about cores and them copy it into DT. I don't
really see the point. Please note that we are talking about every
single device model because there isn't anything like a set of few
generic PCB designs. Every manufacturer applies its own modifications.
I also can't see what's so wrong with this design. I understand you
put info about CPU in DT, but not all stuff goes there, right? E.g.
we don't put info about NAND flash connected to the controller. We
simply use ONFI (or some other semi-standards) to read chip info.
Should we now get rid of nand_flash_detect_onfi and
nand_flash_detect_jedec and store flash params in DT of every
supported device model?


>> 3) There are some dependencies in cores initialization, e.g.
>> ChipCommon core usually has to be initialized first
>
> Are you aware of any important dependencies? Isn't it safe to assume
> that the ChipCommon core would have to be initialized way before any
> peripherals?

On ARM we are left with ChipCommon only I believe. On MIPS we need to
also initialize MIPS core and on PCIe devices we have to initialize
PCIe core.


>> 4) bcma provides some helpers like bcma_core_enable so we don't have
>> to duplicate it in driver code
>
> I don't see why we need to reset/re-enable the NAND core in the kernel
> at all, but if we do, this is touching the exact same registers as
> iproc_nand.c is already. So it makes sense to *share* that code, and do
> the same thing on both Cygnus and Northstar, etc. (And no, Cygnus can't
> convert to BCMA, so we can't do 100% sharing either way.)

I believe Cygnus differs from Northstar and handles
initialization/IRQs differently. I guess it doesn't need the same core
reset routing as bcma/Northstar performs? Don't worry, converting it
to bcma is the last thing I plan to do.


>> That said, I'm for using bcma layer, even if there is some small DT
>> involvement already.
>
> For any reasons besides the above? Cause I'm still not convinced we need
> a BCMA driver at all.

Could you tell me why we *don't* want to have bcma so much?

--=20
Rafa=C5=82
