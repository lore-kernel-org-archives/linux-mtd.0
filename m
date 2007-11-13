Received: from ims.2wire.com ([206.171.6.87])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Is1NS-0003b1-UW
	for linux-mtd@lists.infradead.org; Tue, 13 Nov 2007 14:24:57 -0500
Message-ID: <4739FA7A.9050403@kenati.com>
Date: Tue, 13 Nov 2007 11:26:50 -0800
From: Carlos Munoz <carlos@kenati.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: How to map nand chip ?
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm working on a custom board that has both nor and nand flash. I mapped 
the nor flash (cfi) using do_map_probe("cfi_probe", &map). However, I'm 
not sure what argument to pass to do_map_probe() to map the nand flash.

Does anyone know how nand flash is mapped or point me to the right 
documents ?

Thanks,


Carlos
