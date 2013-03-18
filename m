Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHcgW-00008N-6Y
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 16:13:16 +0000
Message-ID: <51473D19.8090808@parrot.com>
Date: Mon, 18 Mar 2013 17:13:13 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/3] mtd: m25p80: utilize dedicated 4-byte addressing
 commands
References: <1362904877-20144-1-git-send-email-computersforpeace@gmail.com>
 <5147334C.3040505@parrot.com> <201303181639.18602.marex@denx.de>
In-Reply-To: <201303181639.18602.marex@denx.de>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: Kevin Cernekee <cernekee@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
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

Marek Vasut a écrit :
> Dear Matthieu CASTET,
> 
>> What's funny is the other side work :
>>
>> you can have a ROM that use 4-byte mode with 3-byte or 2-byte device as
>> soon as the read command is the same. [1]
> 
> Well, all of these are crap design. The SPI flash shall be power-cycled if the 
> platform reboots no matter what exactly to prevent having it in undefined state.
> 
This side (ROM that use 4-byte mode with 3-byte or 2-byte device) is used to
avoid detection of the flash by the rom (no need to know if spi eeprom or spi nor).
