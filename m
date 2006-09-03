Received: from www.kernelconcepts.de ([212.60.202.195]
	helo=mail.kernelconcepts.de)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GJyWB-0000JY-NE
	for linux-mtd@lists.infradead.org; Sun, 03 Sep 2006 21:24:36 +0100
Message-ID: <44FB3931.6040605@kernelconcepts.de>
Date: Sun, 03 Sep 2006 22:21:05 +0200
From: Nils Faerber <nils.faerber@kernelconcepts.de>
MIME-Version: 1.0
To: Justin Clacherty <justin@redfish-group.com>
Subject: Re: Problem with strata flash in 2 x 16bit config
References: <44F81C58.1030203@kernelconcepts.de>
	<44F85663.7090401@redfish-group.com>
In-Reply-To: <44F85663.7090401@redfish-group.com>
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

Justin Clacherty schrieb:
> Nils Faerber wrote:
>> Node CRC 00800080 != calculated CRC 4bf2ff8d for node at 000d4704
>> -sh: dmesg: Input/output error
> Is it P30 flash?  I've seen something similar if you don't unlock the flash.

Yes, that's correct!
The board has two P30 flashes.

The BLOB bootloader flashes the complete 16MB root partition first.
After that, if I try to write to root using Linux-MTD, I get those errors.
But I would expect that BLOB has already unlocked the complete 16MB for
writing the image.

And even if some are still locked, how do I unlock them?

> Justin.
Cheers
  nils faerber

-- 
kernel concepts GbR      Tel: +49-271-771091-12
Dreisbachstr. 24         Fax: +49-271-771091-19
D-57250 Netphen          Mob: +49-176-21024535
--
