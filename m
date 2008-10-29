Received: from e3.ny.us.ibm.com ([32.97.182.143])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KvKrG-0005t3-Gh
	for linux-mtd@lists.infradead.org; Wed, 29 Oct 2008 23:53:50 +0000
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e3.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m9TNrn32003522
	for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2008 19:53:49 -0400
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	m9TNrn8t130750
	for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2008 19:53:49 -0400
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m9TNrnsA011676
	for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2008 19:53:49 -0400
Received: from linux.ibm.com (imap.raleigh.ibm.com [9.37.253.145])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	m9TNrnul011666
	for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2008 19:53:49 -0400
Message-ID: <20081029195349.imqvyxcajuoko0wo@imap.linux.ibm.com>
Date: Wed, 29 Oct 2008 19:53:49 -0400
From: Corinna Schultz <cschultz@linux.vnet.ibm.com>
To: linux-mtd@lists.infradead.org
Subject: ST M29W320D incorrectly configured
MIME-Version: 1.0
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm having a problem getting the unlock addresses correctly configured =20
for the ST M29W320D chip. CFI query data is shown below (from =20
debugging statements I enabled and/or added to the driver). The chip =20
is wired so that the #BYTE pin is low, putting the chip into x8 mode. =20
The data bus is physically 8 bits.

I don't understand everything that's going on in the code, but it =20
seems to me that the following code (taken from cfi_cmdset_0002.c, =20
which sets the unlock addresses needed for writing and erasing) has a =20
logic error. Maybe someone can explain it to me?

  if (    /* x16 in x8 mode */
     ((cfi->device_type =3D=3D CFI_DEVICETYPE_X8) &&
      (cfi->cfiq->InterfaceDesc =3D=3D 2))


The reason I think this is in error is that both the device type and =20
the interfaceDesc are defined by the hardware, and not indicative of =20
the mode. Besides, isn't this conditional actually testing if the chip =20
is an X8 chip and supports x8 and x16 async modes?

As far as I know the only way to determine what mode the chip is in is =20
to check the QRY string at the beginning of the query data on the chip.

According to the spec, page 12 of:  =20
http://www.amd.com/us-en/assets/content_type/DownloadableAssets/cfi_r20.pdf

An x16 device in x16 mode has QRY at addresses 10, 11, and 12 (hex) =20
and Q null R at addresses 20, 21, and 22. An x16 device in x8 mode has =20
QQR at addresses 20, 21, 22.

Since this chip is an x16 in x8 mode, the unlock addresses should be =20
0xaaa and 0x555.

As can be seen below, the device_type is 2, which is =20
CFI_DEVICE_TYPE_X16, and the InterfaceDesc is 2. But as I understand =20
the spec, these values don't change whether the chip is in x16 mode or =20
in x8 mode.

I'm not sure how to tell the version number of the driver, but =20
gen_probe.c is at v 1.24, and cfi_cmdset_0002.c is at v.1.122, if that =20
helps.


Here's the log:

physmap flash device: 400000 at ffc00000
Number of erase regions: 4
Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)
Primary Algorithm Table at 0040
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum:  2.7 V
Vcc Maximum:  3.6 V
Vpp Minimum: 11.5 V
Vpp Maximum: 12.5 V
Typical byte/word write timeout: 16 ?s
Maximum byte/word write timeout: 512 ?s
Full buffer write not supported
Typical block erase timeout: 1024 ms
Maximum block erase timeout: 16384 ms
Chip erase not supported
Device size: 0x400000 bytes (4 MiB)
Flash Device Interface description: 0x0002
   - supports x8 and x16 via BYTE# with asynchronous interface
Max. bytes in buffer write: 0x1
Number of Erase Block Regions: 4
   Erase Region #0: BlockSize 0x4000 bytes, 1 blocks
   Erase Region #1: BlockSize 0x2000 bytes, 2 blocks
   Erase Region #2: BlockSize 0x8000 bytes, 1 blocks
   Erase Region #3: BlockSize 0x10000 bytes, 63 blocks
phys_mapped_flash: Found 1 x16 devices at 0x0 in 8-bit bank
  Amd/Fujitsu Extended Query Table at 0x0040
   Silicon revision: 0
   Address sensitive unlock: Required
   Erase Suspend: Read/write
   Block protection: 1 sectors per group
   Temporary block unprotect: Supported
   Block protect/unprotect scheme: 4
   Number of simultaneous operations: 0
   Burst mode: Not supported
   Page mode: Not supported
   Vpp Supply Minimum Program/Erase Voltage: 11.5 V
   Vpp Supply Maximum Program/Erase Voltage: 12.5 V
   Top/Bottom Boot Block: Bottom boot
addr_unlock1: 555, addr_unlock2: 2aa
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.


-Corinna Schultz
IBM LTC
