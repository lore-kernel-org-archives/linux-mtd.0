Received: from ns1ca.ubisoft.qc.ca ([205.205.27.131])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15XTnJ-00065q-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 Aug 2001 21:31:10 +0100
Received: from srvmail-mtl.ubisoft.qc.ca (srvmail-mtl.ubisoft.qc.ca [205.205.27.194])
	by ns1ca.ubisoft.qc.ca (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id RAA03970
	for <linux-mtd@lists.infradead.org>; Thu, 16 Aug 2001 17:36:48 -0400
Message-ID: <9A1957CB9FC45A4FA6F35961093ABB8403F1B1CF@srvmail-mtl.ubisoft.qc.ca>
From: Patrick Allaire <pallaire@gameloft.com>
To: linux-mtd@lists.infradead.org
Subject: DiskOnChip2000 make error
Date: Thu, 16 Aug 2001 16:31:01 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi,

I had some problems to compile the MTD support into the kernel, but I was
finaly successfull to compile CFI support for our flash. Since we wont
receive our flash before some time, we have bought a DiskOnChip2000 to
continue our developpement. So now I am trying to add DiskOnChip 2000 to the
kernel, but it does not compile. I am comiling every thing into the kernel
(no module)

here is the output of my compilation :



/usr/bin/kgcc -D__KERNEL__ -I/usr/src/linux/include -Wall
-Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -D__SMP__
-pipe -fno-strength-reduce -m486 -malign-loops=2 -malign-jumps=2
-malign-functions=2 -DCPU=586 -DUTS_MACHINE='"i386"' -c -o init/version.o
init/version.c
make -C  kernel
make[1]: Entering directory `/usr/src/linux-2.2.18/kernel'
make all_targets
make[2]: Entering directory `/usr/src/linux-2.2.18/kernel'
make[2]: Nothing to be done for `all_targets'.
make[2]: Leaving directory `/usr/src/linux-2.2.18/kernel'
make[1]: Leaving directory `/usr/src/linux-2.2.18/kernel'
make -C  drivers
make[1]: Entering directory `/usr/src/linux-2.2.18/drivers'
make -C block
make[2]: Entering directory `/usr/src/linux-2.2.18/drivers/block'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.18/drivers/block'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.18/drivers/block'
make[2]: Leaving directory `/usr/src/linux-2.2.18/drivers/block'
make -C char
make[2]: Entering directory `/usr/src/linux-2.2.18/drivers/char'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.18/drivers/char'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.18/drivers/char'
make[2]: Leaving directory `/usr/src/linux-2.2.18/drivers/char'
make -C net
make[2]: Entering directory `/usr/src/linux-2.2.18/drivers/net'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.18/drivers/net'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.18/drivers/net'
make[2]: Leaving directory `/usr/src/linux-2.2.18/drivers/net'
make -C misc
make[2]: Entering directory `/usr/src/linux-2.2.18/drivers/misc'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.18/drivers/misc'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.18/drivers/misc'
make[2]: Leaving directory `/usr/src/linux-2.2.18/drivers/misc'
make -C sound
make[2]: Entering directory `/usr/src/linux-2.2.18/drivers/sound'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.18/drivers/sound'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.18/drivers/sound'
make[2]: Leaving directory `/usr/src/linux-2.2.18/drivers/sound'
make -C pci
make[2]: Entering directory `/usr/src/linux-2.2.18/drivers/pci'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.18/drivers/pci'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.18/drivers/pci'
make[2]: Leaving directory `/usr/src/linux-2.2.18/drivers/pci'
make -C video
make[2]: Entering directory `/usr/src/linux-2.2.18/drivers/video'
make all_targets
make[3]: Entering directory `/usr/src/linux-2.2.18/drivers/video'
make[3]: Nothing to be done for `all_targets'.
make[3]: Leaving directory `/usr/src/linux-2.2.18/drivers/video'
make[2]: Leaving directory `/usr/src/linux-2.2.18/drivers/video'
make -C mtd
make[2]: Entering directory `/usr/src/linux-2.2.18/drivers/mtd'
make -C chips
make[3]: Entering directory `/usr/src/linux-2.2.18/drivers/mtd/chips'
make all_targets
make[4]: Entering directory `/usr/src/linux-2.2.18/drivers/mtd/chips'
make[4]: Nothing to be done for `all_targets'.
make[4]: Leaving directory `/usr/src/linux-2.2.18/drivers/mtd/chips'
make[3]: Leaving directory `/usr/src/linux-2.2.18/drivers/mtd/chips'
make -C maps
make[3]: Entering directory `/usr/src/linux-2.2.18/drivers/mtd/maps'
make all_targets
make[4]: Entering directory `/usr/src/linux-2.2.18/drivers/mtd/maps'
make[4]: Nothing to be done for `all_targets'.
make[4]: Leaving directory `/usr/src/linux-2.2.18/drivers/mtd/maps'
make[3]: Leaving directory `/usr/src/linux-2.2.18/drivers/mtd/maps'
make -C devices
make[3]: Entering directory `/usr/src/linux-2.2.18/drivers/mtd/devices'
make all_targets
make[4]: Entering directory `/usr/src/linux-2.2.18/drivers/mtd/devices'
/usr/bin/kgcc -D__KERNEL__ -I/usr/src/linux/include -Wall
-Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -D__SMP__
-pipe -fno-strength-reduce -m486 -malign-loops=2 -malign-jumps=2
-malign-functions=2 -DCPU=586   -c -o doc2000.o doc2000.c
doc2000.c:1102: parse error before `cleanup_doc2000'
doc2000.c:1103: warning: return-type defaults to `int'
doc2000.c: In function `cleanup_doc2000':
doc2000.c:1118: warning: control reaches end of non-void function
doc2000.c: At top level:
doc2000.c:1120: warning: initialization from incompatible pointer type
make[4]: *** [doc2000.o] Error 1
make[4]: Leaving directory `/usr/src/linux-2.2.18/drivers/mtd/devices'
make[3]: *** [first_rule] Error 2
make[3]: Leaving directory `/usr/src/linux-2.2.18/drivers/mtd/devices'
make[2]: *** [_subdir_devices] Error 2
make[2]: Leaving directory `/usr/src/linux-2.2.18/drivers/mtd'
make[1]: *** [_subdir_mtd] Error 2
make[1]: Leaving directory `/usr/src/linux-2.2.18/drivers'
make: *** [_dir_drivers] Error 2



thank you all for your time.

Patrick Allaire
mailto:pallaire@gameloft.com
If you can see it, but it's not there, it's virtual. 
If you can't see it, but it is there, it's hidden. 
It you can't see it and it isn't there, it's gone.
