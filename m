Received: from mxfep02.bredband.com ([195.54.107.73])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CwSI1-0004oB-EU
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2005 16:43:58 -0500
Message-ID: <01c401c50970$3ed65c30$4c7370d5@Glamdring>
From: "Ulf Samuelsson" <ulf@atmel.com>
To: "Creech, Matthew" <MattCreech@eaton.com>, <linux-mtd@lists.infradead.org>,
	<jffs-dev@axis.com>, <linux-arm-kernel@lists.arm.linux.org.uk>
References: <F0A064EBC8C91C449244D108367426DC01E4AFEF@ra1ncsmb01.nasa.ad.etn.com>
Date: Wed, 2 Feb 2005 22:32:27 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: JFFS2 on dataflash problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I have an embedded device based on Atmel's AT91RM9200DK board, which is
> using serial dataflash (AT45DB642).  I've allocated a JFFS2 partition to
> store non-volatile data.  In testing I stumbled across a particular
> problem that only occurs after heavy hammering on our device, but is
> fairly consistent in how and when it occurs.  The pattern has been
> narrowed down so that a script doing something like this:

> while [ 1 ]; do
>   cp /mnt/jffs2/$RANDOM_FILE /mnt/jffs2/$BLAH
>   # File size has been tested between 8K and 64K
> done

If I wrote this script I would call it:

wear_out_dataflash_quickly.sh

There are some limitations to the number of erase cycles in the dataflash.
(IN any flash to be correct)
You can expect to reprogram it 50,000-100.000 times before the first errors
occur.
The second thing is that you need to do a block erase after the sum
of erases inside an 8 page block exceeds 10,000.

I am not at all sure that the MTD drivers/JFFS2 handle this (did not look at
the code).
I assume that JFFS may be able to detect a bad write and map
the block out from time to time, so this could explain why you can do the
recover.

If you really want to test the dataflash, write a CRC in the extra bytes
available.
(The page is 1024 + 32 bytes) and read back, checking CRC.

Best Regards,
Ulf Samuelsson
ulf@a-t-m-e-l.com
