Received: from www.kernelconcepts.de ([212.60.202.195]
	helo=mail.kernelconcepts.de)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GKyQ8-00046T-R7
	for linux-mtd@lists.infradead.org; Wed, 06 Sep 2006 15:30:30 +0100
Message-ID: <44FEDB7B.8090809@kernelconcepts.de>
Date: Wed, 06 Sep 2006 16:30:19 +0200
From: Nils Faerber <nils.faerber@kernelconcepts.de>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
Subject: Re: Intel P30, locked sectors?
References: <44FED214.7090309@kernelconcepts.de>
	<Pine.LNX.4.64.0609061024300.18635@xanadu.home>
In-Reply-To: <Pine.LNX.4.64.0609061024300.18635@xanadu.home>
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

Nicolas Pitre schrieb:
> On Wed, 6 Sep 2006, Nils Faerber wrote:
>> I now did a kernel update (in fact, I started over with a new kernel)
>> and am now using 2.6.18-RC6 from kernel.org.
>> I have read access to the flash, rootfs is mounted correctly but at
>> first write attempt I get:
>> [42949375.150000] Freeing init memory: 96K
>> [42949376.480000] Erase at 0x00cc0000 failed immediately: -EROFS. Is the
>> sector locked?
> Before the first write attempt you need to run flash-unlock on the 
> corresponding flash partition.

Ah, cool, thanks!
I guess that this tool is part of mtd-utils, right?

Will be tested ASAP! But I fear that will have to wait until tomorrow,
gotta go soon.

Thanks again!

> Nicolas
Cheers
  nils faerber

-- 
kernel concepts GbR      Tel: +49-271-771091-12
Dreisbachstr. 24         Fax: +49-271-771091-19
D-57250 Netphen          Mob: +49-176-21024535
--
