Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18C2lP-0005qj-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Nov 2002 19:01:23 +0000
Message-ID: <3DD2A89F.BE82BB11@mvista.com>
Date: Wed, 13 Nov 2002 11:31:43 -0800
From: Scott Anderson <scott_anderson@mvista.com>
MIME-Version: 1.0
To: "Hicks, Jamey" <Jamey.Hicks@hp.com>
CC: linux-mtd@lists.infradead.org
Subject: Re: cmdline.c file name collision
References: <D99C1FB421989A40818B6370E3187094040A3AB6@tayexc19.americas.cpqcorp.net>
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

"Hicks, Jamey" wrote:
> hmm.  My first thought was to rename drivers/mtd/cmdline.c to 
> drivers/mtd/mtdcmdline.c or drivers/mtd/cmdlinepart.c.

That sounds reasonable.  Does someone that has direct access to the CVS
repository want to move the files around in the repository (so we don't
lose history) or should I just submit a patch that removes the file and
adds the file back with a different name?

> Actually, that was my second thought.  My first thought was to wonder
> why CONFIG_MODVERSIONS flattens the kernel source file namespace.
> I just turned on CONFIG_MODVERSIONS to build an ipaq kernel, and I find
> I also have a name conflict on arch/arm/mach-sa1100/pm.c and kernel/pm.c.

I've been told third hand or so that it is a "known limitation" in 2.4.
I just looked in 2.5, and this limitation has been eliminated (there is
a hierarchy of files under include/linux/modules that parallels the
source hierarchy).

With that new found information, I guess a new question comes up: does
working around the 2.4 limitation warrant the rename when the limitation
is removed in 2.5?

    Scott Anderson
    scott_anderson@mvista.com   MontaVista Software Inc.
    (408)328-9214               1237 East Arques Ave.
    http://www.mvista.com       Sunnyvale, CA  94085
