Received: from fed1mtao04.cox.net ([68.6.19.241])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Sjdl-0001yl-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 20:30:13 +0100
Subject: Re: JFFS2 Problem
From: Russ Dill <Russ.Dill@asu.edu>
To: Snehaprabha <nsnehaprabha@tnint11.telogy.design.ti.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
In-Reply-To: <200207111518.18733.nsnehaprabha@tnint11.telogy.design.ti.com>
References: <200207101752.51379.nsnehaprabha@tnint11.telogy.design.ti.com>
	<4554.1026371135@redhat.com>
	<200207111518.18733.nsnehaprabha@tnint11.telogy.design.ti.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 11 Jul 2002 12:32:35 -0700
Message-Id: <1026415956.4767.299.camel@timmy>
Mime-Version: 1.0
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

On Thu, 2002-07-11 at 12:18, Snehaprabha wrote:
> Thanks for the response.
> I am running 2.4.17 Kernel. I have a limitation on the flash size (AMD flash 
> 2MB with 64K erase block size). I am running our own bootloader which takes 
> up 3 erase blocks. Then I have the linux kernel that takes around 12 erase 
> blocks, leaving 17 erase blocks for the JFFS2 image. I have managed to fit in 
> most of the required pieces for the file system, which makes it 17 blocks. 
> Now the question is about the spare erase block required for GC.
> I am confused with the #defines in fs/jffs2/nodelist.h

I don't know your requirements, but there are probably better ways of
doing whatever you are doing. On my 2M board, my flash layout looks like
this:

dev:    size   erasesize  name
mtd0: 00008000 00008000 "BLOB boot loader"
mtd1: 00008000 00004000 "NESA journaled config"
mtd2: 00010000 00010000 "NESA static config"
mtd3: 00060000 00020000 "NESA cramfs saveme"
mtd4: 00180000 00020000 "NESA cramfs root"

(note that 0x8000 is 32k, 0x10000 is 64k, etc)
768k is pretty big for a kernel, but if your need that many drivers,
that is the way it goes. A bootloader should be able to fit in one
block, by using bottom boot block flash, I can make even more efficient
use of the first block by subdividing it. I don't see where a 2M system
would need jffs2, my /proc/mounts looks like this:

/dev/root / cramfs rw 0 0
ramfs /etc ramfs rw 0 0
ramfs /var ramfs rw 0 0
ramfs /tmp ramfs rw 0 0
proc /proc proc rw 0 0

/etc is created by copying /init-etc from the cramfs partition at boot.
Any files that need to be saved across boots are tar.gz'd and saved to
the journalled config sectors by writing to that flash raw and including
a revision and crc.

I'm not saying that you should do it exactly this way, but hopefully it
will give you some ideas beyond what you are currently doing.
