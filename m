Received: from m12-13.163.com ([220.181.12.13])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pi7eS-0002Mf-Uy
	for linux-mtd@lists.infradead.org; Wed, 26 Jan 2011 15:51:22 +0000
Date: Wed, 26 Jan 2011 23:51:09 +0800
From: "wxzzzh" <wxzzzh@163.com>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
Subject: incompatible libmtd.a when compiling the mtd-utils
Message-ID: <201101262351090621559@163.com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Reply-To: wxzzzh@163.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I was trying to cross compile the mtd-utils-1.4.1, for ARM, using the arm-2009q3 version of arm-none-linux-gnueabi, following the instructions on http://elinux.org/CompilingMTDUtils

it always fail with saying: "/home/zh/1808/tool/arm-2009q3/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.1/../../../../arm-none-linux-gnueabi/bin/ld: skipping incompatible /home/zh/1808/mtd/mtd-utils-1.4.1/arm-none-linux-gnueabi/lib/libmtd.a when searching for -lmtd
/home/zh/1808/tool/arm-2009q3/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.1/../../../../arm-none-linux-gnueabi/bin/ld: cannot find -lmtd
collect2: ld returned 1 exit status"

How this happened? and how to solve?
Any help appreciated. 	

Regards.			
--------------
Zhu

2011-01-26
