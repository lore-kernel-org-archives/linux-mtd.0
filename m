Received: from yw-out-1718.google.com ([74.125.46.158])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Km5WC-0007rg-4u
	for linux-mtd@lists.infradead.org; Sat, 04 Oct 2008 11:41:52 +0000
Received: by yw-out-1718.google.com with SMTP id 5so1111305ywm.72
	for <linux-mtd@lists.infradead.org>;
	Sat, 04 Oct 2008 04:41:51 -0700 (PDT)
Message-ID: <c384c5ea0810040441u77ebf879i8c4a2be8675ca26c@mail.gmail.com>
Date: Sat, 4 Oct 2008 13:41:50 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: "Haavard Skinnemoen" <haavard.skinnemoen@atmel.com>
Subject: Re: [PATCH] mtd: AT49BV6416 has swapped erase regions
In-Reply-To: <20080930142207.72d5edaa@hskinnemo-gx745.norway.atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1222775733-6690-1-git-send-email-haavard.skinnemoen@atmel.com>
	<c384c5ea0809300502h48915058r78a6586968c1ac1a@mail.gmail.com>
	<20080930142207.72d5edaa@hskinnemo-gx745.norway.atmel.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Haavard, all,

this topic has now diverted to u-boot, as Linux is fixed.  I am
posting in the existing thread to keep the information coherent.

On Tue, Sep 30, 2008 at 2:22 PM, Haavard Skinnemoen
<haavard.skinnemoen@atmel.com> wrote:
> "Leon Woestenberg" <leon.woestenberg@gmail.com> wrote:
>> Haavard,
>> On Tue, Sep 30, 2008 at 1:55 PM, Haavard Skinnemoen
>> <haavard.skinnemoen@atmel.com> wrote:
>> > The CFI information read from AT49BV6416 lists the erase regions in the
>> > wrong order, causing problems when trying to erase or update the first
>> > or last 64K block.
>> >
>> Are there other Atmel designs with this bug or only the chip with this CFI ID?
>
> That's a good question. I guess there may be others in the same family
> with the same bug. I don't really know.
>
> The replacement, AT49BV642D, does not have this bug.
>
>> I ask, because the check in u-boot is too generic; I found u-boot
>> wrongly assumes wrong order for another Atmel part, not checking on a
>> specific CFI ID.
>
> That's interesting...especially since u-boot only reads the low byte
> of the JEDEC ID, so adding a fixup for one particular ID may match tons
> of chips with 16-bit IDs.
>
> I'll have to check the latest u-boot and see if it breaks any of my
> boards.
>
I just checked on a custom design, AP7000 with AT49BV320DT, which
reports its top boot bit correctly.
info->device_id == c4 for this part.

The u-boot flash_fixup_atmel() currently reverses geometry whenever
the top boot bit is set, which seems wrong:

I have to force this to zero to make that custom board work in this
piece of code:

/* Check the "top boot" bit in the PRI */
if (info->ext_addr && !(flash_read_uchar(info, info->ext_addr + 6) & 1))
  reverse_geometry = 1;

I was hesitating to come up with a patch, because some of the check is
#ifdef'd out, and I may have missed
a u-boot convention that I should layout my sectors as
bottom-boot-block in u-boot, and reverse_geometry if 'top'?

Indeed the single byte ID check may need attention. I have to lookup
the CFI specs to be sure.

Regards,
-- 
Leon
