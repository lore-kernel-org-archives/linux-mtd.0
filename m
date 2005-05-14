Received: from mail.gmx.de ([213.165.64.20] helo=mail.gmx.net)
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DWukL-00034R-Tg
	for linux-mtd@lists.infradead.org; Sat, 14 May 2005 07:23:54 -0400
Message-ID: <4285DFCA.8050703@gmx.net>
Date: Sat, 14 May 2005 13:23:54 +0200
From: Peter Bergmann <bergmann.peter@gmx.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: DiskOnChip Millennium Plus 32MB
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

i have an embedded x86 device with a trueffs DiskOnChip
Millennium Plus 32MB on it.
the first thing i've tried was the semi-binary only
driver from m-systems (doc.o) with kernel 2.6.11.
the chip was only detected when specifying the fl_winh
module parameter in order to increase the default probe
window size.
but the driver does not really work. each time i run
md5sum on a file or the device itself (/dev/fla)
i get a different checksum! i've tried the same driver
with a doc2000 16MB and a millennium 8mb and it worked
without problems.

i was glad to find the following message on your project
homepage:
"The DiskOnChip 2000, Millennium and Millennium Plus
devices should be fully supported, using their native
NFTL and INFTL 'translation layers'."

but i've not been able to get it running:

the devices/doc2001plus.c recognizes the device but the
inftl.ko says:
"INFTL no longer supports the old DiskOnChip drivers
loaded via docprobe. Please use the new diskonchip
driver under the NAND subsystem"

great but this combined nand/diskonchip.c driver tells
me "DiskOnChip Millennium Plus 32MB is not supported,
ignoring."

what do i have to do in order to get a
trueffs formatted DiskOnChip Millennium Plus 32MB
running under linux ?

please cc me as i'm not subscribed to the list yet.

thanks for any hints!

cheers,
pet.
