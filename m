Received: from [209.92.187.33] (helo=core.arrancar.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Xb6C-00041R-00
	for <linux-mtd@lists.infradead.org>; Sun, 12 Jan 2003 05:55:56 +0000
Received: from core.arrancar.com (localhost [127.0.0.1])
	by core.arrancar.com (8.12.2/8.12.2) with ESMTP id h0C5hH36013598
	for <linux-mtd@lists.infradead.org>; Sun, 12 Jan 2003 02:43:18 -0300
Received: from OL4-84.fibertel.com.ar (OL4-84.fibertel.com.ar [24.232.84.4])
	(authenticated bits=0)
	by core.arrancar.com (8.12.2/8.12.2) with ESMTP id h0C5hEnW013592
	for <linux-mtd@lists.infradead.org>; Sun, 12 Jan 2003 02:43:17 -0300
Subject: JFFS2 on block devices
From: Federico Ferreres <fferreres@arrancar.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 12 Jan 2003 03:21:34 -0300
Message-Id: <1042352498.1998.19.camel@tp>
Mime-Version: 1.0
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

Hi! I am using jffs2 just for the compression feature on my laptop
(can't upgrade the HD right now). It seems to work fine for my needs (I
created an jffs2 in a normal partition, the used the loopback device on
it, then blkmtd on it, then mounted the mtdblock0 device).

I have two doubts though and couldn't find the answer anywhere ...

* What is the maximun size jffs2 supports? I am using a 300MB image. Is
there a recommended minimun?
* Is it too bad to "resize my image" by appending 0xFF's to it's end?

Anyway, thanks a lot. It's brainkiller to use jffs2 this way and not
intended for this, but I haven't found any other rw compressed HD
filesystem that allows me to use recent kernels. And seems to work great
for what i need (I was able to free 700MB of my tiny 2GB HD this way)

Regards,

Federico
