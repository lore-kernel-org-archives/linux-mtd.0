Received: from [192.109.80.15] (helo=turing.logware.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15cpxM-0000Px-00
	for <linux-mtd@lists.infradead.org>; Fri, 31 Aug 2001 16:11:40 +0100
Received: from exchange.ten.logware.de (exchange.ten.logware.de [10.220.10.26])
	by turing.logware.de (8.9.3/8.9.3) with ESMTP id RAA02367
	for <linux-mtd@lists.infradead.org>; Fri, 31 Aug 2001 17:47:13 +0200
Message-ID: <71B37AB6576DD211AB7E008048CD4D319FA652@exchange.ten.logware.de>
From: Veikko Werner <veikko.werner@logware.de>
To: linux-mtd@lists.infradead.org
Subject: RE: DOC2000 Boot de-ja-vue - add...
Date: Fri, 31 Aug 2001 17:17:41 +0200
MIME-Version: 1.0
Content-Type: text/plain
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

Hhm...
that's what I red also somewhere on the internet.
but when I boot from HD and mount /dev/nftla1 I have /sbin/init and /bin/sh
-> bash
in /etc/fstab I have a line "/dev/nftla1 / ext2 defaults 1 1"
in lilo.conf : root=/dev/nftla1

conclusion: 
MTD and NFTL load successfully
kernels says "root mounted" so I should must have the files I have when I
mount it from HD
but that seems to be not right
maybe access to the DOC is to slow? Can I pass some arguments for slowing
down ?

Veikko

> -----Original Message-----
> From:	martin.kula@deltaes.cz [SMTP:martin.kula@deltaes.cz]
> Sent:	Friday, August 31, 2001 4:24 PM
> To:	linux-mtd@lists.infradead.org
> Subject:	RE: DOC2000 Boot de-ja-vue - add...
> 
> 
> Hi
> 
> 
> See last 8 lines from init/main.c (in kernel source directories).
> ...........................
>     if (execute_command)
>         execve(execute_command,argv_init,envp_init);
>     execve("/sbin/init",argv_init,envp_init);
>     execve("/etc/init",argv_init,envp_init);
>     execve("/bin/init",argv_init,envp_init);
>     execve("/bin/sh",argv_init,envp_init);
>     panic("No init found.  Try passing init= option to kernel.");
> }
> ............................
> Kernel trying executed above executable in order:
> 1. init=... parameter
> 2. /sbin/init
> 3. /etc/init
> 4. /bin/init
> 5. /bin/sh
> 
> if all failed it print the message 'No init found. Try pass......'
> 
> M.
> 
> On Fri, 31 Aug 2001 martin.kula@deltaes.cz wrote:
> 
> > Hi
> > Read last line in the syslog (kernel) messages.
> > .... No init found ......
> > Kernel can't found init executable ... default /sbin/init ... on root
> > volume.
> > Have you got it there? Or you can pass init=some_executable into your
> > kernel before bootting (by grub or lilo), where some_executabe can be
> > /bin/sh for example.
> > 
> > Martin
> > 
> > 
> > On Fri, 31 Aug 2001, Veikko Werner wrote:
> > 
> > > I have also no idea but the same problem. It seems to me that all the
> > > readme's doesn't work.
> > > There must be some clue, but what?
> > > I would appreciate some help.
> > > 
> > > Veikko
> > > 
> > > > -----Original Message-----
> > > > From:	Bill [SMTP:wrs122@psu.edu]
> > > > Sent:	Friday, August 31, 2001 5:00 AM
> > > > To:	linux-mtd@lists.infradead.org
> > > > Subject:	DOC2000 Boot de-ja-vue
> > > > 
> > > > Well, DOC2000 seems happy now kinda. I think my problem is with
> Linux.
> > > > Here 
> > > > is the end of my boot screen:
> > > > 
> > > > blah... blah... blah...
> > > > NFTL driver: nftlcore.c $Revision: 1.78 $, nftlmount.c $Revision:
> 1.21 $
> > > > Cannot calculate an NFTL geometry to match size of 0x46840
> > > > Using C:1002 H:16 S:18 (== 0x46740 sects)
> > > >  nftla: nftla1
> > > > NET4: Linux TCP/IP 1.0 for NET4.0
> > > > IP Protocols: ICMP, UDP, TCP, IGMP
> > > > IP: routing cache hash table of 2048 buckets, 16 Kbytes
> > > > TCP: Hash tables configured (established 16384 bind 16384)
> > > > NET4: Unix domain sockets 1.0/SMP for Linux NET4.0
> > > > VFS: Mounted root (ext2 filesystem) readonly.
> > > > Freeing unused kernel memory 204k freed
> > > > Kernel panic: No init found. Try passing init= option to kernel.
> > > > 
> > > > It mounts the device fine but then dies. Any ideas?
> > > > 
> > > > -Bill
> > > > 
> > 
> > 
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
