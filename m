Received: from sccrmhc01.attbi.com ([204.127.202.61])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17nGrd-0006Ss-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Sep 2002 12:01:25 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Henrik Nordstrom <hno@marasystems.com>
Subject: Re: DOC 2000 and GRUB
Date: Fri, 6 Sep 2002 07:00:10 -0400
Cc: Russ Dill <Russ.Dill@asu.edu>,
 mateo@posta.star.si,
 linux-mtd@lists.infradead.org
References: <200209061149.02058.hno@marasystems.com> <1031302476.763.2.camel@russ> <32342.1031307879@redhat.com>
In-Reply-To: <32342.1031307879@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020906110053.EFQR11061.sccrmhc01.attbi.com@there>
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
> hno@marasystems.com said:
> >  Or wait until the new NFTL format is understood, and use the M-Sys
> > DFORMAT 5.x  program format the flash and install GRUB (plus reserve
> > additional binary  boot partition space if needed for future upgrades
> > of GRUB)
>
> Doesn't the current CVS code work with the new format?

It seems to, on a DoC Millennium, anyway. 

After slightly modifying the Grub stage 2 code (bdev_diskonchip.c), I was 
able to get Grub to boot from a freshly 5.x dformatted DoC. 

This is the old "UnitSizeFactor" issue - this Millennium says the 
UnitSizeFactor is 0x00, which is assumed to mean the same thing as 0xFF.

I haven't tried any DoC 2000's that have a UnitSizeFactor that is not 0 or 
FF, but it looks like this should work as well, with the appropriate changes 
to bdev_diskonchip.c.

I'm guessing that many problems are caused by having the nftl module loaded 
during a fdisk, nftl_format, and/or doc_loadbios.

Following Henrik's advice to use DFORMAT to install GRUB, plus being *very* 
careful to make sure nftl is not loaded at inopportune times, seems to help.
