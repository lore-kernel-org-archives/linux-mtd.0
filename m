Received: from mail-vb0-x233.google.com ([2607:f8b0:400c:c02::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHUuw-00041w-1T
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 07:55:39 +0000
Received: by mail-vb0-f51.google.com with SMTP id fq11so3263486vbb.10
 for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2013 00:55:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1363591314.20738.11.camel@sauron.fi.intel.com>
References: <1362904877-20144-1-git-send-email-computersforpeace@gmail.com>
 <1363591314.20738.11.camel@sauron.fi.intel.com>
Date: Mon, 18 Mar 2013 00:55:35 -0700
Message-ID: <CAN8TOE9XArpfaX_Uf6GJneX7k9R_r56x6Z08qFvRr30-90okWw@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: m25p80: utilize dedicated 4-byte addressing
 commands
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Marek Vasut <marex@denx.de>, Kevin Cernekee <cernekee@gmail.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 18, 2013 at 12:21 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Sun, 2013-03-10 at 00:41 -0800, Brian Norris wrote:
>> Traditionally, the command set used by SPI flash only supported a 3-byte
>> address. However, large SPI flash (>= 32MB, or 256Mbit) require 4 bytes
>> to address the entire flash. Most manufacturers have supplied a mode
>> switch (via a "bank register writer", or a "enable 4-byte mode"
>> command), which tells the flash to expect 4 address cycles from now on,
>> instead of 3. This mode remains until power is cut, the reset line is
>> triggered (on packages where present), or a command is sent to reset the
>> flash or to reset the 3-byte addressing mode.
>
> Aiaiai!
>
> Build fails on all my general testing defconfigs.
>
> --------------------------------------------------------------------------------
> Failed to build the following commit for configuration "arm-omap2plus_defconfig" (architecture arm)":
>
> d4222c5 mtd: nand: reword nand_chip bad block interface comments
<snip>

Wow, my bad. I actually wrote and tested this against an older kernel,
then ported it. In fixing some conflicts, I misplaced my braces...

Anyway, this error (plus a logical mistake that I noticed, regarding
the placement of the "fast_read" check) tells me I should take a
closer look at this one. I'll get back with v2 eventually.

Brian
