Received: from marasystems.com ([213.150.153.194] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18foHM-0002CJ-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Feb 2003 21:37:24 +0000
Date: Mon, 3 Feb 2003 22:37:03 +0100 (CET)
From: Henrik Nordstrom <hno@marasystems.com>
To: Russ Dill <Russ.Dill@asu.edu>
cc: leeyang <leeyang@ycig.com>, <linux-mtd@lists.infradead.org>
In-Reply-To: <1044300428.15823.11.camel@timmy>
Message-ID: <Pine.LNX.4.44.0302032233510.22969-100000@filer.marasystems.com>
MIME-Version: 1.0
Subject: Re: need suggestion about embedded FS plan
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

No need for a linuxrc for such stuff.. simply have it as a sysinit script 
in your inittab.

If the mounting of etc makes that you will have a "better" inittab than in 
the underlying root just do a "telinit q" after mounting the real etc.

Regards
Henrik


On 3 Feb 2003, Russ Dill wrote:

> 
> > In fact,there is only a little fs need to
> > be 'SAVE',like /etc direcory,it take rooms less
> > than %1 of all flash size.And the main parts
> > /lib,/sbin,/bin...maybe never changed.
> > So I have an idea,
> > Put main parts of fs(/lib,/sbin....)on Cramfs
> > at one of the flash bank.
> > Put bootloader,kernel and need-save-fs(/etc) on
> > the other flash bank with jffs2 fs.
> > 
> > Is that possible?Sth ,I am not sure,is if no
> > /etc in root fs,Maybe it can not boot up!!!
> 
> just make a /linuxrc, linuxrc is a shell script run by the kernel
> (init=/linuxrc) that would do stuff like:
> 
> #!/bin/sh
> mount -t ramfs ramfs /var
> mount -t ramfs ramfs /tmp
> mkdir /var/run
> mkdir /var/lock
> mount -t jffs2 /dev/mtd2 /etc
> exec /sbin/init
> 
> 
> 
> 
