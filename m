Received: from ns2a.townisp.com ([216.195.0.134] helo=ns2.townisp.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C2BKh-0006iP-NR
	for linux-mtd@lists.infradead.org; Tue, 31 Aug 2004 12:18:08 -0400
Date: Tue, 31 Aug 2004 12:18:14 -0400 (EDT)
From: Jamie Guinan <guinan@bluebutton.com>
To: Bo Henriksen <bo.henriksen@nordicid.com>
In-Reply-To: <A6991F0FA073F34C94E97976CAC03231327EF6@server2.nordicid.com>
Message-ID: <Pine.LNX.4.44.0408311207130.9460-100000@gemini.home.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
Subject: Re: Setting up MTD via command line?
Reply-To: Jamie Guinan <guinan@bluebutton.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 26 Aug 2004, Bo Henriksen wrote:

> Hi,
> 
> I'm having trouple understanding the new MTD interface with 2.6.8?
> Can anyone explain, or is there docs on how to setup MTD via command
> line, which I think was introduced so 
> you don't need to write your own driver for e.g. embedded processors
> such as ARM.

Hi Bo,

I found it in the config help for "Command line partition table parsing",
and also in the comments in cmdlinepart.c.

For the LogicPD board (lpd7a404 here), I used this kernel command-line,

  boot console=ttyAM1 root=/dev/mtdblock3 rootfstype=jffs2 \
    mtdparts=phys_mapped_flash:256k,256k,1536k,2048k

and (at least) these options,

  CONFIG_MTD_PARTITIONS=y
  CONFIG_MTD_CMDLINE_PARTS=y
  CONFIG_MTD_CFI=y
  CONFIG_MTD_PHYSMAP=y
  CONFIG_MTD_PHYSMAP_START=0x0
  CONFIG_MTD_PHYSMAP_LEN=0x4000000
  CONFIG_MTD_PHYSMAP_BANKWIDTH=4

Now I finally understand the thread from July where the developers were
discussing this (trading a whole C file (lpd7a400-flash.c) for the
"mtdparts=" parameter; good stuff).

Good luck,
-Jamie

> 
> Cheers,
> 
> Bo
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
