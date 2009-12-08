Received: from mail.theptrgroup.com ([71.178.251.9])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NHqwI-00064t-SZ
	for linux-mtd@lists.infradead.org; Tue, 08 Dec 2009 03:40:43 +0000
Message-ID: <4B1DCAB0.8060507@theptrgroup.com>
Date: Mon, 07 Dec 2009 22:40:32 -0500
From: Jeff Angielski <jeff@theptrgroup.com>
MIME-Version: 1.0
To: Charles Manning <manningc2@actrix.gen.nz>
Subject: Re: What filesystem for NAND flash with OOB 218
References: <4B1C682D.1020603@theptrgroup.com>	<200912071619.56623.manningc2@actrix.gen.nz>
	<200912080955.43335.manningc2@actrix.gen.nz>
In-Reply-To: <200912080955.43335.manningc2@actrix.gen.nz>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Charles Manning wrote:
> On Monday 07 December 2009 16:19:56 Charles Manning wrote:
>> On Monday 07 December 2009 15:27:57 Jeff Angielski wrote:
>>> I was wondering what type of filesystem everybody is using for the newer
>>>   NAND flash with OOB>=128 bytes.  For me, this is the Micron
>>> MT29F8G08AAA which has an OOB=218.
>>>
>>> It seems that the JFFS2 tools are out of date and don't work with
>>> anything less than or equal to 64bytes of OOB.
>>>
>>> YAFFS2 does not compile in the latest kernel source trees (2.6.31 in the
>>> DENX linux-2.6-denx git tree).  Is this filesystem dead?
>> Far from it.
>> I'll take a look at why it does not compile.
> 
> I just compiled yaffs2 in 2.6.29, 2.6.30, 2.6.31, 2.6.32 from kernel.org. No 
> problems.
> I didn't try denx.
> I would suggest you'd get further trying to sort this out in the denx or yaffs 
> lists.

It would appear that the yaffs2 code in DENX kernel is out of date.  I 
had assumed that since it was in the git tree, it was being maintained 
and ready for use.  Especially since they keep a close tie with the 
kernel.org tree.

Once I wiped it out and patched it with the latest yaffs code from CVS 
the fs/yaffs2 compiled.  The problem most likely comes from the fact 
that yaffs2 is maintained outside the kernel and requires the patch-ker.sh.


-- 
Jeff Angielski
The PTR Group
www.theptrgroup.com
