Received: from mika.eatserver.nl ([195.20.9.75])
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q2i5f-0007bS-1p
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2011 10:48:31 +0000
Message-ID: <4D8B2174.50606@aimvalley.nl>
Date: Thu, 24 Mar 2011 11:48:20 +0100
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: Detlev Zundel <dzu@denx.de>
Subject: Re: [RFC] Handling of errors for AMD NOR (cfi_cmdset_0002) chips
References: <4D797E23.6070409@emcraft.com>
	<4D79DC90.6070600@aimvalley.nl>	<m27hbpyh36.fsf@ohwell.denx.de>
	<4D8AF428.5010000@aimvalley.nl> <m28vw4x3zk.fsf@ohwell.denx.de>
In-Reply-To: <m28vw4x3zk.fsf@ohwell.denx.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, yanok@emcraft.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/24/11 10:27, Detlev Zundel wrote:
...
>> But the unstable bit problem is different from software timeout
>> related issues regarding UBI and NOR flash the OP mentioned.
>> It is anyway good to hear work is in progress here.
>
> It is never good to ignore errors reported by the hardware if you are
> looking for problems in higher software layers.  That's why we decided
> to implement such error checks which can then be helpful in our further
> testing.  We are hoping that we can better differentiate between
> software and hardware problems this way.
>

ok, I see.

>> I asked about the software timeout issue because I've seen false
>> timeouts with powerpc + CONFIG_NO_HZ a while ago.
>> In my case the low-level do_write_buffer (cfi_cmdset_0002.c) timed
>> out too early. See
>> http://lkml.org/lkml/2009/9/3/84
>
> Ok, I see, thanks for the pointer.  The problems you experienced then
> were unneccessary software timeouts, but there was no data corruption,
> correct?
>

yes that is correct.
It happened only when system was 'stressed' a bit and it caused false
software timeouts which made UBIFS remount the fs in read-only mode.

---
N. van Bolhuis.
