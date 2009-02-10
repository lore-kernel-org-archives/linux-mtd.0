Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LWpWo-0000ox-FZ
	for linux-mtd@lists.infradead.org; Tue, 10 Feb 2009 10:07:45 +0000
Subject: Re: [RFC / PATCH] ubiformat: make it work on mtd parts > 2GiB
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
In-Reply-To: <20090210095614.GA1995@www.tglx.de>
References: <20090210095614.GA1995@www.tglx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 10 Feb 2009 12:06:56 +0200
Message-Id: <1234260416.17790.109.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-02-10 at 10:56 +0100, Sebastian Andrzej Siewior wrote:
> I have here a mtd part which is 3 GiB with a flash page size of 256KiB.
> The 2GiB limit is at erase block 8192. In mtd_is_bad() the computation
> for the MEMGETBADBLOCK ioctl() looks like the following:
> 
> | seek = eb * mtd->eb_size;
> 
> with both eb and mtd->eb_size being a signed int results in seek being a
> signed result. Therefore I changed the type from signed to unsigned int.

If you make "seek" to be 64 bit, and cast one of the multipliers to
off_t, you should be fine.

> The _FILE_OFFSET_BITS=64 define is required to switch off_t from 32bit
> to 64bit an 32bit systems. This is required in order to keep using
> lseek() as lseek64 on 32bit system. Without this change lseek() in
> mtd_read() is called with a 32bit value with most significat bit set and
> the kernel performs a sign extension for the 64bit value which is used
> in the mtd layer.
> 
> The last change also changes the size of the parameter which is passed
> to the MEMGETBADBLOCK ioctl() from 32 to 64bit. The counter part in
> kernel is also defined as loff_t which is of type __kernel_loff_t and
> this is "long long". So this must have been broken for a while unless I
> missed something.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  common.mk                            |    2 +-
>  ubi-utils/new-utils/include/libmtd.h |   10 ++++++----
>  ubi-utils/new-utils/src/libmtd.c     |   20 +++++++++++---------
>  ubi-utils/new-utils/src/libscan.c    |    5 +++--
>  ubi-utils/new-utils/src/ubiformat.c  |    9 ++++++---
>  5 files changed, 27 insertions(+), 19 deletions(-)
> 
> diff --git a/common.mk b/common.mk
> index 77d28bf..65fc1cc 100644
> --- a/common.mk
> +++ b/common.mk
> @@ -2,7 +2,7 @@ CC := $(CROSS)gcc
>  AR := $(CROSS)ar
>  RANLIB := $(CROSS)ranlib
>  CFLAGS ?= -O2 -g
> -CFLAGS += -Wall -Wwrite-strings -W
> +CFLAGS += -Wall -Wwrite-strings -W -D_FILE_OFFSET_BITS=64
>  
>  DESTDIR ?= /usr/local
>  PREFIX=/usr
> diff --git a/ubi-utils/new-utils/include/libmtd.h b/ubi-utils/new-utils/include/libmtd.h
> index d3c6a63..94ccd45 100644
> --- a/ubi-utils/new-utils/include/libmtd.h
> +++ b/ubi-utils/new-utils/include/libmtd.h
> @@ -61,10 +61,12 @@ struct mtd_info
>  };
>  
>  int mtd_get_info(const char *node, struct mtd_info *mtd);
> -int mtd_erase(const struct mtd_info *mtd, int eb);
> -int mtd_is_bad(const struct mtd_info *mtd, int eb);
> -int mtd_read(const struct mtd_info *mtd, int eb, int offs, void *buf, int len);
> -int mtd_write(const struct mtd_info *mtd, int eb, int offs, void *buf, int len);
> +int mtd_erase(const struct mtd_info *mtd, unsigned int eb);
> +int mtd_is_bad(const struct mtd_info *mtd, unsigned int eb);
> +int mtd_read(const struct mtd_info *mtd, unsigned int eb, unsigned int offs,
> +		void *buf, int len);
> +int mtd_write(const struct mtd_info *mtd, unsigned int eb, unsigned int offs,
> +		void *buf, int len);

I do not think you need to make eraseblock number and offset to be
unsigned. In fact, I'd like them to be signed, because this is the same
we have in the kernel (in UBI/UBIFS), and I'd like to be more or less
consistent.

Your patch will be twice as short without this change, right?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
