Received: from bay14-f32.bay14.hotmail.com ([64.4.49.32] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CbO3x-0003Vd-DN
	for linux-mtd@lists.infradead.org; Mon, 06 Dec 2004 13:58:25 -0500
Message-ID: <BAY14-F3281C02A2C83486EFF7BE6BFB40@phx.gbl>
From: "J C" <jjcar1526@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Mon, 06 Dec 2004 13:55:41 -0500
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Subject: DOC 2000 128Mbyte
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

  I have a DOC 2000 128Mbyte dip.  I am running 2.4.28 recently patched.  
When I do load the modules  "modprobe -a diskonchip nftl mtdchar mtdblock"  
The chip is found the /proc/devices shows nftl and mtdblock as devices.  
When the driver loads the last two lines say Coud not find valid boot record 
and NFTL:could not mount device.  I read the jffs-mini-howto.txt and it 
mentioned doing a nftl_format then fdisk.  I tried this and had to run the 
M-sys dos util dformat to get the chip back so the linux drivers could see 
it.  I can not run mkfs on it cuase it says no device found.

  Could someone please tell me what step I am missing.

Thanks John
