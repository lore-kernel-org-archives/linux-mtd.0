Received: from [195.144.108.44] (helo=mail.deltaes.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15cp6o-0000KG-00
	for <linux-mtd@lists.infradead.org>; Fri, 31 Aug 2001 15:17:23 +0100
Received: from lxserver.deltes.cz (IDENT:martin@lxserver.deltes.cz [192.168.5.5])
	by mail.deltaes.com (8.9.3/8.9.3) with ESMTP id OAA16236
	for <linux-mtd@lists.infradead.org>; Fri, 31 Aug 2001 14:12:39 +0200
Date: Fri, 31 Aug 2001 16:24:07 +0200 (CEST)
From: martin.kula@deltaes.cz
Reply-To: martin.kula@deltaes.cz
To: linux-mtd@lists.infradead.org
Subject: RE: DOC2000 Boot de-ja-vue - add...
In-Reply-To: <Pine.LNX.4.21.0108311539490.1786-100000@lxserver.deltes.cz>
Message-ID: <Pine.LNX.4.21.0108311615220.1786-100000@lxserver.deltes.cz>
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

Hi


See last 8 lines from init/main.c (in kernel source directories).
...........................
    if (execute_command)
        execve(execute_command,argv_init,envp_init);
    execve("/sbin/init",argv_init,envp_init);
    execve("/etc/init",argv_init,envp_init);
    execve("/bin/init",argv_init,envp_init);
    execve("/bin/sh",argv_init,envp_init);
    panic("No init found.  Try passing init= option to kernel.");
}
............................
Kernel trying executed above executable in order:
1. init=... parameter
2. /sbin/init
3. /etc/init
4. /bin/init
5. /bin/sh

if all failed it print the message 'No init found. Try pass......'

M.

On Fri, 31 Aug 2001 martin.kula@deltaes.cz wrote:

> Hi
> Read last line in the syslog (kernel) messages.
> .... No init found ......
> Kernel can't found init executable ... default /sbin/init ... on root
> volume.
> Have you got it there? Or you can pass init=some_executable into your
> kernel before bootting (by grub or lilo), where some_executabe can be
> /bin/sh for example.
> 
> Martin
> 
> 
> On Fri, 31 Aug 2001, Veikko Werner wrote:
> 
> > I have also no idea but the same problem. It seems to me that all the
> > readme's doesn't work.
> > There must be some clue, but what?
> > I would appreciate some help.
> > 
> > Veikko
> > 
> > > -----Original Message-----
> > > From:	Bill [SMTP:wrs122@psu.edu]
> > > Sent:	Friday, August 31, 2001 5:00 AM
> > > To:	linux-mtd@lists.infradead.org
> > > Subject:	DOC2000 Boot de-ja-vue
> > > 
> > > Well, DOC2000 seems happy now kinda. I think my problem is with Linux.
> > > Here 
> > > is the end of my boot screen:
> > > 
> > > blah... blah... blah...
> > > NFTL driver: nftlcore.c $Revision: 1.78 $, nftlmount.c $Revision: 1.21 $
> > > Cannot calculate an NFTL geometry to match size of 0x46840
> > > Using C:1002 H:16 S:18 (== 0x46740 sects)
> > >  nftla: nftla1
> > > NET4: Linux TCP/IP 1.0 for NET4.0
> > > IP Protocols: ICMP, UDP, TCP, IGMP
> > > IP: routing cache hash table of 2048 buckets, 16 Kbytes
> > > TCP: Hash tables configured (established 16384 bind 16384)
> > > NET4: Unix domain sockets 1.0/SMP for Linux NET4.0
> > > VFS: Mounted root (ext2 filesystem) readonly.
> > > Freeing unused kernel memory 204k freed
> > > Kernel panic: No init found. Try passing init= option to kernel.
> > > 
> > > It mounts the device fine but then dies. Any ideas?
> > > 
> > > -Bill
> > > 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
