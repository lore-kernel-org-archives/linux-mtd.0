Received: from [200.53.172.239] (helo=qis)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15kq4a-0006Uc-00
	for <linux-mtd@lists.infradead.org>; Sat, 22 Sep 2001 17:56:13 +0100
Message-ID: <20010922160958.5797.qmail@qis>
From: "Nikolai Vladychevski" <niko@isl.net.mx>
To: linux-mtd@lists.infradead.org
Subject: nftl driver
Date: Sat, 22 Sep 2001 16:09:58 GMT
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

I have a problem, when I try to use nftla device zeros are wroten: 

dd if=/tmp/romfile of=/dev/nftla 

reports that the data was written ok,but when I do hexdump against 
/dev/nftla it has zeros. 

I use nftla_format before doing dd ,and I do not unload nftl driver (as the 
HOWTO suggests) because it is not compiled as module, it is included into 
the kernel. Actualy I use /dev/nftla for booting only and loading 
applications into a ramdisk, after that I do not access /dev/nftla anymore. 
The problem begins when I want to upgrade my software that is located on 
that device, and have to nftl_format again. If this problem of writing zeros 
is due to the module unloading problem, how can I solve it if the driver is 
in the kernel and cant be reloaded? 

Nikolai 

Nikolai
