Received: from anchor-post-30.mail.demon.net ([194.217.242.88])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BpSFd-0003ua-MA
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2004 09:44:18 -0400
From: Andy Hawkins <a.hawkins@cabletime.com>
To: tglx@linutronix.de
In-Reply-To: <1090930297.20889.93.camel@thomas.tec.linutronix.de>
References: <1090923928.2237.6.camel@adh>
	<1090930297.20889.93.camel@thomas.tec.linutronix.de>
Content-Type: text/plain
Message-Id: <1090935846.17545.3.camel@adh>
Mime-Version: 1.0
Date: 27 Jul 2004 14:44:06 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Large JFFS2 filesystem problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, 2004-07-27 at 13:11, Thomas Gleixner wrote:
> It should be easy to fix the scan code. All we have to do is to reduce
> the chunk size which we read in one go. The functionality to do so is
> already there and its simple to make it work
> 
> Can you try the following patch ?
> Please let me know if it works.

[snip patch]

Apologies...I didn't read the code fully enough to realise that it would
use that block size in a loop to read the entire flash. I changed the
'kmalloc' to a 'vmalloc' and this appeared to work. Your patch also has
the desired effect.

> > Previously, someone recommended waiting for YAFFS2, as this is likely to
> > be more efficient with large filesystems. Does anyone have any idea as
> > to when this is likely to be available?
> 
> Ask on the YAFFS mailing list.

Ok, I'll do this.

Thanks.

Andy
