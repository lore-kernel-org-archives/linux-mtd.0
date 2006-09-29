Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GTC6H-0001R7-1O
	for linux-mtd@lists.infradead.org; Fri, 29 Sep 2006 07:43:57 +0100
Message-ID: <451CC098.7050805@transmode.se>
Date: Fri, 29 Sep 2006 08:43:36 +0200
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: Different erase block sizes in a JFFS2 partion.
References: <01de01c6e348$c94e7330$1267a8c0@Jocke>
	<625fc13d0609281607l5d2ad581k9615afa8d4f3caa@mail.gmail.com>
In-Reply-To: <625fc13d0609281607l5d2ad581k9615afa8d4f3caa@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
> On 9/28/06, Joakim Tjernlund <joakim.tjernlund@transmode.se> wrote:
>> Got multiple NOR chips with top and bottom boot blocks with diffrent EB size
>> then the rest of the blocks.
> 
> Intel P30?  IIRC, the MTD driver maps those into a set of larger
> virtual eraseblocks.  You might not be able to even distinguish that
> they exist.

yes, Intel P30.
The cfi_cmdset_0001 driver maps them like this:
0: offset=0x0,size=0x8000,blocks=4
1: offset=0x20000,size=0x20000,blocks=255
2: offset=0x2000000,size=0x8000,blocks=4
3: offset=0x2020000,size=0x20000,blocks=255

First, this map is wrong. 2: and 3: should be swapped, that is,
the small blocks should be at the end of the device.

the small blocks fits into a larger one so I should have no problem reading/writing
to such virtual block, but I don't think erase will work as JFFS2 will
only erase one of the small blocks instead of all 4. Maybe I am missing something?
