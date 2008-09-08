Received: from rv-out-0708.google.com ([209.85.198.250])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KcmKO-0006j9-Iv
	for linux-mtd@lists.infradead.org; Mon, 08 Sep 2008 19:23:12 +0000
Received: by rv-out-0708.google.com with SMTP id b17so1553788rvf.42
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Sep 2008 12:23:11 -0700 (PDT)
Message-ID: <8bd0f97a0809081223n30e96c73naa8c14c4898002f9@mail.gmail.com>
Date: Mon, 8 Sep 2008 15:23:11 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Allon Stern" <allon.stern@argonst.com>
Subject: Re: a complex map
In-Reply-To: <BAD66201-5E11-4E14-BE35-F23A186DEF53@argonst.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <BAD66201-5E11-4E14-BE35-F23A186DEF53@argonst.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 8, 2008 at 2:44 PM, Allon Stern wrote:
> I've got the unique pleasure of dealing with a hardware design
> cramming a 64MB NOR flash onto a 23 bit address bus (Coldfire M5282).
> The memory chip is a Numonyx Strataflash (P30). It's a single part on
> a 16 bit data bus.
>
> A couple of questions:
> #1: this chip appears as two dies; Each die has four small (32K)
> blocks at the bottom, with 128K blocks elsewhere. Is this a problem,
> particularly if the small blocks appear in the middle of an MTD
> partition? I'm assuming no problem. (I have concatenating support
> enabled to allow my partition to span the two dies)

the mtd layers handle bottom/top boot devices just fine. usually
people use those sectors to store configurations or bootloaders rather
than filesystems though.  but that is of course your choice.

> #2: I control the high two address bits on the flash (A24 and A25)
> using GPIOs. I have a customized map for this flash which sets the
> GPIOs appropraitely for the offset being accessed. Is this is all I
> need to do?

ive written a generic gpio mapping driver but i'm not sure it's been
posted to LKML yet ... perhaps you will find it useful:
http://blackfin.uclinux.org/git/?p=readonly-mirrors/linux-kernel.git;a=blob_plain;f=drivers/mtd/maps/gpio-addr-flash.c;hb=HEAD

example platform resources can be found here:
http://blackfin.uclinux.org/git/?p=readonly-mirrors/linux-kernel.git;a=commitdiff;h=cf8a23b05d657efbe704426ac458db2f219f5bef

and here:
http://blackfin.uclinux.org/git/?p=readonly-mirrors/linux-kernel.git;a=blob_plain;f=arch/blackfin/mach-bf537/boards/tcm_bf537.c;hb=HEAD
-mike
