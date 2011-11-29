Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RVWCH-0006SI-4y
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2011 22:30:45 +0000
Received: by lagu2 with SMTP id u2so1457731lag.36
 for <linux-mtd@lists.infradead.org>; Tue, 29 Nov 2011 14:30:39 -0800 (PST)
Subject: Re: UBIFS Corruption
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Reginald Perrin <reggyperrin@yahoo.com>
Date: Wed, 30 Nov 2011 00:30:35 +0200
In-Reply-To: <1322510657.7380.YahooMailNeo@web114602.mail.gq1.yahoo.com>
References: <1310130765.68852.YahooMailRC@web114617.mail.gq1.yahoo.com>
 <1310988807.20738.44.camel@sauron>
 <1311707851.83484.YahooMailRC@web114602.mail.gq1.yahoo.com>
 <1313411391.2583.22.camel@sauron>
 <1322510657.7380.YahooMailNeo@web114602.mail.gq1.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1322605837.2150.32.camel@koala>
Mime-Version: 1.0
Cc: MTD Mailing List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-11-28 at 12:04 -0800, Reginald Perrin wrote:
> > 
> 
> > There are no interesting messages:
> > 
> > 1. You enabled all UBIFS debugging messages which are too verbose and
> > not needed. Do not enable them because they "push out" the interesting
> > diagnostic messages from the kernel printk ring buffer.
> > 
> > 2. And it is strange that the last messages are about the commit and not
> > about mount failure - are you sure that you typed dmesg right after the
> > UBIFS mount failure without rebooting ?
> > 
> > -- 
> > Best Regards,
> > Artem Bityutskiy
> > 
> > 
> 
> 
> Hi Artem,
> 
> Whatever is causing this, it seems to be increasing in frequency (or
> we are getting better at inadvertently causing it).

I do not remember - did I ask you to validate your flash with mtd tests?
Please do - it is useful.

> I now have several units in this state, and have tried to change the
> log level to gather more information.  Since the ubifs volume I need
> to mount isn't the root-file-system, I have the luxury of being able
> to create test kernels, flash them, and boot them into the system, at
> which point they try and mount the corrupted partition.
> 
> Below, you can see where I tried to mount this partition after booting
> (I discarded all old messages, so this is just the output of
> attempting to mount this volume).  
> 
> NOTE:  My #1 priority is figuring out how to recover from this -- when
> this happens, we're actually bricked, and can't recover (since all the
> key recovery programs are actually on this volume that can't mount).  
> 
> What else can I do to get more information to you to assist?
> 
> TIA
> RP
> 
> root:/> rm /var/log/messages 
> root:/> mount -t ubifs ubi1:home /home
> mount: mounting ubi1:home on /home failed: Structure needs cleaning
> root:/> cat /var/log/messages 

> Dec 31 16:01:51 kernel: [  111.400000] UBIFS DBG (pid 524): ubifs_getxattr: xattr 'security.capability', ino 319 ('busybox'), buf size 20
> Dec 31 16:01:51 kernel: [  111.404000] UBIFS DBG (pid 424): do_readpage: ino 69, pg 0, i_size 9, flags 0x1
> Dec 31 16:01:51 kernel: [  111.444000] UBIFS DBG (pid 524): do_readpage: ino 319, pg 0, i_size 318888, flags 0x1
> Dec 31 16:01:51 kernel: [  111.448000] UBIFS DBG (pid 524): do_readpage: ino 133, pg 0, i_size 20396, flags 0x1
> Dec 31 16:01:51 kernel: [  111.452000] UBIFS DBG (pid 524): do_readpage: ino 319, pg 74, i_size 318888, flags 0x1
> Dec 31 16:01:51 kernel: [  111.456000] UBIFS DBG (pid 524): do_readpage: ino 319, pg 75, i_size 318888, flags 0x1
> Dec 31 16:01:51 kernel: [  111.460000] UBIFS DBG (pid 524): populate_page: ino 319, pg 76, i_size 318888, flags 0x1
> Dec 31 16:01:51 kernel: [  111.460000] UBIFS DBG (pid 524): populate_page: ino 319, pg 77, i_size 318888, flags 0x1
> Dec 31 16:01:51 kernel: [  111.460000] UBIFS DBG (pid 524): do_readpage: ino 133, pg 4, i_size 20396, flags 0x1
> Dec 31 16:01:51 kernel: [  111.464000] UBIFS DBG (pid 524): do_readpage: ino 107, pg 0, i_size 2083, flags 0x1
> Dec 31 16:01:51 kernel: [  111.468000] UBIFS DBG (pid 524): do_readpage: ino 134, pg 0, i_size 240184, flags 0x1
> Dec 31 16:01:51 kernel: [  111.472000] UBIFS DBG (pid 524): do_readpage: ino 134, pg 56, i_size 240184, flags 0x1
> Dec 31 16:01:51 kernel: [  111.472000] UBIFS DBG (pid 524): do_readpage: ino 134, pg 57, i_size 240184, flags 0x1
> Dec 31 16:01:51 kernel: [  111.476000] UBIFS DBG (pid 524): populate_page: ino 134, pg 58, i_size 240184, flags 0x1
> Dec 31 16:01:51 kernel: [  111.988000] UBIFS DBG (pid 405): ubifs_readdir: dir ino 1, f_pos 0x0
> Dec 31 16:01:51 kernel: [  111.988000] UBIFS DBG (pid 405): ubifs_readdir: feed 'bin', ino 208, new f_pos 0x23605a
> Dec 31 16:01:51 kernel: [  111.988000] UBIFS DBG (pid 405): ubifs_readdir: feed 'dev', ino 384, new f_pos 0x23ee05
> Dec 31 16:01:51 kernel: [  111.992000] UBIFS DBG (pid 405): ubifs_readdir: feed 'etc', ino 65, new f_pos 0x24a603
> Dec 31 16:01:52 kernel: [  112.012000] UBIFS DBG (pid 405): ubifs_readdir: feed 'lib', ino 124, new f_pos 0x2697fa
> Dec 31 16:01:52 kernel: [  112.012000] UBIFS DBG (pid 405): ubifs_readdir: feed 'opt', ino 391, new f_pos 0x27d35e
> Dec 31 16:01:52 kernel: [  112.012000] UBIFS DBG (pid 405): ubifs_readdir: feed 'tmp', ino 122, new f_pos 0x295e98
> Dec 31 16:01:52 kernel: [  112.012000] UBIFS DBG (pid 405): ubifs_readdir: feed 'sys', ino 379, new f_pos 0x2968b1
> Dec 31 16:01:52 kernel: [  112.012000] UBIFS DBG (pid 405): ubifs_readdir: feed 'var', ino 380, new f_pos 0x29ab98
> Dec 31 16:01:52 kernel: [  112.020000] UBIFS DBG (pid 405): ubifs_readdir: feed 'usr', ino 390, new f_pos 0x29e101
> Dec 31 16:01:52 kernel: [  112.020000] UBIFS DBG (pid 405): ubifs_readdir: feed 'logo.565', ino 378, new f_pos 0x1428f67
> Dec 31 16:01:52 kernel: [  112.020000] UBIFS DBG (pid 405): ubifs_readdir: feed 'home', ino 389, new f_pos 0x19cc780
> Dec 31 16:01:52 kernel: [  112.020000] UBIFS DBG (pid 405): ubifs_readdir: feed 'proc', ino 123, new f_pos 0x1baa5b4
> Dec 31 16:01:52 kernel: [  112.020000] UBIFS DBG (pid 405): ubifs_readdir: feed 'sbin', ino 207, new f_pos 0x1c000e1
> Dec 31 16:01:52 kernel: [  112.028000] UBIFS DBG (pid 405): ubifs_readdir: feed 'root', ino 373, new f_pos 0x1c0d8cc
> Dec 31 16:01:52 kernel: [  112.028000] UBIFS DBG (pid 405): ubifs_readdir: dir ino 1, f_pos 0x2
> Dec 31 16:01:52 kernel: [  112.028000] UBIFS DBG (pid 525): ubifs_getxattr: xattr 'security.capability', ino 319 ('busybox'), buf size 20
> Dec 31 16:01:53 kernel: [  113.088000] UBIFS DBG (pid 526): ubifs_getxattr: xattr 'security.capability', ino 319 ('busybox'), buf size 20
> Dec 31 16:01:53 kernel: [  113.120000] UBIFS DBG (pid 526): ubifs_get_sb: name ubi1:home, flags 0x8000
> Dec 31 16:01:53 kernel: [  113.120000] UBIFS DBG (pid 526): ubifs_get_sb: opened ubi1_0

You enabled all the debugging - there is too much of it so it does not
fit your ring buffer. Did you increase it? Try making it larger. I do
not know how much RAM you have, but to make it 64MiB add this to your
kernel boot parameters:

log_buf_len=64M

Also add

ignore_loglevel 

to see all messages in the console.

I suggested you to disable debugging messages altogether, though, like
it says here in item 3:

http://linux-mtd.infradead.org/faq/ubifs.html#L_how_send_bugreport

> Dec 31 16:01:53 kernel: [  113.120000] PM: Adding info for No Bus:ubifs_1_0
> Dec 31 16:01:53 kernel: [  113.120000] UBIFS DBG (pid 527): ubifs_getxattr: xattr 'security.capability', ino 319 ('busybox'), buf size 20
> Dec 31 16:01:53 kernel: [  113.132000] UBIFS DBG (pid 528): ubifs_bg_thread: background thread "ubifs_bgt1_0" started, PID 528
> Dec 31 16:01:53 kernel: [  113.192000] UBIFS DBG (pid 527): do_readpage: ino 68, pg 0, i_size 268, flags 0x1


> Dec 31 16:01:53 kernel: [  113.352000] UBIFS: recovery needed
> Dec 31 16:01:54 kernel: ffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................

This line seem to be corrupted - no time-stamp. There is missing
information before "Recovery needed and the dump, I think.
