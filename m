Received: from www.altera.com ([66.35.227.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16SxVw-0007EJ-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jan 2002 09:46:48 +0000
Message-Id: <200201220957.g0M9vhS26714@uk-proclin7.altera.com>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Clive Davies <cdavies@altera.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] kdev_t updates
Date: Tue, 22 Jan 2002 09:57:43 +0000
Cc: linux-mtd@lists.infradead.org
References: <200201211611.g0LGBPv22298@uk-proclin7.altera.com> <21414.1011632551@redhat.com>
In-Reply-To: <21414.1011632551@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> Something like this ought to do it:
>
> #if LINUX_KERNEL_CODE < KERNEL_VERSION(2,5,1)
> #define minor(x) MINOR(x)
> #define major(x) MAJOR(x)
> #define NODEV 0
> #else
> #define to_kdev_t(x) (x)
> #endif

Ok, done. I used 

#if LINUX_VERSION_CODE < KERNEL_VERSION(2,5,2)
#define minor(x) MINOR(x)
#define major(x) MAJOR(x)
#endif

as to_kdev_t & NODEV are appropriately defined in kdev_t.h before and after 
2.5.2
