Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17c50y-0006VX-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 15:08:49 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H0F0093YDXTXO@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Tue, 06 Aug 2002 16:08:18 +0200 (MEST)
Date: Tue, 06 Aug 2002 16:08:19 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: No free space left for GC(test2 with log)
In-reply-to: <000701c23d49$aefcb860$1b0448c0@gv.com.tw>
To: ?? <kevin@gv.com.tw>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 ? ?? <djh@gv.com.tw>, cms@gv.com.tw, jiunrong <jiunrong@gv.com.tw>
Message-id: <1028642900.19448.117.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
References: <010801c23d3e$7d0f0c00$1b0448c0@gv.com.tw>
 <003501c23d10$5f6c4f60$1b0448c0@gv.com.tw>
 <01c201c23c69$7995faa0$1b0448c0@gv.com.tw>
 <00bc01c239cf$4ef3a8c0$1b0448c0@gv.com.tw>
 <013d01c2388f$94c655a0$1b0448c0@gv.com.tw>
 <0H04006C5M7GUI@smtp-out.bhp.t-online.de>
 <00f801c2390a$d956dd40$1b0448c0@gv.com.tw>
 <0H05001Y6RM950@smtp-out.bhp.t-online.de>
 <001001c23957$3a290520$1b0448c0@gv.com.tw> <28541.1028541296@redhat.com>
 <31970.1028543113@redhat.com> <000701c23cfe$a1542040$1b0448c0@gv.com.tw>
 <31481.1028622389@redhat.com> <31830.1028636815@redhat.com>
 <000701c23d49$aefcb860$1b0448c0@gv.com.tw>
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

On Tue, 2002-08-06 at 15:03, ?? wrote:
> (console log of evb241x:)
> 
> # mkdir aaa
> 
> # df
> Filesystem           1k-blocks      Used Available Use% Mounted on
> /dev/mtdblock1            6904      1612      5292  23% /
> /dev/ram1                 1009        17       992   2% /var
> 192.72.4.43:/home/test/mips   4134900    328600   3596252   8% /mnt
> 
> (/mnt is a mounted nfs directory on pc)
> 
> # cp /mnt/* /aaa/
> jffs2_g_c_deletion_dirent(): Short read (40 not 12) reading from obsolete
> node at 00633ae0
> jffs2_g_c_deletion_dirent(): Short read (40 not 12) reading from obsolete
> node at 00665b68
We really need a complete log from mount to this point. Could you please
provide one ?

compile kernel with CONFIG_JFFS2_DEBUG = 1 and serial console

boot
# echo 9 >/proc/sys/kernel/printk
Switch on logging on your terminal program
# mount /dev/mtdblockx
# mkdir
# cp
Save logfile and compress it 
Put it anywhere for ftp access, if possible, else send it to me and
David, not to the list

-- 
Thomas 
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
