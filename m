Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b73P8-0007PQ-H7
 for linux-mtd@lists.infradead.org; Sun, 29 May 2016 16:17:31 +0000
Subject: Re: mtd locking
To: Matthias Auchmann <m.auchmann@artech.at>
References: <566B344A0B1AB14EB2486D887B6FF9E0331F3DB470@SRV01.ARTech.local>
 <CAFLxGvz+9JqcLZwuUqOd1UsCNbbjD52ecd5Faj8PC12YhTuYiA@mail.gmail.com>
 <566B344A0B1AB14EB2486D887B6FF9E0331F3DB473@SRV01.ARTech.local>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <574B15FE.8030206@nod.at>
Date: Sun, 29 May 2016 18:17:02 +0200
MIME-Version: 1.0
In-Reply-To: <566B344A0B1AB14EB2486D887B6FF9E0331F3DB473@SRV01.ARTech.local>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am 29.05.2016 um 17:53 schrieb Matthias Auchmann:
> By intended you mean it's wrong and we know, but it's still wrong, right?

I'd say lazy. Sometimes counters don't need to be exact.
Having exact counting is expensive. See network stack.

I'm not sure what the exact reasons in the ECC error counting
case are.
Maybe Brian or Boris can tell more.

> What about thread safety in general? Is the rest of the mtd system thread safe? Can it happen that e.g. a command is issued to NAND, and before the buffer is read, another command is issued (and similar scenarios)? Or is there some kind of protection in place for that?

NAND chip access is strictly serialized. :-)
See nand_get_device().

Thanks,
//richard
