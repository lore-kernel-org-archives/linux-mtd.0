Received: from [62.98.196.82] (helo=lisa.rhpk.springfield.inwind.it ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15oVGq-0002R1-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Oct 2001 20:32:04 +0100
Date: Tue, 2 Oct 2001 21:35:20 +0200 (CEST)
From: Cristiano Paris <c.paris@libero.it>
To: David Woodhouse <dwmw2@infradead.org>
cc: <linux-mtd@lists.infradead.org>
Subject: Re: MTD newbie 
In-Reply-To: <13487.1002032051@redhat.com>
Message-ID: <Pine.LNX.4.33.0110022124180.441-100000@lisa.rhpk.springfield.inwind.it>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Tue, 2 Oct 2001, David Woodhouse wrote:

> What is /task-familiar-etc? Did you mean:

task-familiar is a jffs2 image that can be dowload from
familiar.handhelds.org and contains a complete filesystem for the iPAQ
handhelds.

>  dd if=/task-familiar-etc of=/dev/mtdblock0

Why are you doing that ? I'm using 'cp' over /dev/mtd0 as said in the
mtd-jffs-HOWTO :

----QUOTE
cp  /tmp/jffs.image /dev/mtd0,1,2
----QUOTE

Actually 'dd' is a more flexible 'cp'. Anyway I tried both ways.

>  mount -t jffs2 /dev/mtdblock0 /mnt

Here's where I was wrong. The mount works but the system freezes for about
30 seconds (YUP) so I thought the system was hung. Anyway, issuing a
"touch /mnt/silly" crashes the system, giving me the same kernel oops. I
increased the debugging level of printk, as you adviced in your previous
post but I cannot post neither the debug messages nor the kernel oops
itself : tomorrow I will buy a NULL modem cable and I'll try to catch the
messages through the serial port.

Taking a look to the stack trace is giving me the impression that my last
backtrace was correct and the reason why this happens is always the same
"invalid operand".

Cristiano
