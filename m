Received: from bay19-f15.bay19.hotmail.com ([64.4.53.65] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BlHNp-0006UR-Ls
	for linux-mtd@lists.infradead.org; Thu, 15 Jul 2004 21:19:30 -0400
From: "w h" <wh3cq@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 16 Jul 2004 01:19:26 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Message-ID: <BAY19-F15ZElV5tTPEi000352a9@hotmail.com>
Subject: incorrect percent of MTD partition when using "df"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

In using MX1ADS,I have 4 MTD partitions: 1M bootloader,2M kernel,7M root 
fs, 6M fdisk. Jffs2 is taken as root fs and mounted to the last partition 
fdisk. 

In "df" command,100% is given to the usage percent of root fs whatever its 
actual size is.
83% is shown for fdisk usage percent.If I change partition to 
1M,2M,6M,7M,it gives 71%. It seems that 5M of fdisk partition has already 
been to used.  

What reason leads this? I wonder if some modification has been done in 
kernel and where.

_________________________________________________________________
享用世界上最大的电子邮件系统— MSN Hotmail。  http://www.hotmail.com  
