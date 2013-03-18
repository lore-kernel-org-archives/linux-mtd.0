Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHc25-0005ou-Fy
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 15:31:30 +0000
Message-ID: <5147334C.3040505@parrot.com>
Date: Mon, 18 Mar 2013 16:31:24 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/3] mtd: m25p80: utilize dedicated 4-byte addressing
 commands
References: <1362904877-20144-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1362904877-20144-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: Marek Vasut <marex@denx.de>, Kevin Cernekee <cernekee@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian Norris a écrit :
> Traditionally, the command set used by SPI flash only supported a 3-byte
> address. However, large SPI flash (>= 32MB, or 256Mbit) require 4 bytes
> to address the entire flash. Most manufacturers have supplied a mode
> switch (via a "bank register writer", or a "enable 4-byte mode"
> command), which tells the flash to expect 4 address cycles from now on,
> instead of 3. This mode remains until power is cut, the reset line is
> triggered (on packages where present), or a command is sent to reset the
> flash or to reset the 3-byte addressing mode.
> 
> As an alternative, some flash manufacturers have developed a new command
> set that accept a full 4-byte address. They can be used orthogonally to
> any of the modes; that is, they can be used when the flash is in either
> 3-byte or 4-byte address mode.
> 
> Now, there are a number of reasons why the "stateful" 4-byte address
> mode switch may not be acceptable. For instance, some SoC's perform a
> dumb boot sequence in which they only send 3-byte read commands to the
> flash. However, if an unexpected reset occurs, the flash chip cannot be
> guaranteed to return to its 3-byte mode. Thus, the SoC controller and
> flash will not understand each other.
What's funny is the other side work :

you can have a ROM that use 4-byte mode with 3-byte or 2-byte device as soon as
the read command is the same. [1]

What's happen is that the first 1/2 bytes will be skipped and you need to take
care of that when flasing the device.

Matthieu

[1]
- send Read Data (03h)command
- send 32 bits address
- read data
