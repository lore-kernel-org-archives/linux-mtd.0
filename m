Received: from anchor-post-32.mail.demon.net ([194.217.242.90])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AwJwt-0003ys-B3
	for linux-mtd@lists.infradead.org; Thu, 26 Feb 2004 11:45:03 +0000
From: "Simon Haynes" <simon@baydel.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 26 Feb 2004 11:08:16 -0000
MIME-Version: 1.0
Message-ID: <403DD3A0.4494.196896@localhost>
In-reply-to: <1077704741.11584.953.camel@imladris.demon.co.uk>
References: <403C6FC3.1941.DDC08@localhost>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Corruption.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 25 Feb 2004 at 10:25, David Woodhouse wrote:

> On Wed, 2004-02-25 at 09:49 +0000, simon@baydel.com wrote:
> > As I do mount read only on shutdown I assume this is corruption ?
> 
> Maybe. I doubt it's _harmful_ but I am very interested.
> 

This has taken some time to produce. I have a 40Mb logfile which thankfully 
compresses to 4Mb. To generate the log I booted the system via the network with 
JFFS2 patched to use /dev/ram MAJOR, but no JFFS2 debug. I erased the SMC and 
made a clean JFFS2 filesystem. I then copied all of my root files. I mounted and 
umounted this a few times and each time I created and deleted a few files. I did not 
get one error.

I then rebooted using a similar kernel with CONFIG_JFFS2_FS_DEBUG=1 and 
passed arguments "root=/dev/ram1 debug".

It took about 6 hours before I could log in. I then halted the system. On the first 
reboot, fortunately, I did get a CRC error but I cannot find where this was previously 
written. The node is 0x000303f0. 

I also observe the Empty flash XXXX ends at XXX. Which do not appear before the 
filesystem is used as rootfs and restarted.

Beyond that I don't really know what I am looking for in the log. I can mail it to you 
personally but as I said it's 4Mb compressed.

Cheers

Simon.
__________________________

Simon Haynes - Baydel 
Phone : 44 (0) 1372 378811
Email : simon@baydel.com
__________________________
