Received: from wproxy.gmail.com ([64.233.184.205])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CN2vB-00078A-Dn
	for linux-mtd@lists.infradead.org; Thu, 28 Oct 2004 01:34:02 -0400
Received: by wproxy.gmail.com with SMTP id 57so474794wri
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Oct 2004 22:34:00 -0700 (PDT)
Message-ID: <b4618e0f04102722337611da67@mail.gmail.com>
Date: Thu, 28 Oct 2004 11:03:57 +0530
From: bandwidthcrunch <bandwidthcrunch@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Obtaining NAND oobinfo
Reply-To: bandwidthcrunch <bandwidthcrunch@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,
         Any clues why 
./flash_eraseall -j /dev/mtd3 
./flash_eraseall: /dev/mtd3: unable to get NAND oobinfo

should happen ?  
cat /proc/mtd shows
dev:    size   erasesize  name
mtd0: 00040000 00040000 "Bootloader"
mtd1: 00100000 00040000 "Kernel"
mtd2: 01ec0000 00040000 "Filesystem"
mtd3: 02000000 00004000 "Filesystem on nand"

and dmesg shows
NAND device: Manufacture ID: 0xec, Chip ID: 0x76 (Samsung K9D1208V0M)
Creating 1 MTD partitions on "Samsung K9D1208V0M":
0x00000000-0x02000000 : "Filesystem on nand"

Any suggestions would be great 
regards,
band
