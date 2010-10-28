Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PBUS4-0003lt-No
	for linux-mtd@lists.infradead.org; Thu, 28 Oct 2010 15:31:41 +0000
In-Reply-To: <1288276748.1538.58.camel@macbook.infradead.org>
References: <OF2C2A2D93.9DE54A3F-ONC12577CA.004EC5B1-C12577CA.004F2498@transmode.se>
	<1288276748.1538.58.camel@macbook.infradead.org>
Subject: Re: Preventing FS full
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <OF3909837A.3650BEA2-ONC12577CA.0054F770-C12577CA.00554ADB@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 28 Oct 2010 17:31:37 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse <dwmw2@infradead.org> wrote on 2010/10/28 16:39:08:
>
> On Thu, 2010-10-28 at 16:24 +0200, Joakim Tjernlund wrote:
> > Is there any way to temporarily lower the FS full limit(preferably on
> > a process basis) on JFFS2?
> >
> > I want to safeguard the OS from FS full due to some process filling up
> > the disk.
>
> The thresholds are in the resv_blocks_* variables and should be
> relatively easy to tweak. I've toyed with the idea of exposing them in
> sysfs. Tweaking them on a per-process basis is slightly less trivial but
> shouldn't be that hard... you could add a certain number if the process
> has CAP_SYS_RESOURCE or something.

Will have a look.

>
> Although it should *never* be possible to actually fill the space.

hmm, don't quite get that. Isn't it possible to write until the FS is full.
Surley you must at some pint return ENOSPC to user space and then you
cannot write more files. or ...?

       Jocke
