Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agT46-0000Im-7r
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2016 08:13:55 +0000
Subject: Re: Page migration issue with UBIFS
To: Joonsoo Kim <iamjoonsoo.kim@lge.com>
References: <56E8192B.5030008@nod.at>
 <20160315151727.GA16462@node.shutemov.name> <56E82B18.9040807@nod.at>
 <20160315153744.GB28522@infradead.org> <56E8985A.1020509@nod.at>
 <20160316142156.GA23595@node.shutemov.name>
 <20160316142729.GA125481@black.fi.intel.com> <56E9C658.1020903@nod.at>
 <20160317071155.GB10315@js1304-P5Q-DELUXE>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Christoph Hellwig <hch@infradead.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 David Gstir <david@sigma-star.at>, Dave Chinner <david@fromorbit.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Alexander Kaplan
 <alex@nextthing.co>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>, Sasha Levin <sasha.levin@oracle.com>,
 rvaswani@codeaurora.org, "Luck, Tony" <tony.luck@intel.com>,
 Shailendra Verma <shailendra.capricorn@gmail.com>,
 s.strogin@partner.samsung.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <56EA672A.7070007@nod.at>
Date: Thu, 17 Mar 2016 09:13:30 +0100
MIME-Version: 1.0
In-Reply-To: <20160317071155.GB10315@js1304-P5Q-DELUXE>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 17.03.2016 um 08:11 schrieb Joonsoo Kim:
>> It is still not clear why UBIFS has to provide a >migratepage() and what the expected semantics
>> are.
>> What we know so far is that the fall back migration function is broken. I'm sure not only on UBIFS.
>>
>> Can CMA folks please clarify? :-)
> 
> Hello,
> 
> As you mentioned earlier, this issue would not be directly related
> to CMA. It looks like it is more general issue related to interaction
> between MM and FS. Your first error log shows that error happens when
> ubifs_set_page_dirty() is called in try_to_unmap_one() which also
> can be called by reclaimer (kswapd or direct reclaim). Quick search shows
> that problem also happens on reclaim. Is that fixed?
> 
> http://www.spinics.net/lists/linux-fsdevel/msg79531.html

Well, this problem happened only on a tainted kernel and never popped up again.
So, I really don't know. :-)

> I think that you need to CC other people who understand interaction
> between MM and FS perfectly.

Who is missing on the CC list?

Thanks,
//richard
