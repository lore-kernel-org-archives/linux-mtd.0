Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19WubG-0003je-Gy
	for <linux-mtd@lists.infradead.org>; Mon, 30 Jun 2003 10:05:26 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Oskar Stolc <stolc@intrak.sk>, mdharm@momenco.com
In-Reply-To: <20030523063820.GH13272@intrak.sk>
References: <20030523063820.GH13272@intrak.sk>
Message-Id: <1056963941.25574.93.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 30 Jun 2003 10:05:41 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip MD2202-D256
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-05-23 at 07:38, Oskar Stolc wrote:
> Hi,
> 
> 
> I'm just trying to install DiskOnChip MD2202-D256 flash disk on my
> 2.4.21-rc2 linux. While loading modul by command
> 	'modprobe docprobe'
> 	
> these messages occurred on my screen:
> 
> DiskOnChip Millenium found at address 0xE0000

Please could you try the following patch:

Index: drivers/mtd/devices/docprobe.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/devices/docprobe.c,v
retrieving revision 1.37
diff -u -p -r1.37 docprobe.c
--- drivers/mtd/devices/docprobe.c	30 Jun 2003 09:01:46 -0000	1.37
+++ drivers/mtd/devices/docprobe.c	30 Jun 2003 09:04:41 -0000
@@ -135,6 +135,12 @@ static inline int __init doccheck(unsign
 		 window, DOCControl);
 #endif /* !DOC_PASSIVE_PROBE */	
 
+	/* We need to read the ChipID register four times. For some
+	   newer DiskOnChip 2000 units, the first three reads will
+	   return the DiskOnChip Millennium ident. Don't ask. */
+	ReadDOC(window, ChipID);
+	ReadDOC(window, ChipID);
+	ReadDOC(window, ChipID);
 	ChipID = ReadDOC(window, ChipID);
   
 	switch (ChipID) {


-- 
dwmw2
