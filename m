Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15iyiJ-00073G-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Sep 2001 14:45:31 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <fc.000f680100284994000f680100283f75.2849d0@telos-systems.com> 
References: <fc.000f680100284994000f680100283f75.2849d0@telos-systems.com>  <fc.000f680100283f75000f680100283f75.283ff2@telos-systems.com> <20010915211257.B23628@wohnheim.fh-wedel.de> 
To: "James Schettine" <james@telos-systems.com>
Cc: joern@wohnheim.fh-wedel.de, linux-mtd@lists.infradead.org
Subject: Re: Re(2): trouble compiling mkfs.jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 17 Sep 2001 14:51:31 +0100
Message-ID: <14988.1000734691@redhat.com>
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


james@telos-systems.com said:
>  Thanks...  I got it to compile (v1.15), but when I run it  it creates
> a file size == one erase block.

1.15 was doing naughty things when given a relative rootdir, and just 
segfaulting when the rootdir wasn't specified.  1.16 should fix it.

ftp.uk.linux.org:/pub/people/dwmw2/jffs2/mkfs.jffs2-1.16

--
dwmw2
