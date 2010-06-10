Received: from lo.gmane.org ([80.91.229.12])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OMh6V-0007Ms-85
	for linux-mtd@lists.infradead.org; Thu, 10 Jun 2010 12:43:28 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1OMh6S-0006Of-FV
	for linux-mtd@lists.infradead.org; Thu, 10 Jun 2010 14:43:24 +0200
Received: from amg-holding.md ([89.28.62.63])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 10 Jun 2010 14:43:24 +0200
Received: from egorkat by amg-holding.md with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 10 Jun 2010 14:43:24 +0200
To: linux-mtd@lists.infradead.org
From: Egorkat <egorkat@gmail.com>
Subject: MTD support for old DoC chips MD2201-D72
Date: Thu, 10 Jun 2010 12:43:13 +0000 (UTC)
Message-ID: <loom.20100610T134317-652@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Good day, All!

I've faced the problem in 2.6.34 with support for old DiskonChip drives.
I have 4 DoCs - one is MD2202-D32 (is recognised) and 3 MD2201-D72.
modprobe diskonchip says - 
[  151.499542] DiskOnChip found at 0xc8000
[  151.504542] DiskOnChip 2000 responds to DWORD access
[  151.509769] Detected 3 chips per floor.
[  151.509769] No NAND device found.
[  151.517548] DiskOnChip found at 0xca000
[  151.519541] DiskOnChip 2000 responds to DWORD access
[  151.521541] Detected 3 chips per floor.
[  151.527544] No NAND device found.
[  151.536658] No valid DiskOnChip devices found

Here is output from dinfo utility - 
                           D I N F O - utility 
                  Version 5.1.4.0.8, Last Update: 22 Oct 2002
                   Copyright (C) M-Systems, 1992 - 2002
                 ----------------------------------------

 DiskOnChip 1 - GENERAL INFO.
	Physical Address:  0xC8000
	DiskOnChip Type :  DiskOnChip 2000
	Flash Type      :  TC5864
	FormatType      :  NFTL
	TrueFFS version :  5.1.4
	Driver Version  :  DOS 5.1.4
	Sectors         :  9
	Heads           :  16
	Cylinders       :  1002
	Boot Area Size  :  49152 Bytes
	Logical Sectors :  144288
	Phy. UnitSize   :  8192 Bytes
	Physical Size   :  75497472 (72 MB)
	Unit Size       :  8192 Bytes
	Media Size      :  75497472 Bytes (72 MB)
	Chip Size       :  8388608 Bytes (8 MB)
	No Of Chips     :  9
	Interleaving    :  1

 DiskOnChip 2 - GENERAL INFO.
	Physical Address:  0xCA000
	DiskOnChip Type :  DiskOnChip 2000
	Flash Type      :  TC5864
	FormatType      :  NFTL
	TrueFFS version :  5.1.4
	Driver Version  :  DOS 5.1.4
	Sectors         :  9
	Heads           :  16
	Cylinders       :  1002
	Boot Area Size  :  49152 Bytes
	Logical Sectors :  144288
	Phy. UnitSize   :  8192 Bytes
	Physical Size   :  75497472 (72 MB)
	Unit Size       :  8192 Bytes
	Media Size      :  75497472 Bytes (72 MB)
	Chip Size       :  8388608 Bytes (8 MB)
	No Of Chips     :  9
	Interleaving    :  1

Is it possible to add support for that chip in mtd? May be I can supply more
information?

Thanks in advance!
