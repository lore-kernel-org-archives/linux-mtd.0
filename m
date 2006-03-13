Received: from mail.sanpeople.com ([196.41.13.122] helo=za-gw.sanpeople.com)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FIhb8-0006kD-5m
	for linux-mtd@lists.infradead.org; Mon, 13 Mar 2006 02:36:17 -0500
From: Andrew Victor <andrew@sanpeople.com>
To: Brian Stafford <brian@stafford.uklinux.net>
In-Reply-To: <441496CE.3050302@stafford.uklinux.net>
References: <441496CE.3050302@stafford.uklinux.net>
Content-Type: text/plain
Message-Id: <1142235187.8956.56.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 13 Mar 2006 09:33:07 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Building at91_nand.c for 2.6.15
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi Brian,

> I'm trying to build a 2.6.15.3 kernel for the AT91RM9200 patched with 
> current mtd from CVS and 2.6.15-at91.patch.gz (in that order), however 
> compilation fails on at91_nand.c because struct at91_nand_data is not 
> defined.  I would have expected the declaration of this struct to be in 
> one of the at91 header files but I cannot find it mentioned in any other 
> source files.  Any idea where I should be looking?

It's defined in the 2.6.16-rc3-at91 patch.
  http://maxim.org.za/AT91RM9200/2.6/2.6.16-rc3-at91.patch.gz

If you want to use it with 2.6.15, back-port the NAND stuff from the
following files:
   include/asm-arm/arch-at91rm9200/board.h
   arch/arm/mach-at91rm9200/devices.c 

Then in you board-specific file, you need to initialize a "struct
at91_nand_data" structure, and call at91_add_device_nand() from your 
board init code.  [Have a look at the board-dk.c code as an example]


Regards,
  Andrew Victor
