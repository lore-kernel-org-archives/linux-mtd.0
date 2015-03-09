Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YV233-0003LW-VW
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2015 18:05:02 +0000
Received: by padet14 with SMTP id et14so50473382pad.11
 for <linux-mtd@lists.infradead.org>; Mon, 09 Mar 2015 11:04:39 -0700 (PDT)
Date: Mon, 9 Mar 2015 11:04:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 0/3] mtd: nand: add Broadcom NAND controller support
Message-ID: <20150309180431.GW18140@ld-irv-0074>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <CACna6rykQTjtfL8mqHJ4ZSY9Ci+kVhjDfDkjRpsFvg4YatNATw@mail.gmail.com>
 <20150308005720.GF12966@brian-ubuntu>
 <CACna6rz656H-K1hPaSGyOE+x4RKfqdUdnWKhff87n=0dvHB+fw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACna6rz656H-K1hPaSGyOE+x4RKfqdUdnWKhff87n=0dvHB+fw@mail.gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, sbranden@broadcom.com,
 Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Kevin Cernekee <cernekee@gmail.com>,
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

On Sun, Mar 08, 2015 at 11:22:40AM +0100, Rafał Miłecki wrote:
> On 8 March 2015 at 01:57, Brian Norris <computersforpeace@gmail.com> wrote:
> > 2. Endianness is a known issue with at least one other platform. On many
> > chips (spanning MIPS LE, MIPS BE, and ARM LE), NAND has been integrated
> > such that data can just be read/programmed in the native endianness
> > through the FLASH_CACHE registers (as this driver does), but there are a
> > few (on ARM, LE) that require a be32_to_cpu()/cpu_to_be32() swap. I'm
> > considering supporting DT properties like one of the following:
> >
> >         brcm,nand-cache-be
> >         brcm,nand-cache-big-endian
> >         brcm,nand-cache-reverse-endian
> >
> > You might also check (though I might actually be better equipped for
> > this) if there is a separate register that can tell the NAND data bus to
> > automatically endian-swap data into the native endianness. I know a lot
> > of the buses and peripherals in BCG, at least, are designed such that
> > either (1) they can work naturally in the CPU's native endianness or
> > else (2) they can be configured to swap endianness into either format.
> >
> > But if such a register does not exist, then we'll definitely have to do
> > something like the DT property above.
> 
> It seems there is such a magic register. Please take a look at bcm_nand.c:
> https://dev.openwrt.org/browser/trunk/target/linux/bcm53xx/patches-3.18/420-mtd-bcm5301x_nand.patch
> 
> There are multiple places (data, OOB, reads, writes) with:

So you do data and OOB in little endian? At least that seems consistent.

> /* Set controller to Little Endian mode for copying */
> bcmnand_reg_awrite(ctrl, NANDC_IDM_APB_LITTLE_ENDIAN, 1);
> 
> /* Return to Big Endian mode for commands etc */
> bcmnand_reg_awrite(ctrl, NANDC_IDM_APB_LITTLE_ENDIAN, 0);
> 
> That register is 0x408, but it's in "agent" core (AKA wrapper), so
> it's separated mapping. I'm not sure what address is it right now, as
> we read them from the EROM.
> 
> 
> > Do the bad block markers look OK without extra endian swapping? I'm
> > wondering whether the swapping will have to occur on both the
> > FLASH_CACHE and SPARE_AREA registers.
> 
> I don't know, I didn't try nand-on-flash-bbt.

You don't have to use on-flash BBT to notice. Without a flash-based BBT,
you should just be scanning for bad block markers on *every* boot. Do
you read factory-marked bad block markers correctly? Or maybe you see no
factory bad blocks?

Note that this is sometimes hard to tell, if the factory just programmed
the entire page + OOB to 0x00; then you obviously don't have to worry
about endianness. But if they programmed a word of 0xffffff00, then you
definitely do need to care!

Brian
