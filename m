Received: from toledo.inf.pucrs.br ([200.17.94.5])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15eGsG-00014T-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Sep 2001 15:08:21 +0100
Message-ID: <3B94E453.C4A4E9E4@inf.pucrs.br>
Date: Tue, 04 Sep 2001 11:25:23 -0300
From: Daniel Belz <belz@inf.pucrs.br>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: Norbert Leon <norbert@safetech.com>, linux-mtd@lists.infradead.org
Subject: Re: Problems with Intel TE28F320 B3
References: <Pine.LNX.4.21.0109041443430.1177-100000@tagada.safetech.fr> <20180.999610782@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David Woodhouse wrote:

> norbert@safetech.com said:
> >  I'm working on an intel te28f320 b3ba110 (complete reference) and i
> > can't get my system to recognize it ...
>
> Some of the 28F320 chips are CFI-compliant and some aren't. The other
> letters and numbers you quoted didn't seem to help me work out which you
> have.
>
> Turn off CONFIG_MTD_RAM, CONFIG_MTD_ROM and CONFIG_MTD_SLRAM. You don't
> need them.
>
> --
> dwmw2
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

the flash intel TE28F320B3BA110 (same of the BSE-IPengine) isn't CFI
compliant. Is a JEDEC Flash.
You have to modify the MTD source code to detect the flash.
If you are interested, i have this code, and if you need, i send to you.
Else, see the cfi_cmdset002.c, cfi_probe.c, cfi_jedec.c
(/drivers/mtd/chips) and physmap.c (/drivers/mtd/maps).
My code give a solution to implementing JFFS file system and Partitioning
Support.


Daniel Belz
belz@inf.pucrs.br
