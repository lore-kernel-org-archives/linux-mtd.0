Received: from [64.120.26.98] (helo=phonos.telos-systems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15iyIY-000715-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Sep 2001 14:18:54 +0100
Message-id: <fc.000f680100284994000f680100283f75.2849d0@telos-systems.com>
Date: Mon, 17 Sep 2001 09:06:55 -0400
Subject: Re(2): trouble compiling mkfs.jffs2
To: joern@wohnheim.fh-wedel.de
Cc: linux-mtd@lists.infradead.org
From: "James Schettine" <james@telos-systems.com>
References: <fc.000f680100283f75000f680100283f75.283ff2@telos-systems.com>
 <20010915211257.B23628@wohnheim.fh-wedel.de>
In-Reply-To: <20010915211257.B23628@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
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

joern@wohnheim.fh-wedel.de writes:
>Just a wild guess, but Debian 2.2 (aka Potato) is based on the 2.2
>Kernel series. This also effects a bunch of files in the /usr/include
>tree and might be the cause of your problems.
>You could update your Debian system to testing/Woody or simply
>temporarily symlink /usr/include/linux to /usr/src/linux/include - if
>that one belongs to a current kernel version.

Thanks...  I got it to compile (v1.15), but when I run it 
it creates a file size == one erase block.

A quick web search led me to :
ftp://ftp.uk.linux.org/pub/people/dwmw2/iPAQ/mkfs.jffs2.1.8
running it --version sez 1.7 and it creates the whole 5 meg
but my kernel complains bitterly that the fs is too old.

If I could grab a binary somewhere I could move on.
If no-one can point me to a binary, I guess I'll
be debugging this app on a 2.2 kernel.
(my boss threatens to "just go back to WinCE"!)

Thanks  J
