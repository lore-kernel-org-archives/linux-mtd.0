Received: from mailgate5.web.de ([217.72.192.165])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BENqx-0004XK-Ti
	for linux-mtd@lists.infradead.org; Fri, 16 Apr 2004 08:33:35 +0100
Received: by mailgate5.web.de (8.11.6p2/8.11.2/SuSE Linux 8.11.0-0.4) with
	SMTP id i3G7XZ415631
	for linux-mtd@lists.infradead.org; Fri, 16 Apr 2004 09:33:35 +0200
Date: Fri, 16 Apr 2004 09:33:34 +0200
Message-Id: <1196013956@web.de>
MIME-Version: 1.0
From: "Tobias Arp" <tobiasarp@web.de>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: MTD partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,  
  
on my old kernel (2.4.21 and the arm linux patch rmk2) it was possible to configure the  
remapping of the flash in the xconfig/menuconfig files. I have created the mtd partitions in  
physmap.c. So when i have made:  
  
cat /proc/mtd  
  
i got these outputs  
  
dev: size erasesize name  
mtd0: 00400000 00010000 ""physically mapped flash"  
mtd1: 00060000 00010000 ""USER fs"  
  
My flash has a size of 4 MBytes and typically 64kbytes sector size. It started physically at  
offset 0x10000000 and is connected via a 16 bit bus. These were also the configuration  
paramter which i added to my config files. This must be mtd0. The mtd1 device is the partition  
which i have configured in physmap.c.  
  
After applieing the mtd snapshot(mtd-snapshot-20040407.tar.bz2) i have used  
physmap_configure with the same data:  
  
physmap_configure(0x10000000,0x00400000,2,NULL);  
  
0x10000000 = physical flash base  
0x00400000 = Flash size  
2 = 16 Bit Buswidth  
  
Then i have used  
  
physmap_set_partitions(at91_mtd_parts,1);  
  
to add my USER fs  
  
static struct mtd_partition at91_mtd_parts[] __initdata = {  
 {  
 .name = "USER fs",  
 .offset = 0x00380000,  
 .size = 0x00060000,  
 }  
};  
  
Now i get following outputs when i make cat proc/mtd  
  
dev: size erasesize name  
mtd0: 00060000 00010000 ""USER fs"  
  
where is the "old mtd0" device with the whole flashsize ?  
  
And how can i remove these messages from the startup of the kernel:  
  
  
>cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.  
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  
- Is there any patch for this problem ? -  
  
>kmod: failed to exec /sbin/modprobe -s -k cmdlinepart, errno = 2  
>cmdlinepart partition parsing not available  
>kmod: failed to exec /sbin/modprobe -s -k RedBoot, errno = 2  
>RedBoot partition parsing not available  
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  
- Is there any reason for these messages ? -  
  
  
Regards  
Tobias Arp  
  
_____________________________________________________________________
Der WEB.DE Virenschutz schuetzt Ihr Postfach vor dem Wurm Netsky.A-P!
Kostenfrei fuer alle FreeMail Nutzer. http://f.web.de/?mc=021157
