Received: from mail9.messagelabs.com ([194.205.110.133])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 166YtR-0001fK-00
	for <linux-mtd@lists.infradead.org>; Wed, 21 Nov 2001 15:02:29 +0000
Subject: Re: Caching of reads
From: Ian Campbell <icampbell@arcom.co.uk>
To: Linux MTD Mailing List <linux-mtd@lists.infradead.org>
In-Reply-To: <30843.1005925709@redhat.com>
References: <1005925030.25782.27.camel@LinuxDev>  
	<30843.1005925709@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 21 Nov 2001 15:10:30 +0000
Message-Id: <1006355430.17354.8.camel@LinuxDev>
Mime-Version: 1.0
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

> Strange. JFFS2 doesn't do caching - that's supposed to be handle by the 
> Linux VFS/VM. But set CONFIG_JFFS2_FS_DEBUG=1 and 
> echo 9 > /proc/sys/kernel/printk, then see what it's actually being asked 
> to read each time.

Hi,

I've instrumented my kernel a bit and found that the reads are being
caused by calls to jffs2_follow_link (in order to resolve the sym links
for the libraries needed to load sleep)... 

It's been pointed out to me that the jffs list might be a better place
so I'll take this there... 

Thanks,
Ian.
 
-- 
Ian Campbell
Design Engineer

Arcom Control Systems Ltd,
Clifton Road,
Cambridge CB1 7EA
United Kingdom

Tel: +44 (0)1223 411200 ext. 3204
E-Mail: icampbell@arcom.co.uk
Web: http://www.arcomcontrols.com


_____________________________________________________________________
The message in this transmission is sent in confidence for the attention of the addressee only and should not be disclosed to any other party. Unauthorised recipients are requested to preserve this confidentiality. Please advise the sender if the addressee is not resident at the receiving end.

This message has been checked for all viruses by MessageLabs Virus Control Centre. 

Company registered in England No. 1608562.
Registered Office: Unit 8, Clifton Road, Cambridge, CB1 7EA, United Kingdom, Tel: 01223 411200.
