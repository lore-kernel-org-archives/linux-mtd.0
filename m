Received: from mail-ie0-x22e.google.com ([2607:f8b0:4001:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YUYMR-0006ox-45
 for linux-mtd@lists.infradead.org; Sun, 08 Mar 2015 10:23:03 +0000
Received: by iecvy18 with SMTP id vy18so31972914iec.1
 for <linux-mtd@lists.infradead.org>; Sun, 08 Mar 2015 03:22:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150308005720.GF12966@brian-ubuntu>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <CACna6rykQTjtfL8mqHJ4ZSY9Ci+kVhjDfDkjRpsFvg4YatNATw@mail.gmail.com>
 <20150308005720.GF12966@brian-ubuntu>
Date: Sun, 8 Mar 2015 11:22:40 +0100
Message-ID: <CACna6rz656H-K1hPaSGyOE+x4RKfqdUdnWKhff87n=0dvHB+fw@mail.gmail.com>
Subject: Re: [PATCH 0/3] mtd: nand: add Broadcom NAND controller support
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Corneliu Doban <cdoban@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Kevin Cernekee <cernekee@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, bcm-kernel-feedback-list@broadcom.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8 March 2015 at 01:57, Brian Norris <computersforpeace@gmail.com> wrote:
> 2. Endianness is a known issue with at least one other platform. On many
> chips (spanning MIPS LE, MIPS BE, and ARM LE), NAND has been integrated
> such that data can just be read/programmed in the native endianness
> through the FLASH_CACHE registers (as this driver does), but there are a
> few (on ARM, LE) that require a be32_to_cpu()/cpu_to_be32() swap. I'm
> considering supporting DT properties like one of the following:
>
>         brcm,nand-cache-be
>         brcm,nand-cache-big-endian
>         brcm,nand-cache-reverse-endian
>
> You might also check (though I might actually be better equipped for
> this) if there is a separate register that can tell the NAND data bus to
> automatically endian-swap data into the native endianness. I know a lot
> of the buses and peripherals in BCG, at least, are designed such that
> either (1) they can work naturally in the CPU's native endianness or
> else (2) they can be configured to swap endianness into either format.
>
> But if such a register does not exist, then we'll definitely have to do
> something like the DT property above.

It seems there is such a magic register. Please take a look at bcm_nand.c:
https://dev.openwrt.org/browser/trunk/target/linux/bcm53xx/patches-3.18/420=
-mtd-bcm5301x_nand.patch

There are multiple places (data, OOB, reads, writes) with:

/* Set controller to Little Endian mode for copying */
bcmnand_reg_awrite(ctrl, NANDC_IDM_APB_LITTLE_ENDIAN, 1);

/* Return to Big Endian mode for commands etc */
bcmnand_reg_awrite(ctrl, NANDC_IDM_APB_LITTLE_ENDIAN, 0);

That register is 0x408, but it's in "agent" core (AKA wrapper), so
it's separated mapping. I'm not sure what address is it right now, as
we read them from the EROM.


> Do the bad block markers look OK without extra endian swapping? I'm
> wondering whether the swapping will have to occur on both the
> FLASH_CACHE and SPARE_AREA registers.

I don't know, I didn't try nand-on-flash-bbt.

--=20
Rafa=C5=82
