Received: from tomts20-srv.bellnexxia.net ([209.226.175.74])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BjRza-0004es-Vx
	for linux-mtd@lists.infradead.org; Sat, 10 Jul 2004 20:14:55 -0400
Date: Sat, 10 Jul 2004 20:09:53 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: Wolfgang Denk <wd@denx.de>
In-Reply-To: <20040710225655.2EF35C109F@atlas.denx.de>
Message-ID: <Pine.LNX.4.60.0407102006050.4345@localhost.localdomain>
References: <20040710225655.2EF35C109F@atlas.denx.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: Re: sflash: CFI does not contain boot bank location. Assuming top.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 11 Jul 2004, Wolfgang Denk wrote:

> Dear Robert,
>
> in message <Pine.LNX.4.60.0407101310380.16786@localhost.localdomain> you wrote:
>>
>>    the build is successful, but at boot time, i get (excerpt):
>>
>> init_synergy_mtd: processing flash bank 0: sflash.
>> init_synergy_mtd: Remapped flash bank sflash to 0xc3000000.
>> sflash: Found 1 x16 devices at 0x0 in 16-bit mode
>>   Amd/Fujitsu Extended Query Table at 0x0040
>> sflash: CFI does not contain boot bank location. Assuming top. (?????)
>
> Fujitsu flash, right?

actually AMD, but the kernel config lists AMD/Fujitsu as a single 
option.  is the patch then still relevant?

and another issue is that an older, hacked kernel -- 2.4.22-pre8 that 
we got from embedded planet -- does work with the board, but in 
upgrading to the latest 2.4.25 DENX ppc kernel, i have no way of 
knowing if there are any funny, subtle or obscure kernel fixes that we 
got with it that i'm not aware of.

i'll take a shot at the patch tomorrow morning.  thanks.  and i'll 
read over the older (hacked by us) version of rpxlite.c that works 
with the older kernel to see if i've overlooked something.

rday
