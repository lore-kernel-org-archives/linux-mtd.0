Received: from xerxes.tchmachines.com ([208.76.80.175])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1ID6sR-0004Mu-K8
	for linux-mtd@lists.infradead.org; Mon, 23 Jul 2007 18:59:45 -0400
Message-ID: <8988.69.30.123.186.1185231577.squirrel@architechnical.net>
Date: Mon, 23 Jul 2007 15:59:37 -0700 (PDT)
Subject: MTD support for "Intel Strataflash P30"
From: "Pete MacKay" <linux@architechnical.net>
To: veerasena_b@yahoo.co.in
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yes, the P30 is supported through the Common Flash Interface (CFI) in
2.6.18 and I believe in 2.6.12 too.  You have to write a mapping driver
(see drivers/mtd/maps) and probe with the map_name "cfi_probe".  I wrote
one for a PXA-270 device similar to the Intel Mainstone board so I started
with drivers/mtd/maps/mainstone-flash.c and the platform resources in
arch/arm/mach-pxa/mainstone.c as an example.  Good luck!

Also, if you're using u-boot beware that the chip ID for two of the Strata
chips is wrong.  I've submitted a patch twice but somehow didn't follow
some unwritten rules so the u-boot git still has the wrong IDs.  They
should be (from my 1.1.4 source):

#ifndef INTEL_ID_28F64P30T
#define INTEL_ID_28F64P30T  0x8817	/*  64M =  32K x 255 + 32k x 4 */
#define INTEL_ID_28F64P30B  0x881A	/*  64M =  32K x 255 + 32k x 4 */
#define INTEL_ID_28F128P30T 0x8818	/* 128M =  64K x 255 + 32k x 4 */
#define INTEL_ID_28F128P30B 0x881B	/* 128M =  64K x 255 + 32k x 4 */
#define INTEL_ID_28F256P30T 0x8919	/* 256M = 128K x 255 + 32k x 4 */
#define INTEL_ID_28F256P30B 0x891C	/* 256M = 128K x 255 + 32k x 4 */
#endif

Note the last two start with '0x89' and not '0x88', which are the
(incorrect) values in the u-boot header include/flash.h (added in 1.1.5 or
1.1.6 if I remember correctly).

veerasena reddy veerasena_b at yahoo.co.in wrote:

Hi,

Does Linux-2.6.12 or linux-2.6.18 has MTD flash device
support for "Intel Strataflash P30" device?

I appreciate your early response.

Thanks in Advance.

Regards,
Veerasena.
