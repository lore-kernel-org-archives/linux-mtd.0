Received: from 42.242.232.72.static.reverse.layeredtech.com ([72.232.242.42]
	helo=secure.poehali.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hv82c-0007jf-ML
	for linux-mtd@lists.infradead.org; Mon, 04 Jun 2007 04:36:01 -0400
Date: Mon, 4 Jun 2007 11:38:06 +0300
From: Ivan Kuten <ivan.kuten@promwad.com>
To: linux-mtd@lists.infradead.org, hans.jorgensen.news@gmail.com
Subject: Re: JFFS2, AT45DB642D dataflash and power failure
Message-ID: <20070604113806.397b9400@newbox>
In-Reply-To: <646b5e90706032328i78c258f1ga27cd5ba92330b23@mail.gmail.com>
References: <646b5e90706032328i78c258f1ga27cd5ba92330b23@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 4 Jun 2007 08:28:50 +0200
Hans Jorgensen wrote:

> Can JFFS2 handle that an entire flash page gets corrupted if a power
> failure occurs while calling at91_dataflash_write/dataflash_write? If
> not then there might be a problem with
> at91_dataflash.c/mtd_dataflash.c
> 
> The story is as following:
> I am using Linux kernel 2.6.12 + patch 2.6.12 (20/06-2005) from
> maxim.org.za and trying to implement transaction based file access
> with rollback functionality in a user-space application.
> 
> To prove that it would work during power failure I used a watchdog to
> activate reset of the CPU and flashes.  It did not work.
> 
> As an attempt to make it work I modified at91_dataflash_write to use
> the flash commands.
> Buffer 1 Write + Buffer 1 to Main Memory Page Program without Built-in Erase
> instead of
> Main Memory Page Program Through Buffer 1 (which implicit includes an
> erase page functionality)
> 
> Now it is working and that naturally leads to the question above.
> A nice side effect of this change is that writing speed is increased.
> 
> Note: this change may not be a valid solution, as this is not the
> recommended way of using the dataflash. It would require further
> investigation before implementation.
> 
> Hans
> 

Hi Hans,

I had the same problem as you describing with AT91RM9200 and AT45DB642D dataflash,
i tried to ask in this thread http://lists.infradead.org/pipermail/linux-mtd/2007-April/017961.html
but nobody replied.

Could you please post your patch, so I could check if it works for me?

Best regards, 
Ivan
