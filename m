Received: from [210.17.210.210] (helo=mail.avantwave.com)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CZPGR-0005hP-23
	for linux-mtd@lists.infradead.org; Wed, 01 Dec 2004 02:51:04 -0500
Received: from [172.16.10.215] (chung.avantwave.com [172.16.10.215])
	by mail.avantwave.com (8.12.10/8.12.10) with ESMTP id iB17j94r021322
	for <linux-mtd@lists.infradead.org>; Wed, 1 Dec 2004 15:45:09 +0800
Message-ID: <41AD79B1.4050303@avantwave.com>
Date: Wed, 01 Dec 2004 15:58:41 +0800
From: mike <mikelee@avantwave.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: patching cvs mtd to linux 2.4.27-vsr1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all
    Thanks for helping
    I have some problem when patching cvs mtd to linux 2.4.27-vsr1. 
after i use the patches/patchin.sh -c -j /usr/src/linux. I compile 
kernel as usual practise. But i found that error below. 

arm-linux-gcc -D__KERNEL__ -I/usr/src/linux-2.4.27-vrs1/include -Wall 
-Wstrict-prototypes -Wno-trigraphs -Os -fno-strict-aliasing -fno-common 
-Uarm -fno-common -pipe -mapcs-32 -D__LINUX_ARM_ARCH__=4 -march=armv4  
-mshort-load-bytes -msoft-float -Uarm   -nostdinc -iwithprefix include 
-DKBUILD_BASENAME=chipreg   -c -o chipreg.o chipreg.c
In file included from chipreg.c:14:
*/usr/src/linux-2.4.27-vrs1/include/linux/mtd/map.h:127:2: #error "No 
bus width supported. What's the point?"

*I check that there is not define of the map_bankwidth on anywhere of 
the kernel source. Am i patch wrong kernel version?

Best regard
Mike,Lee
