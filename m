Received: from modemcable166.48-200-24.mtl.mc.videotron.ca ([24.200.48.166]
	helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1988YK-0001Iz-Fe
	for <linux-mtd@lists.infradead.org>; Wed, 23 Apr 2003 01:56:00 +0100
Date: Tue, 22 Apr 2003 20:56:19 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Dominic Duval <dduval@oerlikon.ca>
In-Reply-To: <MAIL7EjQxzmWecm9t0C000000d9@mail.oerlikon.ca>
Message-ID: <Pine.LNX.4.44.0304222052200.30897-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
Subject: Re: Unlocking Intel K3 StrataFlash at boot time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 22 Apr 2003, Dominic Duval wrote:

> Hi,
> 
> I'm currently trying to boot from a XScale board which has some Intel
> StrataFlash banks (K3). However, it appears that the K3 flash in locked by
> default, so I'm getting some errors when the root partition is mounted by
> the Kernel in read/write mode.
> 
> I figured the only way to work around this problem is to unlock the K3
> Flash before the Kernel mounts the root partition. Since our own bootloader
> doesn't support the K3 Flash, the only place left is right in the Kernel,
> probably just before the MTD device gets mounted.
> 
> I'd therefore like to know if this has been done before. If it has not, am
> I on the right track here? And is there a place in the mtd code which would
> be particularly well suited for placing the unlocking stuff? 

Right in the MTD map driver, like:

--- linux/drivers/mtd/maps/lubbock.c	Thu Oct 31 15:12:20 2002
+++ linux/drivers/mtd/maps/lubbock.c	Wed Jan  8 15:01:48 2003
@@ -106,6 +106,7 @@
 	struct mtd_partition *parts;
 	int nb_parts = 0;
 	int parsed_nr_parts = 0;
+	int i;
 	char *part_type = "static";
 
 	lubbock_map.buswidth = (BOOT_DEF & 1) ? 2 : 4;
@@ -123,6 +124,15 @@
 	}
 	mymtd->module = THIS_MODULE;
 
+	/* Unlock the flash device. */
+	for (i = 0; i < mymtd->numeraseregions; i++) {
+		int j;
+		for( j = 0; j < mymtd->eraseregions[i].numblocks; j++) {
+			mymtd->unlock(mymtd, mymtd->eraseregions[i].offset +
+				      j * mymtd->eraseregions[i].erasesize, 4);
+		}
+	}
+
 #ifdef CONFIG_MTD_REDBOOT_PARTS
 	if (parsed_nr_parts == 0) {
 		int ret = parse_redboot_partitions(mymtd, &parsed_parts);


Nicolas
