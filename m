Received: from [194.249.198.85] (helo=kasica.elsis.si)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17P1K0-0002Vz-00
	for <linux-mtd@lists.infradead.org>; Mon, 01 Jul 2002 14:34:28 +0100
Content-Type: text/plain;
  charset="us-ascii"
From: Iztok Zupet <iz@vsr.si>
Reply-To: iz@vsr.si
To: linux-mtd@lists.infradead.org
Subject: RedBoot from DoC not working quite well
Date: Mon, 1 Jul 2002 15:35:01 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200207011535.01055.iz@vsr.si>
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

 I succsessfuly replaced a DoC millenium firmware with RedBoot using the GRUB 
patch as the base. After

	>>> doc_loadbios /dev/mtd0 redboot_firmware

RedBoot boots fine (int18 or int19). But after formating my DoC with 
nftl_format utility:

	>>> nftl_format /dev/mtd0 128000

which should leave all the RedBoot blocks unchanged, my RedBoot is gone.
The whole redboot_firmware size is 126280.

Can someone tell me why the RedBoot and NFTL blocks interleave, if they do. 

Thanks
iz
