Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D2Ak0-00019x-DD
	for linux-mtd@lists.infradead.org; Fri, 18 Feb 2005 11:12:29 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20050218160108.GC5926@synertronixx3>
References: <20050218154216.GA5926@synertronixx3>
	<1108741733.13420.20.camel@sauron.oktetlabs.ru>
	<20050218160108.GC5926@synertronixx3>
Content-Type: text/plain
Date: Fri, 18 Feb 2005 17:12:26 +0100
Message-Id: <1108743146.24721.297.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: freeze when mounting fs
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-02-18 at 17:01 +0100, Konstantin Kletschke wrote:
> Am 2005-02-18 18:48 +0300 schrieb Artem B. Bityuckiy:
> > On Fri, 2005-02-18 at 16:42 +0100, Konstantin Kletschke wrote:
> > > But got no info.
> > Because you just mesages. You need to use synchronous output to capture
> > messages. 
> 
> You mean synchronous logging of syslogd/klogd?

No, serial log without syslogd/klogd 

> Busybox's can't.
> It seems adding some scripts to /home into the rootfs breaks things.
> I removed /home before mkfs.jffs2, left the other stuff like it was,
> voily, mounts, runs, works with no error.

Hmm, can you provide such a broken image and the serial log from mount ?

tglx
