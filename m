Received: from mail-vb0-x234.google.com ([2607:f8b0:400c:c02::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UG0zY-0008TX-DE
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2013 05:46:17 +0000
Received: by mail-vb0-f52.google.com with SMTP id fa15so963489vbb.25
 for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2013 22:46:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201303101218.18769.marex@denx.de>
References: <1362904877-20144-1-git-send-email-computersforpeace@gmail.com>
 <201303101218.18769.marex@denx.de>
Date: Wed, 13 Mar 2013 22:46:14 -0700
Message-ID: <CAN8TOE9sfSPn+TiBmu+k1t_zqpOryteizrvwUu7hq1ie0X_zOw@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: m25p80: utilize dedicated 4-byte addressing
 commands
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Mar 10, 2013 at 4:18 AM, Marek Vasut <marex@denx.de> wrote:
>> Traditionally, the command set used by SPI flash only supported a 3-byte
>> address. However, large SPI flash (>= 32MB, or 256Mbit) require 4 bytes
>> to address the entire flash. Most manufacturers have supplied a mode
>> switch (via a "bank register writer", or a "enable 4-byte mode"
>> command), which tells the flash to expect 4 address cycles from now on,
>> instead of 3. This mode remains until power is cut, the reset line is
>> triggered (on packages where present), or a command is sent to reset the
>> flash or to reset the 3-byte addressing mode.
>>
>> As an alternative, some flash manufacturers have developed a new command
>> set that accept a full 4-byte address. They can be used orthogonally to
>> any of the modes; that is, they can be used when the flash is in either
>> 3-byte or 4-byte address mode.
>>
>> Now, there are a number of reasons why the "stateful" 4-byte address
>> mode switch may not be acceptable. For instance, some SoC's perform a
>> dumb boot sequence in which they only send 3-byte read commands to the
>> flash. However, if an unexpected reset occurs, the flash chip cannot be
>> guaranteed to return to its 3-byte mode. Thus, the SoC controller and
>> flash will not understand each other. (One might consider hooking up the
>> aforementioned reset pin to the system reset line so that any system
>> reset will reset the flash to 3-byte mode, but some packages do not
>> provide this pin. And in some other packages, one must choose between
>> having a reset pin and having enough pins for 4-output QSPI support.
>> It is an error prone process choosing a flash that will support a
>> hardware reset pin!)
>>
>> This patch provides support for the new stateless command set, so that
>> we can avoid the problems that come with a stateful addressing mode
>> change. The flash can be left in "3-byte mode" while still accessing the
>> entire flash.
>>
>> Note that Spansion supports this command set on all its large flash
>> (e.g, S25FL512S), and Macronix has begun supporting this command set on
>> some new flash (e.g., MX25L25635F). For the moment, I don't know how to
>> differentiate the Macronix that don't support this command set (e.g.,
>> MX25L25635E) from those that do, so this patch only supports Spansion.
>>
>> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>
> Looks reasonable
>
> Acked-by: Marek Vasut <marex@denx.de>
>
> What system/CPU do you observe these issue on just out of curiosity?

A Broadcom 74xx series SoC.

Brian
