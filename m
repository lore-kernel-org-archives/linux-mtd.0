Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUboe-0003VB-Db
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 10:50:50 +0000
Message-ID: <4FB38683.7030306@nod.at>
Date: Wed, 16 May 2012 12:50:43 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [RFC v4] UBI: Fastmap support (aka checkpointing)
References: <1337101871-31181-1-git-send-email-richard@nod.at>
 <1337161096.24809.36.camel@sauron.fi.intel.com>
In-Reply-To: <1337161096.24809.36.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16.05.2012 11:38, Artem Bityutskiy wrote:
  >> This case can happen if the complete fastmap fits into one PEB, the 
fastmap
>> super block is the first PEB on the MTD partition and the fastmap pool is empty.
>> On the other side, in the worst case fastmap has to scan UBI_FM_MAX_START +
>> UBI_FM_MAX_BLOCKS + UBI_FM_MAX_POOL_SIZE PEBs.
>
> When N ->  inf, UBI_FM_MAX_BLOCKS ->  inf as well. Each PEB requires
> little space in the fastmap table.

No, UBI_FM_MAX_BLOCKS does *not* depend on the MTD partition size.
When N -> inf, UBI_FM_MAX_BLOCKS is still a constant.
--> O(1)

> O(N) would be: N ->  inf, UBI_FM_MAX_BLOCKS ->  C, where C is a constant.
>
> Or did I completely forgot math basics?
>
>> With the current default settings this would be 192 PEBs.
>> So, attaching via fastmap has a complexity of O(1).
>
> No :-) Again, for each PEB you have a little data structure in a fastmap
> which you have to (a) store, (b) read, and (c) process when attaching
> the device. The more PEBs you have, the more you do.

The maximum size of a fastmap is limited to UBI_FM_MAX_BLOCKS.
As I said, in worst case we'd have to scan 192 PEBs, which is a constant.

Thanks,
//richard
