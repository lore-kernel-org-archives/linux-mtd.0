Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D2AnY-0001L5-Iy
	for linux-mtd@lists.infradead.org; Fri, 18 Feb 2005 11:16:10 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20050218160108.GC5926@synertronixx3>
References: <20050218154216.GA5926@synertronixx3>
	<1108741733.13420.20.camel@sauron.oktetlabs.ru>
	<20050218160108.GC5926@synertronixx3>
Content-Type: text/plain
Date: Fri, 18 Feb 2005 19:15:34 +0300
Message-Id: <1108743334.13420.25.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: freeze when mounting fs
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-02-18 at 17:01 +0100, Konstantin Kletschke wrote:
> You mean synchronous logging of syslogd/klogd?
> Busybox's can't.
> It seems adding some scripts to /home into the rootfs breaks things.
> I removed /home before mkfs.jffs2, left the other stuff like it was,
> voily, mounts, runs, works with no error.
> 
> Konsti

I mean via serial line. It is synchronous. In your case it is not,
meaning that first output goes to the circular buffer, then user space
daemons fetch it etc etc. Your system may die before the messages have
been conveyed to syslogd.  
