Received: from www84.your-server.de ([213.133.104.84])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O4I09-0000iB-7S
	for linux-mtd@lists.infradead.org; Tue, 20 Apr 2010 18:16:49 +0000
Subject: Re: [PATCH] Fix a huge latency problem in the MTD CFI and LPDDR
	flash drivers.
From: Stefani Seibold <stefani@seibold.net>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1271623604.7050.0.camel@wall-e.seibold.net>
References: <1271623604.7050.0.camel@wall-e.seibold.net>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Tue, 20 Apr 2010 20:16:31 +0200
Message-ID: <1271787391.16051.4.camel@wall-e.seibold.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: akpm@linux-foundation.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Is the MTD mailing list routed to /dev/null? 

It is very sad that nobody gives my a reply. 

I ask for a merge for the patch, and if there any reason why not, it
would be great to know. Otherwise i can't fix it.

So again, please merge the path for the huge latency problem.

Am Sonntag, den 18.04.2010, 22:46 +0200 schrieb Stefani Seibold:
> From: Stefani Seibold <stefani@seibold.net>
> 
> The use of a memcpy() during a spinlock operation will cause very long
> thread context switch delays if the flash chip bandwidth is low and the
> data to be copied large, because a spinlock will disable preemption.
> 
> For example: A flash with 6,5 MB/s bandwidth will cause under ubifs,
> which request sometimes 128 KB (the flash erase size), a preemption delay of
> 20 milliseconds. High priority threads will not be served during this
> time, regardless whether this threads access the flash or not. This behavior
> breaks real time.
> 
> The patch changes all the use of spin_lock operations for xxxx->mutex
> into mutex operations, which is exact what the name says and means.
> 
> I have checked the code of the drivers and there is no use of atomic
> pathes like interrupt or timers. The mtdoops facility will also not be used
> by this drivers. So it is dave to replace the spin_lock against mutex.
> 
> There is no performance regression since the mutex is normally not
> acquired.
> 
> Changelog:
>  06.03.2010 First release
>  26.03.2010 Fix mutex[1] issue and tested it for compile failure
> 
> Signed-off-by: Stefani Seibold <stefani@seibold.net>
> ---
>  drivers/mtd/chips/cfi_cmdset_0001.c |  131 +++++++++++++++++-----------------
>  drivers/mtd/chips/cfi_cmdset_0002.c |  122 ++++++++++++++++----------------
>  drivers/mtd/chips/cfi_cmdset_0020.c |  136 +++++++++++++++++-----------------
>  drivers/mtd/chips/fwh_lock.h        |    6 +-
>  drivers/mtd/chips/gen_probe.c       |    3 +-
>  drivers/mtd/lpddr/lpddr_cmds.c      |   79 ++++++++++----------
>  include/linux/mtd/flashchip.h       |    4 +-
>  7 files changed, 239 insertions(+), 242 deletions(-)
