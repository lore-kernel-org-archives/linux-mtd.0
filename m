Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173gIg-0005Rt-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 May 2002 17:52:54 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <15570.48163.648146.185360@zaphod.musenki.com> 
References: <15570.48163.648146.185360@zaphod.musenki.com> 
To: Jim Thompson <jim@musenki.com>
Cc: linux-mtd@lists.infradead.org, xkaspa06@fit.vutbr.cz
Subject: Re: patches to 2.4.18 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 03 May 2002 17:52:47 +0100
Message-ID: <23173.1020444767@redhat.com>
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

jim@musenki.com said:
>  Also, I (like so many others lately), had to comment out the call to
> invalidate_device() in mtdblock.c::mtdblock_release() in order to get
> my root filesystem (jffs2 on mtdblock on Intel Strataflash) to mount.

> I note that the call is still there in the CVS vsion:

Eep. That was removed from CVS long ago, but was added back again. I've now 
removed it again.

>  and we are getting crashes on halt/reboot if we've modified the
> filesystem. 

More details please.

>  Similar questions about jffs2 have been asked:
> 	http://mhonarc.axis.se/jffs-dev/msg01297.html
> With no apparent answer.
> anyone with clue to offer? 

For the MTD drivers, the code in 2.4.19-pre is probably the best option 
unless you need the new features I held back for 2.4.20-pre. For JFFS2, you 
should be using the code from the jffs2-2_4-branch in CVS. I _think_ that's 
all been sent to Marcelo for 2.4.19 though. 

--
dwmw2
