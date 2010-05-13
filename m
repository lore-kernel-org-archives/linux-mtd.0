Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OCVP1-0007TK-9S
	for linux-mtd@lists.infradead.org; Thu, 13 May 2010 10:12:28 +0000
Subject: Re: [PATCH v5 2/3] mtd-utils: support >4GiB devices
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <5e05b5a05a30b2dc2035b87a60bb82f3137174cb@localhost.localdomain>
References: <cd4bcbb843643dc463d2a2853766bcf57c23f546@localhost.localdomain>
	<5e05b5a05a30b2dc2035b87a60bb82f3137174cb@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 13 May 2010 13:11:11 +0300
Message-ID: <1273745471.22706.163.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, jwboyer@gmail.com, saeed.bishara@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-05-12 at 19:23 -0700, Kevin Cernekee wrote:
> This patch updates the following programs to handle >4GiB flash devices:
> 
> flash_erase
> flash_eraseall
> flashcp
> mtd_debug
> nanddump
> nandtest
> nandwrite
> 
> It also lays the groundwork for >4GiB support in:
> 
> flash_lock
> flash_unlock
> 
> The latter two utilities would require MEMLOCK64 / MEMUNLOCK64
> functionality on the kernel side (currently unimplemented).  For now
> they still use MEMLOCK / MEMUNLOCK and cannot access blocks above 4GiB.
> 
> By default, the compatibility layer (mtd_ioctl.c) will attempt to use
> the MTD sysfs interface and MEM*64 ioctls in 2.6.31+.  It will fall back
> to the older ABI if it determines that the running kernel does not
> support the new calls.
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> ---
>  Makefile              |   19 +++-
>  flash_erase.c         |   59 ++++++----
>  flash_eraseall.c      |   31 +++--
>  flash_lock.c          |   21 ++--
>  flash_unlock.c        |    9 +-
>  flashcp.c             |   22 ++--
>  mtd_debug.c           |  114 ++++++++++---------
>  mtd_ioctl.c           |  307 +++++++++++++++++++++++++++++++++++++++++++++++++
>  mtd_ioctl.h           |   39 ++++++
>  nanddump.c            |   23 +++--
>  nandtest.c            |   35 +++---
>  nandwrite.c           |   60 +++++-----
>  13 files changed, 570 insertions(+), 171 deletions(-)
>  create mode 100644 mtd_ioctl.c
>  create mode 100644 mtd_ioctl.h

Any chance to extend and use mtd-utils/ubi-utils/src/libmtd.c instead of
mtd_ioctl.c?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
