Received: from musenki.com ([192.207.126.3] helo=dinky.musenki.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1711Ma-0000sL-00
	for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2002 09:45:57 +0100
To: linux-mtd@lists.infradead.org, mshah@yottayotta.com
Subject: Re: removing invalidate_device makes it boot /dev/mtdblock/0
In-Reply-To: <3CC87F1F.2010407@yottayotta.com>
Message-Id: <E1711HW-00062J-00@zaphod.musenki.com>
From: Jim Thompson <jim@musenki.com>
Date: Fri, 26 Apr 2002 03:40:42 -0500
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

	I got past my last problem (last post by me today) by erasing 
	invalidate_device line in mtdblock_release

	Is this OK? I'm using 2.4.18-rmk3

I'm having the same problem.

All you did was to kill the call to invalidate_device() in mtdblock_release()?
