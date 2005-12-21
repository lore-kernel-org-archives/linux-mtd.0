Received: from fmr17.intel.com ([134.134.136.16] helo=orsfmr002.jf.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ep0Ap-0003UK-3g
	for linux-mtd@lists.infradead.org; Wed, 21 Dec 2005 04:22:19 -0500
From: "zhao, forrest" <forrest.zhao@intel.com>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
In-Reply-To: <43A6A105.9020407@yandex.ru>
References: <439C33D2.506@yandex.ru>
	<1134367675.3152.9.camel@localhost.localdomain>
	<439D5159.4030704@yandex.ru>
	<1134455209.7346.12.camel@localhost.localdomain>
	<43A6A105.9020407@yandex.ru>
Content-Type: text/plain
Date: Wed, 21 Dec 2005 17:16:34 +0800
Message-Id: <1135156594.29050.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 after CVS snapshot 2005/11/13 is broken on nandsim
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-12-19 at 15:01 +0300, Artem B. Bityutskiy wrote:
> zhao, forrest wrote:
> > Hi, Artem
> > 
> > The following is what I do in my lab:
> > 1 download MTD snapshot of 2005/10/30(the
> > snapshot before I check in EBH patch)
> Thanks, I know that it worked before EBH. Could you please take the 
> *lates* CVS stanpshot. Try this on nandsim.
> 
Today I did the regression test on kernel 2.6.15-rc5 again,
the result is the same as the one on kernel 2.6.12.2.
The test steps are:
1 mount /dev/mtdblock0 to /mnt, which is a nandsim partition
2 copy a small file(2755 bytes) to /mnt
3 umount /mnt
4 mount /dev/mtdblock0 again 

The CVS snapshot before 2005/11/13 is good; the snapshot after
2005/11/13 is broken. I checked in EBH patch on 2005/11/04, so
this is not a bug in EBH. Anyway I'll take look at the diff
between 2005/11/12 and 2005/11/13 to find the bug out.

For snapshot before 2005/11/13, I also did some stress test
on /mnt, it works very well.

For snapshot after 2005/11/13, kernel panic can be easily
reproduced by copying a small file. 

Thanks,
Forrest
