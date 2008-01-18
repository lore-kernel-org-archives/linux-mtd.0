Received: from wa-out-1112.google.com ([209.85.146.182])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JFq5X-0002xv-LO
	for linux-mtd@lists.infradead.org; Fri, 18 Jan 2008 12:12:54 +0000
Received: by wa-out-1112.google.com with SMTP id v33so1641004wah.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Jan 2008 04:12:46 -0800 (PST)
Message-ID: <479097B7.9050401@gmail.com>
Date: Fri, 18 Jan 2008 17:42:39 +0530
From: vicky <vicky.irobot@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: question about node creation /dev/mtd*
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

Hi,

I have enabled mtd in my config. When I boot from the updated kernel I 
find that /dev/mtdblock is not created?

How does the /dev/mtdblock get created? I didn't find this in the 
init/rcs script. I am under an impression that once the mtd is enabled 
in the linux
config file the creation of the corresponding node is taken care in some 
script.

I have a dummy nand driver written and placed in the mtd/nand location.

Please advice.

Vic
