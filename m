Received: from mail-ob0-x231.google.com ([2607:f8b0:4003:c01::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1acFiU-0004Ge-R9
 for linux-mtd@lists.infradead.org; Sat, 05 Mar 2016 17:10:11 +0000
Received: by mail-ob0-x231.google.com with SMTP id fz5so75404344obc.0
 for <linux-mtd@lists.infradead.org>; Sat, 05 Mar 2016 09:09:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CACRpkdZusueSh99D2JQj5=JQqHAeedTS=X2vm48U58PLbhamcQ@mail.gmail.com>
References: <1453806725-4880-1-git-send-email-linus.walleij@linaro.org>
 <1453806725-4880-3-git-send-email-linus.walleij@linaro.org>
 <CACRpkdY4fNfQWaKAZcak0yzJ2B17hbrqdU=Q4=NiwiWRNv_0yQ@mail.gmail.com>
 <CACRpkdZusueSh99D2JQj5=JQqHAeedTS=X2vm48U58PLbhamcQ@mail.gmail.com>
Date: Sun, 6 Mar 2016 00:09:49 +0700
Message-ID: <CACRpkdZYTAyEejiVivhP44cEhxHMG6sL1VbrJjx=jGe-znyn7A@mail.gmail.com>
Subject: Re: [PATCH 2/6] mtd: physmap_of: add a hook for Versatile write
 protection
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Grant Likely <grant.likely@linaro.org>,
 Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 22, 2016 at 8:09 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Sat, Feb 13, 2016 at 2:19 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Tue, Jan 26, 2016 at 12:12 PM, Linus Walleij
>> <linus.walleij@linaro.org> wrote:
>>
>>> In order to support device tree probing of Versatile NOR flash
>>> chips, there must be a way to add the VPP (write protection)
>>> enable/disable callback. The register in question is in the
>>> system controllers of these machines. Apart from this quirk,
>>> the ARM flash chips are standard CFI flash chips from various
>>> vendors.
>>>
>>> Additionally, the Integrator/AP require you to set up the external
>>> bus interface (EBI) to allow writes to the chip select where the
>>> flash memory is connected.
>>>
>>> Solve this by looking for the arm,versatile-flash compatible
>>> string in the flash device tree node. In the driver,
>>> add a special hook to check for the various Versatile syscons and
>>> register a callback for .set_vpp() if this compatible is present.
>>>
>>> Provide a special Kconfig entry for the addon hook so it will
>>> not be compiled in if the Versatile boards are not supported.
>>> Stubs in the header file make sure the impact will be zero on
>>> other platforms. (Compilers optimze this out.)
>>>
>>> With this patch, a large slew of ARM board file code can be
>>> removed.
>>>
>>> Cc: Grant Likely <grant.likely@linaro.org>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Arnd Bergmann <arnd@arndb.de>
>>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> Do you think my reply to this about reference counting and
>> subsequent (accepted) patch to update the documentation
>> to reflect 876fe76d793d03077
>> "mtd: maps: physmap: Add reference counter to set_vpp()"
>> is enough to warrant merging of this?
>>
>> If you want the code developed in any special direction
>> just tell me.
>
> Ping.

Ping.

Yours,
Linus Walleij
