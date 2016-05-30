Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7JR9-0005US-4B
 for linux-mtd@lists.infradead.org; Mon, 30 May 2016 09:24:39 +0000
Date: Mon, 30 May 2016 11:24:16 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Matthias Auchmann <m.auchmann@artech.at>
Cc: Richard Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: mtd locking
Message-ID: <20160530112416.73e8a875@bbrezillon>
In-Reply-To: <574B15FE.8030206@nod.at>
References: <566B344A0B1AB14EB2486D887B6FF9E0331F3DB470@SRV01.ARTech.local>
 <CAFLxGvz+9JqcLZwuUqOd1UsCNbbjD52ecd5Faj8PC12YhTuYiA@mail.gmail.com>
 <566B344A0B1AB14EB2486D887B6FF9E0331F3DB473@SRV01.ARTech.local>
 <574B15FE.8030206@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+Brian and Sasha

Hi Matthias,

On Sun, 29 May 2016 18:17:02 +0200
Richard Weinberger <richard@nod.at> wrote:

> Hi!
> 
> Am 29.05.2016 um 17:53 schrieb Matthias Auchmann:
> > By intended you mean it's wrong and we know, but it's still wrong, right?  
> 
> I'd say lazy. Sometimes counters don't need to be exact.
> Having exact counting is expensive. See network stack.
> 
> I'm not sure what the exact reasons in the ECC error counting
> case are.
> Maybe Brian or Boris can tell more.
> 
> > What about thread safety in general? Is the rest of the mtd system thread safe? Can it happen that e.g. a command is issued to NAND, and before the buffer is read, another command is issued (and similar scenarios)? Or is there some kind of protection in place for that?  
> 
> NAND chip access is strictly serialized. :-)
> See nand_get_device().

Yep, read/write accesses are correctly protected. The statistics update
are also protected, but it does not prevent tools like nanddump to
retrieve incorrect information. Actually, nanddump uses the following
sequence:

1/ get stats
2/ read stuff
3/ get new stats and compare with information retrieved in #1

Since we can't lock access to the MTD device for the whole sequence,
the statistics might change because of other read accesses on the same
MTD device.

I recently suggested the addition of a new ioctl to address that [1].

Regards,

Boris

[1]http://thread.gmane.org/gmane.linux.drivers.mtd/66834

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
