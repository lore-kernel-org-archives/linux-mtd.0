Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15vQ0l-0006pm-00
	for <linux-mtd@lists.infradead.org>; Sun, 21 Oct 2001 22:19:59 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BD2E0CD.C6C5D115@infineon.com> 
References: <3BD2E0CD.C6C5D115@infineon.com>  <3BCD6B27.C96CED7D@infineon.com> <3BCD41F8.BB0CE865@infineon.com> <3BCC4086.CBDC3EBB@infineon.com> <3BCC3CB4.52063E3E@infineon.com> <3BCC3B0A.849925FF@infineon.com> <3BCC26F4.BA8E4BAB@infineon.com> <3BCC1DFD.350FA03D@infineon.com> <9980.1003224488@redhat.com> <20092.1003234022@redhat.com> <23221.1003235197@redhat.com> <2877.1003240501@redhat.com> <3917.1003240846@redhat.com> <6243.1003241813@redhat.com> <5740.1003307695@redhat.com> <12410.1003319705@redhat.com> 
To: amit lubovsky <amit.lubovsky@infineon.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Making partitions with CFI flash 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 21 Oct 2001 22:29:07 +0100
Message-ID: <21502.1003699747@redhat.com>
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

amit.lubovsky@infineon.com said:
> I have also created the nodes, so "ls -l /dev/mtd*" 
>
> root@172.29.134.163:~# ls -l /dev/mtd*
> crw-r--r--    1 root     root      90,   0 Oct 21  2001 /dev/mtd0
> crw-r--r--    1 root     root      90,   1 Oct 21  2001 /dev/mtd1
> crw-r--r--    1 root     root      90,   2 Oct 21  2001 /dev/mtd2
> brw-r--r--    1 root     root      31,   1 Oct 21  2001 /dev/mtdblock1
> root@172.29.134.163:~#
> 
> but I can't erase or copy to the partition  /dev/mtd1 and I get the
> following:
> 
> root@172.29.134.163:~# /usr/sbin/eraseall /dev/mtd1
> /usr/sbin/eraseall: /dev/mtd1: Permission denied

Read Documentation/devices.txt or run the MAKEDEV script so you get the 
correct minor numbers - don't just make them up yourself.

--
dwmw2
