Received: from [210.77.143.228] (helo=tsinghua.org.cn)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17kGYc-0003Dy-00
	for <linux-mtd@lists.infradead.org>; Thu, 29 Aug 2002 05:05:22 +0100
From: "" <yanhy@tsinghua.org.cn>
To: linux-mtd@lists.infradead.org  
Date: Thu, 29 Aug 2002 12:06:18 +0800
Reply-To: "" <yanhy@tsinghua.org.cn>
Subject: Can anyone give me some suggestions on using jffs(1/2)
Content-Type: text/plain
Message-Id: <E17kGYc-0003Dy-00@pentafluge.infradead.org>
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

Hi!I'm a new comer here and I am new to uClinux.I want to use jffs(1 or 2) as the
root filesystem on target M5272C3.But i failed to do that though i tried a lot
according to "jffs-howto.txt".Can you tell me how to begin?
well,I have download uClinux-2.4.x( uClinux-dist-20020701.tar.gz.tar) from
www.uclinux.org, and i'v succesfully run the kernel on the M5272C3 target using
romfs as root fs(BTW:i use ppcboot as the bootloader,which can receive
kernel+romfs image via ethernet port and then put it in ram at 0x20000.Then i can
run the kernel by typing command "go 20000") .
Now, i want to use jffs as the root fs instead of romfs,but i failed to compile
the kernel when i select MTD support, MTD partitions support and jffs support as 
jffs-howto.txt says.
Can you give me some suggestions how to build the jffs(2 or 1) as root fs? Are any
patches required ?
Thanks so much!
Best wishes
Yan
