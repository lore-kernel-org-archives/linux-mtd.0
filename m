Received: from marasystems.com ([213.15.252.90] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17nICu-0006hd-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Sep 2002 13:27:28 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Henrik Nordstrom <hno@marasystems.com>
To: Mark Meade <mark@lakeshoremicro.com>,
   David Woodhouse <dwmw2@infradead.org>
Subject: Re: DOC 2000 and GRUB
Date: Fri, 6 Sep 2002 14:27:15 +0200
Cc: Russ Dill <Russ.Dill@asu.edu>, mateo@posta.star.si,
   linux-mtd@lists.infradead.org
References: <200209061149.02058.hno@marasystems.com> <32342.1031307879@redhat.com> <20020906110053.EFQR11061.sccrmhc01.attbi.com@there>
In-Reply-To: <20020906110053.EFQR11061.sccrmhc01.attbi.com@there>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200209061427.15220.hno@marasystems.com>
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

Mark Meade wrote:

> After slightly modifying the Grub stage 2 code (bdev_diskonchip.c), I was
> able to get Grub to boot from a freshly 5.x dformatted DoC.
>
> This is the old "UnitSizeFactor" issue - this Millennium says the
> UnitSizeFactor is 0x00, which is assumed to mean the same thing as 0xFF.
>
> I haven't tried any DoC 2000's that have a UnitSizeFactor that is not 0 or
> FF, but it looks like this should work as well, with the appropriate
> changes to bdev_diskonchip.c.

I tried to patch my GRUB to read 0x00 as 0xFF some days ago, but it failed 
miserably.. but I only changed the ifs around the message. Maybe there is 
other things that need to be changed?

(Un)fortunately I do not have a DoC system at the moment (had to deliver all 
we had to customers) so further testing will have to wait some time until we 
have more systems available.

Regards
Henrik
