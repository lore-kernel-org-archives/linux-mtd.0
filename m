Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUcQQ-0004Oc-MT
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 11:29:51 +0000
Message-ID: <4FB38FAA.4080603@nod.at>
Date: Wed, 16 May 2012 13:29:46 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [RFC v4] UBI: Fastmap support (aka checkpointing)
References: <1337101871-31181-1-git-send-email-richard@nod.at>
 <1337161096.24809.36.camel@sauron.fi.intel.com> <4FB38683.7030306@nod.at>
 <1337166556.24809.42.camel@sauron.fi.intel.com>
 <1337167083.24809.49.camel@sauron.fi.intel.com>
In-Reply-To: <1337167083.24809.49.camel@sauron.fi.intel.com>
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

On 16.05.2012 13:18, Artem Bityutskiy wrote:
> On Wed, 2012-05-16 at 14:09 +0300, Artem Bityutskiy wrote:
>>> The maximum size of a fastmap is limited to UBI_FM_MAX_BLOCKS.
>>> As I said, in worst case we'd have to scan 192 PEBs, which is a constant.
>>
>> In this case you cannot use O notation at all because it is just used
>> when talking about asymptotic things.
>
> OK, we are talking about different things. It is fine that you need to
> scan 192 eraseblocks, this is kind of your journal. And this part may be
> O(1). But there is another part as well.

Yeah, seems to.

> But as I already explained, you have a _table_ on the flash, and this
> table stores Erase Counter and LEB number for (roughly) each PEB. The
> more PEBs, the large is the table, linerarly.
>
> As I explained, you have to _read_ and _interpret_ each record in this
> table when attaching. And the more of these records you have, the longer
> it takes to attach. And this is where you have your O(N).

Okay, now I understand your point. :)

> So basically fastmap makes UBI's linerar dependency multiplier a lot
> smaller, so it is still a great improvement.

Yep.

Thanks,
//richard
