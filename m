Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1zRM-0003NG-9Y
 for linux-mtd@lists.infradead.org; Tue, 01 Jul 2014 14:53:48 +0000
Message-ID: <1404226404.6841.120.camel@sauron.fi.intel.com>
Subject: Re: Does UBI still place a just-tortured block first in the free
 block list?
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Atlant Schmidt <aschmidt@dekaresearch.com>
Date: Tue, 01 Jul 2014 17:53:24 +0300
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD36D986A2F0A@dekaexchange07.deka.local>
References: <0A40042D85E7C84DB443060EC44B3FD36D986A2F0A@dekaexchange07.deka.local>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>,
 Cale Surgen <csurgen@dekaresearch.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Atlant,

On Tue, 2014-07-01 at 09:11 -0400, Atlant Schmidt wrote:
> Folks:
> 
>   Several years ago, the behavior of UBI was that if a block
>   failed to write, UBI would torture-test the block (with 0x5A
>   and 0xA5 patterns) and if the block passed the torture test,
>   it would be placed at the top of the list of available blocks.

Not sure, eraseblocks are stored in an RB-tree tree which is indexed by
the erase counter. Then UBI picks those with smaller erase counters
first.

>   With this algorithm, UBI would attempt to again use the just-
>   tortured block for the data that was still waiting to be written.
>   But because the write failures were often data-dependent, in
>   our experience, the block would frequently again fail to store
>   the data to be written. It would be tortured again, passed again,
>   and the cycle would repeat. We've seen this cycle continue for
>   minutes at a time.

Sounds like a possible scenario, if the PEB in question has low erase
counter.

>   Is the algorithm still the same? Or is the just-tortured block
>   now placed at the bottom of the list of available blocks so that
>   it will only show up again later (when the data to be written
>   will probably be different)?

I am not sure about the list you are talking about, do you just assume
there is a list or you mean a specific list?

I do not think this part of UBI changed for the last several years.

-- 
Best Regards,
Artem Bityutskiy
