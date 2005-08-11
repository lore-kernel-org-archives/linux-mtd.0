Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E38XT-00024U-HM
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2005 04:35:57 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: dedekind@infradead.org
In-Reply-To: <1123748971.16052.65.camel@sauron.oktetlabs.ru>
References: <42FAFEC9.1090306@mail.ru>
	<1123745980.16052.48.camel@sauron.oktetlabs.ru>
	<42FB0734.7050304@mail.ru>
	<1123748971.16052.65.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Thu, 11 Aug 2005 08:35:01 +0000
Message-Id: <1123749301.23647.1.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alex Karev <lineum@mail.ru>, linux-mtd@lists.infradead.org
Subject: Re: jffs2 and nand mtd
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-08-11 at 12:29 +0400, Artem B. Bityuckiy wrote:

> 1. enable JFFS3 debugging level 1
> 2. copy as few as possible files to your flash which is enough just to
> reproduce the problem.

After unmount, please create a dump of your FLASH partition with
nanddump and put it somewhere for download.

tglx
