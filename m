Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNgME-0000hR-SF
 for linux-mtd@lists.infradead.org; Thu, 14 Jul 2016 13:07:16 +0000
Subject: Re: Cached NAND reads and UBIFS
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
References: <57863449.4070108@nod.at> <20160713165422.GA130613@google.com>
 <20160714103301.4b01b0ce@bbrezillon>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <57878E68.30901@nod.at>
Date: Thu, 14 Jul 2016 15:06:48 +0200
MIME-Version: 1.0
In-Reply-To: <20160714103301.4b01b0ce@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 14.07.2016 um 10:33 schrieb Boris Brezillon:
>>> Now we're not sure what do do, should we implement bulk reading in the TNC
>>> code or improve NAND read caching?  
>>
>> Seems like we should improve the caching, either in a layer above, or
>> just in the NAND layer.
> 
> I think we all agree on that one :).

Today I found some time to implement a PoC of a single page cache directly
in UBI.
IMHO UBI is the right layer for that. NAND is too low and UBIFS too high
level.
With a few lines of case I was able to speedup UBIFS TNC lookups a lot,
in fact it gave me the same speed up as caching in the NAND layer does.

As next step I'll tidy the code, add a debugfs interface to expose cache hit/miss
counters such that we can experiment with different workloads and users ontop
of UBIFS. /me thinks of squashfs+ubiblock which is also rather common these days.

Maybe caching more than one page helps too.

Thanks,
//richard
