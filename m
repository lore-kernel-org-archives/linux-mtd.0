Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HnY7a-00046h-OL
	for linux-mtd@lists.infradead.org; Mon, 14 May 2007 06:49:44 -0400
Date: Mon, 14 May 2007 12:49:34 +0200
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: dedekind@infradead.org
Subject: Re: Mounting big endian jffs2 images on mtdram on a x86
Message-ID: <20070514124934.6d6838af@dhcp-252-105.norway.atmel.com>
In-Reply-To: <1179138892.3642.5.camel@sauron>
References: <1179133533.21753.13.camel@localhost.localdomain>
	<1179138892.3642.5.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 14 May 2007 13:34:52 +0300
Artem Bityutskiy <dedekind@infradead.org> wrote:

> FYI, mtdblock is not needed and is ancient and confusing way to mount
> jffs2. 
> 
> http://www.linux-mtd.infradead.org/faq/jffs2.html#L_mtdblock

Btw, newer versions of busybox seem to be able to mount jffs2
filesystems without using mtdblock.

~ # mount -tjffs2 mtd3 /usr
~ # umount /usr
~ # mount -tjffs2 mtd:spi0.0-AT45DB642x /usr
~ # ls -l /bin/mount
lrwxrwxrwx    1 root     root            7 Apr 17  2007 /bin/mount -> busybox
~ # busybox
BusyBox v1.4.2 (2007-04-17 15:34:55 CEST) multi-call binary

Haavard
