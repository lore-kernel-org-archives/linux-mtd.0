Received: from palrel11.hp.com ([156.153.255.246])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ACRYp-0007WH-4F
	for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2003 23:34:35 +0100
From: "Christopher Hoover" <ch@hpl.hp.com>
To: <tharbaugh@lnxi.com>, <ch@murgatroid.com>
Date: Wed, 22 Oct 2003 15:33:24 -0700
Message-ID: <000001c398ec$81bc7020$d203b60f@duckduck>
MIME-Version: 1.0
In-Reply-To: <1066313282.10573.121.camel@tubarao>
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
cc: 'mtd list' <linux-mtd@lists.infradead.org>
Subject: RE: Regression of mtd/chips/jedec_probe.c in 2.6.0-test7
Reply-To: ch@hpl.hp.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> If you can narrow the problem down to just a few lines that=20
> are obviously incorrect then the patch should have a fighting=20
> chance.

Here's what I tried:

--- linux-2.6.0-test8-rmk1/drivers/mtd/chips/jedec_probe.c	2003-10-20
22:19:24.000000000 -0700
+++ linux-2.6.0-test8-rmk1-ceiva1/drivers/mtd/chips/jedec_probe.c
2003-10-22 15:24:55.000000000 -0700
@@ -1481,7 +1481,7 @@
 	DEBUG( MTD_DEBUG_LEVEL3,
 	       "MTD %s(): Check fit 0x%.8x + 0x%.8x =3D 0x%.8x\n",
 	       __func__, base, 1 << finfo->DevSize, base + (1 <<
finfo->DevSize) );
-	if ( base + ( 1 << finfo->DevSize ) > map->size ) {
+	if ( base + cfi->interleave * ( 1 << finfo->DevSize ) > map->size )
{
 		DEBUG( MTD_DEBUG_LEVEL3,
 		       "MTD %s(): 0x%.4x 0x%.4x %dKiB doesn't fit\n",
 		       __func__, finfo->mfr_id, finfo->dev_id,
@@ -1539,10 +1539,10 @@
 	 */
 	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): return to ID mode\n", __func__
);
 	if(cfi->addr_unlock1) {
-		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi,
CFI_DEVICETYPE_X8, NULL);
-		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi,
CFI_DEVICETYPE_X8, NULL);
+		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi,
cfi->device_type, NULL);
+		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi,
cfi->device_type, NULL);
 	}
-	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi,
CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi,
cfi->device_type, NULL);
 	/* FIXME - should have a delay before continuing */
=20
  match_done:=09

But it fails to find the chip:

Uncompressing Linux................................... done, booting the
kernel.Linux version 2.6.0-test8-rmk1-ceiva1 (ch@laptop-vmware) (gcc =
version
3.3.1) #33CPU: ARM720T [41807202] revision 2 (ARMv4T)
Machine: CEIVA/Polaroid Photo MAX Digital Picture Frame
Memory policy: ECC disabled, Data cache write back
On node 0 totalpages: 1024
  DMA zone: 1024 pages, LIFO batch:1
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
Building zonelist for node : 0
Kernel command line: root=3D/dev/mtdblock3 rootfstype=3Dcramfs =
console=3DttyCL0
debug
Relocating machine vectors to 0xffff0000
PID hash table entries: 32 (order 5: 256 bytes)
Memory: 4MB =3D 4MB total
Memory: 2908KB available (921K code, 116K data, 52K init)
Calibrating delay loop... 36.76 BogoMIPS
Dentry cache hash table entries: 1024 (order: 0, 4096 bytes)
Inode-cache hash table entries: 1024 (order: 0, 4096 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
CPU: Testing write buffer coherency: ok
POSIX conformance testing by UNIFIX
NET: Registered protocol family 16
Bluetooth: Core ver 2.3
NET: Registered protocol family 31
Bluetooth: HCI device and connection manager initialized
Bluetooth: HCI socket layer initialized
epson1355fb: regs mapped at 0xc0800000, fb 2048 KiB mapped at 0xc0802000
epson1355fb: xres=3D640, yres=3D480, is_color=3D1, is_dual=3D1, =
is_tft=3D0
epson1355fb: bpp=3D16, lcd_bpp=3D16, crt_enabled=3D0, lcd_enabled=3D1
fb0: S1D13505 frame buffer device
Fast Floating Point Emulator V0.9 (c) Peter Teichmann.
JFFS2 version 2.2. (C) 2001-2003 Red Hat, Inc.
Serial: CLPS711x driver $Revision: 1.42 $
ttyCL0 at I/O 0x100 (irq =3D 12) is a CLPS711x
ttyCL1 at I/O 0x1100 (irq =3D 28) is a CLPS711x
Using noop io scheduler
Search for id:(01 225b) interleave(1) type(2)
Search for id:(01 225b) interleave(1) type(2)
Search for id:(70 e3a0) interleave(1) type(2)
Search for id:(01 5b) interleave(2) type(1)
Search for id:(01 5b) interleave(2) type(1)
Search for id:(70 a0) interleave(2) type(1)
Search for id:(70 f10) interleave(2) type(2)
Search for id:(70 f10) interleave(2) type(2)
Search for id:(70 f10) interleave(2) type(2)
JEDEC: Found no ceiva flash device at location zero
clps_setup_mtd: do_map_probe failed to find flash
Bluetooth: HCI UART driver ver 2.1
Bluetooth: HCI H4 protocol initialized
NET: Registered protocol family 1
Bluetooth: L2CAP ver 2.1
Bluetooth: L2CAP socket layer initialized
Bluetooth: RFCOMM ver 1.0
Bluetooth: RFCOMM socket layer initialized
Bluetooth: RFCOMM TTY layer initialized
VFS: Cannot open root device "mtdblock3" or unknown-block(0,0)
Please append a correct "root=3D" boot option
Kernel panic: VFS: Unable to mount root fs on unknown-block(0,0)



Is there something else you'd like me to try to narrow this down?

-ch
