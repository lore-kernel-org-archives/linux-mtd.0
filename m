Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15iKmF-0006DD-00
	for <linux-mtd@lists.infradead.org>; Sat, 15 Sep 2001 20:06:55 +0100
Date: Sat, 15 Sep 2001 21:12:57 +0200
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: James Schettine <james@telos-systems.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: trouble compiling mkfs.jffs2
Message-ID: <20010915211257.B23628@wohnheim.fh-wedel.de>
References: <fc.000f680100283f75000f680100283f75.283ff2@telos-systems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc.000f680100283f75000f680100283f75.283ff2@telos-systems.com>; from james@telos-systems.com on Fri, Sep 14, 2001 at 02:20:02PM -0400
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

Hi!

> In order to re-flash my embedded root filesystem with 
> the correct erase block size, I have transferred all files 
> to my desktop system (an older Debian 2.2) and read up 
> on using mkfs.jffs2.  I couldn't find a pre-compiled binary 
> in a quick and lazy search so I grabbed the cvs tree, 
> cd util, and make mkfs.jffs2.  (did the configure thing too,
> but that didn't fix this problem.)
>
> [more error descriptions]

Just a wild guess, but Debian 2.2 (aka Potato) is based on the 2.2
Kernel series. This also effects a bunch of files in the /usr/include
tree and might be the cause of your problems.
You could update your Debian system to testing/Woody or simply
temporarily symlink /usr/include/linux to /usr/src/linux/include - if
that one belongs to a current kernel version.

Jörn

-- 
Every good work of software starts by 
scratching a developer's personal itch.
