Received: from mail.imc-berlin.de ([217.110.46.186] helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18JVfQ-0007If-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2002 09:18:04 +0000
Message-ID: <3DEDCF74.E77757DC@imc-berlin.de>
Date: Wed, 04 Dec 2002 10:48:36 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: tglx@linutronix.de
CC: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>,
   linux-mtd@lists.infradead.org
Subject: Re: undefined reference to 'crc32' ?
References: <3DE7CB23.5535F5E6@imc-berlin.de>
	 <002301c298c1$e6f10360$0300a8c0@jockeXP> <200212010046.59435.tglx@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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


Thomas Gleixner wrote:
> 
> On Saturday 30 November 2002 23:43, Joakim Tjernlund wrote:
> > CVS JFFS2 assumes that  crc32()  is avialable as a generic function. You
> > need my crc32 backport from 2.5 to 2.4. It's somewhere in the MTD
> > archives(I think). I don't have it handy ATM.
> I had no 2.4.20 kernel available, when I overhauled patchin.sh. I did not
> realize that 2.4.19 had include/linux/crc32.h also available.
> 
> I changed patchin.sh so it supports those kernels too.

Hi, 

I updated to the latest CVS this morning.

The problem with include/linux/crc32.h is solved. Thanks very much!

But, now I am having trouble with the new (rebuilt) mkfs.jffs2!!! It looks like
a endian problem:

I invoked mkfs.jffs2 as usual from within a script with:

mkfs.jffs2 -d $TMP -o flashdisk.jffs2 -b -p

But now I get loads of

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00010000: 0x8519
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00010004: 0x0709
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00010008: 0x4137
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001000c: 0x1600
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00010010: 0x1c00
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00010014: 0xed81
instead

So "-b" seems not to be working... ???

My old version of mkfs.jffs2 is still wotking correctly!!!

Any ideas?

Thanks,

Steven
