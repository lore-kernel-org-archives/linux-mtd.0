Received: from anchor-post-32.mail.demon.net ([194.217.242.90])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FZG1l-0002Dt-VM
	for linux-mtd@lists.infradead.org; Thu, 27 Apr 2006 19:36:07 -0400
Message-ID: <44515552.6040606@lougher.demon.co.uk>
Date: Fri, 28 Apr 2006 00:35:46 +0100
From: Phillip Lougher <phillip@lougher.demon.co.uk>
MIME-Version: 1.0
To: Russ Dill <russ.dill@gmail.com>
References: <BAY19-F25626592BB956CC2B586828BBF0@phx.gbl>	<003301c66852$c7371280$153335bf@cabletime.com>
	<f9d2a5e10604271433y34b72c19p22bb10c79b305d97@mail.gmail.com>
In-Reply-To: <f9d2a5e10604271433y34b72c19p22bb10c79b305d97@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: squashfs and NAND flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Russ Dill wrote:
> On 4/25/06, Andy Hawkins <a.hawkins@cabletime.com> wrote:
> 
>>Hi,
>>
>>
>>>Should mtd handle bad blocks when using squashfs?
>>
>>I suspect you will have to write a simple 'translation layer' that
>>automatically skips bad blocks. This is something we had to do in our
>>device.
>>
>>Basically, if (for example) block 4 is bad, then any request for block 4
>>should actually return block 5. Also, any request for block 5 should return
>>block 6 etc. etc. etc.
>>
> 
> 
> Even worse, NAND flash bits occasionally flip for no reason, ie, even
> when the sector isn't bad. If you read a sector, and get an ecc
> correction, you should rewrite the sector to a free sector, and then
> mark the current sector as free.
> 
> So in other words, even with a read only filesystem, you need a good
> FTL, unless you really don't care if units stop booting after a year
> or two.

A couple of years ago I did some work making Squashfs work with NAND. 
Because of the inherent unreliability of NAND, and the constant MTD code 
base changes, I decided not to make this work publically available.

Providing native NAND support in Squashfs represents too much work for 
absolutely no gain.  It is unlikely this is going to change in the near 
future.

Phillip Lougher
