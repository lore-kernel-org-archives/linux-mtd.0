Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Shfc-000697-00
	for <linux-mtd@lists.infradead.org>; Mon, 21 Jan 2002 16:51:44 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200201211611.g0LGBPv22298@uk-proclin7.altera.com> 
References: <200201211611.g0LGBPv22298@uk-proclin7.altera.com> 
To: Clive Davies <cdavies@altera.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] kdev_t updates 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 21 Jan 2002 17:02:31 +0000
Message-ID: <21414.1011632551@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

cdavies@altera.com said:
>  The type definition of kdev_t has changed in 2.5.2. This patch
> updates  a couple of files to reflect this. If its Ok, then I'll check
> it in.

Can you couple it with the appropriate magic in include/linux/compatmac.h 
and make sure that's included from the affected files?

Something like this ought to do it:

#if LINUX_KERNEL_CODE < KERNEL_VERSION(2,5,1)
#define minor(x) MINOR(x)
#define major(x) MAJOR(x)
#define NODEV 0
#else
#define to_kdev_t(x) (x)
#endif

--
dwmw2
