Received: from gw1.transmode.se ([195.58.98.146])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5JTa-0003sv-0T
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 16:12:31 +0000
In-Reply-To: <1331129384.28469.YahooMailClassic@web29020.mail.ird.yahoo.com>
References: <1331129384.28469.YahooMailClassic@web29020.mail.ird.yahoo.com>
Subject: Re: [PATCH 0/6] mtd: Fix unnecessary flash erase and write errors
To: Paul Parsons <lost.distance@yahoo.com>
Message-ID: <OF1B4BCF66.7196B2F9-ONC12579BA.0058ED0A-C12579BA.00590665@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Wed, 7 Mar 2012 17:12:23 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, philipp.zabel@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Paul Parsons <lost.distance@yahoo.com> wrote on 2012/03/07 15:09:44:
>
> The problem:
>
> An HP iPAQ hx4700 consistently reports flash erase and write errors when running
> Linux:
>
> block erase failed at 0x02c00000: status 0xa000a0. Retrying...
> block erase failed at 0x02c00000: status 0xa000a0. Retrying...
> block erase failed at 0x02c00000: status 0xa000a0. Retrying...
> SR.4 or SR.5 bits set in buffer write (status a000a0). Clearing.
>
> block erase failed at 0x02c40000: status 0xa000a0. Retrying...
> block erase failed at 0x02c40000: status 0xa000a0. Retrying...
> block erase failed at 0x02c40000: status 0xa000a0. Retrying...
> physmap-flash: block erase failed at 0x02c40000 (status 0xa000a0)
>
> block erase failed at 0x00440000: status 0xa000a0. Retrying...
> block erase failed at 0x00440000: status 0xa000a0. Retrying...
> block erase failed at 0x00440000: status 0xa000a0. Retrying...
> physmap-flash: block erase error: (bad VPP)
> physmap-flash: buffer write error (status 0xd000d0)
>
> The cause:
>
> The flash program/erase voltage (vpp) is turned off by the MTD CFI driver while
> erase operations are in progress or suspended. This kills the erase operations.
>
> The culprit:
>
> ./drivers/mtd/chips/cfi_cmdset_0001.c contains two functions, get_chip() and
> put_chip(), which are called before and after every flash operation.
> The intention seems to be that if one thread is waiting for a Block Erase to
> finish, another thread wanting to perform a concurrent operation within the same
> partition will suspend the erase in get_chip() and resume it in put_chip(),
> without disturbing vpp.
> If the other thread wants to perform a concurrent operation within a different
> partition, no suspend/resume is performed but put_chip() will call DISABLE_VPP()
> to turn vpp off.
> That is exactly what happens: a pending Block Erase in one partition expects vpp
> to remain on, but a Read Array in another partition turns vpp off.
>
> The fix:
>
> 1. Ensure that only those flash operations which call ENABLE_VPP() can then call
> DISABLE_VPP(). Other operations should never call DISABLE_VPP().
>
> Consequently...
>
> 2. Ensure that calls to ENABLE_VPP() / DISABLE_VPP() (i.e. set_vpp()) can nest.
> This requirement is already stated in ./include/linux/mtd/map.h:
>
>         /* set_vpp() must handle being reentered -- enable, enable, disable
>            must leave it enabled. */
>         void (*set_vpp)(struct map_info *, int);
>
> and a method for doing so is suggested in ./drivers/mtd/chips/cfi_cmdset_0001.c:
>
>         /* We should really make set_vpp() count, rather than doing this */
>         DISABLE_VPP(map);

Cool, glad you found the real problem!

 Jocke
