Received: from jupiter.lunarpages.com ([64.235.234.141])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E8eEg-0004Ri-Ib
	for linux-mtd@lists.infradead.org; Fri, 26 Aug 2005 09:27:16 -0400
Received: from [61.246.2.163] (helo=[10.20.50.70])
	by jupiter.lunarpages.com with esmtpa (Exim 4.50) id 1E8eEd-0003xe-E8
	for linux-mtd@lists.infradead.org; Fri, 26 Aug 2005 06:27:07 -0700
Message-ID: <430F18A9.9000303@kritikalsolutions.com>
Date: Fri, 26 Aug 2005 18:57:05 +0530
From: Narinder Kumar <narinder@kritikalsolutions.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Creating MTD partition using USB SMC reader
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

     I am using ARM9 on samsumg's s3c2410 and i am using SMC for keeping the bootloader(vivi), kernel(2.4.19) and rootfile system. All these partitions are cramfs. For some reason by bootloader got corrupted and now its not booting anymore. I am trying to use a USB All-in-1 Card reader which can read/write SD/MMC/SMC MS/MSPRO etc.  Now i want to create an MTD partition on my SMC and want to write the VIVI(bootloader) onto that MTD partition. If anyone has ever come across this scene then please provide me some guidance. I am stuck because we don't have JTAG with us right now (with which i was use to write SMC card earlier)  so were trying to find some alternate solution to write SMC. If there is some other way , then please give information about that also.


Narinder
