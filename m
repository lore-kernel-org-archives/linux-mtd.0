Received: from anchor-post-32.mail.demon.net ([194.217.242.90])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AvhWH-0005OZ-GU
	for linux-mtd@lists.infradead.org; Tue, 24 Feb 2004 18:43:01 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Simon Haynes <simon@baydel.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 24 Feb 2004 18:04:50 +0000
References: <4034E8ED.5757.55A2D9@localhost> <6A03D4BC2018@baydel.com>
	<1077645958.7826.599.camel@hades.cambridge.redhat.com>
In-Reply-To: <1077645958.7826.599.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <6A3A7BF261CD@baydel.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Corruption.
Reply-To: simon@baydel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 24 Feb 2004 6:05 pm, David Woodhouse wrote:
> On Tue, 2004-02-24 at 17:05 +0000, Simon Haynes wrote:
> > Would you recommend changing the printk for the "Empty Flash" messages to
> > a different level and using the ramdisk as a permanent solution ?
>
> Changing the printk level for the 'Empty Flash' messages does seem
> appropriate -- or preferably finding a way to eliminate the ones which
> we don't want. Are you mounting the fs read-only before rebooting? If
> not, the occasional CRC failure is acceptable. You get those with an
> unclean restart. It doesn't indicate data loss; it indicates that one
> particular log entry which you were writing _while_ you rebooted was
> lost. That was not data which userspace thought was already on the
> medium.
>
> The problem with mtdblock is interesting. Can you make it BUG() when it
> dirties its cache and put it back to how it was, using mtdblock?

I do remount the filesystem read only as part of a shutdown. I also cat 
/proc/mounts so that I can check it has happened. So the filesystem should be 
clean. After this halt is called. I think this tries to write to utmp. If the 
kernel already has the device open for write will this be allowed ? 

I guess it is strange that the read only mtdblock device prevents write 
access via jffs2. I don't know if the cache in mtdblock is ever being used 
but I can certainly put a BUG() in there.

Cheers

Simon.
