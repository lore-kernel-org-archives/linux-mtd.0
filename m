Received: from webmanixhosting.com ([216.40.225.16]
	helo=www.webmanixhosting.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aehh6-0001P8-DN
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2004 21:27:56 +0000
From: "Dan Post" <djp.mtd@onemyth.net>
To: "Lothar Wassmann" <LW@KARO-electronics.de>
Date: Thu, 8 Jan 2004 13:12:06 -0800
Message-Id: <20040108211206.M17119@onemyth.net>
In-Reply-To: <16381.14656.474765.390645@ipc1.karo>
References: <16381.14656.474765.390645@ipc1.karo>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
cc: linux-mtd@lists.infradead.org
Subject: Re: put_chip() called with oldstate 1!! (linux 2.6.0-rmk2)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 8 Jan 2004 12:04:32 +0100, Lothar Wassmann wrote
> I'm using the MTD driver with Intel flash chips on a PXA255 platform
> with Redboot partitions. Whenever I write data to the flash and
> subsequently unmount and remount the modified partition I get several
> messages: 'put_chip() called with oldstate 1!!'.

Hmmm, strange.

Actually, looking at include/linux/mtd/flashchip.h, 1 == FL_STATUS.  (That
holds true for older versions as well.)

Looking at the CVS version of cfi_cmdset_0001.c,
                chip->state = FL_ERASING;
                break;

        case FL_READY:
+        case FL_STATUS:
                /* We should really make set_vpp() count, rather than doing
this */
                DISABLE_VPP(map);
                break;
        default:
                printk(KERN_ERR "put_chip() called with oldstate %d!!\n",
chip->oldstate);
        }


Note the line with the "+" at the front.  That was added in version 1.127 of
that file (thanks, CVSweb!), on Wed Jul 2 2003, by acurtis.
The comment: "Added FL_STATUS to the FL_READY case in put_chip(). (Eliminate
noise)"

Given my knowledge of flash chips and the driver, that looks like the
appropriate behavior... you may want to upgrade your file or at least add that
line.  There have been some other nice changes since then.  From a quick
glance, I can't find any mailing list activity from that timeperiod on this
fix though...

Dan
