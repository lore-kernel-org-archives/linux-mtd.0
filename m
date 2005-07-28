Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1Dy4V8-0006bq-4t
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2005 05:16:31 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Amit Sharma <amitsharma91@gmail.com>
In-Reply-To: <9185a3fa0507280057dcd057f@mail.gmail.com>
References: <9185a3fa0507280057dcd057f@mail.gmail.com>
Content-Type: text/plain
Date: Thu, 28 Jul 2005 11:15:47 +0200
Message-Id: <1122542147.3466.6.camel@lap02.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 mounting problem
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-07-28 at 16:57 +0900, Amit Sharma wrote:
> mkfs.jffs2 -d /home/jffs2stuff -o /tmp/jffs2.image

Yoe have to set the correct options for your FLASH.

mkfs.jffs2 -e ERASEBLOCKSIZE -p NANDPAGESIZE -n -d ... -o ...

> cat /tmp/jffs2.image >/dev/mtdblock/0

Use nandwrite for that. Read
http://linux-mtd.infradead.org/faq/nand.html

> mount -t jffs2 /dev/mtdblock/0 /mnt/

tglx
