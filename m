Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E78t8-00067K-W6
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2005 05:46:49 -0400
Received: from ep_mmp1 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0ILM00HWAB5PTA@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 22 Aug 2005 18:46:37 +0900 (KST)
Received: from july7 ([168.219.213.193])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0ILM002RXB5POR@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 22 Aug 2005 18:46:37 +0900 (KST)
Date: Mon, 22 Aug 2005 18:46:38 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
In-reply-to: <1124613404.3407.31.camel@localhost.localdomain>
To: 'David Woodhouse' <dwmw2@infradead.org>
Message-id: <0ILM002RYB5POR@mmp1.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Cc: linux-mtd@lists.infradead.org
Subject: RE: LTP fs test results on OneNAND
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> 
> On Sat, 2005-08-20 at 09:06 +0900, Kyungmin Park wrote:
> > rwtest01                       FAIL       2
> > rwtest02                       FAIL       2
> > rwtest03                       FAIL       2
> > rwtest04                       FAIL       2
> > rwtest05                       FAIL       2
> 
> > Total Failures: 5
> 
> These are solely due to the lack of shared writable mappings, yes?

<<<test_output>>>

doio(rwtest01) (  918) 14:07:18
---------------------
mmap() failed - 0xffffffff 22

doio(rwtest01) (  918) 14:07:18
---------------------
mmap-write() request failed:  No such file or directory (2)
Request number 1
          fd 4 is file /tmp/ltp-710/rw-sync-905 - open flags are 010002
O_RDWR,,
          write done at file offset 0 - pattern is I (0111)
          number of requests is 1, strides per request is 1
          i/o byte count = 107087
          memory alignment is unaligned

syscall:  mmap-write(NULL, 779264, PROT_WRITE, MAP_SHARED, 4, 0)
        file is mmaped to: 0x0
        file-mem=0x0, length=107087, buffer=0x3d369


doio(rwtest01) (  918) 14:07:18
---------------------
doio(): operation 121 returned != 0
rwtest(rwtest01) : iogen reported errors (r=141)
rwtest01    1  FAIL  :  Test failed

The remains are almost same. 

I don't know why this tests are fail?

> 
> LTP tests correctness -- I like to do JFFS2 runs with some stress
> testing, like fsx-linux (and another tool called 'holey' 
> which stresses
> the extent mapping stuff -- http://david.woodhou.se/holey.c).

The holey is working well.
