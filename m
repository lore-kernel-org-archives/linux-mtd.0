Received: from tomts15-srv.bellnexxia.net ([209.226.175.3])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17fmJD-0004u2-00
	for <linux-mtd@lists.infradead.org>; Fri, 16 Aug 2002 19:58:55 +0100
Date: Fri, 16 Aug 2002 14:58:52 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: jay.s@sohu.com
cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: grub loading problem, for help
In-Reply-To: <6753069.1029470073112.JavaMail.postfix@mailsrv1.mail.sohu.com>
Message-ID: <Pine.LNX.4.44.0208160039180.16312-100000@server.superbt.com>
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

Jay,

On Fri, 16 Aug 2002 jay.s@sohu.com wrote:

> grub>
> 
> 
> I feel lucky to see the prompt, however I cant access the doc anymore( I
> have tried to use "kernel ...." according to that howto), I have
> installed the contents in the doc and also the grub/menu.lst, but
> nothing help. Because I don't know grub much, I don't know what to do
> then.

Does the "root (dc0)" or the "root (dc0,0)" command work?  Can you see the 
content of the menu.lst file by typing "cat /boot/grub/menu.lst"?  I 
always create a symbolic link when preparing the boot partition:

    cd boot
    ln -s . boot

In this way the path /boot/grub/menu.lst will resolve even when /boot is a 
mount point.

Also one has to make sure that the DoC's filesystem can be mounted at all 
(that is, mount -t ext3 /dev/nftla2 /mnt/flash or similar must work).  
It's easy to do mounting probe by booting off the hard disk first.

Ilguiz
