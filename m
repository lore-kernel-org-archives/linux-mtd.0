Received: from ims.2wire.com ([206.171.6.87])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IskJm-0003Sq-Fj
	for linux-mtd@lists.infradead.org; Thu, 15 Nov 2007 14:24:08 -0500
Message-ID: <473C9D46.9060007@kenati.com>
Date: Thu, 15 Nov 2007 11:25:58 -0800
From: Carlos Munoz <carlos@kenati.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: How to map nand chip ?
References: <4739FA7A.9050403@kenati.com>
In-Reply-To: <4739FA7A.9050403@kenati.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Carlos Munoz <carlos@kenati.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Carlos Munoz wrote:
> I'm working on a custom board that has both nor and nand flash. I mapped 
> the nor flash (cfi) using do_map_probe("cfi_probe", &map). However, I'm 
> not sure what argument to pass to do_map_probe() to map the nand flash.
>
> Does anyone know how nand flash is mapped or point me to the right 
> documents ?
>   
OK. I figured it out... had to write a board nand driver.

When I load the nand driver module, the nand chip is detected correctly 
but it seems all the erase blocks are bad. I wonder if it's caused by 
the wrong timings when accessing the nand chip. However, the 
manufacturer and chip id are read correctly. Does anyone know what may 
be the cause for these errors ?

The output is as follows:

modprobe migo_r
NAND device: Manufacturer ID: 0xec, Chip ID: 0xd3 (Samsung NAND 1GiB 
3,3V 8-bit)
Scanning device for bad blocks
Bad eraseblock 1 at 0x00020000
Bad eraseblock 2 at 0x00040000
Bad eraseblock 3 at 0x00060000
Bad eraseblock 4 at 0x00080000
Bad eraseblock 5 at 0x000a0000
Bad eraseblock 6 at 0x000c0000
Bad eraseblock 7 at 0x000e0000
Bad eraseblock 8 at 0x00100000
Bad eraseblock 9 at 0x00120000
Bad eraseblock 10 at 0x00140000
....


Thanks,


Carlos
