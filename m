Received: from [210.8.246.199] (helo=singularity.tronunltd.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dHzs-0000oJ-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Feb 2002 21:40:24 +0000
Date: Wed, 20 Feb 2002 07:50:44 +1000
Message-Id: <200202192150.HAA24884@singularity.tronunltd.com>
To: "Chris Fowler" <cfowler@outpostsentinel.com>
Subject: Re:Kerlen 2.4.13 and ramdisks
From: "Ian" <Relativity@HumanHeuristic.com>
Cc: linux-mtd@lists.infradead.org
Reply-To: "Ian" <Relativity@HumanHeuristic.com>
Content-type: text/plain; charset="us-ascii"
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

If you have loopback support compiled in you can mount it directly through 
the loopback driver, without creating a ramdisk ...

What was the error that mount gave?  You probably only need to specify
the "-o" parameter ... mount doesn't usually detect fancy filesystems ...


  ----- Original Message -----
>From: "Chris Fowler" <cfowler@outpostsentinel.com>
>To: <linux-mtd@lists.infradead.org>
>Subject:  Kerlen 2.4.13 and ramdisks
>Date: Tue, 19 Feb 2002 10:33:33 -0500
>
> You guys might have ran across a ramdisk problem.  I have a feeling that kernel 2.4.13 is 
not respecting my ramdisks.
> 
> 
> dd if=/etc/user.img of=/dev/ram6
> 
> mount /dev/ram6  fails.  
> 
> 
> Is this a problem?
> 
> 
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
