Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1913FP-0002KQ-6P
	for <linux-mtd@lists.infradead.org>; Thu, 03 Apr 2003 12:51:11 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Stephane Fillod <f4cfe@free.fr>
In-Reply-To: <20030402211307.GF15932@charybde.local>
References: <20030402211307.GF15932@charybde.local>
Message-Id: <1049370670.14220.21.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 03 Apr 2003 12:51:11 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Misc util patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-04-02 at 22:13, Stephane Fillod wrote:
> Hi,
> 
> Please find attached a patch against mtd-snapshot-20030325.
> 
> Fixes:
> * typo in eraseall.c, enable short option 'j', make cleanmarker to work:
>   this was obviously NOT tested. Now, it's okay.

Applied.

> * potential bug fix in mkfs.jffs2.c, because cpu_to_je32 can be a macro.
>   BTW, this cleans a warning under ppcboot about unexpected node version.

I think the warning's bogus -- what precisely does it complain about?
Incrementing version more than once is a bug but a harmless one.

I think I'd rather fix the macro instead so it doesn't evaluate 'x' more
than once...

#define t16(x) ({ uint16_t b = x; (target_endian==__BYTE_ORDER)?x:bswap_16(b); })
#define t32(x) ({ uint32_t b = x; (target_endian==__BYTE_ORDER)?x:bswap_32(b); })

> * undefined prototypes in compr_rtime.c

No Likee Ifdefs.

I think it's probably time to stop mkfs.jffs2 from using kernel code at
all. If this is just a warning, let it stay. It's ugly but the fact
we're using kernel files at all is ugly anyway :)

> * gcc-3.x warning cleanups in mtd_debug.c
> * getopt'ified fcp.c, fixes a bug with "fcp -h"

Applied.

Thanks for the fixes.

-- 
dwmw2
