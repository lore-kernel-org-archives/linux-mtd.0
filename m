Received: from softsteprubberfloors.com ([192.220.111.56] helo=rcmenter.iserver.net)
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18fmDF-0001RI-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Feb 2003 19:25:01 +0000
From: Russ Dill <Russ.Dill@asu.edu>
To: leeyang <leeyang@ycig.com>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <001401c2c802$8b31ed30$0200a8c0@ycigrnd.ycig.com>
References: <001401c2c802$8b31ed30$0200a8c0@ycigrnd.ycig.com>
Message-Id: <1044300428.15823.11.camel@timmy>
Mime-Version: 1.0
Date: 03 Feb 2003 12:27:08 -0700
Subject: Re: need suggestion about embedded FS plan
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

> In fact,there is only a little fs need to
> be 'SAVE',like /etc direcory,it take rooms less
> than %1 of all flash size.And the main parts
> /lib,/sbin,/bin...maybe never changed.
> So I have an idea,
> Put main parts of fs(/lib,/sbin....)on Cramfs
> at one of the flash bank.
> Put bootloader,kernel and need-save-fs(/etc) on
> the other flash bank with jffs2 fs.
> 
> Is that possible?Sth ,I am not sure,is if no
> /etc in root fs,Maybe it can not boot up!!!

just make a /linuxrc, linuxrc is a shell script run by the kernel
(init=/linuxrc) that would do stuff like:

#!/bin/sh
mount -t ramfs ramfs /var
mount -t ramfs ramfs /tmp
mkdir /var/run
mkdir /var/lock
mount -t jffs2 /dev/mtd2 /etc
exec /sbin/init



-- 
Russ Dill <Russ.Dill@asu.edu>
