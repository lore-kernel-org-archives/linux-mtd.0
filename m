Received: from msgbas1x.net.europe.agilent.com ([192.25.19.109])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BIA9Y-0002yl-8M
	for linux-mtd@lists.infradead.org; Mon, 26 Apr 2004 18:44:24 +0100
Message-ID: <408D4A58.7000402@agilent.com>
Date: Mon, 26 Apr 2004 10:43:52 -0700
From: Shawn Jin <xiaogeng_jin@agilent.com>
MIME-Version: 1.0
To: Oliver Korpilla <okorpil@fh-landshut.de>
References: <3236F92B82933347807DFF6A8BA63280D74675@wcosmb04.cos.agilent.com>
In-Reply-To: <3236F92B82933347807DFF6A8BA63280D74675@wcosmb04.cos.agilent.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Newbie help! - Old AMD (cfi_cmdset_0002) interleaved flash
	problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A general remark is that the current CVS code of cmdset_0002 may not 
work on all interleaved chips. If I were you, I would try some older 
version, e.g. the code coming with DENX distribution (v 1.62).

-Shawn.

Oliver Korpilla wrote:

> / # ftl_format -i -r 10 /dev/mtd2
> Partition size = 2816 kb, erase unit size = 256 kb, 1 transfer units
> Reserved 10%, formatted size = 2283 kb
> This will destroy all data on the target device.  Confirm (y/n): y
> Erasing all blocks...
> ---+---+---
> MTD do_write_oneword(): software timeout
> 
> This will cause Input/Output errors on cp and cat, and if I copy or cat
> a JFFS2 image (I've tried both big and little endian just to be sure), I
> cannot mount it afterwards (missing magic blocks).
