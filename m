Received: from chfdns02.ch.intel.com ([143.182.246.25] helo=melete.ch.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15so9d-0003oF-00
	for <linux-mtd@lists.infradead.org>; Sun, 14 Oct 2001 17:30:21 +0100
Received: from hasmsxvs01.iil.intel.com (hasmsxvs01.iil.intel.com [143.185.63.58])
	by melete.ch.intel.com (8.9.1a+p1/8.9.1/d: relay.m4,v 1.44 2001/10/01 19:10:43 root Exp $) with SMTP id QAA09666
	for <linux-mtd@lists.infradead.org>; Sun, 14 Oct 2001 16:39:31 GMT
Message-ID: <7C0E66E1B97BD5119B120002A50A63D22E4195@hasmsx101.iil.intel.com>
From: "Kremer, Alex" <alex.kremer@intel.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>,
        "Kremer, Alex" <alex.kremer@intel.com>
Cc: linux-mtd@lists.infradead.org
Subject: RE: linux/completion.h 
Date: Sun, 14 Oct 2001 18:39:28 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
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

Thanks!

Now there is another problem:

drivers/mtd/mtdlink.o: In function `mtdblock_ioctl':
drivers/mtd/mtdlink.o(.text+0xafa4): undefined reference to `__put_user_bad'

There was a discussion concerning put_user here, right? Something about
BLKGETSIZE64. 
If I comment out the #define BLKGETSIZE64 in compatmac.h the
	case BLKGETSIZE64:
		return put_user((u64)mtdblk->mtd->size, (u64 *)arg); 
in mtdblock.c is not compiled, and then there is no problem.

But then the whole purpose of 
	#ifndef BLKGETSIZE64 /* LINUX_VERSION_CODE <
KERNEL_VERSION(2,4,10-pre13) */
	#define BLKGETSIZE64 _IOR(0x12,114,sizeof(u64)) /* return device
size in bytes (u64 *arg) */
	#endif
in compatmac.h is missed.

What is the right way to do it?

Kreso

| -----Original Message-----
| From: David Woodhouse [mailto:dwmw2@infradead.org]
| Sent: Sun, October 14, 2001 5:31 PM
| To: Kremer, Alex
| Cc: linux-mtd@lists.infradead.org
| Subject: Re: linux/completion.h 
| 
| 
| 
| 
| alex.kremer@intel.com said:
| > From about a month ago, the jffs2 code uses the 
| "completion" interface
| > that appeared only around 2.4.8. This means that jffs2 cannot be
| > compiled unmodified with kernels prior to this. I'm using 2.4.1 and
| > cannot currently upgrade (hw compatibility issues, that would demand
| > too many changes).
| 
| > Does anyone know what would be a sufficient set of changes either to
| > jffs2 or the kernel that wouldn't break anything and allow 
| me use the
| > latest jffs2 code?
| 
| The necessary magic should already be in include/linux/mtd/compatmac.h
| 
| It should just work if you include that from background.c.
| 
| --
| dwmw2
| 
| 
