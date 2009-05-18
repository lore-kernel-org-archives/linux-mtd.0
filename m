Received: from spam1.hanyang.ac.kr ([166.104.177.29])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M5s6R-0003hB-AL
	for linux-mtd@lists.infradead.org; Mon, 18 May 2009 01:57:26 +0000
Received: from 166.104.177.101 (166.104.177.101 [166.104.177.101])
	by spam1.hanyang.ac.kr (WBlock.pss 3.6.24)
	with ESMTP id <4A10BF48.3080602@hanyang.ac.kr>
	for <linux-mtd@lists.infradead.org>; Mon, 18 May 2009 10:51:50 +0900
Received: from 166.104.12.75 (166.104.12.75 [166.104.12.75])
	by hymel1 (DeepMTA 3.6.21)
	with ESMTP id <4A10BF48.3080602@hanyang.ac.kr>
	for <linux-mtd@lists.infradead.org>; Mon, 18 May 2009 10:50:58 +0900
Message-ID: <4A10BF48.3080602@hanyang.ac.kr>
Date: Mon, 18 May 2009 10:52:08 +0900
From: HyoGi Sim <dahlia@hanyang.ac.kr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Question about mtd_blktrans_ops interface
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Reply-To: dahlia@hanyang.ac.kr
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I about to write a FTL for a large (2KB or 4KB page size) NAND flash 
devices.
MTD has a interface, mtd_blktrans_ops, for FTL. mtd_blktrans_ops has two 
access interface; readsect and writesect.

Since readsect and writesect in mtd_blktrans_ops takes single sector # 
for its argument, underlying FTL cannot handle multiple sectors at once 
even if above block IO layer requested multiple, logically consecutive, 
sectors in a request.

Here is a situation:

Let's say that flash device consists of 2 KB pages, and FTL registers 
itself with 512B sector size.
If a filesystem lying on the FTL device uses 2KB blocks, mtd_blkdevs 
always takes request whose size is multiple of 2 KB.
Let's assume that 2 KB request comes. Since current mtd_blktrans_ops 
splits the request into four 512B pieces, the request incurrs four 512B 
IOs in the FTL. Especillay for write requests, the splitted requests may 
degrade performance since the FTL should write four times for 
programming one 2KB page. Of course, although there can be a solution to 
avoid the problem such as internal page buffering, it may be complicated 
due to synchronization issues.

Here is my questions:

1. I think if the FTL device uses 2KB sector size, we can avoid the 
splitted I/O problem. Am I correct?

2. I think it will be more general if mtd_blktrans_ops offers access 
interfaces that take (starting sector#, # of sectors) like block IO 
layer do. Any problems with that?


Thanks.
