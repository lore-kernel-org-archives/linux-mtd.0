Subject: Re: [PATCH] mtd: Delete final remnants of MTD ioctls from
	fs/compat_ioctl.c
From: David Woodhouse <dwmw2@infradead.org>
To: Kevin Cernekee <kpc.mtd@gmail.com>
Content-Type: text/plain
Date: Fri, 29 May 2009 15:30:12 +0100
Message-Id: <1243607412.19886.169.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, arnd@arndb.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-04-14 at 21:59 -0700, Kevin Cernekee wrote:
> Move all MTD compat_ioctl logic into drivers/mtd/mtdchar.c
> 
> Depends on this patch set:
> 
> http://lkml.org/lkml/2009/4/9/52
> http://lkml.org/lkml/2009/4/9/53
> http://lkml.org/lkml/2009/4/9/54
> http://lkml.org/lkml/2009/4/9/55
> 
> Signed-off-by: Kevin Cernekee <kpc.mtd@gmail.com>
> ---
>  drivers/mtd/mtdchar.c |    3 ++-
>  fs/compat_ioctl.c     |   22 ----------------------

Er, that doesn't move stuff into mtdchar.c. It just deletes it...

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
