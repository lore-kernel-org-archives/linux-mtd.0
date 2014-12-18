Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1Z1H-0007P3-GP
 for linux-mtd@lists.infradead.org; Thu, 18 Dec 2014 11:13:24 +0000
Message-ID: <5492B6B8.5010705@nod.at>
Date: Thu, 18 Dec 2014 12:12:56 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Tanya Brokhman <tlinder@codeaurora.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Dolev Raviv <draviv@codeaurora.org>
Subject: Re: Synchronization in UBIFS (zero length files)
References: <5492918F.2060704@codeaurora.org>
In-Reply-To: <5492918F.2060704@codeaurora.org>
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

Tanya,

Am 18.12.2014 um 09:34 schrieb Tanya Brokhman:
> Hi Artem/Richard
> 
> I've been looking into the "zero length files" issue in UBIFS and came across "Synchronization exceptions for buggy applications" @
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_sync_semantics. This section concludes with:
> 
> "We have plans to implement these features in UBIFS, but this has not been done yet. The problem is that UBI/MTD are fully synchronous and we cannot initiate asynchronous
> write-out, so we'd have to synchronously write files on close/rename, which is slow. So implementing these features would require implementing asynchronous I/O in UBI, which is a
> big job. But feel free to do this :-)."
> 
> So two questions:
> 1. was anything done in ubifs to handle file truncation and rename similar to ext4? Didn't find anything but afraid I might be missing something

I don't think so.

> 2. Not sure I understand why "implementing these features would require implementing asynchronous I/O in UBI". Could you please elaborate on this?

If we'd do it synchronous it would horrible slow down UBIFS. That's why ext4 is doing it async.
Having async IO for UBI is not trivial. Especially because of powercut safety.

Thanks,
//richard
