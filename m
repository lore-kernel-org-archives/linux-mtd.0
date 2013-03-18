Received: from mail-pb0-f42.google.com ([209.85.160.42])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHd6t-0002CZ-KW
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 16:40:32 +0000
Received: by mail-pb0-f42.google.com with SMTP id xb4so6564336pbc.15
 for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2013 09:40:28 -0700 (PDT)
Message-ID: <5147436E.7030603@gmail.com>
Date: Mon, 18 Mar 2013 09:40:14 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/3] mtd: m25p80: utilize dedicated 4-byte addressing
 commands
References: <1362904877-20144-1-git-send-email-computersforpeace@gmail.com>
 <5147334C.3040505@parrot.com> <201303181639.18602.marex@denx.de>
In-Reply-To: <201303181639.18602.marex@denx.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Kevin Cernekee <cernekee@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/18/2013 08:39 AM, Marek Vasut wrote:
> Dear Matthieu CASTET,
>
>> Brian Norris a écrit :
>>> Traditionally, the command set used by SPI flash only supported a 3-byte
>>> address. However, large SPI flash (>= 32MB, or 256Mbit) require 4 bytes
>>> to address the entire flash. Most manufacturers have supplied a mode
>>> switch (via a "bank register writer", or a "enable 4-byte mode"
>>> command), which tells the flash to expect 4 address cycles from now on,
>>> instead of 3. This mode remains until power is cut, the reset line is
>>> triggered (on packages where present), or a command is sent to reset the
>>> flash or to reset the 3-byte addressing mode.
>>>
>>> As an alternative, some flash manufacturers have developed a new command
>>> set that accept a full 4-byte address. They can be used orthogonally to
>>> any of the modes; that is, they can be used when the flash is in either
>>> 3-byte or 4-byte address mode.
>>>
>>> Now, there are a number of reasons why the "stateful" 4-byte address
>>> mode switch may not be acceptable. For instance, some SoC's perform a
>>> dumb boot sequence in which they only send 3-byte read commands to the
>>> flash. However, if an unexpected reset occurs, the flash chip cannot be
>>> guaranteed to return to its 3-byte mode. Thus, the SoC controller and
>>> flash will not understand each other.
>>
>> What's funny is the other side work :
>>
>> you can have a ROM that use 4-byte mode with 3-byte or 2-byte device as
>> soon as the read command is the same. [1]
>
> Well, all of these are crap design. The SPI flash shall be power-cycled if the
> platform reboots no matter what exactly to prevent having it in undefined state.

While I agree that ideally, the flash should always be 
reset/power-cycled on reboot, these type of flash have traditionally 
been stateless (and have no RESET command) and flash manufacturers have 
done nothing to help this as they added state (e.g., non-standard 
command sets; partially-supported command sets). Plus, as I mentioned, 
not all flash have reset pins, as they try to skimp on pins or take them 
over for other uses.

What exactly is your recommended non-crap design on these stateful flash 
that have no reset pin? Just a smarter boot ROM which can handle 
different states/flash types?

Brian
