Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15fGfq-0006Lq-00
	for <linux-mtd@lists.infradead.org>; Fri, 07 Sep 2001 09:07:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B981BF6.24FD764D@sis.com.tw> 
References: <3B981BF6.24FD764D@sis.com.tw>  <Pine.LNX.4.33.0109061649230.9437-100000@hex.linuxgrrls.org> <14482.999791732@redhat.com> 
To: Ollie Lho <ollie@sis.com.tw>
Cc: kira brown <kira@hex.linuxgrrls.org>,
    Herman Oosthuysen <herman@wirelessnetworksinc.com>,
    "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: DiskOnChip write performance 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
Date: Fri, 07 Sep 2001 09:08:47 +0100
Message-ID: <17891.999850127@redhat.com>
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

ollie@sis.com.tw said:
> > Don't forget "don't use O(n^3) algorithms when trying to find a new
> > block to write to".

> What does this suppose to mean ?? 

Algorithms which take time proportional to the cube of 'n', where n is some 
variable indicating the complexity of the task - in this case it would be 
the number of blocks on the DiskOnChip which are to be considered for 
selection. 

In fact, I don't think there's anything quite as stupid as O(n^3) in there, 
but it _is_ extremely naïve in places and needs a rethink of some of the 
data structures to allow some operations to operate in linear time, and to 
improve the wear levelling. The wear levelling at the moment is nonexistent 
- we always pick the longest chain, and if you have a one-block chain which 
never gets rewritten, NFTL will never cycle the block it's in.


> 	Did you "threaded" NFTL code yet ?? Or we still get locked when NFTL
> is syncing/flushing ?? 

I've put the necessary locking into the doc2000 driver. We can call it 
concurrently now. But haven't threaded NFTL to take advantage of it.

The core of the current NFTL code has just sort of evolved from my initial
hacks to see if I could get it to understand a DiskOnChip, and then to see
if I could write to it without confusing the DOS drivers. And it hasn't
evolved far. Ideally, it wants to be completely rewritten.


--
dwmw2
