Received: from tolkien.mizi.com ([203.239.30.114])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15LHZ7-0003B4-00
	for <linux-mtd@lists.infradead.org>; Sat, 14 Jul 2001 06:02:06 +0100
To: kingseft@samsung.co.kr
Cc: linux-mtd@lists.infradead.org
Subject: Re: =?euc-kr?b?KMDnwPy82yk=?= /dev/mtd0 qeustions
References: <H00002af04ff19c1@MHS>
From: Yong-iL Joh <tolkien@mizi.com>
Date: 14 Jul 2001 14:07:41 +0900
In-Reply-To: <H00002af04ff19c1@MHS>
Message-ID: <hbofqo9jz6.fsf@tolkien.mizi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

kingseft@samsung.co.kr writes:

>  mkfs.jffs -d /home/jffs -o /tmp/jffs.image
>  and
> 
>  cp /tmp/jffs.image /dev/mtd0
>  the result message is
> 
>  cp: /dev/mtd0  Read-only file system.     <----Here.

what filesystem do you use for root filesystem?
if you use romfs, then mount /dev as ramfs and make node.

>  so, I can't proceed next step!!

-- 
Joh, Yong-iL
E-mail: tolkien@nownuri.net tolkien@mizi.com
