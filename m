Received: from moutng.kundenserver.de ([212.227.17.8])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RA15d-00025Y-AH
	for linux-mtd@lists.infradead.org; Sat, 01 Oct 2011 15:02:58 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH V4] mtd: Add DiskOnChip G3 support
Date: Sat, 01 Oct 2011 17:02:10 +0200
Message-ID: <2027446.JdsYbAItg0@wuerfel>
In-Reply-To: <87y5x4hpkz.fsf@free.fr>
References: <1316633266-21312-1-git-send-email-robert.jarzmik@free.fr>
	<201109281445.47715.arnd@arndb.de> <87y5x4hpkz.fsf@free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 01 October 2011 14:19:08 Robert Jarzmik wrote:
> Arnd Bergmann <arnd@arndb.de> writes:
> 
> > I generally recommend removing debug messages like this entirely from
> > production code. If you need them on production systems, that is an indication
> > that the code quality is not good enough.
> Perhaps.
> But when you create a driver without any specification, and you release it to
> the communauty, there will be unmet behaviours. So, when someone will ask me
> "why in my board XXX my docg3 can't read data ?" how can I improve the driver
> without any traces ?

In my experience, the kind of debugging data you need for analysing a problem
on someone else's system is not just a trace of the commands you send to
a device but more complicated to get, so you are dependent on a clueful
bug reporter anyway.

If you have successfully debugged a remote problem just by looking at a dump,
then you should certainly leave the code in there.

> > Or you could turn the entire tracing into trace events and do the parsing
> > in user space, which seems appropriate if you frequently need to trace
> > these.
> This looks much much better. I'll have a peek into that, as only (io_address,
> read/write, width, value) could be dumped, and userland application could
> translate it into sequence/nop/flashcontrol ... etc ...

Right, that was the idea.

	Arnd
